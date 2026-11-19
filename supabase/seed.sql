-- SiapASN seed data: passing-grade profiles, syllabus, starter lessons,
-- sample questions (original), packages and a demo try-out.
-- Passing-grade values follow the 2024 KepmenPANRB as reported in the BRD
-- sources; confirm against the latest regulation before launch.

-- Passing-grade profiles -----------------------------------------------------
insert into public.passing_grade_profiles (name, year, formation_type, rule_type, twk_min, tiu_min, tkp_min, total_min, is_default, notes) values
  ('Umum 2024',                     2024, 'umum',        'per_test',   65, 80, 166, null, true,  'Formasi umum'),
  ('Cumlaude & Diaspora 2024',      2024, 'cumlaude',    'cumulative', null, 85, null, 311, false, 'Nilai kumulatif + TIU minimum'),
  ('Diaspora 2024',                 2024, 'diaspora',    'cumulative', null, 85, null, 311, false, 'Nilai kumulatif + TIU minimum'),
  ('Penyandang Disabilitas 2024',   2024, 'disabilitas', 'cumulative', null, 60, null, 286, false, 'Nilai kumulatif + TIU minimum'),
  ('Putra/Putri Papua 2024',        2024, 'papua',       'cumulative', null, 60, null, 286, false, 'Nilai kumulatif + TIU minimum'),
  ('Putra/Putri Kalimantan 2024',   2024, 'kalimantan',  'cumulative', null, 60, null, 286, false, 'Formasi khusus IKN – konfirmasi ke regulasi terbaru');

-- Taxonomy ---------------------------------------------------------------------
insert into public.topics (test_code, name, slug, description, sort_order) values
  ('TWK', 'Nasionalisme & Bela Negara', 'twk-nasionalisme', 'Nasionalisme, integritas, dan bela negara.', 1),
  ('TWK', 'Pilar Negara', 'twk-pilar-negara', 'Pancasila, UUD 1945, NKRI, Bhinneka Tunggal Ika.', 2),
  ('TWK', 'Bahasa Indonesia', 'twk-bahasa-indonesia', 'Kaidah bahasa dan pemahaman bacaan.', 3),
  ('TIU', 'Verbal', 'tiu-verbal', 'Analogi, silogisme, dan kemampuan analitis.', 1),
  ('TIU', 'Numerik', 'tiu-numerik', 'Berhitung, deret, perbandingan, soal cerita.', 2),
  ('TIU', 'Figural', 'tiu-figural', 'Analogi gambar, ketidaksamaan, serial.', 3),
  ('TKP', 'Pelayanan Publik', 'tkp-pelayanan-publik', 'Orientasi melayani masyarakat.', 1),
  ('TKP', 'Jejaring Kerja', 'tkp-jejaring-kerja', 'Membangun dan memelihara relasi kerja.', 2),
  ('TKP', 'Sosial Budaya', 'tkp-sosial-budaya', 'Adaptasi dalam masyarakat majemuk.', 3),
  ('TKP', 'Teknologi Informasi & Komunikasi', 'tkp-tik', 'Pemanfaatan TIK dalam pekerjaan.', 4),
  ('TKP', 'Profesionalisme', 'tkp-profesionalisme', 'Kualitas kerja dan tanggung jawab.', 5),
  ('TKP', 'Anti Radikalisme', 'tkp-anti-radikalisme', 'Sikap terhadap paham radikal.', 6);

