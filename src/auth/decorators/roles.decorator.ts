// roles.decorator.ts — Rol bazlı erişim için kullanılan özel decorator.
// Kullanım: @Roles('admin') — o route sadece 'admin' rolüne sahip kullanıcılara açılır.
// RolesGuard ile birlikte çalışır; ROLES_KEY metadata olarak route'a eklenir.

import { SetMetadata } from '@nestjs/common';

export const ROLES_KEY = 'roles'; // metadata anahtarı

// Örnek: @Roles('admin', 'moderator')
export const Roles = (...roles: string[]) => SetMetadata(ROLES_KEY, roles);
