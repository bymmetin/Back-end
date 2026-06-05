// create-player.dto.ts — POST /players isteği için doğrulama kuralları.
// Admin panelinden oyuncu oluşturmak için kullanılır.

import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class CreatePlayerDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(3)
  username: string;

  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(6)
  password: string;
}
