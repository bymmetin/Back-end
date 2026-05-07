-- ============================================================
-- Mnemo — Supabase Veritabanı Şeması
-- Tabloları silip baştan oluşturur (tam sıfırlama)
-- ============================================================

-- Varsa eski tabloları temizle (sıra önemli — FK kırılmasın)
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS lessons   CASCADE;
DROP TABLE IF EXISTS topics    CASCADE;

-- ── topics — Üniteler ─────────────────────────────────────
-- Her ünite bir konuyu (Birinci Dünya Savaşı, Osmanlı vb.) temsil eder.
-- order_num küçükten büyüğe sıralanır.
CREATE TABLE topics (
  id          BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title       TEXT    NOT NULL,          -- Ünite adı
  description TEXT,                      -- Kısa açıklama (opsiyonel)
  order_num   INTEGER NOT NULL DEFAULT 0 -- Gösterim sırası
);

-- ── lessons — Aşamalar ────────────────────────────────────
-- Her ünite birden fazla aşama içerebilir.
-- Aşaması olmayan üniteler uygulamada gösterilmez.
CREATE TABLE lessons (
  id        BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  topic_id  BIGINT  NOT NULL REFERENCES topics(id) ON DELETE CASCADE,
  title     TEXT    NOT NULL,            -- Aşama adı
  order_num INTEGER NOT NULL DEFAULT 0   -- Ünite içindeki sıra
);

-- ── questions — Sorular ───────────────────────────────────
-- Desteklenen soru tipleri:
--   multiple_choice → A/B/C/D şıklı soru
--   matching        → Eşleştirme (extra_data JSON)
--   fill_blank      → Boşluk doldurma
--   (şıksız multiple_choice → bilgi kartı olarak gösterilir)
CREATE TABLE questions (
  id             BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  lesson_id      BIGINT NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
  question_text  TEXT   NOT NULL,
  question_type  TEXT   NOT NULL DEFAULT 'multiple_choice',
  option_a       TEXT,
  option_b       TEXT,
  option_c       TEXT,
  option_d       TEXT,
  correct_answer TEXT,                   -- "A" | "B" | "C" | "D" | metin
  extra_data     TEXT,                   -- JSON (matching için)
  image_url      TEXT,                   -- Görsel URL (opsiyonel)
  audio_url      TEXT                    -- Ses URL (opsiyonel)
);

-- ── Row Level Security ─────────────────────────────────────
ALTER TABLE topics    ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons   ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Herkes okuyabilir" ON topics    FOR SELECT USING (true);
CREATE POLICY "Herkes okuyabilir" ON lessons   FOR SELECT USING (true);
CREATE POLICY "Herkes okuyabilir" ON questions FOR SELECT USING (true);

GRANT SELECT ON topics    TO anon;
GRANT SELECT ON lessons   TO anon;
GRANT SELECT ON questions TO anon;
