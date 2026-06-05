// players.controller.ts — Oyuncu CRUD HTTP route'ları.
//
// Controller, HTTP isteğini karşılar ve uygun Service metodunu çağırır.
// İş mantığı burada değil — controller sadece yönlendirir.
//
// @Controller('players'): tüm route'lar /players altında toplanır
// @UseGuards(JwtAuthGuard): tüm route'lar JWT gerektirir (login olmadan erişilemez)
// ParseIntPipe: URL'deki string parametreyi number'a çevirir ("/players/1" → id: 1)

import {
  Controller, Get, Post, Body,
  Patch, Param, Delete, UseGuards, ParseIntPipe,
} from '@nestjs/common';
import { PlayersService }  from './players.service';
import { CreatePlayerDto } from './dto/create-player.dto';
import { JwtAuthGuard }    from '../auth/guards/jwt-auth.guard';

@Controller('players')
@UseGuards(JwtAuthGuard) // tüm oyuncu route'ları JWT gerektirir
export class PlayersController {
  constructor(private readonly playersService: PlayersService) {}

  // POST /players — yeni oyuncu oluştur
  @Post()
  create(@Body() createPlayerDto: CreatePlayerDto) {
    return this.playersService.create(createPlayerDto);
  }

  // GET /players — tüm oyuncuları listele
  @Get()
  findAll() {
    return this.playersService.findAll();
  }

  // GET /players/:id — tek oyuncu getir
  // ParseIntPipe: ":id" string'ini number'a çevirir
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.playersService.findOne(id);
  }

  // PATCH /players/:id — oyuncu güncelle (sadece gönderilen alanlar)
  @Patch(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateDto: Partial<CreatePlayerDto>,
  ) {
    return this.playersService.update(id, updateDto);
  }

  // DELETE /players/:id — oyuncu sil
  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.playersService.remove(id);
  }
}
