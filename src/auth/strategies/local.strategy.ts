// local.strategy.ts — Kullanıcı adı + şifre doğrulama stratejisi (passport-local).
// POST /auth/login isteğinde LocalAuthGuard bu stratejiyi tetikler.
// usernameField: 'username' — gövdedeki "username" alanını kullanır (varsayılan "username" zaten).
// validate() null dönerse UnauthorizedException fırlatır; başarılıysa req.user'a atanır.

import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy }         from 'passport-local';
import { AuthService }      from '../auth.service';

@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(private authService: AuthService) {
    super({ usernameField: 'username' }); // istek gövdesinde 'username' alanını ara
  }

  // Şifre yanlışsa null gelir → UnauthorizedException; doğruysa kullanıcı objesini döner
  async validate(username: string, password: string) {
    const user = await this.authService.validatePlayer(username, password);
    if (!user) {
      throw new UnauthorizedException('Kullanıcı adı veya şifre hatalı');
    }
    return user; // req.user olur
  }
}
