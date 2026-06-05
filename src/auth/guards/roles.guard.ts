// roles.guard.ts — Rol bazlı erişim kontrolü.
// @Roles('admin') gibi decorator ile işaretlenen route'larda kullanılır.
// Route'da @Roles yoksa herkes geçer; varsa req.user.role listede olmalıdır.
// Şu an uygulamada admin rolü kullanılmıyor; ileride içerik yönetimi için planlanmış.

import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { ROLES_KEY } from '../decorators/roles.decorator';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    // Route veya controller üzerindeki @Roles() değerlerini oku
    const requiredRoles = this.reflector.getAllAndOverride<string[]>(ROLES_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);

    // Rol kısıtı yoksa herkese izin ver
    if (!requiredRoles || requiredRoles.length === 0) {
      return true;
    }

    // Kullanıcının rolü gerekli roller arasında mı?
    const { user } = context.switchToHttp().getRequest<{ user: { role?: string } }>();
    return requiredRoles.includes(user?.role ?? '');
  }
}
