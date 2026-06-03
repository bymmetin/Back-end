import {
  ConflictException,
  Injectable,
  InternalServerErrorException,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import * as bcrypt from 'bcrypt';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class AuthService {
  constructor(
    private supabase: SupabaseService,
    private jwt: JwtService,
    private config: ConfigService,
  ) {}

  // ── Kayıt ────────────────────────────────────────────────
  async register(username: string, email: string, password: string) {
    const client = this.supabase.getClient();

    // username çakışma kontrolü
    const { data: existing } = await client
      .from('profiles')
      .select('id')
      .eq('username', username)
      .maybeSingle();

    if (existing) {
      throw new ConflictException('Bu kullanıcı adı zaten kullanılıyor');
    }

    const passwordHash = await bcrypt.hash(password, 10);

    const { data, error } = await client
      .from('profiles')
      .insert({ username, email, password_hash: passwordHash, xp: 0, streak: 0 })
      .select('id, username, email, xp, streak')
      .single();

    if (error) throw new InternalServerErrorException(error.message);

    const tokens = this.generateTokens(data.id, data.username);

    // refresh token'ı hashleyip kaydet
    const refreshHash = await bcrypt.hash(tokens.refresh_token, 10);
    await client
      .from('profiles')
      .update({ refresh_token_hash: refreshHash })
      .eq('id', data.id);

    return { ...tokens, user: { id: data.id, username: data.username, email: data.email } };
  }

  // ── validatePlayer (LocalStrategy için) ─────────────────
  async validatePlayer(username: string, password: string) {
    const { data: profile, error } = await this.supabase
      .getClient()
      .from('profiles')
      .select('id, username, email, password_hash, xp, streak')
      .eq('username', username)
      .maybeSingle();

    if (error || !profile) return null;

    const isMatch = await bcrypt.compare(password, profile.password_hash ?? '');
    if (!isMatch) return null;

    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const { password_hash, ...result } = profile;
    return result;
  }

  // ── Login (LocalAuthGuard validate'den sonra çağrılır) ──
  async login(user: { id: string; username: string; email: string }) {
    const tokens = this.generateTokens(user.id, user.username);

    // refresh token hashini kaydet
    const refreshHash = await bcrypt.hash(tokens.refresh_token, 10);
    await this.supabase
      .getClient()
      .from('profiles')
      .update({ refresh_token_hash: refreshHash })
      .eq('id', user.id);

    return { ...tokens, user };
  }

  // ── Profil ───────────────────────────────────────────────
  async getProfile(userId: string) {
    const { data, error } = await this.supabase
      .getClient()
      .from('profiles')
      .select('id, username, email, xp, streak')
      .eq('id', userId)
      .single();

    if (error || !data) throw new UnauthorizedException('Profil bulunamadı');
    return data;
  }

  // ── Logout ───────────────────────────────────────────────
  async logout(userId: string) {
    await this.supabase
      .getClient()
      .from('profiles')
      .update({ refresh_token_hash: null })
      .eq('id', userId);

    return { success: true, message: 'Çıkış yapıldı' };
  }

  // ── Token üretici (private) ──────────────────────────────
  private generateTokens(userId: string, username: string) {
    const payload = { sub: userId, username };

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const access_token = this.jwt.sign(payload, {
      secret: this.config.get<string>('JWT_SECRET'),
      expiresIn: this.config.get('JWT_EXPIRES_IN', '3600s') as any,
    });

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const refresh_token = this.jwt.sign(payload, {
      secret: this.config.get<string>('JWT_REFRESH_SECRET'),
      expiresIn: this.config.get('JWT_REFRESH_EXPIRES_IN', '7d') as any,
    });

    return { access_token, refresh_token };
  }
}
