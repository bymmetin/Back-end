// topics.service.ts — Konu (ünite) veri erişim katmanı.
// @InjectRepository(Topic) ile TypeORM repository kullanılır — Supabase SDK değil.
// order_num: haritadaki ünite sırasını belirleyen sütun; ASC = küçükten büyüğe sırala.

import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import { Topic }            from './topic.entity';

@Injectable()
export class TopicsService {
  constructor(
    @InjectRepository(Topic)
    private topicsRepo: Repository<Topic>,
  ) {}

  // Tüm konuları order_num'a göre sıralı getir
  // find({ order: ... }) → SELECT * FROM topics ORDER BY order_num ASC
  async getTopics(): Promise<Topic[]> {
    return this.topicsRepo.find({
      order: { order_num: 'ASC' }, // haritada üstten alta doğru sıralama
    });
  }
}
