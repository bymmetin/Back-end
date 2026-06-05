// jwt-auth.guard.ts — JWT koruması.
// @UseGuards(JwtAuthGuard) ile işaretlenen route'lara sadece geçerli Bearer token ile erişilir.
// Token doğrulama JwtStrategy.validate() üzerinden yapılır.

import { Injectable } from '@nestjs/common';
import { AuthGuard }  from '@nestjs/passport';

@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {}
