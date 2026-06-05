-- ============================================================
-- Mnemo — II. Dünya Savaşı Ünitesi
-- 1) Kurtuluş Savaşı ve Cumhuriyet ünitesini sil
-- 2) II. Dünya Savaşı ünitesini ekle (6 ders, 25 BK + 25 soru)
-- ============================================================

-- ── 1. Eski üniteyi sil (CASCADE → dersler + sorular da silinir) ─────
DELETE FROM topics WHERE title = 'Kurtuluş Savaşı ve Cumhuriyet';


-- ── 2. Yeni ünite: II. Dünya Savaşı ─────────────────────────────────
INSERT INTO topics (title, description, order_num)
VALUES ('II. Dünya Savaşı', '1939-1945 yılları arası yaşanan küresel savaş', 2);


-- ════════════════════════════════════════════════════════════
-- DERS 1: Kök Nedenler ve Kıvılcım
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Kök Nedenler ve Kıvılcım', 1);

-- BK 1 → Arka Plan
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'İlk savaşın ardından İtilaf Devletlerinin dayattığı intikam dolu antlaşmalar (özellikle Versay), 1929 Dünya Ekonomik Bunalımı ve Avrupa''da faşizm/Nazizm gibi totaliter rejimlerin yükselişi yeni savaşın temellerini attı.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'I. Dünya Savaşı''nın sonunda imzalanan ve ağır şartlarıyla II. Dünya Savaşı''na zemin hazırlayan antlaşma hangisidir?',
  'multiple_choice',
  'Lozan Antlaşması', 'Versay Antlaşması', 'Sevr Antlaşması', 'Brest-Litovsk Antlaşması', 'B'
);

-- BK 2 → Bloklar
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'Bu kez dünya Mihver Devletleri (Almanya, İtalya, Japonya) ve Müttefik Devletleri (İngiltere, Fransa, SSCB, ABD) olarak ikiye ayrıldı.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'Almanya, İtalya ve Japonya''nın oluşturduğu bloğun adı nedir?',
  'multiple_choice',
  'İtilaf Devletleri', 'Müttefik Devletleri', 'Mihver Devletleri', 'Orta Devletler', 'C'
);

-- BK 3 → Yatıştırma
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'Savaşın başında İngiltere ve Fransa, Hitler''in saldırgan adımlarını (Çekoslovakya''nın işgali gibi) yeni bir dünya savaşını önlemek umuduyla tavizler vererek geçiştirmeye çalıştı.',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'İngiltere ve Fransa''nın Hitler''in ilk saldırgan adımlarını görmezden geldiği politikanın adı nedir?',
  'multiple_choice',
  'Caydırıcılık', 'İzolasyon', 'Yatıştırma', 'Müdahale', 'C'
);

-- BK 4 → Fitil
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  '1 Eylül 1939''da Almanya''nın Polonya''yı işgal etmesiyle İngiltere ve Fransa Almanya''ya savaş ilan etti. II. Dünya Savaşı böylece resmen başladı.',
  'multiple_choice'
);
-- Q 4
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Kök Nedenler ve Kıvılcım'),
  'Almanya''nın 1939''da hangi ülkeyi işgal etmesiyle II. Dünya Savaşı fiilen başladı?',
  'multiple_choice',
  'Fransa', 'Avusturya', 'Çekoslovakya', 'Polonya', 'D'
);


-- ════════════════════════════════════════════════════════════
-- DERS 2: Savaşın Karakteri ve Yeni Taktikler
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Savaşın Karakteri ve Yeni Taktikler', 2);

-- BK 1 → Blitzkrieg
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  'Almanların ağır bombardıman uçakları ve hızlı tank tümenleriyle düşman hatlarını şok edici bir hızla yarıp yok ettiği bu yeni nesil askeri taktiğe "Yıldırım Savaşı" anlamına gelen Blitzkrieg adı verildi.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  '"Yıldırım Savaşı" anlamına gelen ve Almanların uyguladığı hızlı saldırı taktiğinin adı nedir?',
  'multiple_choice',
  'Barbarossa', 'Blitzkrieg', 'D-Day', 'Overlord', 'B'
);

-- BK 2 → Teknoloji / Enigma
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  'Bu savaşta radarlar, V2 roketleri, savaş jetleri ve şifreleme makineleri kader belirledi. Alman ordusunun kullandığı Enigma şifreleme makinesi, Müttefikler tarafından kırılarak büyük stratejik avantaj sağlandı.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  'Alman ordusunun haberleşmesini şifreleyen ve Müttefikler tarafından kırılan makine hangisidir?',
  'multiple_choice',
  'Turing', 'Colossus', 'Enigma', 'V2', 'C'
);

