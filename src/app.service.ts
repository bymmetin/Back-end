// app.service.ts — Kök servis; sadece sunucu sağlık kontrolü için kullanılır.

import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  // GET / isteğine dönen basit yanıt
  getHello(): string {
    return 'Hello World!';
  }
}
