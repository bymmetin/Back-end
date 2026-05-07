-- ============================================================
-- Mnemo — Örnek Veriler (v2)
-- Her aşama: Bilgi Kartı → Soru çifti şeklinde sıralı.
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

-- BK1 → Q1 : Franz Ferdinand suikastı
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Avusturya-Macaristan Veliahtı Arşidük Franz Ferdinand, 28 Haziran 1914''te Saraybosna''da suikaste uğradı. Bu olay I. Dünya Savaşı''nın fitilini ateşledi.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Arşidük Franz Ferdinand hangi şehirde suikaste uğradı?',
  'multiple_choice',
  'Viyana', 'Belgrad', 'Saraybosna', 'Berlin', 'C'
);

-- BK2 → Q2 : Savaşın başlangıcı
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Suikastin ardından Avusturya-Macaristan Sırbistan''a savaş ilan etti. Birbirini izleyen ittifak zincirleriyle savaş 1914''te başladı ve 1918''de sona erdi.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'I. Dünya Savaşı hangi yılda başladı?',
  'multiple_choice',
  '1912', '1914', '1916', '1918', 'B'
);

-- BK3 → Q3 : İtilaf ve İttifak devletleri
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Savaşta iki büyük blok karşı karşıya geldi: İtilaf Devletleri (İngiltere, Fransa, Rusya) ve İttifak Devletleri (Almanya, Avusturya-Macaristan, Osmanlı).',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'İtilaf Devletleri hangi ülkelerden oluşuyordu?',
  'multiple_choice',
  'Almanya, Avusturya, Osmanlı', 'İngiltere, Fransa, Rusya', 'İtalya, Japonya, ABD', 'Bulgaristan, Macaristan, İtalya', 'B'
);

-- BK4 → Q4 : Osmanlı'nın pozisyonu
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'Osmanlı Devleti, Ağustos 1914''te Almanya ile gizli bir ittifak antlaşması imzalayarak İttifak Devletleri safına katıldı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Nedenleri'),
  'I. Dünya Savaşı''nda Osmanlı Devleti hangi grupta yer aldı?',
  'multiple_choice',
  'İtilaf Devletleri', 'İttifak Devletleri', 'Tarafsız', 'Önce İtilaf sonra İttifak', 'B'
);

-- ── Aşama 1.2: Cepheler ve Büyük Muharebeler ──────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Cepheler ve Büyük Muharebeler', 2);

-- BK1 → Q1 : Çanakkale
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Çanakkale Cephesi (1915), İngiliz ve Anzak kuvvetlerinin Osmanlı topraklarına çıkarma yapma girişimidir. Türk savunmasını bizzat yöneten Mustafa Kemal bu cephede öne çıktı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Çanakkale Cephesi''nde Türk kuvvetlerini kim komuta etti?',
  'multiple_choice',
  'Enver Paşa', 'Mustafa Kemal', 'Talat Paşa', 'Cemal Paşa', 'B'
);

-- BK2 → Q2 : Batı Cephesi / Somme
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Batı Cephesi''nde Almanya ile İngiltere-Fransa arasında kıyasıya bir siperlerde mevzi savaşı yaşandı. Somme Muharebesi yaklaşık 1 milyon kayıpla tarihin en kanlı çatışmalarından biri oldu.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Yaklaşık 1 milyon kayba yol açan Batı Cephesi muharebesi hangisidir?',
  'multiple_choice',
  'Verdun Muharebesi', 'Marne Muharebesi', 'Somme Muharebesi', 'Ypres Muharebesi', 'C'
);

-- BK3 → Q3 (eşleştirme) : Üç ana cephe
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'I. Dünya Savaşı''nın üç ana cephesi: Çanakkale (Osmanlı-İtilaf), Batı Cephesi (Almanya-Fransa/İngiltere) ve Doğu Cephesi (Almanya-Rusya).',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, extra_data)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cepheler ve Büyük Muharebeler'),
  'Cepheleri karşı tarafla eşleştir',
  'matching',
  NULL, NULL, NULL, NULL, NULL,
  '[{"left":"Çanakkale Cephesi","right":"Osmanlı - İtilaf"},{"left":"Batı Cephesi","right":"Almanya - Fransa/İngiltere"},{"left":"Doğu Cephesi","right":"Almanya - Rusya"}]'
);

-- ── Aşama 1.3: Osmanlı ve Savaş ───────────────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Osmanlı ve Savaş', 3);