insert into public.subtopics (topic_id, name, slug, sort_order)
select t.id, s.name, s.slug, s.ord
from (values
  ('twk-nasionalisme', 'Nasionalisme', 'twk-nasionalisme-dasar', 1),
  ('twk-nasionalisme', 'Integritas', 'twk-integritas', 2),
  ('twk-nasionalisme', 'Bela Negara', 'twk-bela-negara', 3),
  ('twk-pilar-negara', 'Pancasila', 'twk-pancasila', 1),
  ('twk-pilar-negara', 'UUD 1945', 'twk-uud-1945', 2),
  ('twk-pilar-negara', 'NKRI & Bhinneka Tunggal Ika', 'twk-nkri', 3),
  ('twk-bahasa-indonesia', 'Kaidah Bahasa', 'twk-kaidah-bahasa', 1),
  ('tiu-verbal', 'Analogi', 'tiu-analogi', 1),
  ('tiu-verbal', 'Silogisme', 'tiu-silogisme', 2),
  ('tiu-verbal', 'Analitis', 'tiu-analitis', 3),
  ('tiu-numerik', 'Berhitung', 'tiu-berhitung', 1),
  ('tiu-numerik', 'Deret Angka', 'tiu-deret-angka', 2),
  ('tiu-numerik', 'Perbandingan', 'tiu-perbandingan', 3),
  ('tiu-numerik', 'Soal Cerita', 'tiu-soal-cerita', 4),
  ('tiu-figural', 'Analogi Gambar', 'tiu-analogi-gambar', 1),
  ('tiu-figural', 'Ketidaksamaan', 'tiu-ketidaksamaan', 2),
  ('tiu-figural', 'Serial Gambar', 'tiu-serial-gambar', 3),
  ('tkp-pelayanan-publik', 'Pelayanan Publik', 'tkp-pelayanan', 1),
  ('tkp-jejaring-kerja', 'Jejaring Kerja', 'tkp-jejaring', 1),
  ('tkp-sosial-budaya', 'Sosial Budaya', 'tkp-sosbud', 1),
  ('tkp-tik', 'TIK', 'tkp-tik-dasar', 1),
  ('tkp-profesionalisme', 'Profesionalisme', 'tkp-profesional', 1),
  ('tkp-anti-radikalisme', 'Anti Radikalisme', 'tkp-antiradikal', 1)
) as s(topic_slug, name, slug, ord)
join public.topics t on t.slug = s.topic_slug;

-- Starter lessons ----------------------------------------------------------------
insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select st.id, l.title, l.slug, l.summary, l.content, l.is_free, l.ord, l.mins, 'published'
from (values
  ('twk-pancasila', 'Pancasila sebagai Dasar Negara', 'pancasila-dasar-negara',
   'Kedudukan, fungsi, dan sejarah perumusan Pancasila.',
   E'## Kedudukan Pancasila\n\nPancasila adalah **dasar negara** sekaligus **pandangan hidup bangsa**. Rumusan resmi tercantum dalam Pembukaan UUD 1945 alinea keempat.\n\n## Sejarah singkat perumusan\n\n| Tanggal | Peristiwa |\n| --- | --- |\n| 29 Mei – 1 Juni 1945 | Sidang I BPUPKI membahas dasar negara |\n| 22 Juni 1945 | Panitia Sembilan menghasilkan Piagam Jakarta |\n| 18 Agustus 1945 | PPKI mengesahkan UUD 1945 beserta Pancasila |\n\n## Tips mengerjakan soal\n\n- Hafalkan tokoh dan tanggal penting.\n- Pahami makna tiap sila dan contoh pengamalannya.\n- Soal TWK sering berbentuk studi kasus: pilih jawaban yang paling sesuai nilai Pancasila.',
   true, 1, 12),
  ('twk-uud-1945', 'Amandemen UUD 1945', 'amandemen-uud-1945',
   'Empat kali perubahan UUD 1945 dan pokok perubahannya.',
   E'## Empat tahap amandemen\n\nUUD 1945 diubah sebanyak **empat kali** oleh MPR pada 1999, 2000, 2001, dan 2002.\n\n1. **1999** – pembatasan masa jabatan presiden.\n2. **2000** – pemerintahan daerah, HAM, wilayah negara.\n3. **2001** – DPD, pemilu langsung, Mahkamah Konstitusi.\n4. **2002** – pendidikan, perekonomian nasional, penghapusan DPA.\n\n> Yang **tidak** boleh diubah: bentuk Negara Kesatuan Republik Indonesia (Pasal 37 ayat 5).',
   false, 1, 15),
  ('tiu-deret-angka', 'Pola Deret Angka', 'pola-deret-angka',
   'Mengenali deret aritmetika, geometri, dan deret bertingkat.',
   E'## Deret aritmetika\n\nSelisih antar suku tetap. Rumus suku ke-$n$:\n\n$$U_n = a + (n-1)b$$\n\nContoh: 3, 7, 11, 15, … (beda $b = 4$).\n\n## Deret geometri\n\nRasio antar suku tetap:\n\n$$U_n = a \\cdot r^{n-1}$$\n\nContoh: 2, 6, 18, 54, … (rasio $r = 3$).\n\n## Deret bertingkat & selang-seling\n\n- **Bertingkat**: selisihnya membentuk deret baru (1, 2, 4, 7, 11 → selisih 1, 2, 3, 4).\n- **Selang-seling**: dua pola bergantian pada suku ganjil dan genap.\n\n### Strategi cepat\n\n1. Hitung selisih antar suku.\n2. Jika tidak tetap, cek rasio.\n3. Jika tetap gagal, pisahkan suku ganjil dan genap.',
   true, 1, 15),
  ('tiu-silogisme', 'Silogisme dan Penarikan Kesimpulan', 'silogisme-dasar',
   'Modus ponens, modus tollens, dan silogisme kategoris.',
   E'## Bentuk dasar\n\n| Nama | Premis 1 | Premis 2 | Kesimpulan |\n| --- | --- | --- | --- |\n| Modus ponens | $p \\Rightarrow q$ | $p$ | $q$ |\n| Modus tollens | $p \\Rightarrow q$ | $\\neg q$ | $\\neg p$ |\n| Silogisme | $p \\Rightarrow q$ | $q \\Rightarrow r$ | $p \\Rightarrow r$ |\n\n## Kesalahan umum\n\nMenyimpulkan $p$ dari $p \\Rightarrow q$ dan $q$ adalah **keliru** (menegaskan konsekuen).',
   false, 1, 12),
  ('tkp-pelayanan', 'Prinsip Pelayanan Publik', 'prinsip-pelayanan-publik',
   'Cara berpikir yang dinilai tinggi pada soal TKP pelayanan publik.',
   E'## Pola jawaban bernilai 5\n\nPada TKP setiap opsi bernilai 1–5. Jawaban dengan skor tertinggi biasanya:\n\n- **Proaktif** membantu tanpa menunggu diminta.\n- Tetap **sesuai prosedur** dan aturan.\n- **Mengutamakan kepentingan masyarakat** di atas kepentingan pribadi.\n- Menyelesaikan masalah **sampai tuntas**, bukan melempar ke pihak lain.\n\n## Hindari\n\n- Jawaban pasif ("menunggu atasan").\n- Jawaban emosional atau membela diri.\n- Jawaban yang melanggar aturan walau tujuannya baik.',
   true, 1, 10)
) as l(subtopic_slug, title, slug, summary, content, is_free, ord, mins)
join public.subtopics st on st.slug = l.subtopic_slug;

