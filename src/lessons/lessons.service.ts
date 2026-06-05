// lessons.service.ts — Ders veri erişim katmanı.
// find({ where: { topic_id }, order: ... }) → SELECT * FROM lessons WHERE topic_id = ? ORDER BY order_num ASC

import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import { Lesson }           from './lesson.entity';

@Injectable()
export class LessonsService {
  constructor(
    @InjectRepository(Lesson)
    private lessonsRepo: Repository<Lesson>,
  ) {}

  // Belirtilen konuya ait dersleri order_num sırasıyla getir
  async getLessons(topicId: number): Promise<Lesson[]> {
    return this.lessonsRepo.find({
      where: { topic_id: topicId },    // WHERE topic_id = ?
      order: { order_num: 'ASC' },     // ORDER BY order_num ASC
    });
  }
}
