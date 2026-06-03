import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { LessonsService } from './lessons.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@Controller('lessons')
@UseGuards(JwtAuthGuard)
export class LessonsController {
  constructor(private lessons: LessonsService) {}

  @Get(':topicId')
  getByTopic(@Param('topicId') topicId: string) {
    return this.lessons.getLessons(topicId);
  }
}
