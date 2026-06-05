// lessons.module.ts — Ders modülü.
// TypeOrmModule.forFeature([Lesson]): bu modülde Lesson repository kullanılabilir.

import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { LessonsService }    from './lessons.service';
import { LessonsController } from './lessons.controller';
import { Lesson }            from './lesson.entity';

@Module({
  imports:     [TypeOrmModule.forFeature([Lesson])],
  controllers: [LessonsController],
  providers:   [LessonsService],
})
export class LessonsModule {}
