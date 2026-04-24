# Mnemo — Back-end

Mnemo uygulamasının veritabanı katmanı. **Supabase** (PostgreSQL) kullanılmaktadır.

## Proje Bağlantısı

- **Mobil Uygulama:** [bymmetin/MobilUygulama](https://github.com/bymmetin/MobilUygulama)
- **Supabase Projesi:** `gyucxqpvrczuqqqhtrkm.supabase.co`

---

## Dosyalar

| Dosya | Açıklama |
|-------|----------|
| `schema.sql` | Tablo yapısı, ilişkiler, RLS politikaları |
| `seed.sql` | Örnek Osmanlı tarihi verileri |

---

## Veritabanı Yapısı

```
topics
  └── lessons
        └── questions
```

### `topics` — Konular
| Kolon | Tip | Açıklama |
|-------|-----|----------|
| id | BIGINT | Otomatik artan birincil anahtar |
| title | TEXT | Konu başlığı |
| description | TEXT | Konu açıklaması |
| order_num | INTEGER | Sıralama numarası |

### `lessons` — Dersler
| Kolon | Tip | Açıklama |
|-------|-----|----------|
| id | BIGINT | Birincil anahtar |
| topic_id | BIGINT | Bağlı konu (FK → topics) |
| title | TEXT | Ders başlığı |
| order_num | INTEGER | Sıralama numarası |

### `questions` — Sorular
| Kolon | Tip | Açıklama |
|-------|-----|----------|
| id | BIGINT | Birincil anahtar |
| lesson_id | BIGINT | Bağlı ders (FK → lessons) |
| question_text | TEXT | Soru metni |
| option_a/b/c/d | TEXT | Cevap seçenekleri |
| correct_answer | TEXT | Doğru cevap (A/B/C/D) |
| image_url | TEXT | Soru görseli (opsiyonel) |
| audio_url | TEXT | Soru sesi (opsiyonel) |

---

## Kurulum

1. [supabase.com](https://supabase.com)'da yeni proje oluştur
2. **SQL Editor**'da `schema.sql` dosyasını çalıştır
3. **SQL Editor**'da `seed.sql` dosyasını çalıştır
4. Project Settings → API'den URL ve anon key'i kopyala
5. Mobil uygulamada `src/config/supabase.js` dosyasına yapıştır

## Güvenlik

- Row Level Security (RLS) aktif
- Anonim kullanıcılar yalnızca okuma yapabilir
- Yazma işlemleri sadece Supabase Dashboard'dan yapılır
