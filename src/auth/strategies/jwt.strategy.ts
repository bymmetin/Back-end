import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { SupabaseService } from '../../supabase/supabase.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private config: ConfigService,
    private supabase: SupabaseService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: config.get<string>('JWT_SECRET')!,
    });
  }

  async validate(payload: { sub: string; username: string }) {
    const { data, error } = await this.supabase
      .getClient()
      .from('profiles')
      .select('id, username, xp, streak')
      .eq('id', payload.sub)
      .single();

    if (error || !data) {
      throw new UnauthorizedException('Geçersiz token');
    }

    return { userId: data.id, username: data.username, xp: data.xp, streak: data.streak };
  }
}
