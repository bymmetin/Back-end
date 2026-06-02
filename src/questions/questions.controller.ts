import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { QuestionsService } from './questions.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@Controller('questions')
@UseGuards(JwtAuthGuard)
export class QuestionsController {
  constructor(private questions: QuestionsService) {}

  @Get(':lessonId')
  getByLesson(@Param('lessonId') lessonId: string) {
    return this.questions.getQuestions(lessonId);
  }
}