-- Sample questions (original) ------------------------------------------------------
create temporary table _q (sub text, test public.test_code, stem text, a text, b text, c text, d text, e text,
                            pa int, pb int, pc int, pd int, pe int, expl text, diff public.difficulty);

insert into _q values
-- TWK
('twk-pancasila','TWK','Rumusan dasar negara yang disahkan PPKI pada 18 Agustus 1945 tercantum dalam …',
 'Piagam Jakarta','Pembukaan UUD 1945 alinea keempat','Batang tubuh UUD 1945 Pasal 1','Dekrit Presiden 5 Juli 1959','Maklumat Wakil Presiden No. X',
 0,5,0,0,0,'Pancasila yang sah tercantum dalam Pembukaan UUD 1945 alinea keempat yang disahkan PPKI pada 18 Agustus 1945.','easy'),
('twk-pancasila','TWK','Sikap warga yang menghormati teman beribadah sesuai agamanya mencerminkan pengamalan sila …',
 'Pertama','Kedua','Ketiga','Keempat','Kelima',
 5,0,0,0,0,'Toleransi antarumat beragama adalah pengamalan sila Ketuhanan Yang Maha Esa.','easy'),
('twk-uud-1945','TWK','Ketentuan UUD 1945 yang tidak dapat dilakukan perubahan adalah mengenai …',
 'Masa jabatan presiden','Bentuk Negara Kesatuan Republik Indonesia','Susunan MPR','Kewenangan DPD','Lembaga Mahkamah Konstitusi',
 0,5,0,0,0,'Pasal 37 ayat (5) UUD 1945 menyatakan bentuk NKRI tidak dapat dilakukan perubahan.','medium'),
('twk-integritas','TWK','Seorang pegawai menemukan rekan kerja memalsukan laporan perjalanan dinas. Tindakan yang mencerminkan integritas adalah …',
 'Diam karena bukan urusannya','Ikut memalsukan agar kompak','Melaporkan melalui mekanisme pengaduan resmi','Menyebarkan di media sosial','Meminta bagian dari hasil pemalsuan',
 0,0,5,0,0,'Integritas berarti menolak dan melaporkan pelanggaran melalui jalur resmi, bukan membiarkan atau mempermalukan secara publik.','easy'),
('twk-kaidah-bahasa','TWK','Penulisan kata yang sesuai kaidah baku adalah …',
 'Praktek','Apotik','Kwalitas','Analisis','Resiko',
 0,0,0,5,0,'Bentuk baku: praktik, apotek, kualitas, analisis, risiko.','medium'),