-- BK1 → Q1 : Savaşa giriş yılı
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı Devleti, Ekim 1914''te Karadeniz''deki Rus limanlarını bombalaması üzerine İtilaf Devletleri ile savaşa girdi. Böylece birden fazla cephede savaşmak zorunda kaldı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı Devleti I. Dünya Savaşı''na hangi yılda girdi?',
  'multiple_choice',
  '1914', '1915', '1916', '1917', 'A'
);

-- BK2 → Q2 : Gizli antlaşma
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı Devleti, 2 Ağustos 1914''te Almanya ile gizli bir ittifak antlaşması imzaladı. Bu antlaşma Osmanlı''yı İttifak Devletleri''ne bağladı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı''nın savaşa girmesinde etkili olan gizli antlaşma hangi devletle yapıldı?',
  'multiple_choice',
  'Avusturya', 'Bulgaristan', 'Almanya', 'İtalya', 'C'
);

-- BK3 → Q3 : Kanal Cephesi
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı, Süveyş Kanalı''nı ele geçirmek için Kanal Cephesi''ni açtı. Aynı zamanda Kafkas ve Irak cephelerinde de savaştı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Osmanlı ve Savaş'),
  'Osmanlı''nın Süveyş Kanalı''na ulaşmaya çalıştığı cephe hangisidir?',
  'multiple_choice',
  'Çanakkale Cephesi', 'Kafkas Cephesi', 'Kanal Cephesi', 'Irak Cephesi', 'C'
);

-- ── Aşama 1.4: Savaşın Sonu ve Sonuçları ──────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 1), 'Savaşın Sonu ve Sonuçları', 4);

-- BK1 → Q1 : Mondros
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'I. Dünya Savaşı 1918''de İttifak Devletleri''nin yenilgisiyle sona erdi. Osmanlı Devleti 30 Ekim 1918''de Mondros Mütarekesi''ni imzalayarak savaştan çekildi.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'Osmanlı Devleti hangi antlaşma ile I. Dünya Savaşı''ndan çekildi?',
  'multiple_choice',
  'Sevr Antlaşması', 'Mondros Mütarekesi', 'Lozan Antlaşması', 'Versay Antlaşması', 'B'
);

-- BK2 → Q2 : Versay
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  '28 Haziran 1919''da imzalanan Versay Antlaşması, I. Dünya Savaşı''nı resmen sona erdirdi. Almanya ağır koşulları kabul etmek zorunda kaldı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'I. Dünya Savaşı''nı resmi olarak sona erdiren antlaşma hangisidir?',
  'multiple_choice',
  'Lozan Antlaşması', 'Sevr Antlaşması', 'Versay Antlaşması', 'Brest-Litovsk Antlaşması', 'C'
);

-- BK3 → Q3 : Milletler Cemiyeti
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'Savaşın ardından kalıcı barışı sağlamak amacıyla 1920''de Milletler Cemiyeti kuruldu. Bu örgüt, günümüz Birleşmiş Milletler''inin öncülüdür.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Sonu ve Sonuçları'),
  'Savaş sonrası kurulan ve bugünkü BM''nin öncülü olan uluslararası örgüt hangisidir?',
  'multiple_choice',
  'NATO', 'Milletler Cemiyeti', 'Avrupa Birliği', 'Kızılhaç', 'B'
);


-- ═══════════════════════════════════════════════════════════
-- ÜNİTE 2: Kurtuluş Savaşı ve Cumhuriyetin Kuruluşu
-- ═══════════════════════════════════════════════════════════
INSERT INTO topics (title, description, order_num)
VALUES ('Kurtuluş Savaşı ve Cumhuriyet', '1919-1923 yılları arası Türk Kurtuluş Savaşı ve Cumhuriyetin ilanı', 2);

-- ── Aşama 2.1: Mustafa Kemal ve Milli Mücadele ────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Mustafa Kemal ve Milli Mücadele', 1);

-- BK1 → Q1 : Samsun'a çıkış
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal, 19 Mayıs 1919''da Samsun''a çıkarak Milli Mücadele''yi başlattı. Bu tarih Türkiye''de her yıl Gençlik ve Spor Bayramı olarak kutlanmaktadır.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal Samsun''a hangi tarihte çıktı?',
  'multiple_choice',
  '19 Mayıs 1918', '19 Mayıs 1919', '23 Nisan 1920', '29 Ekim 1923', 'B'
);

-- BK2 → Q2 : TBMM
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal''in önderliğinde 23 Nisan 1920''de Ankara''da Türkiye Büyük Millet Meclisi (TBMM) açıldı. TBMM, ulusal egemenliği temsil eden meşru otorite oldu.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'TBMM hangi tarihte açıldı?',
  'multiple_choice',
  '19 Mayıs 1919', '23 Nisan 1920', '30 Ağustos 1922', '29 Ekim 1923', 'B'
);

