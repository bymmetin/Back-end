-- ============================================================
-- Mnemo — Örnek Veriler
-- Schema.sql çalıştırıldıktan sonra bu dosyayı çalıştır.
-- ============================================================

-- ═══════════════════════════════════════════════════════════
-- ÜNİTE 1: I. Dünya Savaşı
-- ═══════════════════════════════════════════════════════════
INSERT INTO topics (title, description, order_num)
VALUES ('I. Dünya Savaşı', '1914-1918 yılları arası yaşanan küresel savaş', 1);

-- ── Aşama 1.1: Savaşın Nedenleri ──────────────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Savaşın Nedenleri', 1);

-- Bilgi kartı (şık yok → uygulama bilgi metni olarak gösterir)
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'I. Dünya Savaşı 1914-1918 yılları arasında yaşandı. Avusturya-Macaristan Veliahtı Arşidük Franz Ferdinand''ın Saraybosna''da öldürülmesi savaşın fitilini ateşledi.',
  'multiple_choice'
);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Avusturya-Macaristan Veliahtı Arşidük Franz Ferdinand hangi şehirde suikaste uğradı?',
  'multiple_choice',
  'Viyana', 'Belgrad', 'Saraybosna', 'Berlin',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'I. Dünya Savaşı hangi yılda başladı?',
  'multiple_choice',
  '1912', '1914', '1916', '1918',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'İtilaf Devletleri hangi ülkelerden oluşuyordu?',
  'multiple_choice',
  'Almanya, Avusturya, Osmanlı', 'İngiltere, Fransa, Rusya', 'İtalya, Japonya, ABD', 'Bulgaristan, Macaristan, İtalya',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'I. Dünya Savaşı''nda Osmanlı Devleti hangi grupta yer aldı?',
  'multiple_choice',
  'İtilaf Devletleri', 'İttifak Devletleri', 'Tarafsız', 'Önce İtilaf sonra İttifak',
  'B'
);

-- ── Aşama 1.2: Cepheler ve Büyük Muharebeler ──────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Cepheler ve Büyük Muharebeler', 2);

INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Çanakkale Cephesi''nde Türk askerleri, İngiliz ve Anzak kuvvetlerine karşı büyük bir direniş gösterdi. Bu cephe, Mustafa Kemal''in öne çıktığı muharebe oldu.',
  'multiple_choice'
);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Çanakkale Cephesi''nde Türk kuvvetlerini kim komuta etti?',
  'multiple_choice',
  'Enver Paşa', 'Mustafa Kemal', 'Talat Paşa', 'Cemal Paşa',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Yaklaşık 1 milyon kayba yol açan Batı Cephesi muharebesi hangisidir?',
  'multiple_choice',
  'Verdun Muharebesi', 'Marne Muharebesi', 'Somme Muharebesi', 'Ypres Muharebesi',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Cepheleri karşı tarafla eşleştir',
  'matching',
  NULL, NULL, NULL, NULL, NULL,
  '[{"left":"Çanakkale Cephesi","right":"Osmanlı - İtilaf"},{"left":"Batı Cephesi","right":"Almanya - Fransa/İngiltere"},{"left":"Doğu Cephesi","right":"Almanya - Rusya"}]'
);

-- ── Aşama 1.3: Osmanlı ve Savaş ───────────────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Osmanlı ve Savaş', 3);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı Devleti I. Dünya Savaşı''na hangi yılda girdi?',
  'multiple_choice',
  '1914', '1915', '1916', '1917',
  'A'
),
(
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı''nın savaşa girmesinde etkili olan gizli antlaşma hangi devletle yapıldı?',
  'multiple_choice',
  'Avusturya', 'Bulgaristan', 'Almanya', 'İtalya',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı''nın Süveyş Kanalı''na ulaşmaya çalıştığı cephe hangisidir?',
  'multiple_choice',
  'Çanakkale Cephesi', 'Kafkas Cephesi', 'Kanal Cephesi', 'Irak Cephesi',
  'C'
);

-- ── Aşama 1.4: Savaşın Sonu ve Sonuçları ──────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Savaşın Sonu ve Sonuçları', 4);

INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'I. Dünya Savaşı 1918''de İttifak Devletleri''nin yenilgisiyle sona erdi. Osmanlı Devleti Mondros Mütarekesi''ni imzaladı ve toprakları işgale uğradı.',
  'multiple_choice'
);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'Osmanlı Devleti hangi antlaşma ile I. Dünya Savaşı''ndan çekildi?',
  'multiple_choice',
  'Sevr Antlaşması', 'Mondros Mütarekesi', 'Lozan Antlaşması', 'Versay Antlaşması',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'I. Dünya Savaşı''nı resmi olarak sona erdiren antlaşma hangisidir?',
  'multiple_choice',
  'Lozan Antlaşması', 'Sevr Antlaşması', 'Versay Antlaşması', 'Brest-Litovsk Antlaşması',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'Savaş sonrası kurulan ve bugünkü BM''nin öncülü olan uluslararası örgüt hangisidir?',
  'multiple_choice',
  'NATO', 'Milletler Cemiyeti', 'Avrupa Birliği', 'Kızılhaç',
  'B'
);


-- ═══════════════════════════════════════════════════════════
-- ÜNİTE 2: Kurtuluş Savaşı ve Cumhuriyetin Kuruluşu
-- ═══════════════════════════════════════════════════════════
INSERT INTO topics (title, description, order_num)
VALUES ('Kurtuluş Savaşı ve Cumhuriyet', '1919-1923 yılları arası Türk Kurtuluş Savaşı ve Cumhuriyetin ilanı', 2);

-- ── Aşama 2.1: Mustafa Kemal ve Milli Mücadele ────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Mustafa Kemal ve Milli Mücadele', 1);

INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal, 19 Mayıs 1919''da Samsun''a çıkarak Milli Mücadele''yi başlattı. Bu tarih Türkiye''de her yıl Gençlik ve Spor Bayramı olarak kutlanmaktadır.',
  'multiple_choice'
);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal Samsun''a hangi tarihte çıktı?',
  'multiple_choice',
  '19 Mayıs 1918', '19 Mayıs 1919', '23 Nisan 1920', '29 Ekim 1923',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'TBMM hangi tarihte açıldı?',
  'multiple_choice',
  '19 Mayıs 1919', '23 Nisan 1920', '30 Ağustos 1922', '29 Ekim 1923',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal''in Samsun''a çıkışının temel amacı neydi?',
  'multiple_choice',
  'Tatil yapmak', 'Askeri denetim yapmak', 'Milli Mücadeleyi örgütlemek', 'Mondros''u uygulamak',
  'C'
);

-- ── Aşama 2.2: Önemli Muharebeler ─────────────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Önemli Muharebeler', 2);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Kurtuluş Savaşı''nın kesin zaferinin kazanıldığı muharebe hangisidir?',
  'multiple_choice',
  'İnönü Muharebesi', 'Sakarya Meydan Muharebesi', 'Büyük Taarruz', 'Çanakkale Muharebesi',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Büyük Taarruz hangi tarihte başladı?',
  'multiple_choice',
  '26 Ağustos 1921', '26 Ağustos 1922', '30 Ağustos 1922', '9 Eylül 1922',
  'B'
),
(
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Muharebeleri doğru tarihle eşleştir',
  'matching',
  NULL, NULL, NULL, NULL, NULL,
  '[{"left":"I. İnönü","right":"Ocak 1921"},{"left":"II. İnönü","right":"Mart-Nisan 1921"},{"left":"Sakarya","right":"Ağustos-Eylül 1921"},{"left":"Büyük Taarruz","right":"Ağustos 1922"}]'
);

-- ── Aşama 2.3: Cumhuriyetin İlanı ve İnkılaplar ───────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Cumhuriyetin İlanı ve İnkılaplar', 3);

INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  '29 Ekim 1923''te Türkiye Cumhuriyeti ilan edildi. Mustafa Kemal Atatürk ilk Cumhurbaşkanı seçildi. Ardından gerçekleştirilen inkılaplarla modern Türkiye inşa edildi.',
  'multiple_choice'
);

INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Türkiye Cumhuriyeti hangi tarihte ilan edildi?',
  'multiple_choice',
  '23 Nisan 1920', '24 Temmuz 1923', '29 Ekim 1923', '30 Ağustos 1922',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Latin alfabesine geçiş hangi yılda gerçekleşti?',
  'multiple_choice',
  '1924', '1926', '1928', '1932',
  'C'
),
(
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Lozan Antlaşması hangi yılda imzalandı?',
  'multiple_choice',
  '1919', '1920', '1923', '1925',
  'C'
);
