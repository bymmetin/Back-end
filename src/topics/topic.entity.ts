// topic.entity.ts — Konu (ünite) tablosunu temsil eden TypeORM Entity'si.
// Harita ekranındaki her büyük başlık (Osmanlı, Kurtuluş Savaşı vb.) bir topic'tir.
// order_num: haritada hangi sırayla görüneceğini belirler.

import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Lesson } from '../lessons/lesson.entity';

@Entity('topics')
export class Topic {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string; // ünite başlığı

  @Column({ nullable: true, type: 'text' })
  description: string; // ünite açıklaması (opsiyonel)

  @Column({ default: 0 })
  order_num: number; // haritadaki görüntüleme sırası

  // 1:N ilişki — bir konunun birden fazla dersi vardır
  @OneToMany(() => Lesson, (lesson) => lesson.topic)
  lessons: Lesson[];
}
