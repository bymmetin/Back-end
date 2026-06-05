// user-progress.entity.ts — NestJS için ayrı ilerleme tablosu.
// Mevcut Supabase user_progress (UUID) ile çakışmamak için nestjs_user_progress kullanılır.
// player_id: NestJS players tablosunun integer ID'si.

import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('nestjs_user_progress')
export class UserProgress {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  player_id: number; // NestJS players tablosunun integer ID'si

  @Column()
  lesson_id: number;

  @Column({ default: false })
  completed: boolean;

  @Column({ default: 0 })
  score: number;

  @Column({ default: 0 })
  correct_count: number;

  @Column({ default: 0 })
  total_count: number;

  @Column({ default: 0 })
  earned_xp: number;

  @Column({ nullable: true, type: 'text' })
  wrong_question_ids: string;
}
