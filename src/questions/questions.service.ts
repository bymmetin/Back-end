// questions.service.ts — Soru veri erişim katmanı.
// find({ where: { lesson_id }, order: { id: 'ASC' } }) → soruları ekleme sırasıyla getirir.
// Sıra önemli: bilgi kartı → quiz sorusu dizilimi Supabase'de de aynı şekilde.

import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import { Question }         from './question.entity';

@Injectable()
export class QuestionsService {
  constructor(
    @InjectRepository(Question)
    private questionsRepo: Repository<Question>,
  ) {}

  // Belirtilen derse ait tüm soruları ID sırasıyla getir
  async getQuestions(lessonId: number): Promise<Question[]> {
    return this.questionsRepo.find({
      where: { lesson_id: lessonId }, // WHERE lesson_id = ?
      order: { id: 'ASC' },           // ekleme sırası — bilgi kartı/quiz dizilimi bozulmasın
    });
  }
}