-- BK3 → Q3 : Amaç
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal, resmi görevi askeri denetim yapmak olsa da asıl amacı Anadolu''daki direnişi örgütlemekti. İşgallere karşı halkı harekete geçirdi.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Mustafa Kemal ve Milli Mücadele'),
  'Mustafa Kemal''in Samsun''a çıkışının temel amacı neydi?',
  'multiple_choice',
  'Tatil yapmak', 'Askeri denetim yapmak', 'Milli Mücadeleyi örgütlemek', 'Mondros''u uygulamak', 'C'
);

-- ── Aşama 2.2: Önemli Muharebeler ─────────────────────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Önemli Muharebeler', 2);

-- BK1 → Q1 : Büyük Taarruz
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Büyük Taarruz, Kurtuluş Savaşı''nın kesin zaferini kazandıran harekâttır. 26 Ağustos 1922''de başlayan taarruz, 30 Ağustos''ta Dumlupınar''da zaferle taçlandı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Kurtuluş Savaşı''nın kesin zaferinin kazanıldığı muharebe hangisidir?',
  'multiple_choice',
  'İnönü Muharebesi', 'Sakarya Meydan Muharebesi', 'Büyük Taarruz', 'Çanakkale Muharebesi', 'C'
);

-- BK2 → Q2 : Büyük Taarruz tarihi
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Büyük Taarruz, İzmir''in 9 Eylül 1922''de kurtarılmasıyla tamamlandı. Böylece Batı Anadolu''daki Yunan işgaline son verildi.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Büyük Taarruz hangi tarihte başladı?',
  'multiple_choice',
  '26 Ağustos 1921', '26 Ağustos 1922', '30 Ağustos 1922', '9 Eylül 1922', 'B'
);

-- BK3 → Q3 (eşleştirme) : Muharebe kronolojisi
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Kurtuluş Savaşı''nın dönüm noktaları: I. İnönü (Ocak 1921), II. İnönü (Mart-Nisan 1921), Sakarya (Ağustos-Eylül 1921) ve Büyük Taarruz (Ağustos 1922).',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer, extra_data)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Önemli Muharebeler'),
  'Muharebeleri doğru tarihle eşleştir',
  'matching',
  NULL, NULL, NULL, NULL, NULL,
  '[{"left":"I. İnönü","right":"Ocak 1921"},{"left":"II. İnönü","right":"Mart-Nisan 1921"},{"left":"Sakarya","right":"Ağustos-Eylül 1921"},{"left":"Büyük Taarruz","right":"Ağustos 1922"}]'
);

-- ── Aşama 2.3: Cumhuriyetin İlanı ve İnkılaplar ───────────
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE order_num = 2), 'Cumhuriyetin İlanı ve İnkılaplar', 3);

-- BK1 → Q1 : Cumhuriyet ilanı
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  '29 Ekim 1923''te Türkiye Cumhuriyeti ilan edildi. Mustafa Kemal Atatürk ilk Cumhurbaşkanı seçildi. Bu tarih her yıl Cumhuriyet Bayramı olarak kutlanmaktadır.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Türkiye Cumhuriyeti hangi tarihte ilan edildi?',
  'multiple_choice',
  '23 Nisan 1920', '24 Temmuz 1923', '29 Ekim 1923', '30 Ağustos 1922', 'C'
);

-- BK2 → Q2 : Latin alfabesi
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Atatürk''ün gerçekleştirdiği inkılaplar arasında 1928''de Latin alfabesine geçiş büyük önem taşır. Böylece Arap alfabesinin yerini Latin harfleri aldı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Latin alfabesine geçiş hangi yılda gerçekleşti?',
  'multiple_choice',
  '1924', '1926', '1928', '1932', 'C'
);

-- BK3 → Q3 : Lozan Antlaşması
INSERT INTO questions (lesson_id, question_text, question_type)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  '24 Temmuz 1923''te imzalanan Lozan Antlaşması, Türkiye''nin uluslararası arenada tanınmasını sağladı ve Kurtuluş Savaşı''nı diplomatik açıdan taçlandırdı.',
  'multiple_choice'
);
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer)
VALUES (
  (SELECT id FROM lessons WHERE title = 'Cumhuriyetin İlanı ve İnkılaplar'),
  'Lozan Antlaşması hangi yılda imzalandı?',
  'multiple_choice',
  '1919', '1920', '1923', '1925', 'C'
);