-- BK 3 → Holokost
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  'Nazi Almanyası savaş boyunca milyonlarca Yahudi''yi, Roman''ı ve diğer azınlık gruplarını toplama ve imha kamplarında sistemli bir şekilde katletti. Bu insanlık suçuna Holokost adı verilir.',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Savaşın Karakteri ve Yeni Taktikler'),
  'Nazi Almanyası''nın milyonlarca Yahudi''yi sistemli biçimde katletmesi olayına ne ad verilir?',
  'multiple_choice',
  'Blitzkrieg', 'Holokost', 'Barbarossa', 'Lebensraum', 'B'
);


-- ════════════════════════════════════════════════════════════
-- DERS 3: Genişleyen Cepheler
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Genişleyen Cepheler', 3);

-- BK 1 → Fransa
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Almanya 1940''ta, aşılmaz denilen Ardenler Ormanı''ndan sürpriz saldırı yaparak koca Fransa''yı sadece altı haftada diz çöktürdü.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Almanya''nın 1940''ta Ardenler Ormanı''ndan geçerek yalnızca 6 haftada teslim aldığı ülke hangisidir?',
  'multiple_choice',
  'İngiltere', 'Sovyetler Birliği', 'Polonya', 'Fransa', 'D'
);

-- BK 2 → Britanya Muharebesi
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Almanya İngiltere''yi havadan yok etmeye çalıştı; ancak İngiliz Kraliyet Hava Kuvvetleri (RAF) ve radar teknolojisi sayesinde bu saldırı püskürtüldü. Bu çatışmaya Britanya Muharebesi denir.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Almanya''nın İngiltere''yi havadan yok etmeye çalıştığı ancak püskürtüldüğü hava savaşının adı nedir?',
  'multiple_choice',
  'Blitzkrieg', 'Barbarossa Harekâtı', 'Britanya Muharebesi', 'D-Day Operasyonu', 'C'
);

-- BK 3 → Barbarossa
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  '1941''de Hitler, müttefiki SSCB''ye sürpriz bir saldırı başlattı. "Barbarossa Harekâtı" adı verilen bu hamle, Alman ordusunu ölümcül Rus kışına ve iki cepheli bir savaşa sürükledi; tarihin en büyük hatalarından biri oldu.',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Hitler''in SSCB''ye sürpriz saldırı başlattığı ve ordusunu Rus kışına sürüklediği harekâtın adı nedir?',
  'multiple_choice',
  'D-Day', 'Overlord', 'Barbarossa Harekâtı', 'Market Garden', 'C'
);

-- BK 4 → Pearl Harbor
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Pasifik''te genişlemek isteyen Japonya, ABD''nin Hawaii''deki Pearl Harbor deniz üssüne sürpriz bir hava saldırısı düzenledi (1941). Bu saldırı ABD''yi savaşa resmen soktu.',
  'multiple_choice'
);
-- Q 4
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Japonya''nın ABD''yi resmen savaşa sokan sürpriz hava saldırısını düzenlediği deniz üssü neresidir?',
  'multiple_choice',
  'Midway', 'Pearl Harbor', 'Guadalcanal', 'Iwo Jima', 'B'
);

-- BK 5 → Stalingrad
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Stalingrad Kuşatması (1942-1943): Aylar süren dondurucu sokak çatışmaları sonucunda Alman ordusu tamamen yok edildi. Bu savaş Doğu Cephesi''nde Almanların yenilmezlik efsanesini bitirdi.',
  'multiple_choice'
);
-- Q 5
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Doğu Cephesi''nde Alman yenilmezlik efsanesini çökertenve Alman ordusunun yok edildiği büyük kuşatma savaşı hangisidir?',
  'multiple_choice',
  'Kursk Muharebesi', 'Moskova Muharebesi', 'Leningrad Kuşatması', 'Stalingrad Kuşatması', 'D'
);

-- BK 6 → El Alameyn
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Alman-İtalyan kuvvetlerinin Mısır''ı ve Süveyş Kanalı''nı alma hayali, General Montgomery komutasındaki İngiliz ordusu tarafından El Alameyn''de çölün ortasında bitirildi.',
  'multiple_choice'
);
-- Q 6
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Genişleyen Cepheler'),
  'Kuzey Afrika''da Alman-İtalyan ilerleyişini durduran İngilizlerin kazandığı kritik muharebe hangisidir?',
  'multiple_choice',
  'Kasserine Geçidi', 'Tobruk Muharebesi', 'El Alameyn Muharebesi', 'Sicilya Çıkarması', 'C'
);


