// players.module.ts — Oyuncu modülü; CRUD endpoint'lerini barındırır.
//
// TypeOrmModule.forFeature([Player]): Bu modülde Player repository'sini
//   @InjectRepository(Player) ile kullanabilmek için gerekli kayıt.
//   forRoot() global bağlantıyı kurar; forFeature() hangi entity'lerin
//   bu modülde kullanılacağını belirtir.
//
// exports: [PlayersService] — AuthModule gibi diğer modüller
//   PlayersService'i import etmeden kullanabilir.

import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PlayersController } from './players.controller';
import { PlayersService }    from './players.service';
import { Player }            from './player.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([Player]), // Player repository'sini bu modüle kaydet
  ],
  controllers: [PlayersController],
  providers:   [PlayersService],
  exports:     [PlayersService], // diğer modüller PlayersService inject edebilir
})
export class PlayersModule {}
