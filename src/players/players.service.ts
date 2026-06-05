// players.service.ts — Oyuncu CRUD iş mantığı katmanı.
//
// @InjectRepository(Player): TypeORM'un bize verdiği hazır repository nesnesi.
//   Bu nesne üzerinden: find(), findOneBy(), save(), update(), delete() çağrılır.
//   Biz SQL yazmıyoruz — TypeORM sorguyu otomatik oluşturur.
//
// CRUD metodları:
//   create()   → INSERT INTO players
//   findAll()  → SELECT * FROM players
//   findOne()  → SELECT * FROM players WHERE id = ?
//   update()   → UPDATE players SET ... WHERE id = ?
//   remove()   → DELETE FROM players WHERE id = ?
//
// NotFoundException: kayıt bulunamazsa NestJS otomatik 404 döner.

import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import * as bcrypt          from 'bcrypt';
import { Player }           from './player.entity';
import { CreatePlayerDto }  from './dto/create-player.dto';

@Injectable()
export class PlayersService {
  constructor(
    // TypeORM Player repository'sini dependency injection ile al
    @InjectRepository(Player)
    private playersRepo: Repository<Player>,
  ) {}

  // Yeni oyuncu oluştur — şifreyi hashle ve kaydet
  async create(dto: CreatePlayerDto): Promise<Player> {
    const hashedPassword = await bcrypt.hash(dto.password, 10);
    const player = this.playersRepo.create({ ...dto, password: hashedPassword });
    return this.playersRepo.save(player); // INSERT INTO players
  }

  // Tüm oyuncuları listele
  async findAll(): Promise<Player[]> {
    return this.playersRepo.find(); // SELECT * FROM players
  }

  // Tek oyuncu getir — bulunamazsa 404 fırlat
  async findOne(id: number): Promise<Player> {
    const player = await this.playersRepo.findOneBy({ id }); // SELECT WHERE id = ?
    if (!player) throw new NotFoundException(`Oyuncu #${id} bulunamadı`);
    return player;
  }

  // Oyuncu güncelle — Partial<> sayesinde sadece gönderilen alanlar güncellenir
  async update(id: number, dto: Partial<CreatePlayerDto>): Promise<Player> {
    await this.findOne(id); // önce var mı kontrol et
    await this.playersRepo.update(id, dto); // UPDATE players SET ...
    return this.findOne(id); // güncel halini döndür
  }

  // Oyuncuyu sil
  async remove(id: number): Promise<{ message: string }> {
    await this.findOne(id); // önce var mı kontrol et
    await this.playersRepo.delete(id); // DELETE FROM players WHERE id = ?
    return { message: `Oyuncu #${id} silindi` };
  }

  // XP güncelle — ders bitince çağrılır
  async addXP(playerId: number, amount: number): Promise<Player> {
    const player = await this.findOne(playerId);
    player.xp += amount;
    return this.playersRepo.save(player);
  }
}
