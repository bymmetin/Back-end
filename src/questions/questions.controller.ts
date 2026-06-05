// questions.controller.ts — Soru route'ları.
// GET /questions/:lessonId — o derse ait soruları döner (JWT gerektirir).

import { Controller, Get, Param, UseGuards, ParseIntPipe } from '@nestjs/common';
import { QuestionsService } from './questions.service';
import { JwtAuthGuard }     from '../auth/guards/jwt-auth.guard';

@Controller('questions')
@UseGuards(JwtAuthGuard)
export class QuestionsController {
  constructor(private questions: QuestionsService) {}

  @Get(':lessonId')
  getByLesson(@Param('lessonId', ParseIntPipe) lessonId: number) {
    return this.questions.getQuestions(lessonId);
  }
}