-- ════════════════════════════════════════════════════════════
-- DERS 4: Türkiye'nin Tutumu
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Türkiye''nin Tutumu', 4);

-- BK 1 → Denge Politikası
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'İsmet İnönü liderliğindeki Türkiye, Müttefiklerin ve Mihver''in yoğun baskılarına rağmen savaşın son günlerine kadar silahlı tarafsızlığını korudu. Bu politika "denge politikası" olarak bilinir.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'II. Dünya Savaşı boyunca Türkiye''nin Müttefik ve Mihver baskılarına rağmen izlediği politikanın adı nedir?',
  'multiple_choice',
  'İttifak Politikası', 'Saldırmazlık Politikası', 'Silahlı Tarafsızlık', 'Açık Kapı Politikası', 'C'
);

-- BK 2 → Kahire Görüşmeleri
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'Churchill başta olmak üzere Müttefik liderlerin Türkiye''yi aktif savaşa çekmek için yaptığı diplomatik hamleler, Türk tarafının malzeme eksikliği gerekçesiyle ustaca ertelendi. Bu görüşmeler Adana ve Kahire''de gerçekleşti.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'Müttefik liderlerin İsmet İnönü ile Türkiye''yi savaşa çekmek için görüştüğü Mısır şehri hangisidir?',
  'multiple_choice',
  'İskenderiye', 'Kahire', 'Süveyş', 'Port Said', 'B'
);

-- BK 3 → BM
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'Türkiye, savaş sonrası kurulacak Birleşmiş Milletler''e kurucu üye olabilmek için savaşın bitmesine aylar kala Almanya ve Japonya''ya sembolik olarak savaş ilan etti (1945).',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Türkiye''nin Tutumu'),
  'Türkiye''nin 1945''te Almanya ve Japonya''ya sembolik savaş ilan etmesinin asıl amacı hangi örgüte kurucu üye olmaktı?',
  'multiple_choice',
  'NATO', 'Avrupa Birliği', 'Varşova Paktı', 'Birleşmiş Milletler', 'D'
);


-- ════════════════════════════════════════════════════════════
-- DERS 5: Dönüm Noktaları ve Karşı Saldırılar
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Dönüm Noktaları ve Karşı Saldırılar', 5);

-- BK 1 → Midway
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Midway Muharebesi (1942): ABD, Japon donanmasının şifrelerini kırarak pusuya yattı ve Pasifik''teki deniz üstünlüğünü kalıcı olarak Japonlardan aldı.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'ABD''nin şifrelerini kırarak Japon donanmasını pusuya düşürdüğü ve Pasifik''te deniz üstünlüğünü ele geçirdiği savaş hangisidir?',
  'multiple_choice',
  'Guadalcanal Muharebesi', 'Coral Sea Muharebesi', 'Midway Muharebesi', 'Pearl Harbor Baskını', 'C'
);

-- BK 2 → İtalya
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Müttefiklerin Kuzey Afrika''dan Sicilya''ya, oradan da İtalya ana karasına çıkmasıyla halk isyan etti, Mussolini devrildi ve İtalya 1943''te teslim oldu.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Müttefiklerin 1943''te Sicilya üzerinden işgal etmesiyle diktatörü devrilip teslim olan ülke hangisidir?',
  'multiple_choice',
  'Fransa', 'Romanya', 'Macaristan', 'İtalya', 'D'
);

-- BK 3 → Normandiya
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Normandiya Çıkarması (6 Haziran 1944): ABD, İngiliz ve Kanada askerlerinin Fransa sahillerine yaptığı, Batı Avrupa''yı Nazilerden kurtarmaya başlayan tarihin en büyük denizden karaya harekâtı.',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Müttefiklerin 1944''te Batı Avrupa''yı kurtarmak için Fransa''ya yaptığı tarihin en büyük amfibi harekâtının adı nedir?',
  'multiple_choice',
  'Torc Harekâtı', 'Market Garden Harekâtı', 'Barbarossa Harekâtı', 'Normandiya Çıkarması', 'D'
);