-- TIU
('tiu-deret-angka','TIU','Tentukan bilangan berikutnya: 3, 7, 11, 15, …',
 '17','18','19','20','21',
 0,0,5,0,0,'Deret aritmetika dengan beda 4, sehingga 15 + 4 = 19.','easy'),
('tiu-deret-angka','TIU','Tentukan bilangan berikutnya: 2, 6, 18, 54, …',
 '108','162','148','216','72',
 0,5,0,0,0,'Deret geometri dengan rasio 3, sehingga 54 × 3 = 162.','easy'),
('tiu-deret-angka','TIU','Tentukan bilangan berikutnya: 1, 2, 4, 7, 11, …',
 '14','15','16','17','18',
 0,0,5,0,0,'Selisihnya 1, 2, 3, 4, maka selisih berikutnya 5: 11 + 5 = 16.','medium'),
('tiu-silogisme','TIU','Semua pegawai disiplin mendapat tunjangan. Sebagian pegawai yang mendapat tunjangan adalah lulusan baru. Kesimpulan yang tepat adalah …',
 'Semua lulusan baru disiplin','Sebagian pegawai disiplin adalah lulusan baru','Tidak dapat ditarik kesimpulan yang pasti tentang lulusan baru yang disiplin','Semua pegawai mendapat tunjangan','Lulusan baru tidak disiplin',
 0,0,5,0,0,'Premis kedua tidak menyatakan bahwa lulusan baru itu disiplin, sehingga tidak ada kesimpulan pasti tentang irisan keduanya.','hard'),
('tiu-analogi','TIU','DOKTER : RUMAH SAKIT = GURU : …',
 'Murid','Sekolah','Buku','Kapur','Pelajaran',
 0,5,0,0,0,'Dokter bekerja di rumah sakit; guru bekerja di sekolah.','easy'),
('tiu-perbandingan','TIU','6 pekerja dapat menyelesaikan pekerjaan dalam 10 hari. Jika pekerjanya 15 orang, pekerjaan selesai dalam …',
 '3 hari','4 hari','5 hari','6 hari','25 hari',
 0,5,0,0,0,'Perbandingan berbalik nilai: 6 × 10 = 15 × x, sehingga x = 4 hari.','medium'),
('tiu-soal-cerita','TIU','Harga sebuah buku setelah diskon 20% adalah Rp48.000. Harga sebelum diskon adalah …',
 'Rp57.600','Rp58.000','Rp60.000','Rp62.000','Rp64.000',
 0,0,5,0,0,'80% × harga = 48.000 → harga = 48.000 ÷ 0,8 = Rp60.000.','medium'),
-- TKP
('tkp-pelayanan','TKP','Menjelang jam tutup layanan, seorang warga lanjut usia datang membawa berkas yang belum lengkap. Sikap Anda …',
 'Menolak karena sudah hampir tutup','Meminta ia datang lagi besok tanpa penjelasan','Menjelaskan berkas yang kurang dan membantu mencatat persyaratan agar besok langsung diproses','Menerima berkas meski tidak lengkap agar ia senang','Menyerahkan ke rekan lain',
 1,2,5,3,4,'Jawaban terbaik tetap sesuai prosedur sekaligus proaktif membantu warga menyelesaikan kebutuhannya.','medium'),
('tkp-jejaring','TKP','Anda ditugaskan pada proyek lintas instansi dan belum mengenal anggota tim lain. Yang Anda lakukan …',
 'Menunggu orang lain memperkenalkan diri','Berkenalan dan mengajak menyusun pembagian tugas bersama','Bekerja sendiri agar lebih cepat','Hanya berkomunikasi dengan tim dari instansi sendiri','Meminta atasan mengatur semuanya',
 2,5,1,3,4,'Membangun jejaring secara aktif dan kolaboratif mendapat nilai tertinggi.','easy'),
('tkp-sosbud','TKP','Anda ditempatkan di daerah dengan adat yang berbeda dari kebiasaan Anda. Sikap Anda …',
 'Mempelajari dan menghormati adat setempat sambil tetap menjalankan tugas','Mengikuti kebiasaan sendiri','Meminta pindah tugas','Menghindari interaksi dengan warga','Mengikuti adat hanya saat diawasi atasan',
 5,2,1,3,4,'Adaptif dan menghormati keberagaman budaya adalah sikap yang paling diharapkan.','easy'),
