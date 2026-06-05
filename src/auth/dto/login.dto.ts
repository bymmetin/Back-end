// login.dto.ts — POST /auth/login isteği için doğrulama kuralları.
//
// LocalAuthGuard bu DTO'yu doğruladıktan sonra LocalStrategy'yi çalıştırır.
// LocalStrategy 'username' alanını kullanır (usernameField: 'username' ayarıyla).

import { IsNotEmpty, IsString } from 'class-validator';

export class LoginDto {
  @IsString()
  @IsNotEmpty({ message: 'Kullanıcı adı boş olamaz' })
  username: string;

  @IsString()
  @IsNotEmpty({ message: 'Şifre boş olamaz' })
  password: string;
}
