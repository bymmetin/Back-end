import { Body, Controller, Get, Post, Request, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import { LocalAuthGuard } from './guards/local-auth.guard';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private auth: AuthService) {}

  // POST /auth/register — açık
  @Post('register')
  register(@Body() dto: RegisterDto) {
    return this.auth.register(dto.username, dto.email, dto.password);
  }

  // POST /auth/login — LocalAuthGuard (passport-local) validate'i tetikler
  @UseGuards(LocalAuthGuard)
  @Post('login')
  login(@Request() req: { user: { id: string; username: string; email: string } }) {
    return this.auth.login(req.user);
  }

  // GET /auth/profile — JwtAuthGuard korumalı
  @UseGuards(JwtAuthGuard)
  @Get('profile')
  getProfile(@Request() req: { user: { userId: string } }) {
    return this.auth.getProfile(req.user.userId);
  }

  // POST /auth/logout — JwtAuthGuard korumalı
  @UseGuards(JwtAuthGuard)
  @Post('logout')
  logout(@Request() req: { user: { userId: string } }) {
    return this.auth.logout(req.user.userId);
  }
}