('tkp-tik-dasar','TKP','Kantor Anda mulai menggunakan aplikasi persuratan elektronik yang baru. Sikap Anda …',
 'Tetap memakai cara manual','Mempelajarinya dan membantu rekan yang kesulitan','Menunggu pelatihan resmi saja','Meminta rekan mengerjakan bagian saya','Menggunakannya hanya jika diwajibkan',
 1,5,3,2,4,'Antusias memanfaatkan TIK dan membantu orang lain beradaptasi adalah sikap terbaik.','easy'),
('tkp-profesional','TKP','Atasan memberi tugas mendesak saat pekerjaan Anda sendiri belum selesai. Anda …',
 'Menolak tugas tersebut','Mengerjakan tugas atasan dan mengabaikan pekerjaan sendiri','Menyusun prioritas, mengomunikasikan tenggat, lalu menyelesaikan keduanya','Mengerjakan keduanya dengan asal-asalan','Mengeluh kepada rekan kerja',
 1,4,5,3,2,'Profesional berarti mampu mengelola prioritas dan berkomunikasi tanpa mengorbankan kualitas.','medium'),
('tkp-antiradikal','TKP','Anda menerima pesan berantai yang mengajak menolak Pancasila sebagai dasar negara. Tindakan Anda …',
 'Meneruskan ke grup lain','Membiarkannya saja','Tidak menyebarkan, mengingatkan pengirim, dan melaporkan konten ke kanal resmi','Membalas dengan kata kasar','Menyimpan untuk dibaca nanti',
 1,3,5,2,4,'Menolak penyebaran, mengedukasi, dan melapor ke kanal resmi adalah sikap anti radikalisme terbaik.','easy');

insert into public.questions (test_code, subtopic_id, stem, options, explanation, difficulty, usage, status, source, year)
select q.test, s.id, q.stem,
       jsonb_build_array(
         jsonb_build_object('label','A','text',q.a,'points',q.pa),
         jsonb_build_object('label','B','text',q.b,'points',q.pb),
         jsonb_build_object('label','C','text',q.c,'points',q.pc),
         jsonb_build_object('label','D','text',q.d,'points',q.pd),
         jsonb_build_object('label','E','text',q.e,'points',q.pe)),
       q.expl, q.diff, 'both', 'published', 'SiapASN original', 2026
from _q q join public.subtopics s on s.slug = q.sub;

drop table _q;

-- Packages (BRD §12) -----------------------------------------------------------------
insert into public.packages (name, slug, description, price, duration_days, includes_material, includes_practice, includes_all_tryouts, features, highlight, sort_order) values
  ('Try-out Pack', 'tryout-pack', '10 try-out lengkap dengan pembahasan dan ranking nasional.', 49000, 90,
   false, false, true,
   array['10 try-out simulasi CAT','Pembahasan setiap soal','Ranking nasional & persentil','Analisis per sub-topik'], false, 1),
  ('Belajar + Latihan', 'belajar-latihan', 'Seluruh materi, bank soal latihan, dan analitik belajar.', 99000, 90,
   true, true, false,
   array['Semua materi TWK, TIU, TKP','Latihan soal tanpa batas','Drill titik lemah','Analitik progres'], false, 2),
  ('Premium Lengkap', 'premium-lengkap', 'Semua fitur termasuk try-out nasional terjadwal hingga hari ujian.', 199000, 180,
   true, true, true,
   array['Semua materi & latihan','Semua try-out termasuk try-out nasional','Pembahasan & ranking nasional','Analitik lengkap & study path'], true, 3);

-- Demo try-out (mini blueprint so the seed is usable immediately) -----------------------
insert into public.tryouts (title, slug, description, kind, duration_minutes, extended_duration_minutes, attempt_limit, blueprint, is_free, status, shuffle_questions,
                            passing_grade_profile_id)
values ('Try-out Gratis: Mini SKD', 'tryout-gratis-mini', 'Mini simulasi SKD untuk mencoba sistem CAT. Penilaian sama persis dengan SKD asli.',
        'on_demand', 15, 20, 3, '{"TWK":5,"TIU":7,"TKP":6}', true, 'published', true,
        (select id from public.passing_grade_profiles where is_default limit 1));

insert into public.tryout_questions (tryout_id, question_id, position)
select t.id, q.id, row_number() over (order by q.test_code, q.created_at)
from public.tryouts t cross join public.questions q
where t.slug = 'tryout-gratis-mini';

insert into public.announcements (title, body, segment) values
  ('Selamat datang di SiapASN!', 'Mulai dari try-out gratis untuk mengetahui posisi awalmu, lalu ikuti materi yang direkomendasikan.', 'all');