-- BK 4 → Berlin
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Sovyet ordusunun Berlin''e girmesiyle kapana kısılan Hitler intihar etti ve Almanya Mayıs 1945''te kayıtsız şartsız teslim oldu.',
  'multiple_choice'
);
-- Q 4
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Dönüm Noktaları ve Karşı Saldırılar'),
  'Sovyet ordusunun girmesiyle Hitler''in intihar ettiği ve Almanya''nın teslim olduğu başkent neresidir?',
  'multiple_choice',
  'Hamburg', 'Münih', 'Berlin', 'Viyana', 'C'
);


-- ════════════════════════════════════════════════════════════
-- DERS 6: Pasifik'te Bitiş ve Sonuçlar
-- ════════════════════════════════════════════════════════════
INSERT INTO lessons (topic_id, title, order_num)
VALUES ((SELECT id FROM topics WHERE title = 'II. Dünya Savaşı'), 'Pasifik''te Bitiş ve Sonuçlar', 6);

-- BK 1 → Ada Atlama
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'ABD''nin, Pasifik''teki tüm adaları almak yerine yalnızca stratejik olanları ele geçirerek Japon anakarasına sıçradığı askeri ilerleme planına "Ada Atlama Stratejisi" denir.',
  'multiple_choice'
);
-- Q 1
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'ABD''nin Pasifik''te yalnızca stratejik adaları ele geçirerek ilerlediği taktiğin adı nedir?',
  'multiple_choice',
  'Kamikazeler', 'Ada Atlama Stratejisi', 'Denizden Karaya Taktik', 'Pasifik Saldırısı', 'B'
);

-- BK 2 → Kamikazeler
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'Savaşı ve donanmasını kaybeden Japonya, düşman gemilerine uçaklarıyla doğrudan intihar dalışı yapan pilotlar kullanmaya başladı. Bu pilotlara Kamikaze adı verildi.',
  'multiple_choice'
);
-- Q 2
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'Japonya''nın düşman gemilerine uçaklarıyla intihar dalışı yapan pilotlarına ne ad verilir?',
  'multiple_choice',
  'Banzai', 'Ninja', 'Samurai', 'Kamikaze', 'D'
);

-- BK 3 → Atom Bombaları
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'ABD, savaşı bitirmek ve Sovyetlere güç gösterisi yapmak için Ağustos 1945''te Hiroşima ve Nagazaki''ye atom bombası attı. Bu, tarihin ilk ve tek nükleer saldırılarıdır.',
  'multiple_choice'
);
-- Q 3
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'ABD''nin 1945''te tarihin ilk atom bombası saldırılarını düzenlediği iki Japon şehri hangileridir?',
  'multiple_choice',
  'Tokyo ve Osaka', 'Hiroşima ve Nagazaki', 'Kyoto ve Nagoya', 'Yokohama ve Kobe', 'B'
);

-- BK 4 → Japonya'nın Teslimi
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'Nükleer felaket ve Sovyetlerin Mançurya''ya saldırması üzerine Japonya 2 Eylül 1945''te teslim oldu. Böylece tarihin en kanlı savaşı resmen bitti.',
  'multiple_choice'
);
-- Q 4
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'Japonya''nın 2 Eylül 1945''te teslim olmasına yol açan iki kritik olay nelerdir?',
  'multiple_choice',
  'Midway ve Stalingrad', 'Normandiya ve Berlin', 'Atom bombaları ve Sovyetlerin Mançurya işgali', 'Ada Atlama ve Kamikazeler', 'C'
);

-- BK 5 → Soğuk Savaş
INSERT INTO questions (lesson_id, question_text, question_type) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'Ortak düşman Almanya yenilince, süper güç olarak kalan ABD (Kapitalizm) ve SSCB (Komünizm) arasında on yıllar sürecek, dünyayı nükleer krizlerin eşiğine getirecek yeni bir kutuplaşma dönemi başladı: Soğuk Savaş.',
  'multiple_choice'
);
-- Q 5
INSERT INTO questions (lesson_id, question_text, question_type, option_a, option_b, option_c, option_d, correct_answer) VALUES (
  (SELECT id FROM lessons WHERE title = 'Pasifik''te Bitiş ve Sonuçlar'),
  'II. Dünya Savaşı''nın ardından ABD ve SSCB arasında başlayan nükleer silahlanma yarışı dönemine ne ad verilir?',
  'multiple_choice',
  'Kore Savaşı', 'Soğuk Savaş', 'Demir Perde', 'Yıldız Savaşları', 'B'
);
