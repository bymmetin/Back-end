// local-auth.guard.ts — Kullanıcı adı+şifre doğrulama koruması.
// Sadece POST /auth/login route'unda kullanılır.
// LocalStrategy.validate()'i çalıştırır; başarılıysa AuthController.login()'e geçer.

import { Injectable } from '@nestjs/common';
import { AuthGuard }  from '@nestjs/passport';

@Injectable()
export class LocalAuthGuard extends AuthGuard('local') {}
