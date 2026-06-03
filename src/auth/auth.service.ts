import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class AuthService {
  constructor(
    private supabase: SupabaseService,
    private jwt: JwtService,
  ) {}

  async register(email: string, password: string, username: string) {
    const client = this.supabase.getClient();

    const { data, error } = await client.auth.signUp({ email, password });
    if (error) throw new UnauthorizedException(error.message);

    const userId = data.user?.id;
    if (userId) {
      await client.from('profiles').upsert({ id: userId, username });
    }

    const token = this.jwt.sign({ sub: userId, email });
    return { access_token: token, user: { id: userId, email, username } };
  }

  async login(email: string, password: string) {
    const client = this.supabase.getClient();

    const { data, error } = await client.auth.signInWithPassword({ email, password });
    if (error) throw new UnauthorizedException('Email veya şifre hatalı');

    const userId = data.user?.id;
    const { data: profile } = await client
      .from('profiles')
      .select('username, xp, streak')
      .eq('id', userId)
      .single();

    const token = this.jwt.sign({ sub: userId, email });
    return { access_token: token, user: { id: userId, email, ...profile } };
  }

  async getProfile(userId: string) {
    const { data, error } = await this.supabase
      .getClient()
      .from('profiles')
      .select('id, username, xp, streak')
      .eq('id', userId)
      .single();

    if (error) throw new UnauthorizedException('Profil bulunamadı');
    return data;
  }

  async logout(userId: string) {
    await this.supabase.getClient().auth.signOut();
    return { success: true, message: 'Çıkış yapıldı' };
  }
}
