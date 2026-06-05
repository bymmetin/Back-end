// lessons.controller.ts — Ders route'ları.
// GET /lessons/:topicId — belirtilen konunun derslerini sıralı döner (JWT gerektirir).
// ParseIntPipe: URL string parametresini number'a çevirir.

import { Controller, Get, Param, UseGuards, ParseIntPipe } from '@nestjs/common';
import { LessonsService } from './lessons.service';
import { JwtAuthGuard }   from '../auth/guards/jwt-auth.guard';

@Controller('lessons')
@UseGuards(JwtAuthGuard)
export class LessonsController {
  constructor(private lessons: LessonsService) {}

  // GET /lessons/:topicId — o konunun dersleri
  @Get(':topicId')
  getByTopic(@Param('topicId', ParseIntPipe) topicId: number) {
    return this.lessons.getLessons(topicId);
  }
}
