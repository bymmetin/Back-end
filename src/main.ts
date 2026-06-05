// main.ts — NestJS uygulamasının başlangıç noktası.
//
// CORS: Mobil uygulama farklı origin'den (192.168.x.x:8081) istek atar.
//   app.enableCors() ile tüm kaynaklara izin verilir — geliştirme ortamı için.
//
// ValidationPipe: gelen isteklerin DTO kurallarına uygunluğunu kontrol eder.
//   whitelist: true → DTO'da olmayan alanları siler (güvenlik).
//   transform: true → string parametreleri otomatik number'a çevirir.
//
// ClassSerializerInterceptor: @Exclude() ile işaretlenen alanları (şifre hash'i) yanıttan kaldırır.

import { NestFactory, Reflector } from '@nestjs/core';
import { ValidationPipe, ClassSerializerInterceptor } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // CORS: Expo Go (192.168.x.x:8081) ve Postman'dan gelen isteklere izin ver
  app.enableCors({ origin: '*' });

  // Tüm route'larda DTO doğrulaması
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, transform: true }));

  // Şifre hash gibi @Exclude() alanları yanıta dahil etme
  app.useGlobalInterceptors(new ClassSerializerInterceptor(app.get(Reflector)));

  // PORT env'den al; cloud deploy'larda port dinamik değişir
  await app.listen(process.env.PORT ?? 3000);

  console.log(`Backend çalışıyor: http://localhost:${process.env.PORT ?? 3000}`);
}
bootstrap();
