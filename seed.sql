-- ============================================================
-- Mnemo — Örnek Veriler (Seed)
-- Tabloları temizleyip baştan doldurur
-- ============================================================

TRUNCATE TABLE questions RESTART IDENTITY CASCADE;
TRUNCATE TABLE lessons   RESTART IDENTITY CASCADE;
TRUNCATE TABLE topics    RESTART IDENTITY CASCADE;

-- ── Konular ───────────────────────────────────────────────
INSERT INTO topics (title, description, order_num) VALUES
('Osmanlı Kuruluş Dönemi',  '1299-1453 yılları arası', 1),
('Osmanlı Yükseliş Dönemi', '1453-1600 yılları arası', 2),
('Osmanlı Gerileme Dönemi', '1600-1800 yılları arası', 3),
('Kurtuluş Savaşı',         '1919-1923 yılları arası', 4),
('Cumhuriyet Dönemi',       '1923 ve sonrası',         5),
('I. Dünya Savaşı',         '1914-1918 yılları arası', 6);

-- ── Dersler ───────────────────────────────────────────────
INSERT INTO lessons (topic_id, title, order_num) VALUES
((SELECT id FROM topics WHERE order_num = 1), 'Osmanlı Devleti''nin Kuruluşu',       1),
((SELECT id FROM topics WHERE order_num = 1), 'İlk Osmanlı Padişahları',              2),
((SELECT id FROM topics WHERE order_num = 2), 'İstanbul''un Fethi',                   1),
((SELECT id FROM topics WHERE order_num = 2), 'Kanuni Sultan Süleyman Dönemi',        2),
((SELECT id FROM topics WHERE order_num = 4), 'Mustafa Kemal''in Samsun''a Çıkışı',  1),
((SELECT id FROM topics WHERE order_num = 4), 'Lozan Antlaşması',                     2),
((SELECT id FROM topics WHERE order_num = 5), 'Cumhuriyet''in İlanı',                 1),
((SELECT id FROM topics WHERE order_num = 5), 'Atatürk İnkılapları',                  2),
((SELECT id FROM topics WHERE order_num = 6), 'Siper Savaşı ve Yeni Silahlar',        1),
((SELECT id FROM topics WHERE order_num = 6), 'Savaşın Kıvılcımı ve Bloklar',         2);

-- ── Sorular ───────────────────────────────────────────────
INSERT INTO questions (lesson_id, question_text, option_a, option_b, option_c, option_d, correct_answer) VALUES
((SELECT id FROM lessons WHERE title = 'Osmanlı Devleti''nin Kuruluşu'),
 'Osmanlı Devleti hangi yılda kuruldu?', '1071', '1299', '1453', '1326', 'B'),

((SELECT id FROM lessons WHERE title = 'Osmanlı Devleti''nin Kuruluşu'),
 'Osmanlı Devleti''ni kim kurdu?', 'Orhan Bey', 'Osman Bey', 'Alaeddin Bey', 'Ertuğrul Bey', 'B'),

((SELECT id FROM lessons WHERE title = 'İstanbul''un Fethi'),
 'İstanbul hangi yılda fethedildi?', '1389', '1402', '1453', '1461', 'C'),

((SELECT id FROM lessons WHERE title = 'İstanbul''un Fethi'),
 'İstanbul''u kim fethetti?', 'Yıldırım Bayezid', 'II. Murat', 'Fatih Sultan Mehmet', 'Yavuz Sultan Selim', 'C'),

((SELECT id FROM lessons WHERE title = 'Mustafa Kemal''in Samsun''a Çıkışı'),
 'Mustafa Kemal Samsun''a hangi yılda çıktı?', '1918', '1919', '1920', '1921', 'B'),

((SELECT id FROM lessons WHERE title = 'Cumhuriyet''in İlanı'),
 'Cumhuriyet hangi yılda ilan edildi?', '1920', '1921', '1922', '1923', 'D'),

-- I. Dünya Savaşı — Siper Savaşı ve Yeni Silahlar
((SELECT id FROM lessons WHERE title = 'Siper Savaşı ve Yeni Silahlar'),
 'I. Dünya Savaşı''nda askerlerin aylarca kazdıkları hendeklerde bekleyerek savaştığı, özellikle Batı Cephesi''nin en karakteristik savaş türü hangisidir?',
 'Yıldırım Harbi (Blitzkrieg)', 'Meydan Muharebesi', 'Siper Savaşı', 'Gerilla Savaşı', 'C'),

((SELECT id FROM lessons WHERE title = 'Siper Savaşı ve Yeni Silahlar'),
 'I. Dünya Savaşı''nda siperlerdeki askerleri etkisiz hale getirmek için ilk kez kullanılan ve askerleri gaz maskesi takmaya mecbur bırakan yeni silah hangisidir?',
 'Napalm Bombası', 'Zehirli Gazlar', 'Atom Bombası', 'Balistik Füze', 'B'),

-- I. Dünya Savaşı — Savaşın Kıvılcımı ve Bloklar
((SELECT id FROM lessons WHERE title = 'Savaşın Kıvılcımı ve Bloklar'),
 'I. Dünya Savaşı''nın başlamasına neden olan suikast hangi şehirde gerçekleşmiştir?',
 'Belgrad', 'Viyana', 'Saraybosna', 'İstanbul', 'C'),

((SELECT id FROM lessons WHERE title = 'Savaşın Kıvılcımı ve Bloklar'),
 'Savaş başladıktan sonra İttifak Grubu''ndan ayrılarak İtilaf Grubu''na geçen devlet hangisidir?',
 'Bulgaristan', 'İtalya', 'Amerika Birleşik Devletleri', 'Yunanistan', 'B'),

((SELECT id FROM lessons WHERE title = 'Savaşın Kıvılcımı ve Bloklar'),
 '1917 yılında gerçekleşen Bolşevik İhtilali sonucu savaştan çekilen devlet hangisidir?',
 'Osmanlı Devleti', 'Rusya', 'Fransa', 'Japonya', 'B');
