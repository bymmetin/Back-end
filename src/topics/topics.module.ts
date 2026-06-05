// topics.module.ts — Konu modülü.
// TypeOrmModule.forFeature([Topic]): bu modülde Topic repository kullanılabilir.

import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TopicsService }     from './topics.service';
import { TopicsController }  from './topics.controller';
import { Topic }             from './topic.entity';

@Module({
  imports:     [TypeOrmModule.forFeature([Topic])],
  controllers: [TopicsController],
  providers:   [TopicsService],
})
export class TopicsModule {}
