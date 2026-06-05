// topics.controller.ts — Konu (ünite) route'larını yönetir.
// GET /topics — tüm konuları sıralı döner (JWT gerektirir).
// Tüm route'lar JwtAuthGuard ile korumalı; token olmadan 401 döner.

import { Controller, Get, UseGuards } from '@nestjs/common';
import { TopicsService } from './topics.service';
import { JwtAuthGuard }  from '../auth/guards/jwt-auth.guard';

@Controller('topics')
@UseGuards(JwtAuthGuard) // tüm route'lar JWT gerektirir
export class TopicsController {
  constructor(private topics: TopicsService) {}

  // Tüm konuları order_num'a göre sıralı döner
  @Get()
  getAll() {
    return this.topics.getTopics();
  }
}
