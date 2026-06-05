// auth.module.ts — Kimlik doğrulama modülü.
//
// TypeOrmModule.forFeature([Player]): Bu modülde Player repository'sini
//   @InjectRepository(Player) ile inject edebilmek için gerekli.
//   Her modül kendi entity'lerini forFeature ile kaydetmeli.
//
// JwtModule.registerAsync: ConfigService'den JWT_SECRET ve JWT_EXPIRES_IN alır.
//   Async kullanılır çünkü ConfigService dependency injection gerektirir.
//
// exports: [AuthService] — diğer modüller (ProgressModule vb.) AuthService'i inject edebilir.

import { Module }          from '@nestjs/common';
import { TypeOrmModule }   from '@nestjs/typeorm';
import { JwtModule }       from '@nestjs/jwt';
import { PassportModule }  from '@nestjs/passport';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { AuthService }     from './auth.service';
import { AuthController }  from './auth.controller';
import { LocalStrategy }   from './strategies/local.strategy';
import { JwtStrategy }     from './strategies/jwt.strategy';
import { JwtAuthGuard }    from './guards/jwt-auth.guard';
import { LocalAuthGuard }  from './guards/local-auth.guard';
import { RolesGuard }      from './guards/roles.guard';
import { Player }          from '../players/player.entity';

@Module({
  imports: [
    // Player tablosuna erişim için repository kaydı
    TypeOrmModule.forFeature([Player]),
    PassportModule,
    // JWT modülünü .env değerleriyle async konfigüre et
    JwtModule.registerAsync({
      imports:    [ConfigModule],
      inject:     [ConfigService],
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      useFactory: (config: ConfigService): any => ({
        secret:      config.get<string>('JWT_SECRET'),
        signOptions: { expiresIn: config.get<string>('JWT_EXPIRES_IN', '3600s') },
      }),
    }),
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    LocalStrategy,  // kullanıcı adı + şifre doğrulama
    JwtStrategy,    // Bearer token doğrulama
    JwtAuthGuard,
    LocalAuthGuard,
    RolesGuard,
  ],
  exports: [AuthService, JwtModule, JwtAuthGuard],
})
export class AuthModule {}
