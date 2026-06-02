import { Controller, Get, UseGuards } from '@nestjs/common';
import { TopicsService } from './topics.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@Controller('topics')
@UseGuards(JwtAuthGuard)
export class TopicsController {
  constructor(private topics: TopicsService) {}

  @Get()
  getAll() {
    return this.topics.getTopics();
  }
}
