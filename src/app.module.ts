// app.module.ts — NestJS kök modülü; tüm modüller ve TypeORM bağlantısı burada tanımlanır.
//
// TypeOrmModule.forRoot(): PostgreSQL bağlantısını bir kez kurar; tüm modüller paylaşır.
// synchronize: true — Entity sınıflarından veritabanı tablolarını otomatik oluşturur/günceller.
//   ⚠ Sadece geliştirme ortamında kullanılır; üretimde TypeORM Migration kullanılmalıdır.
// entities: [__dirname + '/**/*.entity{.ts,.js}'] — tüm .entity dosyalarını otomatik tarar.
//
// ConfigModule.forRoot({ isGlobal: true }): .env dosyasını okur ve tüm modüllerde
//   process.env.DEGISKEN_ADI ile erişilebilir kılar.

import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController }  from './app.controller';
import { AppService }     from './app.service';
import { AuthModule }     from './auth/auth.module';
import { PlayersModule }  from './players/players.module';
import { TopicsModule }   from './topics/topics.module';
import { LessonsModule }  from './lessons/lessons.module';
import { QuestionsModule } from './questions/questions.module';
import { ProgressModule } from './progress/progress.module';

@Module({
  imports: [
    // .env dosyasını global olarak yükle — her modülde ConfigService erişilebilir
    ConfigModule.forRoot({ isGlobal: true }),

    // TypeORM PostgreSQL bağlantısı — .env değerlerinden okunur
    TypeOrmModule.forRootAsync({
      imports:    [ConfigModule],
      inject:     [ConfigService],
      useFactory: (config: ConfigService) => ({
        type:     'postgres',
        host:     config.get<string>('DB_HOST', 'localhost'),
        port:     config.get<number>('DB_PORT', 5432),
        username: config.get<string>('DB_USER', 'postgres'),
        password: config.get<string>('DB_PASSWORD'),
        database: config.get<string>('DB_NAME', 'postgres'),
        // Tüm .entity.ts dosyalarını otomatik tara ve tablolarla eşleştir
        entities:    [__dirname + '/**/*.entity{.ts,.js}'],
        // synchronize: false — mevcut Supabase tablolarını bozmamak için
        // Tablolar Supabase'de zaten var; TypeORM sadece bağlanıp sorgular
        synchronize: false,
        ssl: config.get<string>('DB_SSL') === 'true'
          ? { rejectUnauthorized: false } // Supabase/cloud PostgreSQL için SSL
          : false,
      }),
    }),

    AuthModule,      // kayıt, giriş, JWT — /auth endpoint'leri
    PlayersModule,   // oyuncu CRUD — /players endpoint'leri
    TopicsModule,    // konular — /topics endpoint'leri
    LessonsModule,   // dersler — /lessons endpoint'leri
    QuestionsModule, // sorular — /questions endpoint'leri
    ProgressModule,  // ilerleme — /progress endpoint'leri
  ],
  controllers: [AppController],
  providers:   [AppService],
})
export class AppModule {}
