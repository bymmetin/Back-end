// progress.controller.ts — İlerleme route'ları (JWT gerektirir).

import { Body, Controller, Get, Param, Post, UseGuards, ParseIntPipe } from '@nestjs/common';
import { IsNotEmpty, IsNumber, IsArray, IsOptional } from 'class-validator';
import { ProgressService } from './progress.service';
import { JwtAuthGuard }    from '../auth/guards/jwt-auth.guard';

class SaveProgressDto {
  @IsNumber()
  playerId: number;

  @IsNumber()
  lessonId: number;

  @IsNumber()
  score: number;

  @IsNumber()
  xpEarned: number;

  @IsNumber()
  correctCount: number;

  @IsNumber()
  totalCount: number;

  @IsArray()
  @IsOptional()
  wrongQuestionIds: number[];
}

@Controller('progress')
@UseGuards(JwtAuthGuard)
export class ProgressController {
  constructor(private progress: ProgressService) {}

  @Get(':playerId')
  getProgress(@Param('playerId', ParseIntPipe) playerId: number) {
    return this.progress.getUserProgress(playerId);
  }

  @Post()
  saveProgress(@Body() dto: SaveProgressDto) {
    return this.progress.saveProgress(
      dto.playerId, dto.lessonId, dto.score,
      dto.xpEarned, dto.correctCount, dto.totalCount,
      dto.wrongQuestionIds ?? [],
    );
  }
}
