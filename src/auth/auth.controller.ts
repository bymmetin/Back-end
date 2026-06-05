// auth.controller.ts — Kimlik doğrulama HTTP route'ları.
//
// POST /auth/register — herkese açık; yeni oyuncu oluşturur
// POST /auth/login    — LocalAuthGuard passport-local stratejisini çalıştırır,
//                       doğrulanınca req.user dolar, ardından login() token üretir
// GET  /auth/profile  — JWT gerektirir; kendi profilini döner (@Exclude ile şifre gizlenir)
// POST /auth/logout   — JWT gerektirir; refresh token'ı DB'den siler
//
// @HttpCode(200): login POST'tur ama başarı kodu 200 olmalı (NestJS POST için 201 döner)

import {
  Body, Controller, Get, Post,
  Request, UseGuards, HttpCode,
} from '@nestjs/common';
import { AuthService }    from './auth.service';
import { RegisterDto }    from './dto/register.dto';
import { LocalAuthGuard } from './guards/local-auth.guard';
import { JwtAuthGuard }   from './guards/jwt-auth.guard';
import { Player }         from '../players/player.entity';

@Controller('auth')
export class AuthController {
  constructor(private auth: AuthService) {}

  // Yeni oyuncu kaydı — body'den RegisterDto alır, class-validator doğrular
  @Post('register')
  register(@Body() dto: RegisterDto): Promise<Player> {
    return this.auth.register(dto);
  }

  // Giriş — LocalAuthGuard önce validatePlayer() çalıştırır
  // Başarılıysa req.user dolar ve login() token çifti döner
  @UseGuards(LocalAuthGuard)
  @Post('login')
  @HttpCode(200) // POST olmasına rağmen 200 dön (201 yerine)
  login(@Request() req: { user: Player }) {
    return this.auth.login(req.user);
  }

  // Profil — sadece geçerli JWT ile erişilebilir
  // @Exclude() sayesinde password ve refreshToken JSON'a girmez
  @UseGuards(JwtAuthGuard)
  @Get('profile')
  getProfile(@Request() req: { user: Player }) {
    return this.auth.getProfile(req.user.id);
  }

  // Çıkış — JWT gerektirir; refresh token DB'den silinir
  @UseGuards(JwtAuthGuard)
  @Post('logout')
  @HttpCode(200)
  logout(@Request() req: { user: Player }) {
    return this.auth.logout(req.user.id);
  }
}
