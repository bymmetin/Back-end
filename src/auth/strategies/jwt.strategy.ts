// jwt.strategy.ts — JWT Bearer token doğrulama stratejisi.
//
// Passport'un JwtStrategy'si, @UseGuards(JwtAuthGuard) ile korunan route'larda
// Authorization: Bearer <token> başlığından token'ı çıkarır ve doğrular.
//
// @InjectRepository(Player): token'daki user ID ile veritabanından oyuncuyu çeker.
//   Neden DB'ye tekrar soruyoruz? Token çalınmış ama oyuncu silinmiş olabilir.
//   Bu kontrol ile "token geçerli ama kullanıcı yok" durumu yakalanır.
//
// validate() dönen değer → req.user olarak tüm korumalı route'larda erişilebilir.

import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy }  from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService }     from '@nestjs/config';
import { InjectRepository }  from '@nestjs/typeorm';
import { Repository }        from 'typeorm';
import { Player }            from '../../players/player.entity';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private config: ConfigService,
    @InjectRepository(Player)
    private playersRepo: Repository<Player>,
  ) {
    super({
      // Authorization: Bearer <token> başlığından token'ı çıkar
      jwtFromRequest:  ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false, // süresi dolmuş token'ı reddet
      secretOrKey:      config.get<string>('JWT_SECRET')!, // .env'den al
    });
  }

  // Token imzası doğrulandıktan sonra çağrılır; payload token'ın içindeki veri
  async validate(payload: { sub: number; username: string; role: string }) {
    // DB'den güncel oyuncu bilgisini çek (token'daki bilgi eski olabilir)
    const player = await this.playersRepo.findOneBy({ id: payload.sub });
    if (!player) throw new UnauthorizedException('Geçersiz token — oyuncu bulunamadı');
    return player; // req.user olur — @Exclude() şifreyi gizler
  }
}
