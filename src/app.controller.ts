// app.controller.ts — Kök rotayı yöneten controller (GET /).
// NestJS varsayılan boilerplate; sunucunun ayakta olduğunu doğrulamak için kullanılır.

import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  // GET / — sunucu sağlık kontrolü
  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
