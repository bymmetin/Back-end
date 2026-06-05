// auth.service.ts — Kayıt, giriş, token üretimi ve çıkış iş mantığı.
//
// @InjectRepository(Player): TypeORM repository'sini dependency injection ile alır.
//   Repository<Player>: Player tablosunda CRUD işlemleri için TypeORM'un hazır sınıfı.
//   findOneBy(), save(), update() gibi metodları kullanmamızı sağlar.
//
// bcrypt: şifre güvenliği için tek yönlü hash algoritması.
//   hash(): kayıt sırasında şifreyi hashler — DB'e düz metin kaydedilmez.
//   compare(): giriş sırasında girilen şifreyi hash ile karşılaştırır.
//
// JWT: kullanıcı kimliğini kanıtlayan imzalı token.
//   access_token:  kısa ömürlü (1 saat) — API isteklerinde Authorization header'ında gönderilir.
//   refresh_token: uzun ömürlü (7 gün)  — access_token yenileme için kullanılır.

import {
  Injectable,
  ConflictException,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import { JwtService }       from '@nestjs/jwt';
import { ConfigService }    from '@nestjs/config';
import * as bcrypt          from 'bcrypt';
import { Player }           from '../players/player.entity';
import { RegisterDto }      from './dto/register.dto';

@Injectable()
export class AuthService {
  constructor(
    // TypeORM repository — Player tablosunda sorgular bu nesne üzerinden yapılır
    @InjectRepository(Player)
    private playersRepo: Repository<Player>,
    private jwtService:  JwtService,
    private config:      ConfigService,
  ) {}

  // Yeni oyuncu kaydı.
  // findOneBy(): tek satır arama — bulunamazsa null döner.
  // playersRepo.create(): DTO'dan Player nesnesi oluşturur (DB'ye yazmaz).
  // playersRepo.save(): Player nesnesini INSERT eder.
  async register(dto: RegisterDto): Promise<Player> {
    // Kullanıcı adı daha önce alındı mı?
    const existing = await this.playersRepo.findOneBy({ username: dto.username });
    if (existing) throw new ConflictException('Bu kullanıcı adı zaten alınmış');

    // Şifreyi bcrypt ile hashle (10 round önerilir — güvenlik/performans dengesi)
    const hashedPassword = await bcrypt.hash(dto.password, 10);

    // Entity oluştur ve kaydet
    const player = this.playersRepo.create({ ...dto, password: hashedPassword });
    return this.playersRepo.save(player);
  }

  // LocalStrategy'nin çağırdığı doğrulama metodu.
  // Mobil uygulama email gönderdiği için hem username hem email ile arama yapılır.
  // bcrypt.compare(): girilen şifreyi DB'deki hash ile karşılaştırır — hash'i çözmez.
  // Geçersizse null döner → LocalStrategy 401 fırlatır.
  async validatePlayer(usernameOrEmail: string, password: string): Promise<Player | null> {
    // Önce username ile ara, bulamazsa email ile ara
    let player = await this.playersRepo.findOneBy({ username: usernameOrEmail });
    if (!player) {
      player = await this.playersRepo.findOneBy({ email: usernameOrEmail });
    }
    if (!player) return null;

    const isMatch = await bcrypt.compare(password, player.password);
    if (!isMatch) return null;

    return player; // req.user'a atanır
  }

  // Başarılı girişten sonra access + refresh token çifti üretir.
  // Refresh token DB'ye hashlenmiş halde kaydedilir (ham token saklanmaz).
  async login(player: Player) {
    const payload = { sub: player.id, username: player.username, role: player.role };

    // Access token — kısa ömürlü, API isteklerinde kullanılır
    const accessToken = this.jwtService.sign(payload);

    // Refresh token — uzun ömürlü, yeni access token almak için
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const refreshToken = this.jwtService.sign(payload as any, {
      secret:    this.config.get<string>('JWT_REFRESH_SECRET'),
      expiresIn: this.config.get('JWT_REFRESH_EXPIRES_IN', '7d') as any,
    });

    // Refresh token'ı hashleyip kaydet — DB ele geçirilse ham token kullanılamaz
    const hashedRefresh = await bcrypt.hash(refreshToken, 10);
    await this.playersRepo.update(player.id, { refreshToken: hashedRefresh });

    return { accessToken, refreshToken, user: { id: player.id, username: player.username, role: player.role } };
  }

  // JWT doğrulandıktan sonra kullanıcı profilini döner
  async getProfile(playerId: number): Promise<Player> {
    const player = await this.playersRepo.findOneBy({ id: playerId });
    if (!player) throw new UnauthorizedException('Oyuncu bulunamadı');
    return player; // @Exclude() sayesinde password ve refreshToken JSON'a girmez
  }

  // Oturumu kapatır: refresh token'ı null yapar → geçersiz kalır
  async logout(playerId: number): Promise<{ message: string }> {
    await this.playersRepo.update(playerId, { refreshToken: undefined });
    return { message: 'Çıkış yapıldı' };
  }
}
