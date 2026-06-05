// lesson.entity.ts — Ders tablosu.

import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';
import { Topic }    from '../topics/topic.entity';
import { Question } from '../questions/question.entity';

@Entity('lessons')
export class Lesson {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column({ default: 0 })
  order_num: number;

  @ManyToOne(() => Topic, (topic) => topic.lessons)
  @JoinColumn({ name: 'topic_id' })
  topic: Topic;

  @Column()
  topic_id: number;

  @OneToMany(() => Question, (question) => question.lesson)
  questions: Question[];
}
