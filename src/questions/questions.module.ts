// questions.module.ts — Soru modülü.
import { Module }        from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuestionsService }    from './questions.service';
import { QuestionsController } from './questions.controller';
import { Question }            from './question.entity';

@Module({
  imports:     [TypeOrmModule.forFeature([Question])],
  controllers: [QuestionsController],
  providers:   [QuestionsService],
})
export class QuestionsModule {}
