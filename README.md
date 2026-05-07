# 🗄️ Mnemo — Veritabanı Katmanı (Back-end)

Mnemo uygulamasının Supabase/PostgreSQL tabanlı bulut veritabanı şeması ve örnek veri seti.

## 📐 Veri Modeli

```
topics  (Üniteler)
 └── lessons  (Aşamalar)
       └── questions  (Sorular)
```

Silme işlemleri CASCADE — bir ünite silinirse bağlı tüm aşama ve sorular da otomatik silinir.

---

## 🗂️ Tablo Detayları

### `topics` — Üniteler
| Sütun | Tip | Açıklama |
|---|---|---|
| `id` | BIGINT | Otomatik artan birincil anahtar |
| `title` | TEXT | Ünite adı (ör: "Osmanlı Kuruluş Dönemi") |
| `description` | TEXT | Kısa açıklama (opsiyonel) |
| `order_num` | INTEGER | Gösterim sırası — küçük numara üstte gösterilir |

### `lessons` — Aşamalar
| Sütun | Tip | Açıklama |
|---|---|---|
| `id` | BIGINT | Otomatik artan birincil anahtar |
| `topic_id` | BIGINT | Bağlı ünite → `topics.id` (CASCADE DELETE) |
| `title` | TEXT | Aşama adı (ör: "İstanbul'un Fethi") |
| `order_num` | INTEGER | Ünite içindeki sıra |

> **Not:** Aşaması olmayan üniteler uygulamada gösterilmez.

### `questions` — Sorular
| Sütun | Tip | Açıklama |
|---|---|---|
| `id` | BIGINT | Otomatik artan birincil anahtar |
| `lesson_id` | BIGINT | Bağlı aşama → `lessons.id` (CASCADE DELETE) |
| `question_text` | TEXT | Soru metni veya bilgi kartı içeriği |
| `question_type` | TEXT | `multiple_choice` \| `matching` \| `fill_blank` (varsayılan: `multiple_choice`) |
| `option_a` – `option_d` | TEXT | Çoktan seçmeli şıklar (opsiyonel) |
| `correct_answer` | TEXT | Doğru cevap — çoktan seçmeli için `"A"/"B"/"C"/"D"` |
| `extra_data` | TEXT | JSON string — eşleştirme çiftleri için kullanılır (opsiyonel) |
| `image_url` | TEXT | Görselli sorular için tam URL (opsiyonel) |
| `audio_url` | TEXT | Sesli sorular için tam URL (opsiyonel) |

---

## 📁 Dosyalar

| Dosya | İçerik |
|---|---|
| `schema.sql` | Tablo oluşturma, RLS politikaları ve yetkilendirme |
| `seed.sql` | Örnek veriler — Osmanlı tarihi ve I. Dünya Savaşı konuları |

---

## 🚀 Kurulum

### 1. Supabase Projesi Oluştur
[supabase.com](https://supabase.com) → **New Project** → Bölge: **Europe (Frankfurt)** önerilir.

### 2. SQL Dosyalarını Sırayla Çalıştır

Dashboard → **SQL Editor** sekmesine git:

```
Adım 1: schema.sql içeriğini yapıştır → Run
Adım 2: seed.sql  içeriğini yapıştır → Run
```

> ⚠️ `seed.sql` dosyası `TRUNCATE` ile başlar — çalıştırmadan önce mevcut verileri yedekle.

### 3. API Bilgilerini Al

**Project Settings → API** bölümünden:
- `Project URL` → `SUPABASE_URL`
- `anon public` key → `SUPABASE_KEY`

Bu değerleri mobil uygulamanın `src/config/supabase.js` dosyasına gir.

---

## 🔒 Güvenlik (Row Level Security)

Tüm tablolarda RLS aktiftir:

| İşlem | Yetkili |
|---|---|
| `SELECT` (okuma) | Herkes — anonim kullanıcılar dahil |
| `INSERT / UPDATE / DELETE` | Yalnızca Supabase Dashboard |

Uygulama yalnızca okuma yapar; içerik yönetimi tamamen Dashboard üzerinden yapılır.

---

## 📝 Soru Tipi Örnekleri

### `multiple_choice` — Çoktan Seçmeli
```sql
INSERT INTO questions
  (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  1,
  'Osmanlı Devleti hangi yılda kuruldu?',
  'multiple_choice',
  '1071', '1299', '1453', '1326',
  'B'
);
```

### `matching` — Eşleştirme
`extra_data` alanına JSON çift listesi yazılır; `option_*` ve `correct_answer` boş bırakılır:
```sql
INSERT INTO questions (lesson_id, question_text, question_type, extra_data)
VALUES (
  2,
  'Padişahları tahta çıkış yıllarıyla eşleştir',
  'matching',
  '[{"left":"Osman Bey","right":"1299"},{"left":"Fatih Sultan Mehmet","right":"1451"}]'
);
```

### `fill_blank` — Boşluk Doldurma
`correct_answer` alanına beklenen metin yazılır:
```sql
INSERT INTO questions (lesson_id, question_text, question_type, correct_answer)
VALUES (
  3,
  'Osmanlı Devleti''ni _____ kurmuştur.',
  'fill_blank',
  'Osman Bey'
);
```

### Bilgi Kartı (Info Card)
`question_type = 'multiple_choice'` ama şık yok — uygulamada bilgi metni olarak gösterilir:
```sql
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  1,
  '1299 yılında Osman Bey tarafından kurulan Osmanlı Devleti, küçük bir beylikten dünya imparatorluğuna dönüştü.',
  'multiple_choice'
);
```

---

## 🔗 İlgili Repolar

- **Mobil Uygulama:** [bymmetin/MobilUygulama](https://github.com/bymmetin/MobilUygulama)
- **Supabase Projesi:** `gyucxqpvrczuqqqhtrkm.supabase.co`
