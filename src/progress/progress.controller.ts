import { Body, Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import { IsNotEmpty, IsNumber, IsString } from 'class-validator';
import { ProgressService } from './progress.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

class SaveProgressDto {
  @IsString()
  @IsNotEmpty()
  userId: string;

  @IsString()
  @IsNotEmpty()
  lessonId: string;

  @IsNumber()
  score: number;

  @IsNumber()
  xpEarned: number;
}

@Controller('progress')
@UseGuards(JwtAuthGuard)
export class ProgressController {
  constructor(private progress: ProgressService) {}

  @Get(':userId')
  getProgress(@Param('userId') userId: string) {
    return this.progress.getUserProgress(userId);
  }

  @Post()
  saveProgress(@Body() dto: SaveProgressDto) {
    return this.progress.saveProgress(dto.userId, dto.lessonId, dto.score, dto.xpEarned);
  }
}
