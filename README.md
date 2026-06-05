# Mnemo Backend API

NestJS + Supabase tabanlı Mnemo mobil uygulaması backend'i.

## Kurulum

```bash
npm install
```

## Çalıştırma

```bash
# geliştirme
npm run start:dev

# üretim
npm run start:prod
```

## Ortam Değişkenleri (.env)

```
SUPABASE_URL=https://gyucxqpvrczuqqqhtrkm.supabase.co
SUPABASE_KEY=<supabase_key>
JWT_SECRET=mnemo_jwt_secret_2025
JWT_EXPIRES_IN=3600s
JWT_REFRESH_SECRET=mnemo_refresh_secret_2025
JWT_REFRESH_EXPIRES_IN=7d
```

## API Endpoint Listesi

### Auth (Kimlik Doğrulama)

| Method | Endpoint | Korumalı | Açıklama |
|--------|----------|----------|----------|
| POST | `/auth/register` | Hayır | Yeni kullanıcı kaydı |
| POST | `/auth/login` | Hayır | Giriş yap, JWT token döner |
| GET | `/auth/profile` | Evet | Giriş yapan kullanıcının profili |
| POST | `/auth/logout` | Evet | Çıkış yap |

**POST /auth/register** gövdesi:
```json
{ "username": "ali", "email": "ali@example.com", "password": "123456" }
```

**POST /auth/login** gövdesi:
```json
{ "email": "ali@example.com", "password": "123456" }
```

**Korumalı route'lar için header:**
```
Authorization: Bearer <access_token>
```

---

### Topics (Konular)

| Method | Endpoint | Korumalı | Açıklama |
|--------|----------|----------|----------|
| GET | `/topics` | Evet | Tüm konuları listele |

---

### Lessons (Dersler)

| Method | Endpoint | Korumalı | Açıklama |
|--------|----------|----------|----------|
| GET | `/lessons/:topicId` | Evet | Konuya ait dersleri getir |

---

### Questions (Sorular)

| Method | Endpoint | Korumalı | Açıklama |
|--------|----------|----------|----------|
| GET | `/questions/:lessonId` | Evet | Derse ait soruları getir |

---

### Progress (İlerleme)

| Method | Endpoint | Korumalı | Açıklama |
|--------|----------|----------|----------|
| GET | `/progress/:userId` | Evet | Kullanıcının tüm ilerlemesini getir |
| POST | `/progress` | Evet | Ders ilerlemesini kaydet, XP güncelle |

**POST /progress** gövdesi:
```json
{ "userId": "uuid", "lessonId": "uuid", "score": 80, "xpEarned": 10 }
```

---

## Veritabanı Tabloları (Supabase)

- `profiles` — Kullanıcı profili (id, username, xp, streak)
- `topics` — Konular (id, title, description, order_num)
- `lessons` — Dersler (id, topic_id, title, order_num)
- `questions` — Sorular (id, lesson_id, question_text, options, correct_answer)
- `user_progress` — Kullanıcı ilerlemesi (id, user_id, lesson_id, completed, score)
