// progress.service.ts — Kullanıcı ilerleme ve XP güncelleme.
// nestjs_user_progress tablosu kullanılır — Supabase UUID tablosuyla çakışmaz.

import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository }       from 'typeorm';
import { UserProgress }     from './user-progress.entity';
import { Player }           from '../players/player.entity';

@Injectable()
export class ProgressService {
  constructor(
    @InjectRepository(UserProgress)
    private progressRepo: Repository<UserProgress>,
    @InjectRepository(Player)
    private playersRepo: Repository<Player>,
  ) {}

  // Kullanıcının tüm ders ilerlemesini döner
  async getUserProgress(playerId: number): Promise<UserProgress[]> {
    try {
      return await this.progressRepo.find({ where: { player_id: playerId } });
    } catch {
      return [];
    }
  }

  // Ders bitince çağrılır: en yüksek skor korunur, XP birikmeli eklenir
  async saveProgress(
    playerId: number,
    lessonId: number,
    score: number,
    xpEarned: number,
    correctCount: number,
    totalCount: number,
    wrongQuestionIds: number[],
  ): Promise<{ success: boolean }> {
    try {
      let progress = await this.progressRepo.findOne({
        where: { player_id: playerId, lesson_id: lessonId },
      });

      if (progress) {
        if (score > progress.score) {
          progress.score         = score;
          progress.correct_count = correctCount;
          progress.total_count   = totalCount;
          progress.completed     = score >= 50;
        }
        progress.earned_xp         += xpEarned;
        progress.wrong_question_ids = JSON.stringify(wrongQuestionIds);
      } else {
        progress = this.progressRepo.create({
          player_id:          playerId,
          lesson_id:          lessonId,
          completed:          score >= 50,
          score,
          correct_count:      correctCount,
          total_count:        totalCount,
          earned_xp:          xpEarned,
          wrong_question_ids: JSON.stringify(wrongQuestionIds),
        });
      }

      await this.progressRepo.save(progress);

      // Oyuncunun toplam XP'sini güncelle
      const player = await this.playersRepo.findOneBy({ id: playerId });
      if (player) {
        player.xp += xpEarned;
        await this.playersRepo.save(player);
      }

      return { success: true };
    } catch (e) {
      console.warn('saveProgress hata:', e.message);
      return { success: false };
    }
  }
}
