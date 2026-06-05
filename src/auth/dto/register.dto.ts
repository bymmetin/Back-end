// register.dto.ts — POST /auth/register isteği için doğrulama kuralları.
//
// DTO (Data Transfer Object): API'ye gelen verinin şeklini ve kurallarını tanımlar.
// class-validator dekoratörleri + ValidationPipe birlikte çalışır:
//   Kural ihlali → 400 Bad Request otomatik döner, controller'a ulaşmaz.
//
// @IsString():   metin olmalı
// @IsNotEmpty(): boş geçilemez
// @MinLength():  minimum karakter uzunluğu
// @IsEmail():    geçerli email formatı

import { IsEmail, IsNotEmpty, IsString, MinLength } from 'class-validator';

export class RegisterDto {
  @IsString()
  @IsNotEmpty()
  @MinLength(3, { message: 'Kullanıcı adı en az 3 karakter olmalı' })
  username: string;

  @IsEmail({}, { message: 'Geçerli bir email adresi girin' })
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  @MinLength(6, { message: 'Şifre en az 6 karakter olmalı' })
  password: string;
}
