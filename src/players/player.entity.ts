// player.entity.ts — NestJS auth için oyuncu tablosu.
// @Exclude(): şifre ve refresh token JSON yanıtına dahil edilmez.

import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';
import { Exclude } from 'class-transformer';

@Entity('players')
export class Player {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  username: string;

  @Column({ unique: true })
  email: string;

  @Column()
  @Exclude()
  password: string;

  @Column({ nullable: true })
  @Exclude()
  refreshToken: string;

  @Column({ default: 0 })
  xp: number;

  @Column({ default: 0 })
  streak: number;

  @Column({ nullable: true })
  last_login: string;

  @Column({ default: 'player' })
  role: string;

  @CreateDateColumn()
  createdAt: Date;
}
