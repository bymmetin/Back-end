// progress.module.ts — İlerleme modülü.
// İki entity register ediliyor: UserProgress (kendi tablosu) + Player (XP güncellemek için).

import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProgressService }    from './progress.service';
import { ProgressController } from './progress.controller';
import { UserProgress }       from './user-progress.entity';
import { Player }             from '../players/player.entity';

@Module({
  imports:     [TypeOrmModule.forFeature([UserProgress, Player])],
  controllers: [ProgressController],
  providers:   [ProgressService],
})
export class ProgressModule {}
