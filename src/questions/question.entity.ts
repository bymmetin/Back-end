// question.entity.ts — Soru tablosunu temsil eden TypeORM Entity'si.
//
// Desteklenen soru tipleri (question_type):
//   'multiple_choice' — A/B/C/D şıklı soru; option_a boşsa bilgi kartı sayılır
//   'matching'        — sol-sağ eşleştirme; çiftler extra_data JSON'unda tutulur
//   'fill_blank'      — cümlede _____ boşluğunu doldur
//
// option_a null olan multiple_choice → bilgi kartı (şık yok, sadece okunur).
// extra_data: eşleştirme soruları için [{left:"...", right:"..."}] JSON listesi.

import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { Lesson } from '../lessons/lesson.entity';

@Entity('questions')
export class Question {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'text' })
  question_text: string; // soru metni veya bilgi kartı içeriği

  @Column({ default: 'multiple_choice' })
  question_type: string; // 'multiple_choice' | 'matching' | 'fill_blank'

  @Column({ nullable: true })
  option_a: string; // A şıkkı (null ise bilgi kartı)

  @Column({ nullable: true })
  option_b: string;

  @Column({ nullable: true })
  option_c: string;

  @Column({ nullable: true })
  option_d: string;

  @Column({ default: '' })
  correct_answer: string; // doğru şık harfi: 'A' | 'B' | 'C' | 'D'

  @Column({ nullable: true })
  image_url: string; // soru görseli (opsiyonel)

  @Column({ nullable: true })
  audio_url: string; // soru sesi (opsiyonel)

  @Column({ nullable: true, type: 'text' })
  extra_data: string; // eşleştirme soruları için JSON string

  // N:1 ilişki — her soru bir derse aittir
  @ManyToOne(() => Lesson, (lesson) => lesson.questions)
  @JoinColumn({ name: 'lesson_id' })
  lesson: Lesson;

  @Column()
  lesson_id: number; // foreign key değeri
}
