-- ============================================================================
-- SiapASN — Konten TWK (Tes Wawasan Kebangsaan)
-- Materi (lessons) dan bank soal latihan orisinal untuk seluruh sub-topik TWK.
-- Idempoten: lessons memakai ON CONFLICT (slug), soal memakai NOT EXISTS (stem).
-- ============================================================================

begin;

-- ---------------------------------------------------------------------------
-- LESSONS
-- ---------------------------------------------------------------------------
insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values

-- =========================== NASIONALISME ==================================
('twk-nasionalisme-dasar', 'Konsep, Bentuk, dan Indikator Nasionalisme', 'twk-konsep-indikator-nasionalisme',
 'Pengertian nasionalisme, bentuk-bentuknya, perbedaan dengan chauvinisme dan primordialisme, serta indikator sikap nasionalis yang sering diuji di SKD.',
$md$
## Apa itu nasionalisme?

**Nasionalisme** adalah paham dan sikap yang menempatkan kesetiaan tertinggi individu kepada bangsa dan negaranya. Dalam konteks Indonesia, nasionalisme tidak berdiri di atas kesamaan suku, agama, atau ras, melainkan di atas **kesamaan sejarah, nasib, dan cita-cita** untuk hidup bersama dalam satu negara: Negara Kesatuan Republik Indonesia.

Nasionalisme Indonesia bersifat **terbuka dan berperikemanusiaan**. Artinya, cinta kepada bangsa sendiri tidak boleh berubah menjadi merendahkan bangsa lain. Hal ini sejalan dengan sila kedua dan ketiga Pancasila: persatuan Indonesia dibangun di atas penghormatan terhadap martabat manusia.

> **Tips ujian:** Dalam soal TWK, jawaban yang "terlalu keras" (menolak semua hal asing, memusuhi bangsa lain) biasanya *bukan* jawaban yang benar. Nasionalisme Pancasila itu cinta tanah air yang tetap terbuka.

## Bentuk-bentuk nasionalisme

| Bentuk | Ciri utama |
| --- | --- |
| Nasionalisme kewarganegaraan (sipil) | Ikatan kebangsaan berdasar kesediaan warga untuk hidup bersama dalam satu negara dan tunduk pada hukum yang sama |
| Nasionalisme etnis | Ikatan berdasar kesamaan suku/keturunan |
| Nasionalisme budaya | Ikatan berdasar kesamaan budaya, bukan keturunan |
| Nasionalisme romantik | Menonjolkan ekspresi budaya dan sejarah sebagai identitas bangsa |
| Nasionalisme keagamaan | Ikatan berdasar kesamaan agama |

Nasionalisme Indonesia paling dekat dengan **nasionalisme kewarganegaraan** karena bangsa Indonesia terdiri atas ratusan suku, beragam agama, dan budaya, tetapi bersatu dalam satu kesepakatan kebangsaan.

## Sikap yang bertentangan dengan nasionalisme

| Istilah | Pengertian | Contoh |
| --- | --- | --- |
| **Chauvinisme** | Cinta bangsa secara berlebihan sampai merendahkan bangsa lain | Mengejek warga negara lain sebagai bangsa rendah |
| **Primordialisme** | Mengutamakan ikatan asal (suku, daerah, agama) di atas kepentingan bangsa | Hanya mau bekerja sama dengan orang sesuku |
| **Etnosentrisme** | Menilai budaya lain dengan ukuran budaya sendiri dan menganggap budayanya paling unggul | Menganggap adat daerah lain aneh dan rendah |
| **Separatisme** | Keinginan memisahkan diri dari negara | Gerakan memisahkan suatu wilayah dari NKRI |
| **Kosmopolitanisme ekstrem** | Merasa sebagai warga dunia sampai mengabaikan identitas bangsa | Meremehkan budaya dan bahasa sendiri |
| **Provinsialisme/kedaerahan** | Fanatisme berlebihan pada daerah sendiri | Menolak pejabat hanya karena berasal dari daerah lain |

## Indikator sikap nasionalis

Kisi-kisi TWK menekankan kemampuan peserta **memahami dan mampu menerapkan** nasionalisme. Indikator yang perlu dikenali:

- **Cinta tanah air**: menjaga lingkungan, bangga terhadap budaya, mengenal sejarah bangsa.
- **Rela berkorban**: mendahulukan kepentingan umum di atas kepentingan pribadi atau golongan.
- **Menjaga persatuan dan kesatuan**: tidak mudah terprovokasi isu SARA, menghargai perbedaan.
- **Bangga sebagai bangsa Indonesia**: menggunakan bahasa Indonesia dengan baik, menghormati simbol negara.
- **Mengutamakan produk dalam negeri** tanpa memusuhi produk asing.
- **Berprestasi untuk mengharumkan nama bangsa**, misalnya melalui pendidikan, olahraga, atau inovasi.
- **Menaati hukum dan membayar pajak** sebagai wujud tanggung jawab warga negara.

### Nasionalisme bagi ASN

Bagi aparatur sipil negara, nasionalisme berarti **netral dari kepentingan politik praktis**, melayani semua warga tanpa diskriminasi, dan menjadi perekat persatuan. ASN yang menolak melayani warga karena perbedaan suku atau agama jelas melanggar nilai nasionalisme sekaligus prinsip pelayanan publik.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Sebuah desa menolak kedatangan guru dari luar daerah karena "bukan orang asli sini". Sikap ini paling tepat disebut …*

Penalaran: penolakan didasarkan pada asal daerah, bukan kompetensi. Itu adalah **primordialisme/kedaerahan**. Chauvinisme kurang tepat karena chauvinisme berkaitan dengan merendahkan *bangsa lain*.

**Contoh 2.** *Seorang atlet menolak menerima bonus dari sponsor asing karena merasa semua yang berbau asing merusak bangsa.*

Penalaran: sikap ini berlebihan. Nasionalisme tidak berarti anti-asing. Jawaban yang tepat biasanya menekankan **keterbukaan dengan tetap menjaga jati diri bangsa**.

**Contoh 3.** *Wujud nasionalisme pelajar di era digital yang paling tepat adalah …*

Penalaran: carilah opsi yang aktif dan konstruktif, misalnya **membuat konten positif tentang budaya Indonesia dan tidak menyebarkan hoaks**, bukan sekadar "memasang bendera di profil".

## Ringkasan

- Nasionalisme Indonesia berdasar kesamaan sejarah, nasib, dan cita-cita, bukan kesamaan suku atau agama.
- Nasionalisme Pancasila bersifat terbuka: cinta bangsa sendiri tanpa merendahkan bangsa lain.
- Kenali lawan-lawannya: chauvinisme, primordialisme, etnosentrisme, separatisme, kedaerahan.
- Indikator: cinta tanah air, rela berkorban, menjaga persatuan, bangga sebagai bangsa, taat hukum.

## Tips mengerjakan soal

- Bedakan *chauvinisme* (soal bangsa lain) dengan *primordialisme* (soal ikatan asal di dalam bangsa sendiri).
- Pada soal sikap, pilih tindakan yang **konkret, konstruktif, dan inklusif**.
- Hindari opsi ekstrem: menolak semua yang asing, atau sebaliknya meremehkan budaya sendiri.
- Kata kunci "mendahulukan kepentingan umum" hampir selalu terkait dengan **rela berkorban**.
$md$, true, 2, 12),

('twk-nasionalisme-dasar', 'Tokoh dan Keteladanan Pergerakan Nasional', 'twk-tokoh-keteladanan-pergerakan',
 'Tokoh-tokoh pergerakan nasional, organisasi penting, serta nilai keteladanan yang bisa diterapkan dalam kehidupan sehari-hari dan dalam tugas ASN.',
$md$
## Mengapa sejarah tokoh diuji?

Soal TWK tidak hanya menanyakan "siapa dan kapan", tetapi juga **nilai apa yang dapat diteladani**. Karena itu, pelajari setiap tokoh bersama nilai yang ia wariskan.

## Organisasi dan tokoh penting

| Organisasi/peristiwa | Tahun | Tokoh kunci | Catatan |
| --- | --- | --- | --- |
| Budi Utomo | 20 Mei 1908 | dr. Wahidin Sudirohusodo (penggagas), Soetomo dan pelajar STOVIA | Tanggal berdirinya diperingati sebagai Hari Kebangkitan Nasional |
| Indische Partij | 1912 | Tiga Serangkai: E.F.E. Douwes Dekker, Tjipto Mangoenkoesoemo, Soewardi Soerjaningrat | Partai politik pertama yang terang-terangan bercita-cita Hindia merdeka |
| Perhimpunan Indonesia | 1920-an (di Belanda) | Mohammad Hatta dan mahasiswa Indonesia di Belanda | Memperkenalkan nama "Indonesia" sebagai identitas politik |
| Taman Siswa | 3 Juli 1922 | Ki Hajar Dewantara | Pendidikan nasional untuk rakyat pribumi |
| Partai Nasional Indonesia | 4 Juli 1927 | Soekarno | Bersikap nonkooperatif terhadap pemerintah kolonial |
| Kongres Pemuda II | 27–28 Oktober 1928 | Soegondo Djojopoespito (ketua), Mohammad Yamin, W.R. Supratman | Melahirkan Sumpah Pemuda |

### Ki Hajar Dewantara

Nama aslinya **Raden Mas Soewardi Soerjaningrat**. Ia menulis kritik tajam terhadap pemerintah kolonial dalam tulisan berjudul *Als ik eens Nederlander was* ("Seandainya aku seorang Belanda"), yang membuatnya diasingkan. Semboyan pendidikannya terkenal hingga kini:

- *Ing ngarsa sung tuladha* — di depan memberi teladan.
- *Ing madya mangun karsa* — di tengah membangun semangat/kemauan.
- *Tut wuri handayani* — di belakang memberi dorongan.

Tanggal lahirnya, 2 Mei, diperingati sebagai **Hari Pendidikan Nasional**.

### R.A. Kartini

Memperjuangkan pendidikan dan kesetaraan bagi perempuan. Surat-suratnya dibukukan dan dikenal dengan judul *Habis Gelap Terbitlah Terang*. Nilai teladan: **keberanian berpikir maju** dan kepedulian pada pendidikan.

### Bung Tomo dan arek-arek Surabaya

Pidato Bung Tomo membakar semangat rakyat dalam **pertempuran Surabaya 10 November 1945**, yang kini diperingati sebagai **Hari Pahlawan**. Nilai teladan: **rela berkorban** dan **pantang menyerah**.

### Soekarno dan Mohammad Hatta

Dwitunggal proklamator. Nilai teladan: kemampuan **bermusyawarah dan mengesampingkan perbedaan pendapat** demi kepentingan bangsa, misalnya ketika merumuskan teks proklamasi.

## Periodisasi perjuangan

| Periode | Ciri perjuangan |
| --- | --- |
| Sebelum 1908 | Bersifat kedaerahan, bergantung pada pemimpin karismatik, dan umumnya mengandalkan kekuatan senjata |
| 1908–1942 (pergerakan nasional) | Melalui organisasi modern, pendidikan, pers, dan diplomasi; berskala nasional |
| 1942–1945 (pendudukan Jepang) | Memanfaatkan organisasi bentukan Jepang dan gerakan bawah tanah |
| 1945–1949 (revolusi fisik) | Mempertahankan kemerdekaan melalui perjuangan bersenjata dan diplomasi |

> **Tips ujian:** Perbedaan perjuangan sebelum dan sesudah 1908 sering ditanyakan. Kata kuncinya: **kedaerahan vs nasional**, **fisik vs organisasi modern**.

## Nilai yang diwariskan

1. **Persatuan di atas perbedaan** — Sumpah Pemuda menyatukan pemuda dari berbagai organisasi kedaerahan.
2. **Pendidikan sebagai jalan kemerdekaan** — Budi Utomo, Taman Siswa, Kartini.
3. **Keberanian moral** — kritik terbuka terhadap ketidakadilan kolonial.
4. **Rela berkorban** — para pejuang mengorbankan harta, waktu, bahkan nyawa.
5. **Musyawarah** — perbedaan pandangan para pendiri bangsa diselesaikan dengan dialog.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Nilai keteladanan yang paling relevan dari peristiwa Sumpah Pemuda bagi ASN masa kini adalah …*

Penalaran: inti Sumpah Pemuda adalah **persatuan melampaui identitas kedaerahan**. Opsi yang benar biasanya berbunyi "bekerja sama dengan rekan dari berbagai latar belakang demi tujuan organisasi".

**Contoh 2.** *Perbedaan utama perjuangan setelah 1908 dibanding sebelumnya adalah …*

Penalaran: setelah 1908, perjuangan menggunakan **organisasi modern dan bersifat nasional**. Jangan terkecoh opsi "perjuangan tidak lagi menggunakan senjata sama sekali" — perjuangan bersenjata tetap terjadi pada masa revolusi.

## Ringkasan

- Budi Utomo (1908) menandai lahirnya pergerakan nasional modern.
- Tiga Serangkai mendirikan Indische Partij; Ki Hajar Dewantara mendirikan Taman Siswa.
- Sumpah Pemuda 28 Oktober 1928 meneguhkan satu tanah air, satu bangsa, dan bahasa persatuan.
- Pelajari tokoh bersama nilai teladannya: persatuan, pendidikan, keberanian, rela berkorban, musyawarah.

## Tips mengerjakan soal

- Hafalkan pasangan **tokoh–organisasi–tahun** dalam satu tabel.
- Untuk soal nilai teladan, cari opsi yang **relevan dengan masa kini** dan bisa dilakukan secara nyata.
- Waspadai opsi yang benar secara sejarah tetapi tidak menjawab pertanyaan "nilai".
$md$, false, 3, 12),

('twk-nasionalisme-dasar', 'Bahasa Indonesia dan Simbol Negara sebagai Perekat Bangsa', 'twk-bahasa-simbol-negara',
 'Kedudukan bahasa Indonesia sebagai bahasa persatuan dan bahasa negara, serta aturan bendera, lambang, dan lagu kebangsaan menurut UUD 1945 dan UU 24/2009.',
$md$
## Bahasa Indonesia: dari bahasa persatuan menjadi bahasa negara

Bahasa Indonesia memiliki dua kedudukan penting:

| Kedudukan | Sejak | Dasar |
| --- | --- | --- |
| **Bahasa persatuan/nasional** | 28 Oktober 1928 | Ikrar ketiga Sumpah Pemuda: *menjunjung bahasa persatuan, bahasa Indonesia* |
| **Bahasa negara/resmi** | 18 Agustus 1945 | Pasal 36 UUD 1945: *Bahasa Negara ialah Bahasa Indonesia* |

Perhatikan redaksi ikrar ketiga Sumpah Pemuda: para pemuda **menjunjung** bahasa persatuan, bukan "mengaku berbahasa satu". Artinya, bahasa daerah tetap dihormati dan dilestarikan, sementara bahasa Indonesia menjadi alat pemersatu.

Bahasa Indonesia berakar dari **bahasa Melayu**, yang sejak lama menjadi *lingua franca* (bahasa pergaulan) di Nusantara karena digunakan dalam perdagangan antarpulau. Kongres Bahasa Indonesia pertama diselenggarakan pada 1938 di Solo.

### Fungsi bahasa Indonesia

Sebagai **bahasa nasional**: lambang kebanggaan dan identitas nasional, alat pemersatu berbagai suku, serta alat komunikasi antardaerah dan antarbudaya.

Sebagai **bahasa negara**: bahasa resmi kenegaraan, bahasa pengantar dalam dunia pendidikan, bahasa dalam perencanaan dan pelaksanaan pembangunan, serta bahasa pengembangan ilmu pengetahuan dan teknologi.

> **Tips ujian:** Jika soal menanyakan fungsi "alat pemersatu" atau "identitas", itu fungsi sebagai **bahasa nasional**. Jika menyebut "dokumen resmi", "pengantar pendidikan", itu fungsi sebagai **bahasa negara**.

## Simbol negara dalam UUD 1945

| Pasal | Isi |
| --- | --- |
| Pasal 35 | Bendera Negara Indonesia ialah Sang Merah Putih |
| Pasal 36 | Bahasa Negara ialah Bahasa Indonesia |
| Pasal 36A | Lambang Negara ialah Garuda Pancasila dengan semboyan Bhinneka Tunggal Ika |
| Pasal 36B | Lagu Kebangsaan ialah Indonesia Raya |
| Pasal 36C | Ketentuan lebih lanjut diatur dengan undang-undang |

Pasal 36A, 36B, dan 36C merupakan hasil **perubahan kedua** UUD 1945 (tahun 2000). Undang-undang pelaksananya adalah **UU Nomor 24 Tahun 2009** tentang Bendera, Bahasa, dan Lambang Negara, serta Lagu Kebangsaan.

### Bendera Merah Putih

- Bentuk persegi panjang dengan perbandingan lebar dan panjang **2 : 3**.
- Bagian atas merah, bagian bawah putih, dengan ukuran sama.
- **Bendera Pusaka** adalah bendera yang dikibarkan saat Proklamasi 17 Agustus 1945 dan dijahit oleh Fatmawati.
- Bendera tidak boleh dipakai sebagai reklame/iklan komersial, tidak boleh dikibarkan dalam keadaan rusak, robek, atau kusam, dan tidak boleh dicoret atau ditulisi huruf/gambar.
- Pengibaran setengah tiang dilakukan sebagai tanda berkabung.

### Garuda Pancasila

- Burung garuda menoleh ke kanan (dari sudut pandang garuda), dengan perisai di dada.
- Jumlah bulu melambangkan tanggal proklamasi: **17 helai** pada tiap sayap, **8** pada ekor, **19** di pangkal ekor, dan **45** di leher.
- Pita yang dicengkeram bertuliskan **Bhinneka Tunggal Ika**.

| Sila | Simbol pada perisai |
| --- | --- |
| Ketuhanan Yang Maha Esa | Bintang |
| Kemanusiaan yang adil dan beradab | Rantai |
| Persatuan Indonesia | Pohon beringin |
| Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan | Kepala banteng |
| Keadilan sosial bagi seluruh rakyat Indonesia | Padi dan kapas |

### Lagu kebangsaan Indonesia Raya

Diciptakan oleh **Wage Rudolf Supratman** dan pertama kali diperdengarkan (dengan biola) pada Kongres Pemuda II, 28 Oktober 1928. Saat lagu kebangsaan diperdengarkan, setiap orang wajib berdiri tegak dengan sikap hormat.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Sebuah toko memasang bendera Merah Putih yang sudah robek dan pudar di depan tokonya selama berbulan-bulan. Sikap warga negara yang tepat adalah …*

Penalaran: bendera yang rusak tidak boleh dikibarkan. Tindakan terbaik adalah **mengingatkan pemilik toko secara santun dan menyarankan penggantian**, bukan mencabutnya secara paksa atau membiarkannya.

**Contoh 2.** *Dalam rapat dinas tingkat nasional, peserta dari berbagai provinsi lebih nyaman memakai bahasa daerah masing-masing. Hal ini kurang tepat karena …*

Penalaran: forum resmi menuntut penggunaan **bahasa negara**. Jawaban yang benar mengaitkan dengan fungsi bahasa Indonesia sebagai bahasa resmi kenegaraan.

## Ringkasan

- Bahasa persatuan sejak 1928 (Sumpah Pemuda); bahasa negara sejak 1945 (Pasal 36 UUD 1945).
- Simbol negara diatur dalam Pasal 35–36C UUD 1945 dan UU 24/2009.
- Bendera 2 : 3; Garuda dengan bulu 17–8–19–45; Indonesia Raya karya W.R. Supratman.

## Tips mengerjakan soal

- Hafalkan pasangan **pasal–simbol**: 35 bendera, 36 bahasa, 36A lambang, 36B lagu.
- Untuk soal sikap terhadap simbol negara, pilih opsi yang **menghormati simbol sekaligus santun** kepada pelanggar.
- Ingat: menjunjung bahasa persatuan tidak berarti meninggalkan bahasa daerah.
$md$, false, 4, 12),

-- ============================ INTEGRITAS ====================================
('twk-integritas', 'Integritas dan Nilai-Nilai Antikorupsi', 'twk-integritas-nilai-antikorupsi',
 'Makna integritas, sembilan nilai antikorupsi, bentuk-bentuk tindak pidana korupsi, dan cara menjawab soal studi kasus integritas.',
$md$
## Makna integritas

**Integritas** berasal dari kata Latin *integer* yang berarti utuh. Orang berintegritas adalah orang yang **pikiran, perkataan, dan perbuatannya selaras**, serta tetap berpegang pada nilai yang benar meskipun tidak ada yang mengawasi.

Dalam kisi-kisi TWK, integritas dimaknai sebagai kemampuan peserta untuk **bersikap konsisten, jujur, dan berani menolak perbuatan menyimpang**, terutama korupsi, kolusi, dan nepotisme (KKN).

> **Tips ujian:** Kalimat "tetap jujur walaupun tidak ada yang tahu" adalah definisi operasional integritas yang paling sering muncul dalam bentuk studi kasus.

## Sembilan nilai antikorupsi

Komisi Pemberantasan Korupsi (KPK) merumuskan sembilan nilai yang sering disingkat dalam tiga kelompok:

| Kelompok | Nilai | Contoh perilaku |
| --- | --- | --- |
| **Inti** | Jujur | Melaporkan anggaran sesuai realisasi |
| | Disiplin | Datang tepat waktu dan menyelesaikan tugas sesuai tenggat |
| | Tanggung jawab | Mengakui kesalahan dan memperbaikinya |
| **Sikap** | Adil | Memberi pelayanan yang sama kepada semua warga |
| | Berani | Menolak suap dan melaporkan penyimpangan |
| | Peduli | Mengingatkan rekan yang hendak berbuat curang |
| **Etos kerja** | Kerja keras | Menyelesaikan pekerjaan dengan sungguh-sungguh |
| | Sederhana | Hidup sesuai kemampuan, tidak pamer kemewahan |
| | Mandiri | Tidak bergantung pada orang lain dan tidak menitipkan urusan lewat "orang dalam" |

## Bentuk tindak pidana korupsi

Undang-undang pemberantasan tindak pidana korupsi (UU 31/1999 sebagaimana diubah dengan UU 20/2001) memuat banyak pasal yang dapat dikelompokkan menjadi tujuh:

1. **Kerugian keuangan negara** — memperkaya diri atau orang lain secara melawan hukum.
2. **Suap-menyuap** — memberi/menerima sesuatu agar pejabat berbuat atau tidak berbuat dalam jabatannya.
3. **Penggelapan dalam jabatan** — menggelapkan uang atau barang yang dikuasai karena jabatan, termasuk memalsukan buku/daftar pemeriksaan administrasi.
4. **Pemerasan** — pejabat memaksa orang memberi sesuatu dengan menyalahgunakan kekuasaan.
5. **Perbuatan curang** — misalnya pemborong yang curang dalam pembangunan.
6. **Benturan kepentingan dalam pengadaan** — pejabat ikut serta dalam pengadaan yang ia urus.
7. **Gratifikasi** — pemberian kepada pegawai negeri yang berhubungan dengan jabatan dan tidak dilaporkan.

### Korupsi, kolusi, dan nepotisme

| Istilah | Inti | Contoh |
| --- | --- | --- |
| Korupsi | Penyalahgunaan wewenang/keuangan negara untuk keuntungan pribadi | Menggelembungkan harga pengadaan |
| Kolusi | Persekongkolan secara melawan hukum antarpihak | Panitia lelang "mengatur" pemenang bersama rekanan |
| Nepotisme | Menguntungkan keluarga/kroni di atas kepentingan umum | Meloloskan kerabat dalam seleksi pegawai tanpa prosedur |

## Faktor penyebab korupsi

- **Internal**: sifat tamak, gaya hidup konsumtif, moral yang lemah.
- **Eksternal**: sistem yang tidak transparan, pengawasan lemah, budaya permisif ("sudah biasa"), dan rendahnya keteladanan pimpinan.

Rumus sederhana yang sering dipakai untuk menjelaskan korupsi: korupsi terjadi ketika ada **monopoli kewenangan dan diskresi tanpa akuntabilitas**. Karena itu pencegahan dilakukan dengan transparansi, pembatasan diskresi, dan pengawasan.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Seorang pegawai diminta atasannya menandatangani daftar hadir rapat fiktif agar honor dapat dicairkan. Tindakan yang paling mencerminkan integritas adalah …*

Penalaran: opsi terbaik adalah **menolak dengan sopan sambil menjelaskan risikonya, dan bila perlu melapor melalui kanal pengaduan resmi**. Opsi "menandatangani tetapi tidak mengambil honornya" tetap salah karena ia ikut memalsukan dokumen.

**Contoh 2.** *Nilai antikorupsi yang paling ditonjolkan oleh pegawai yang menolak "jalur cepat" berbayar dan memilih antre sesuai prosedur adalah …*

Penalaran: tindakan itu menunjukkan **jujur dan adil** (tidak menyerobot hak orang lain). Perhatikan konteks: jika soal menekankan menolak bantuan "orang dalam", kata kuncinya **mandiri**.

## Ringkasan

- Integritas = keselarasan pikiran, ucapan, dan tindakan, termasuk saat tidak diawasi.
- Sembilan nilai antikorupsi: jujur, disiplin, tanggung jawab, adil, berani, peduli, kerja keras, sederhana, mandiri.
- Tujuh kelompok tipikor: kerugian negara, suap, penggelapan jabatan, pemerasan, perbuatan curang, benturan kepentingan pengadaan, gratifikasi.

## Tips mengerjakan soal

- Pada studi kasus, **tolak penyimpangan sejak awal**; jangan pilih opsi kompromi ("ikut sebentar lalu lapor").
- Bila ada opsi menolak *dan* opsi menolak sekaligus melapor melalui jalur resmi, opsi kedua biasanya lebih lengkap.
- Hindari opsi yang menyebarkan masalah ke media sosial sebelum menempuh jalur resmi.
$md$, true, 2, 12),

('twk-integritas', 'Gratifikasi, Suap, dan Konflik Kepentingan dalam Tugas ASN', 'twk-gratifikasi-konflik-kepentingan',
 'Perbedaan gratifikasi, suap, dan pemerasan; kewajiban pelaporan gratifikasi; serta cara mengenali dan menangani konflik kepentingan melalui studi kasus ASN.',
$md$
## Gratifikasi: pengertian luas

**Gratifikasi** adalah pemberian dalam arti luas: uang, barang, rabat (diskon), komisi, pinjaman tanpa bunga, tiket perjalanan, fasilitas penginapan, perjalanan wisata, pengobatan cuma-cuma, dan fasilitas lainnya.

Gratifikasi kepada pegawai negeri atau penyelenggara negara **dianggap suap** apabila **berhubungan dengan jabatannya** dan **berlawanan dengan kewajiban atau tugasnya** (Pasal 12B UU Tipikor). Ketentuan ini tidak berlaku jika penerima **melaporkannya kepada KPK paling lambat 30 hari kerja** sejak gratifikasi diterima (Pasal 12C).

> **Tips ujian:** Kunci gratifikasi ada pada hubungannya dengan **jabatan**. Kado ulang tahun dari sahabat lama yang tidak punya urusan dengan kantor berbeda dengan "kado" dari rekanan yang sedang mengikuti lelang di unit Anda.

## Gratifikasi, suap, dan pemerasan

| Aspek | Gratifikasi | Suap | Pemerasan |
| --- | --- | --- | --- |
| Inisiatif | Umumnya dari pemberi | Ada kesepakatan (meeting of minds) antara pemberi dan penerima | Dari pejabat yang meminta/memaksa |
| Kesepakatan imbal balik | Tidak harus ada di awal; sering sebagai "tanam budi" | Ada janji berbuat/tidak berbuat sesuatu | Pemberi berada dalam tekanan |
| Contoh | Parsel mewah dari vendor saat hari raya | Uang agar izin cepat terbit melanggar prosedur | Petugas meminta "uang rokok" agar berkas diproses |

### Contoh pemberian yang perlu diwaspadai

- Hadiah dari pihak yang **sedang/akan memiliki urusan** dengan instansi.
- Uang terima kasih dari warga setelah dilayani.
- Fasilitas perjalanan atau hotel dari rekanan.
- Diskon khusus yang tidak diberikan kepada masyarakat umum.

### Langkah yang tepat jika menerima gratifikasi

1. **Tolak** sejak awal dengan santun bila memungkinkan.
2. Jika tidak dapat ditolak (misalnya dikirim ke rumah), **jangan digunakan**, lalu **laporkan** melalui unit pengendalian gratifikasi instansi atau langsung kepada KPK dalam batas waktu 30 hari kerja.
3. Simpan bukti dan ikuti penetapan status (milik negara atau milik penerima).

## Konflik kepentingan

**Konflik kepentingan** adalah situasi ketika pejabat memiliki **kepentingan pribadi** yang dapat memengaruhi **objektivitas** keputusannya. Konflik kepentingan belum tentu korupsi, tetapi merupakan **pintu masuk** korupsi bila tidak dikelola.

### Sumber konflik kepentingan

| Sumber | Contoh |
| --- | --- |
| Hubungan keluarga | Menilai berkas seleksi yang diikuti adik sendiri |
| Hubungan bisnis | Pejabat pengadaan memiliki saham di perusahaan peserta lelang |
| Rangkap jabatan | Pengawas yang sekaligus menjadi pihak yang diawasi |
| Hadiah atau utang budi | Pernah dibantu pihak yang kini mengajukan izin |
| Afiliasi politik | Menggunakan fasilitas kantor untuk mendukung calon tertentu |

### Cara mengelola

- **Mengungkapkan** (deklarasi) konflik kepentingan kepada atasan secara tertulis.
- **Mengundurkan diri** dari proses pengambilan keputusan yang terkait (recusal).
- **Memisahkan** tugas sehingga tidak ada satu orang yang memegang seluruh proses.

## Studi kasus ASN

**Kasus 1.** Rani, petugas perizinan, menerima telepon dari pamannya yang meminta izin usahanya "didahulukan" walaupun berkasnya belum lengkap.

Analisis: ada konflik kepentingan (hubungan keluarga) dan potensi pelanggaran prosedur. Sikap tepat: **menolak perlakuan khusus, menjelaskan persyaratan yang kurang, dan memproses sesuai antrean**. Jika berkas paman lengkap pun, sebaiknya Rani menyerahkan pemrosesan kepada rekan lain.

**Kasus 2.** Setelah lelang selesai, pemenang lelang mengirim jam tangan mahal ke rumah Budi, anggota panitia, dengan kartu "sekadar ucapan terima kasih".

Analisis: pemberian terkait jabatan, berpotensi gratifikasi yang dianggap suap. Sikap tepat: **tidak memakai barang tersebut dan melaporkannya** melalui unit pengendalian gratifikasi/KPK paling lambat 30 hari kerja. Mengembalikan diam-diam tanpa laporan bukan jawaban terbaik karena tidak tercatat.

**Kasus 3.** Seorang warga memberi amplop kepada petugas loket sebagai ucapan terima kasih setelah KTP-nya selesai.

Analisis: pelayanan publik adalah kewajiban. Sikap tepat: **menolak dengan ramah dan menjelaskan bahwa layanan tidak dipungut biaya tambahan**.

## Ringkasan

- Gratifikasi terkait jabatan yang tidak dilaporkan dianggap suap; batas pelaporan 30 hari kerja.
- Suap melibatkan kesepakatan; pemerasan berasal dari paksaan pejabat.
- Konflik kepentingan harus diungkapkan dan dikelola, misalnya dengan mundur dari proses keputusan.

## Tips mengerjakan soal

- Tanyakan dua hal: **apakah pemberi punya urusan dengan jabatan saya?** dan **apakah pemberian itu bisa memengaruhi keputusan saya?**
- Opsi terbaik umumnya: tolak → jika terpaksa diterima, laporkan → lanjutkan tugas sesuai prosedur.
- Jangan pilih opsi "menerima lalu menyumbangkannya sendiri ke panti asuhan" — tetap harus dilaporkan.
$md$, false, 3, 13),

('twk-integritas', 'Nilai Dasar ASN BerAKHLAK dan Etika Jabatan', 'twk-nilai-dasar-asn-berakhlak',
 'Tujuh nilai dasar ASN BerAKHLAK beserta perilaku utamanya, netralitas ASN, serta penerapannya dalam soal integritas dan pelayanan publik.',
$md$
## Latar belakang

Pemerintah meluncurkan **core values ASN "BerAKHLAK"** pada Juli 2021 sebagai nilai dasar bersama seluruh aparatur sipil negara. Nilai-nilai ini kemudian dimuat sebagai nilai dasar ASN dalam **UU Nomor 20 Tahun 2023 tentang Aparatur Sipil Negara**, pengganti UU 5/2014. Pemerintah juga memperkenalkan *employer branding* **"Bangga Melayani Bangsa"**.

## Tujuh nilai BerAKHLAK

| Nilai | Makna singkat | Contoh perilaku |
| --- | --- | --- |
| **Ber**orientasi Pelayanan | Komitmen memberi pelayanan prima demi kepuasan masyarakat | Ramah, cekatan, solutif, dan terus memperbaiki kualitas layanan |
| **A**kuntabel | Bertanggung jawab atas kepercayaan yang diberikan | Jujur, cermat, disiplin, berintegritas; memakai kekayaan dan barang milik negara secara efisien; tidak menyalahgunakan kewenangan |
| **K**ompeten | Terus belajar dan mengembangkan kapabilitas | Meningkatkan kompetensi, membantu orang lain belajar, menyelesaikan tugas dengan kualitas terbaik |
| **H**armonis | Saling peduli dan menghargai perbedaan | Menghargai setiap orang apa pun latar belakangnya, suka menolong, membangun lingkungan kerja kondusif |
| **L**oyal | Berdedikasi dan mengutamakan kepentingan bangsa dan negara | Memegang teguh ideologi Pancasila dan UUD 1945, setia kepada NKRI serta pemerintahan yang sah, menjaga nama baik instansi, menjaga rahasia jabatan |
| **A**daptif | Terus berinovasi dan antusias menghadapi perubahan | Cepat menyesuaikan diri, berinovasi, bertindak proaktif |
| **K**olaboratif | Membangun kerja sama yang sinergis | Memberi kesempatan berbagai pihak berkontribusi, terbuka bekerja sama, menggerakkan sumber daya untuk tujuan bersama |

> **Tips ujian:** Kata "akuntabel" sering dipasangkan dengan **jujur, bertanggung jawab, tidak menyalahgunakan wewenang**. Kata "loyal" dipasangkan dengan **setia pada Pancasila, UUD 1945, NKRI, dan menjaga rahasia jabatan**.

## Integritas dalam etika jabatan

Beberapa prinsip etika yang sering muncul dalam soal:

- **Netralitas politik**: ASN tidak boleh menjadi anggota/pengurus partai politik dan tidak boleh berpihak dalam kampanye, termasuk melalui media sosial (misalnya memberi tanda suka atau membagikan materi kampanye secara aktif dapat dipersoalkan).
- **Menjaga rahasia jabatan**: tidak membocorkan dokumen atau data pribadi warga.
- **Tidak menyalahgunakan fasilitas negara**: kendaraan dinas bukan untuk keperluan pribadi atau keluarga.
- **Melaporkan harta kekayaan** bagi pejabat yang diwajibkan, melalui LHKPN.
- **Whistleblowing**: melaporkan pelanggaran melalui saluran resmi dengan perlindungan identitas pelapor.

## Pemetaan kasus ke nilai

| Situasi | Nilai yang paling relevan |
| --- | --- |
| Pegawai mengembalikan sisa uang perjalanan dinas | Akuntabel |
| Pegawai mempelajari aplikasi baru dan mengajari rekan | Kompeten dan Adaptif |
| Pegawai menolak membocorkan soal ujian seleksi kepada kerabat | Loyal (rahasia jabatan) dan Akuntabel |
| Unit kerja menggandeng komunitas lokal untuk vaksinasi | Kolaboratif |
| Petugas tetap melayani dengan sabar warga yang marah | Berorientasi Pelayanan dan Harmonis |
| Pegawai tidak memakai mobil dinas untuk mudik | Akuntabel |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Menjelang pemilihan kepala daerah, sebuah grup percakapan pegawai ramai membagikan materi kampanye salah satu calon. Sikap yang tepat sebagai ASN adalah …*

Penalaran: nilai **netralitas** dan **loyal** pada negara, bukan pada calon tertentu. Jawaban terbaik: **tidak ikut membagikan, mengingatkan rekan tentang aturan netralitas secara santun**, dan bila berlanjut melaporkan melalui mekanisme yang berlaku.

**Contoh 2.** *Seorang pegawai menemukan selisih kas karena kesalahan pencatatannya sendiri. Ia segera melapor kepada atasan dan memperbaikinya. Nilai yang ditunjukkan …*

Penalaran: mengakui dan memperbaiki kesalahan adalah inti **akuntabel/tanggung jawab**. Opsi "kompeten" kurang tepat karena fokus kasus bukan pada kemampuan.

**Contoh 3.** *Saat sistem antrean daring baru diterapkan, sebagian pegawai senior enggan memakainya. Tindakan yang mencerminkan nilai adaptif adalah …*

Penalaran: carilah opsi **mempelajari sistem baru dengan antusias dan membantu rekan beradaptasi**, bukan menunggu instruksi atau tetap bertahan pada cara lama.

## Ringkasan

- BerAKHLAK: Berorientasi Pelayanan, Akuntabel, Kompeten, Harmonis, Loyal, Adaptif, Kolaboratif.
- Nilai dasar ini kini menjadi bagian dari UU 20/2023 tentang ASN.
- Integritas ASN tampak dalam netralitas, menjaga rahasia jabatan, tidak menyalahgunakan fasilitas, dan berani melapor melalui kanal resmi.

## Tips mengerjakan soal

- Petakan kata kunci kasus ke salah satu nilai BerAKHLAK sebelum membaca opsi.
- Opsi terbaik biasanya **sesuai aturan sekaligus tetap humanis**.
- Waspadai opsi yang tampak loyal kepada atasan tetapi melanggar aturan; loyal dalam BerAKHLAK berarti loyal kepada negara dan aturan, bukan kepada perintah yang menyimpang.
$md$, false, 4, 12),

-- ============================ BELA NEGARA ===================================
('twk-bela-negara', 'Konsep, Dasar Hukum, dan Nilai Dasar Bela Negara', 'twk-konsep-dasar-bela-negara',
 'Pengertian bela negara, dasar hukumnya dalam UUD 1945 dan undang-undang, lima nilai dasar bela negara, serta bentuk keikutsertaan warga negara.',
$md$
## Pengertian bela negara

**Bela negara** adalah tekad, sikap, dan perilaku serta tindakan warga negara, baik secara perseorangan maupun kolektif, dalam menjaga kedaulatan negara, keutuhan wilayah, dan keselamatan bangsa dan negara yang dijiwai oleh kecintaan kepada NKRI yang berdasarkan Pancasila dan UUD 1945.

Bela negara **tidak identik dengan angkat senjata**. Seorang guru yang mendidik muridnya dengan sungguh-sungguh, petani yang menjaga ketahanan pangan, atau ASN yang melayani dengan jujur juga sedang membela negara sesuai profesinya.

## Dasar hukum

| Dasar | Isi pokok |
| --- | --- |
| Pembukaan UUD 1945 alinea IV | Tujuan negara "melindungi segenap bangsa Indonesia dan seluruh tumpah darah Indonesia" |
| Pasal 27 ayat (3) UUD 1945 | Setiap warga negara berhak dan wajib ikut serta dalam upaya pembelaan negara |
| Pasal 30 ayat (1) UUD 1945 | Tiap-tiap warga negara berhak dan wajib ikut serta dalam usaha pertahanan dan keamanan negara |
| Pasal 30 ayat (2) UUD 1945 | Usaha pertahanan dan keamanan negara dilaksanakan melalui sistem pertahanan dan keamanan rakyat semesta oleh TNI dan Polri sebagai kekuatan utama, dan rakyat sebagai kekuatan pendukung |
| UU 3/2002 tentang Pertahanan Negara | Mengatur penyelenggaraan pertahanan negara dan keikutsertaan warga negara dalam bela negara |
| UU 23/2019 tentang Pengelolaan Sumber Daya Nasional untuk Pertahanan Negara | Mengatur pembinaan kesadaran bela negara serta komponen cadangan dan komponen pendukung |

> **Tips ujian:** Bela negara sebagai **hak dan kewajiban** sekaligus — bukan hanya kewajiban. Pasal yang paling sering ditanyakan: **27 ayat (3)** dan **30 ayat (1)**.

## Bentuk keikutsertaan warga negara (UU 3/2002)

Menurut UU Pertahanan Negara, keikutsertaan warga negara dalam upaya bela negara diselenggarakan melalui:

1. **Pendidikan kewarganegaraan**;
2. **Pelatihan dasar kemiliteran** secara wajib;
3. **Pengabdian sebagai prajurit TNI** secara sukarela atau secara wajib;
4. **Pengabdian sesuai dengan profesi**.

## Lima nilai dasar bela negara

| Nilai | Indikator perilaku |
| --- | --- |
| **Cinta tanah air** | Menjaga lingkungan, mengenal wilayah dan budaya, bangga menggunakan produk dalam negeri |
| **Sadar berbangsa dan bernegara** | Menaati hukum, membayar pajak, menggunakan hak pilih secara bertanggung jawab |
| **Setia kepada Pancasila sebagai ideologi negara** | Menolak ideologi yang bertentangan dengan Pancasila, mengamalkan nilai-nilai Pancasila |
| **Rela berkorban untuk bangsa dan negara** | Menyumbangkan tenaga, waktu, dan pikiran untuk kepentingan umum |
| **Kemampuan awal bela negara** | Sehat jasmani dan rohani, disiplin, ulet, memiliki kecerdasan dan kemampuan yang bisa diabdikan |

## Komponen pertahanan negara

| Komponen | Isi |
| --- | --- |
| **Komponen utama** | TNI, siap digunakan untuk melaksanakan tugas pertahanan |
| **Komponen cadangan** | Sumber daya nasional (termasuk warga negara terlatih) yang disiapkan untuk memperbesar dan memperkuat komponen utama; keikutsertaan warga bersifat sukarela |
| **Komponen pendukung** | Sumber daya nasional yang dapat meningkatkan kekuatan dan kemampuan komponen utama dan cadangan |

## Hari Bela Negara

**19 Desember** diperingati sebagai Hari Bela Negara untuk mengenang pembentukan **Pemerintah Darurat Republik Indonesia (PDRI)** di Sumatra Barat pada 1948, setelah Belanda menduduki Yogyakarta dalam Agresi Militer II. PDRI dipimpin oleh **Sjafruddin Prawiranegara** dan membuktikan bahwa Republik Indonesia tetap ada.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Seorang dokter muda memilih bertugas di daerah terpencil dan perbatasan. Bentuk bela negara yang ditunjukkan adalah …*

Penalaran: ini **pengabdian sesuai profesi**. Jangan terkecoh dengan opsi "pelatihan dasar kemiliteran".

**Contoh 2.** *Pernyataan yang paling tepat tentang bela negara adalah …*

Penalaran: pilih opsi yang menyatakan bahwa bela negara adalah **hak dan kewajiban setiap warga negara** dan dapat dilakukan **secara fisik maupun nonfisik**.

## Ringkasan

- Bela negara adalah hak dan kewajiban warga negara (Pasal 27 ayat 3 dan Pasal 30 ayat 1).
- Bentuk keikutsertaan: pendidikan kewarganegaraan, pelatihan dasar kemiliteran, pengabdian sebagai prajurit TNI, pengabdian sesuai profesi.
- Lima nilai dasar: cinta tanah air, sadar berbangsa dan bernegara, setia pada Pancasila, rela berkorban, kemampuan awal bela negara.
- Hari Bela Negara: 19 Desember (PDRI 1948).

## Tips mengerjakan soal

- Bela negara bersifat **semesta**: semua warga, semua profesi, fisik dan nonfisik.
- Hafalkan lima nilai dasar persis urutannya; soal sering meminta "yang bukan nilai dasar bela negara".
- Untuk soal sikap, pilih tindakan nyata yang sesuai kapasitas pelaku (pelajar, ASN, pengusaha, dan sebagainya).
$md$, true, 2, 12),

('twk-bela-negara', 'Ancaman terhadap Negara dan Sistem Pertahanan Semesta', 'twk-ancaman-sistem-pertahanan',
 'Jenis ancaman militer, nonmiliter, dan hibrida; sistem pertahanan dan keamanan rakyat semesta; serta peran TNI, Polri, dan masyarakat.',
$md$
## Ancaman: pengertian dan jenis

**Ancaman** adalah setiap usaha dan kegiatan, baik dari dalam maupun luar negeri, yang dinilai membahayakan kedaulatan negara, keutuhan wilayah, dan keselamatan segenap bangsa.

| Jenis | Ciri | Contoh |
| --- | --- | --- |
| **Ancaman militer** | Menggunakan kekuatan bersenjata yang terorganisasi | Agresi negara lain, pelanggaran wilayah, pemberontakan bersenjata, sabotase, spionase, aksi teror bersenjata, ancaman keamanan laut dan udara, konflik komunal bersenjata |
| **Ancaman nonmiliter** | Tidak menggunakan senjata, tetapi berdampak luas | Ideologi (radikalisme, paham anti-Pancasila), politik (intervensi asing), ekonomi (krisis, penyelundupan), sosial budaya (narkoba, disintegrasi), teknologi (kejahatan siber), keselamatan umum (bencana, wabah) |
| **Ancaman hibrida** | Gabungan militer dan nonmiliter secara bersamaan | Serangan siber terkoordinasi yang disertai propaganda dan gangguan bersenjata |

### Dari mana asalnya?

- **Ancaman dari dalam**: separatisme, konflik SARA, korupsi yang melemahkan negara, penyalahgunaan narkoba.
- **Ancaman dari luar**: agresi, spionase, perang informasi, penguasaan sumber daya oleh pihak asing secara melawan hukum.

> **Tips ujian:** Narkoba, hoaks, korupsi, dan radikalisme adalah **ancaman nonmiliter**. Terorisme dapat masuk ancaman militer jika menggunakan senjata terorganisasi, tetapi penyebaran paham radikalnya adalah ancaman ideologi (nonmiliter).

## Sistem pertahanan negara

Pertahanan Indonesia bersifat **semesta**: melibatkan seluruh warga negara, wilayah, dan sumber daya nasional, dipersiapkan secara dini oleh pemerintah, dan diselenggarakan secara total, terpadu, terarah, dan berlanjut.

| Menghadapi | Unsur utama | Unsur pendukung |
| --- | --- | --- |
| Ancaman militer | TNI sebagai komponen utama | Komponen cadangan dan komponen pendukung |
| Ancaman nonmiliter | Kementerian/lembaga di luar bidang pertahanan sesuai jenis ancaman | Unsur lain kekuatan bangsa, termasuk masyarakat |

Contoh: menghadapi wabah penyakit, unsur utamanya adalah lembaga di bidang kesehatan dan penanggulangan bencana; TNI dan Polri dapat membantu.

### Peran TNI dan Polri

| Lembaga | Peran pokok (Pasal 30 UUD 1945) |
| --- | --- |
| **TNI** (AD, AL, AU) | Sebagai alat negara bertugas mempertahankan, melindungi, dan memelihara keutuhan dan kedaulatan negara |
| **Polri** | Sebagai alat negara yang menjaga keamanan dan ketertiban masyarakat, bertugas melindungi, mengayomi, melayani masyarakat, serta menegakkan hukum |

Presiden memegang **kekuasaan yang tertinggi atas Angkatan Darat, Angkatan Laut, dan Angkatan Udara** (Pasal 10 UUD 1945).

## Konsep ketahanan nasional

**Ketahanan nasional** adalah kondisi dinamis bangsa yang berisi keuletan dan ketangguhan untuk mengembangkan kekuatan nasional dalam menghadapi ancaman, gangguan, hambatan, dan tantangan (sering disingkat **ATHG**).

| Istilah | Sifat |
| --- | --- |
| Ancaman | Bersifat **konseptual**, dari luar maupun dalam, bertujuan mengubah atau merombak kebijakan secara konsepsional |
| Tantangan | Bersifat menggugah kemampuan, dari dalam maupun luar |
| Hambatan | Bersifat **dari dalam diri**, melemahkan atau menghalangi secara tidak konsepsional |
| Gangguan | Bersifat **dari luar**, melemahkan atau menghalangi secara tidak konsepsional |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Maraknya peredaran narkoba di kalangan pelajar di daerah perbatasan termasuk ancaman …*

Penalaran: tanpa kekuatan bersenjata, menyerang kualitas generasi muda → **ancaman nonmiliter di bidang sosial budaya**.

**Contoh 2.** *Pemerintah menghadapi serangan siber yang melumpuhkan layanan publik. Unsur utama yang menghadapi ancaman ini adalah …*

Penalaran: ancaman nonmiliter di bidang teknologi → unsur utamanya **lembaga pemerintah yang membidangi keamanan siber**, didukung unsur lain. TNI sebagai komponen utama hanya untuk ancaman militer.

**Contoh 3.** *Kapal asing bersenjata memasuki perairan teritorial tanpa izin dan menolak diperiksa.*

Penalaran: pelanggaran wilayah dengan kekuatan bersenjata → **ancaman militer**.

## Ringkasan

- Ancaman terdiri atas militer, nonmiliter, dan hibrida; bisa berasal dari dalam maupun luar negeri.
- Pertahanan Indonesia bersifat semesta; TNI komponen utama untuk ancaman militer, kementerian/lembaga terkait untuk ancaman nonmiliter.
- Polri menjaga keamanan dan ketertiban masyarakat serta menegakkan hukum.

## Tips mengerjakan soal

- Tanyakan: **apakah ancaman ini memakai kekuatan bersenjata terorganisasi?** Jika tidak, hampir pasti nonmiliter.
- Bedakan peran TNI (pertahanan) dan Polri (keamanan dan ketertiban, penegakan hukum).
- Untuk soal ATHG, ingat: hambatan dari dalam, gangguan dari luar.
$md$, false, 3, 12),

('twk-bela-negara', 'Bela Negara Nonfisik di Era Digital', 'twk-bela-negara-nonfisik-digital',
 'Wujud bela negara nonfisik bagi pelajar, pekerja, dan ASN, termasuk melawan hoaks, radikalisme, dan ujaran kebencian di ruang digital.',
$md$
## Bela negara fisik dan nonfisik

| Bentuk | Pengertian | Contoh |
| --- | --- | --- |
| **Fisik** | Menghadapi ancaman dengan kekuatan fisik/bersenjata | Menjadi prajurit TNI, komponen cadangan, membantu pengamanan saat perang |
| **Nonfisik** | Upaya mempertahankan negara melalui peningkatan kesadaran berbangsa, pengabdian, dan perilaku positif | Belajar sungguh-sungguh, bekerja jujur, menjaga persatuan, melawan hoaks, membayar pajak |

Di masa damai, **bela negara nonfisik** justru paling relevan bagi sebagian besar warga.

## Wujud bela negara sesuai peran

| Peran | Contoh bela negara nonfisik |
| --- | --- |
| Pelajar/mahasiswa | Belajar tekun, berprestasi, tidak tawuran, aktif dalam kegiatan positif, menolak narkoba |
| Pekerja/profesional | Bekerja jujur dan profesional, membayar pajak, menaati hukum |
| Pengusaha | Menciptakan lapangan kerja, memakai bahan baku lokal, membayar upah dan pajak dengan benar |
| ASN | Melayani masyarakat tanpa diskriminasi, netral, menolak korupsi, menjaga rahasia negara |
| Warga digital | Memeriksa kebenaran informasi, tidak menyebarkan hoaks dan ujaran kebencian, menjaga data pribadi |

## Ancaman di ruang digital

### 1. Hoaks dan disinformasi

Hoaks dapat memecah belah masyarakat, menurunkan kepercayaan pada lembaga negara, bahkan memicu kerusuhan. Langkah menghadapinya:

1. **Cek sumber**: apakah berasal dari media atau lembaga kredibel?
2. **Cek fakta**: bandingkan dengan sumber lain atau kanal cek fakta resmi.
3. **Cermati judul provokatif** dan ajakan "sebarkan sebelum dihapus".
4. **Jangan meneruskan** informasi yang belum terverifikasi.
5. **Laporkan** konten yang jelas melanggar melalui kanal aduan resmi atau fitur pelaporan platform.

### 2. Radikalisme dan intoleransi

Radikalisme yang mengarah pada kekerasan dan penolakan terhadap Pancasila adalah **ancaman nonmiliter di bidang ideologi**. Ciri-cirinya: intoleran terhadap perbedaan, merasa paling benar, mengafirkan atau merendahkan kelompok lain, dan membenarkan kekerasan untuk mencapai tujuan.

### 3. Ujaran kebencian berbasis SARA

Ujaran kebencian merusak persatuan. Penyebarannya juga dapat berujung pidana berdasarkan peraturan perundang-undangan di bidang informasi dan transaksi elektronik.

### 4. Kejahatan siber dan kebocoran data

Menjaga kata sandi, tidak membagikan data pribadi warga, dan melaporkan kerentanan sistem melalui jalur resmi adalah bagian dari bela negara bagi pegawai yang mengelola data.

> **Tips ujian:** Opsi "membalas hoaks dengan kemarahan di kolom komentar" atau "membiarkan saja" bukan jawaban terbaik. Pilih opsi yang **memverifikasi, tidak menyebarkan, mengedukasi, dan melaporkan**.

## Studi kasus

**Kasus 1.** Di grup percakapan alumni beredar video lama kerusuhan yang diberi narasi seolah-olah baru terjadi di kota Anda, disertai ajakan membenci suku tertentu.

Analisis: ini disinformasi yang berpotensi memecah belah. Sikap tepat: **tidak meneruskan, memberi klarifikasi dengan sumber yang kredibel secara santun, dan melaporkan kontennya**.

**Kasus 2.** Seorang mahasiswa diajak bergabung dalam kelompok kajian yang menyebut Pancasila sebagai "sistem buatan manusia yang harus diganti" dan mendorong menolak hormat bendera.

Analisis: indikasi paham anti-Pancasila (ancaman ideologi). Sikap tepat: **menolak bergabung, berdiskusi dengan dosen/pembimbing, dan melaporkan kepada pihak kampus** bila ada ajakan kekerasan.

**Kasus 3.** Seorang pegawai diminta pihak luar menyerahkan salinan basis data penduduk "untuk riset" tanpa surat resmi.

Analisis: data warga adalah aset yang wajib dilindungi. Sikap tepat: **menolak dan mengarahkan permohonan melalui prosedur resmi** sesuai ketentuan perlindungan data.

## Contoh pola soal dan penalarannya

*Contoh bela negara nonfisik yang paling tepat bagi seorang pedagang adalah …*

Penalaran: carilah opsi yang sesuai profesinya, misalnya **menjual produk yang legal dan berkualitas, membayar pajak, dan tidak menimbun barang**. Opsi "mengikuti latihan militer" adalah bela negara fisik dan bukan kewajiban pedagang.

## Ringkasan

- Bela negara nonfisik adalah wujud paling relevan bagi warga di masa damai.
- Ancaman digital: hoaks, radikalisme, ujaran kebencian, kejahatan siber.
- Pola sikap terbaik: verifikasi → tidak menyebarkan → edukasi santun → laporkan melalui kanal resmi.

## Tips mengerjakan soal

- Sesuaikan jawaban dengan **peran pelaku** dalam soal.
- Utamakan opsi yang **preventif dan edukatif** daripada reaktif atau emosional.
- Radikalisme dan narkoba termasuk ancaman nonmiliter; hafalkan bidangnya (ideologi dan sosial budaya).
$md$, false, 4, 11),

-- ============================== PANCASILA ===================================
('twk-pancasila', 'Sejarah Perumusan Pancasila: BPUPKI, Piagam Jakarta, dan PPKI', 'twk-sejarah-perumusan-pancasila',
 'Kronologi perumusan Pancasila dari sidang BPUPKI, usulan para tokoh, Piagam Jakarta oleh Panitia Sembilan, hingga pengesahan oleh PPKI pada 18 Agustus 1945.',
$md$
## Gambaran umum

Pancasila tidak lahir dalam satu hari. Rumusannya melalui proses **usulan, perdebatan, dan kompromi** para pendiri bangsa pada 1945. Soal TWK sering menanyakan urutan peristiwa, tokoh pengusul, dan perubahan rumusan sila pertama.

## BPUPKI

**Badan Penyelidik Usaha-Usaha Persiapan Kemerdekaan Indonesia** (*Dokuritsu Junbi Cosakai*) dibentuk oleh pemerintah pendudukan Jepang dan dilantik pada **28 April 1945**. Ketuanya **dr. K.R.T. Radjiman Wedyodiningrat**.

| Sidang | Waktu | Agenda |
| --- | --- | --- |
| Sidang I | 29 Mei – 1 Juni 1945 | Membahas **dasar negara** |
| Sidang II | 10 – 17 Juli 1945 | Membahas **rancangan undang-undang dasar**, bentuk negara, dan wilayah |

### Usulan dasar negara pada Sidang I

| Tanggal | Tokoh | Usulan (secara ringkas) |
| --- | --- | --- |
| 29 Mei 1945 | Mr. Mohammad Yamin | Peri Kebangsaan, Peri Kemanusiaan, Peri Ketuhanan, Peri Kerakyatan, Kesejahteraan Rakyat |
| 31 Mei 1945 | Prof. Dr. Soepomo | Persatuan, Kekeluargaan, Keseimbangan lahir dan batin, Musyawarah, Keadilan rakyat |
| 1 Juni 1945 | Ir. Soekarno | Kebangsaan Indonesia, Internasionalisme atau Perikemanusiaan, Mufakat atau Demokrasi, Kesejahteraan Sosial, Ketuhanan Yang Berkebudayaan |

Soekarno-lah yang pertama kali memberi nama **"Pancasila"** untuk dasar negara. Ia juga menawarkan alternatif peringkasan menjadi **Trisila** (sosio-nasionalisme, sosio-demokrasi, ketuhanan) dan **Ekasila** (gotong royong). Karena itu, **1 Juni** ditetapkan sebagai **Hari Lahir Pancasila**.

> **Tips ujian:** Yang ditanyakan biasanya: siapa yang pertama kali mengusulkan nama "Pancasila" (Soekarno, 1 Juni 1945) dan urutan pengusul (Yamin → Soepomo → Soekarno).

## Panitia Sembilan dan Piagam Jakarta

Setelah Sidang I, dibentuk **Panitia Sembilan** untuk merumuskan usulan-usulan menjadi satu naskah. Anggotanya:

| Golongan kebangsaan | Golongan Islam |
| --- | --- |
| Ir. Soekarno (ketua) | K.H. Abdul Wahid Hasjim |
| Drs. Mohammad Hatta | H. Agus Salim |
| Mr. A.A. Maramis | Abikusno Tjokrosujoso |
| Mr. Achmad Soebardjo | Abdul Kahar Muzakkir |
| Mr. Mohammad Yamin | |

Pada **22 Juni 1945** Panitia Sembilan menghasilkan rancangan pembukaan hukum dasar yang kemudian dikenal sebagai **Piagam Jakarta** (*Jakarta Charter*, istilah yang dipopulerkan Mohammad Yamin). Rumusan sila pertamanya: *"Ketuhanan, dengan kewajiban menjalankan syariat Islam bagi pemeluk-pemeluknya."*

## PPKI dan pengesahan

**Panitia Persiapan Kemerdekaan Indonesia** (*Dokuritsu Junbi Inkai*) dibentuk pada **7 Agustus 1945**, diketuai **Soekarno** dengan wakil **Mohammad Hatta**.

Menjelang sidang 18 Agustus 1945, muncul keberatan dari wakil-wakil Indonesia bagian timur terhadap tujuh kata dalam sila pertama Piagam Jakarta. Hatta kemudian melakukan pendekatan kepada tokoh-tokoh Islam, antara lain **Ki Bagus Hadikusumo** dan **Teuku Mohammad Hasan**. Demi persatuan, para tokoh menyetujui perubahan sila pertama menjadi **"Ketuhanan Yang Maha Esa"**.

Sidang PPKI **18 Agustus 1945** menghasilkan:

1. Pengesahan **UUD 1945** (yang Pembukaannya memuat rumusan Pancasila);
2. Pemilihan **Soekarno sebagai Presiden** dan **Mohammad Hatta sebagai Wakil Presiden**;
3. Penetapan bahwa untuk sementara Presiden dibantu oleh sebuah **Komite Nasional**.

### Perbandingan rumusan

| Sila | Piagam Jakarta (22 Juni 1945) | Rumusan sah (18 Agustus 1945) |
| --- | --- | --- |
| 1 | Ketuhanan, dengan kewajiban menjalankan syariat Islam bagi pemeluk-pemeluknya | Ketuhanan Yang Maha Esa |
| 2 | Kemanusiaan yang adil dan beradab | Kemanusiaan yang adil dan beradab |
| 3 | Persatuan Indonesia | Persatuan Indonesia |
| 4 | Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan | sama |
| 5 | Keadilan sosial bagi seluruh rakyat Indonesia | sama |

## Nilai yang dapat diteladani

- **Musyawarah mufakat** dalam menyelesaikan perbedaan pandangan.
- **Mengutamakan persatuan** di atas kepentingan golongan (sikap para tokoh Islam pada 18 Agustus 1945).
- **Toleransi** terhadap keberagaman agama dan daerah.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Perubahan sila pertama Piagam Jakarta pada 18 Agustus 1945 menunjukkan sikap para pendiri bangsa yang …*

Penalaran: inti peristiwa adalah kerelaan demi keutuhan bangsa → **mengutamakan persatuan dan kesatuan bangsa di atas kepentingan golongan**.

**Contoh 2.** *Tokoh yang mengusulkan dasar negara pada 31 Mei 1945 dengan gagasan negara integralistik adalah …*

Penalaran: tanggal 31 Mei → **Soepomo**.

## Ringkasan

- BPUPKI: Sidang I (29 Mei–1 Juni 1945) membahas dasar negara; Sidang II (10–17 Juli 1945) membahas rancangan UUD.
- Pengusul: Yamin (29 Mei), Soepomo (31 Mei), Soekarno (1 Juni, pencetus nama Pancasila).
- Panitia Sembilan → Piagam Jakarta (22 Juni 1945).
- PPKI mengesahkan UUD 1945 pada 18 Agustus 1945 dengan sila pertama "Ketuhanan Yang Maha Esa".

## Tips mengerjakan soal

- Buat garis waktu sederhana dan hafalkan tanggalnya berurutan.
- Bedakan **BPUPKI** (menyelidiki, merumuskan) dan **PPKI** (mempersiapkan, mengesahkan).
- Rumusan Pancasila yang **sah** adalah yang tercantum dalam **Pembukaan UUD 1945 alinea keempat**.
$md$, true, 2, 13),

('twk-pancasila', 'Makna dan Pengamalan Tiap Sila Pancasila', 'twk-pengamalan-sila-pancasila',
 'Makna setiap sila, contoh butir pengamalan, hubungan antarsila yang hierarkis-piramidal, serta strategi menjawab soal studi kasus pengamalan Pancasila.',
$md$
## Sifat hubungan antarsila

Sila-sila Pancasila merupakan **satu kesatuan yang utuh** dan bersifat **hierarkis-piramidal**: sila pertama menjiwai sila kedua sampai kelima, sila kedua dijiwai sila pertama dan menjiwai sila ketiga sampai kelima, dan seterusnya. Karena itu, sila-sila tidak boleh dipahami atau diamalkan secara terpisah.

## Sila pertama: Ketuhanan Yang Maha Esa

Makna: bangsa Indonesia percaya dan takwa kepada Tuhan Yang Maha Esa, dengan menghormati kebebasan setiap orang memeluk agama dan beribadat menurut agama dan kepercayaannya.

Contoh pengamalan:

- Menghormati dan bekerja sama antarpemeluk agama yang berbeda.
- Tidak memaksakan suatu agama atau kepercayaan kepada orang lain.
- Membina kerukunan hidup antarumat beragama.
- Memberi kesempatan rekan kerja menjalankan ibadah.

## Sila kedua: Kemanusiaan yang adil dan beradab

Makna: mengakui dan memperlakukan manusia sesuai harkat dan martabatnya sebagai makhluk Tuhan.

Contoh pengamalan:

- Mengakui persamaan derajat, hak, dan kewajiban tanpa membedakan suku, agama, ras, jenis kelamin, atau kedudukan sosial.
- Tenggang rasa dan tidak semena-mena terhadap orang lain.
- Gemar melakukan kegiatan kemanusiaan dan berani membela kebenaran dan keadilan.
- Menghormati bangsa lain sebagai bagian dari umat manusia.

## Sila ketiga: Persatuan Indonesia

Makna: menempatkan persatuan, kesatuan, kepentingan, dan keselamatan bangsa dan negara di atas kepentingan pribadi dan golongan.

Contoh pengamalan:

- Rela berkorban untuk kepentingan bangsa dan negara.
- Cinta tanah air dan bangga sebagai bangsa Indonesia.
- Memajukan pergaulan demi persatuan dan kesatuan bangsa yang ber-Bhinneka Tunggal Ika.
- Ikut menjaga ketertiban dunia.

## Sila keempat: Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan

Makna: kedaulatan berada di tangan rakyat; keputusan diambil melalui musyawarah yang dilandasi akal sehat dan hati nurani.

Contoh pengamalan:

- Mengutamakan musyawarah untuk mencapai mufakat dalam mengambil keputusan.
- Tidak memaksakan kehendak kepada orang lain.
- Menerima dan melaksanakan hasil keputusan musyawarah dengan iktikad baik dan tanggung jawab.
- Musyawarah dilakukan dengan akal sehat dan sesuai hati nurani yang luhur.

## Sila kelima: Keadilan sosial bagi seluruh rakyat Indonesia

Makna: kemakmuran yang merata bagi seluruh rakyat, dengan keseimbangan antara hak dan kewajiban.

Contoh pengamalan:

- Bersikap adil kepada sesama dan menghormati hak orang lain.
- Tidak menggunakan hak milik untuk hal yang bertentangan dengan kepentingan umum (misalnya pemerasan).
- Tidak bersifat boros dan bergaya hidup mewah.
- Suka bekerja keras dan menghargai hasil karya orang lain.
- Bersama-sama mewujudkan kemajuan yang merata.

> **Tips ujian:** Kata kunci cepat — **ibadah/toleransi agama** → sila 1; **martabat/HAM/kemanusiaan** → sila 2; **persatuan/rela berkorban/cinta tanah air** → sila 3; **musyawarah/tidak memaksakan kehendak** → sila 4; **adil/merata/tidak boros/kerja keras** → sila 5.

## Tabel cepat: kata kunci dan sila

| Situasi dalam soal | Sila |
| --- | --- |
| Membantu tetangga beda agama membangun rumah ibadah | 1 (kerukunan beragama) |
| Menggalang donasi untuk korban bencana di luar negeri | 2 |
| Menyanyikan lagu daerah lain di acara sekolah dengan bangga | 3 |
| Ketua RT mengajak warga rapat sebelum menentukan iuran | 4 |
| Pemerintah membangun jalan di daerah tertinggal agar harga barang turun | 5 |
| Menerima hasil voting walaupun usulannya kalah | 4 |
| Tidak membeda-bedakan pasien berdasarkan status sosial | 2 |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Dalam rapat kelurahan, usulan Pak Darto kalah suara. Ia tetap ikut melaksanakan keputusan rapat dengan sungguh-sungguh. Sikap ini mencerminkan sila …*

Penalaran: menerima dan melaksanakan hasil musyawarah → **sila keempat**. Pengecoh umum: sila ketiga (persatuan). Fokus kasus adalah proses pengambilan keputusan, jadi sila keempat lebih tepat.

**Contoh 2.** *Seorang pengusaha menetapkan upah karyawan sesuai ketentuan dan membagikan sebagian keuntungan untuk pelatihan warga sekitar. Nilai sila yang paling dominan …*

Penalaran: pemerataan kesejahteraan → **sila kelima**.

**Contoh 3 (tipe "paling tepat").** *Seorang dokter menolak mendahulukan pasien kaya yang menawarkan bayaran lebih, dan tetap melayani sesuai urutan kondisi darurat.*

Penalaran: memperlakukan manusia sama derajatnya → **sila kedua**. Sila kelima juga bersinggungan (adil), tetapi soal menekankan **martabat dan persamaan derajat manusia**, jadi sila kedua lebih tepat. Baca kata kunci dengan cermat.

## Ringkasan

- Sila-sila Pancasila bersifat hierarkis-piramidal dan saling menjiwai.
- Setiap sila memiliki kata kunci pengamalan yang khas.
- Dalam soal studi kasus, cari **fokus utama** tindakan, bukan sekadar nilai yang ikut terlibat.

## Tips mengerjakan soal

- Garis bawahi kata kerja utama dalam kasus (menghormati ibadah, bermusyawarah, berbagi, dan sebagainya).
- Jika dua sila tampak cocok, pilih yang paling langsung berkaitan dengan tindakan inti.
- Ingat bahwa toleransi beragama masuk sila pertama, sedangkan persamaan derajat masuk sila kedua.
$md$, false, 3, 12),

('twk-pancasila', 'Pancasila sebagai Ideologi Terbuka dan Sistem Nilai', 'twk-pancasila-ideologi-terbuka',
 'Kedudukan dan fungsi Pancasila, ciri ideologi terbuka, tiga tingkatan nilai (dasar, instrumental, praksis), serta perbandingan dengan ideologi lain.',
$md$
## Kedudukan dan fungsi Pancasila

| Kedudukan/fungsi | Penjelasan singkat |
| --- | --- |
| **Dasar negara** | Landasan penyelenggaraan negara; sumber dari segala sumber hukum negara |
| **Pandangan hidup bangsa** | Pedoman bersikap dan bertingkah laku dalam kehidupan sehari-hari |
| **Ideologi negara** | Cita-cita dan gagasan dasar yang ingin diwujudkan bangsa |
| **Kepribadian bangsa** | Ciri khas yang membedakan bangsa Indonesia dari bangsa lain |
| **Perjanjian luhur** | Kesepakatan para pendiri bangsa saat negara didirikan |
| **Sumber dari segala sumber hukum** | Setiap peraturan perundang-undangan tidak boleh bertentangan dengan Pancasila |

Ketentuan bahwa Pancasila adalah **sumber segala sumber hukum negara** ditegaskan dalam undang-undang tentang pembentukan peraturan perundang-undangan (UU 12/2011 beserta perubahannya).

## Pancasila sebagai ideologi terbuka

**Ideologi terbuka** adalah ideologi yang nilai-nilai dasarnya tetap, tetapi penjabarannya dapat menyesuaikan perkembangan zaman tanpa kehilangan jati diri.

### Ciri ideologi terbuka vs tertutup

| Ideologi terbuka | Ideologi tertutup |
| --- | --- |
| Nilai-nilainya digali dari budaya dan kehidupan masyarakat sendiri | Dipaksakan oleh sekelompok orang atau penguasa |
| Merupakan hasil kesepakatan masyarakat | Kebenarannya tidak boleh dipersoalkan |
| Bersifat dinamis dan reformis | Bersifat kaku dan dogmatis |
| Menghargai pluralitas | Menuntut keseragaman |
| Tidak diciptakan oleh negara, tetapi ditemukan dalam masyarakat | Isinya berupa tuntutan konkret dan operasional yang mutlak |

### Tiga tingkatan nilai

| Tingkat nilai | Sifat | Contoh wujud |
| --- | --- | --- |
| **Nilai dasar** | Tetap, tidak berubah, bersifat abstrak dan universal | Lima sila Pancasila dalam Pembukaan UUD 1945 |
| **Nilai instrumental** | Penjabaran nilai dasar; dapat berubah sesuai zaman | UUD (batang tubuh), undang-undang, peraturan pemerintah, kebijakan |
| **Nilai praksis** | Pelaksanaan nyata dalam kehidupan sehari-hari | Gotong royong membersihkan lingkungan, musyawarah warga |

> **Tips ujian:** Soal sering memberi contoh lalu menanyakan tingkat nilainya. **Undang-undang = nilai instrumental**. **Perilaku nyata warga = nilai praksis**.

### Batas keterbukaan

Keterbukaan Pancasila bukan tanpa batas. Batasannya antara lain:

- Tidak boleh mengubah **nilai dasar** Pancasila.
- Tidak boleh bertentangan dengan stabilitas nasional dan persatuan bangsa.
- Menolak ideologi yang bertentangan, seperti paham yang anti-Tuhan atau paham yang ingin mengganti dasar negara dengan kekerasan.
- Penjabarannya dilakukan melalui proses yang sah dan **demokratis**.

## Perbandingan dengan ideologi lain

| Aspek | Liberalisme | Komunisme | Pancasila |
| --- | --- | --- | --- |
| Pandangan tentang individu | Kebebasan individu paling utama | Individu tunduk pada kepentingan kolektif/partai | Keseimbangan kepentingan individu dan masyarakat |
| Agama | Urusan pribadi, terpisah dari negara | Cenderung ditolak | Dijamin dan dihormati negara (Ketuhanan Yang Maha Esa) |
| Ekonomi | Pasar bebas | Dikuasai negara sepenuhnya | Usaha bersama berasas kekeluargaan (Pasal 33 UUD 1945) |
| Politik | Demokrasi liberal | Satu partai | Demokrasi Pancasila berdasar musyawarah |

## Pancasila dalam kehidupan berbangsa

- **Pancasila sebagai paradigma pembangunan**: pembangunan politik, ekonomi, hukum, dan sosial budaya harus berlandaskan nilai-nilai Pancasila.
- **Pembinaan ideologi**: saat ini dilakukan antara lain oleh **Badan Pembinaan Ideologi Pancasila (BPIP)**.
- **Hari Kesaktian Pancasila** diperingati setiap **1 Oktober**.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Lahirnya undang-undang baru tentang perlindungan data pribadi untuk menjawab tantangan era digital menunjukkan bahwa Pancasila …*

Penalaran: nilai dasar tetap, tetapi diwujudkan melalui aturan baru yang sesuai zaman → **Pancasila sebagai ideologi terbuka** (undang-undang = nilai instrumental).

**Contoh 2.** *Pernyataan berikut yang BUKAN ciri ideologi terbuka adalah …*

Penalaran: cari opsi "kebenarannya tidak boleh dipersoalkan" atau "dipaksakan oleh penguasa" — itu ciri ideologi **tertutup**.

## Ringkasan

- Pancasila berkedudukan sebagai dasar negara, pandangan hidup, ideologi, dan sumber segala sumber hukum negara.
- Ideologi terbuka: nilai dasar tetap, nilai instrumental dan praksis menyesuaikan zaman.
- Keterbukaan Pancasila dibatasi oleh nilai dasarnya sendiri dan persatuan bangsa.

## Tips mengerjakan soal

- Hafalkan tiga tingkatan nilai beserta contohnya.
- Pada soal perbandingan ideologi, kunci Pancasila adalah **keseimbangan** dan **kekeluargaan**.
- Waspadai opsi yang menyebut Pancasila "dapat diubah sesuai kebutuhan" — yang dapat berubah hanya penjabarannya.
$md$, false, 4, 12),

-- ============================== UUD 1945 ====================================
('twk-uud-1945', 'Pembukaan UUD 1945 dan Struktur Konstitusi', 'twk-pembukaan-struktur-uud',
 'Makna setiap alinea Pembukaan UUD 1945, kedudukan Pembukaan, tujuan negara, sejarah berlakunya konstitusi, serta struktur UUD 1945 setelah perubahan.',
$md$
## Kedudukan Pembukaan UUD 1945

Pembukaan UUD 1945 memuat **pernyataan kemerdekaan, tujuan negara, bentuk negara, dan dasar negara**. Karena itu, Pembukaan dipandang sebagai **pokok kaidah negara yang fundamental** (*staatsfundamentalnorm*) dan **tidak diubah** dalam proses perubahan UUD 1945. Kesepakatan MPR sebelum perubahan memang menetapkan bahwa Pembukaan tidak akan diubah.

## Makna tiap alinea

| Alinea | Isi pokok | Makna |
| --- | --- | --- |
| **I** | Kemerdekaan ialah hak segala bangsa; penjajahan harus dihapuskan karena tidak sesuai perikemanusiaan dan perikeadilan | Dalil objektif: penjajahan bertentangan dengan kemanusiaan; dasar Indonesia menentang segala bentuk penjajahan |
| **II** | Perjuangan pergerakan kemerdekaan telah sampai pada saat yang berbahagia, mengantarkan rakyat ke depan pintu gerbang kemerdekaan negara yang **merdeka, bersatu, berdaulat, adil, dan makmur** | Penghargaan atas perjuangan; memuat cita-cita nasional |
| **III** | Atas berkat rahmat Allah Yang Maha Kuasa dan didorong keinginan luhur, rakyat Indonesia menyatakan kemerdekaannya | Motivasi spiritual dan pernyataan (pengukuhan) kemerdekaan |
| **IV** | Pembentukan pemerintahan negara, tujuan negara, UUD, bentuk republik berkedaulatan rakyat, dan dasar negara Pancasila | Memuat tujuan negara, bentuk negara, dan dasar negara |

### Tujuan negara (alinea IV)

1. **Melindungi** segenap bangsa Indonesia dan seluruh tumpah darah Indonesia;
2. **Memajukan** kesejahteraan umum;
3. **Mencerdaskan** kehidupan bangsa;
4. **Ikut melaksanakan ketertiban dunia** yang berdasarkan kemerdekaan, perdamaian abadi, dan keadilan sosial.

> **Tips ujian:** Bedakan **cita-cita nasional** (alinea II: merdeka, bersatu, berdaulat, adil, makmur) dan **tujuan nasional** (alinea IV: melindungi, memajukan, mencerdaskan, ikut melaksanakan ketertiban dunia). Ini salah satu jebakan paling sering.

### Contoh pengaitan kebijakan dengan tujuan negara

| Kebijakan | Tujuan negara |
| --- | --- |
| Program beasiswa dan wajib belajar | Mencerdaskan kehidupan bangsa |
| Pengiriman pasukan perdamaian ke negara konflik | Ikut melaksanakan ketertiban dunia |
| Pengamanan perbatasan dan evakuasi WNI dari negara konflik | Melindungi segenap bangsa |
| Bantuan sosial dan pembangunan infrastruktur desa | Memajukan kesejahteraan umum |

## Sejarah berlakunya konstitusi

| Periode | Konstitusi | Bentuk negara |
| --- | --- | --- |
| 18 Agustus 1945 – 27 Desember 1949 | UUD 1945 | Kesatuan |
| 27 Desember 1949 – 17 Agustus 1950 | Konstitusi RIS 1949 | Serikat (federal) |
| 17 Agustus 1950 – 5 Juli 1959 | UUD Sementara 1950 | Kesatuan, sistem parlementer |
| 5 Juli 1959 – sekarang | UUD 1945 (diubah empat kali pada 1999–2002) | Kesatuan |

## Perubahan (amandemen) UUD 1945

| Perubahan | Disahkan |
| --- | --- |
| Pertama | 19 Oktober 1999 |
| Kedua | 18 Agustus 2000 |
| Ketiga | 9 November 2001 |
| Keempat | 10 Agustus 2002 |

Kesepakatan dasar MPR dalam melakukan perubahan, antara lain: tidak mengubah Pembukaan, tetap mempertahankan NKRI, mempertegas sistem pemerintahan presidensial, meniadakan Penjelasan dengan memasukkan hal-hal normatifnya ke dalam pasal-pasal, dan melakukan perubahan dengan cara **adendum**.

## Struktur UUD 1945 setelah perubahan

Menurut Pasal II Aturan Tambahan, UUD 1945 **terdiri atas Pembukaan dan pasal-pasal**; Penjelasan tidak lagi menjadi bagian UUD. Secara umum, UUD 1945 hasil perubahan memuat **21 bab, 73 pasal, 170 ayat, 3 pasal Aturan Peralihan, dan 2 pasal Aturan Tambahan**. Satu bab, yaitu **Bab IV tentang Dewan Pertimbangan Agung**, dihapus.

### Pasal pembuka yang wajib hafal

| Pasal | Isi |
| --- | --- |
| 1 ayat (1) | Negara Indonesia ialah Negara Kesatuan yang berbentuk Republik |
| 1 ayat (2) | Kedaulatan berada di tangan rakyat dan dilaksanakan menurut Undang-Undang Dasar |
| 1 ayat (3) | Negara Indonesia adalah negara hukum |

Sebelum perubahan, Pasal 1 ayat (2) menyatakan kedaulatan dilakukan sepenuhnya oleh MPR. Setelah perubahan, MPR **bukan lagi lembaga tertinggi negara**.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pemerintah mengirim kontingen Garuda dalam misi perdamaian PBB. Kebijakan ini merupakan pelaksanaan tujuan negara pada alinea …*

Penalaran: "ikut melaksanakan ketertiban dunia" → **alinea keempat**.

**Contoh 2.** *Alinea Pembukaan UUD 1945 yang memuat motivasi spiritual bangsa Indonesia adalah …*

Penalaran: "atas berkat rahmat Allah Yang Maha Kuasa" → **alinea ketiga**.

## Ringkasan

- Alinea I: hak kemerdekaan; II: cita-cita nasional; III: motivasi spiritual dan pernyataan kemerdekaan; IV: tujuan negara, bentuk negara, dasar negara.
- Konstitusi yang pernah berlaku: UUD 1945, Konstitusi RIS 1949, UUDS 1950, lalu UUD 1945 kembali melalui Dekrit 5 Juli 1959.
- Perubahan UUD 1945 dilakukan empat kali (1999–2002) dengan cara adendum.

## Tips mengerjakan soal

- Hafalkan kata kunci alinea: **hak – gerbang – rahmat – tujuan**.
- Untuk soal kebijakan, cocokkan kata kerja kebijakan dengan empat tujuan negara.
- Ingat tanggal-tanggal perubahan dan bahwa Pembukaan tidak pernah diubah.
$md$, true, 2, 13),

('twk-uud-1945', 'Lembaga Negara dalam UUD 1945', 'twk-lembaga-negara-uud',
 'Kedudukan, susunan, dan kewenangan MPR, DPR, DPD, Presiden, MA, MK, KY, dan BPK menurut UUD 1945 hasil perubahan, lengkap dengan tabel perbandingan.',
$md$
## Prinsip dasar

Setelah perubahan, UUD 1945 menganut prinsip **checks and balances**. Tidak ada lagi lembaga tertinggi negara; lembaga-lembaga negara utama berkedudukan sejajar dan saling mengawasi.

## MPR (Pasal 2–3)

- Terdiri atas **anggota DPR dan anggota DPD** yang dipilih melalui pemilihan umum.
- Bersidang **sedikitnya sekali dalam lima tahun** di ibu kota negara.
- Wewenang:
  - **Mengubah dan menetapkan** UUD;
  - **Melantik** Presiden dan/atau Wakil Presiden;
  - Hanya dapat **memberhentikan** Presiden dan/atau Wakil Presiden dalam masa jabatannya menurut UUD.

## Presiden (Pasal 4–17)

| Pasal | Ketentuan |
| --- | --- |
| 4 | Presiden memegang kekuasaan pemerintahan menurut UUD |
| 5 | Berhak mengajukan RUU kepada DPR; menetapkan peraturan pemerintah |
| 6A | Presiden dan Wakil Presiden dipilih dalam satu pasangan secara langsung oleh rakyat |
| 7 | Masa jabatan lima tahun, sesudahnya dapat dipilih kembali dalam jabatan yang sama hanya untuk satu kali masa jabatan |
| 7A–7B | Pemberhentian dalam masa jabatan melalui usul DPR, pemeriksaan MK, lalu keputusan MPR |
| 7C | Presiden tidak dapat membekukan dan/atau membubarkan DPR |
| 10 | Memegang kekuasaan tertinggi atas AD, AL, dan AU |
| 11 | Menyatakan perang, membuat perdamaian, dan perjanjian dengan negara lain dengan persetujuan DPR |
| 12 | Menyatakan keadaan bahaya |
| 14 | Grasi dan rehabilitasi dengan pertimbangan **MA**; amnesti dan abolisi dengan pertimbangan **DPR** |
| 17 | Presiden dibantu menteri-menteri yang diangkat dan diberhentikan oleh Presiden |

> **Tips ujian:** Pasangan pertimbangan sering ditukar dalam opsi. Ingat: **G-R ke MA** (grasi, rehabilitasi) dan **A-A ke DPR** (amnesti, abolisi).

### Jika Presiden berhalangan tetap (Pasal 8)

- Presiden diganti **Wakil Presiden** sampai habis masa jabatannya.
- Jika Presiden dan Wakil Presiden berhalangan tetap bersamaan, pelaksana tugas kepresidenan adalah **Menteri Luar Negeri, Menteri Dalam Negeri, dan Menteri Pertahanan** secara bersama-sama, lalu MPR memilih pengganti dari pasangan calon yang diusulkan partai politik.

## DPR (Pasal 19–22B)

- Anggota dipilih melalui pemilu.
- **Fungsi**: legislasi, anggaran, dan pengawasan (Pasal 20A).
- **Hak lembaga**: interpelasi, angket, dan menyatakan pendapat.
- Memegang **kekuasaan membentuk undang-undang** (Pasal 20 ayat 1); setiap RUU dibahas bersama Presiden untuk persetujuan bersama.
- Pasal 22: dalam kegentingan yang memaksa, Presiden berhak menetapkan **Perppu**, yang harus mendapat persetujuan DPR pada persidangan berikutnya.

## DPD (Pasal 22C–22D)

- Anggota dipilih dari **setiap provinsi** melalui pemilu; jumlah anggota tiap provinsi sama; jumlah seluruh anggota DPD **tidak lebih dari sepertiga** jumlah anggota DPR.
- Dapat **mengajukan** dan **ikut membahas** RUU yang berkaitan dengan otonomi daerah, hubungan pusat dan daerah, pembentukan dan pemekaran daerah, pengelolaan sumber daya alam, serta perimbangan keuangan pusat dan daerah.
- Memberi pertimbangan kepada DPR atas RUU APBN serta RUU yang berkaitan dengan pajak, pendidikan, dan agama.

## Kekuasaan kehakiman (Pasal 24–24C)

| Lembaga | Wewenang utama |
| --- | --- |
| **Mahkamah Agung** | Mengadili pada tingkat **kasasi**; menguji peraturan perundang-undangan **di bawah UU terhadap UU**; membawahi peradilan umum, agama, militer, dan tata usaha negara |
| **Mahkamah Konstitusi** | Mengadili pada tingkat pertama dan terakhir yang putusannya final untuk: menguji **UU terhadap UUD**, memutus **sengketa kewenangan lembaga negara** yang kewenangannya diberikan UUD, memutus **pembubaran partai politik**, memutus **perselisihan hasil pemilu**; serta **wajib** memberi putusan atas pendapat DPR mengenai dugaan pelanggaran oleh Presiden/Wakil Presiden |
| **Komisi Yudisial** | Bersifat mandiri; **mengusulkan pengangkatan hakim agung** dan menjaga serta menegakkan kehormatan, keluhuran martabat, dan perilaku hakim |

MK memiliki **sembilan hakim konstitusi** yang ditetapkan Presiden: masing-masing **tiga orang diajukan oleh MA, tiga oleh DPR, dan tiga oleh Presiden**.

## BPK (Pasal 23E–23G)

- Lembaga yang **bebas dan mandiri** untuk memeriksa pengelolaan dan tanggung jawab tentang keuangan negara.
- Hasil pemeriksaan diserahkan kepada **DPR, DPD, dan DPRD** sesuai kewenangannya.
- Anggota BPK dipilih oleh DPR dengan memperhatikan pertimbangan DPD, dan diresmikan oleh Presiden.
- Berkedudukan di ibu kota negara dan memiliki perwakilan di setiap provinsi.

## Tabel ringkas: siapa memilih siapa

| Jabatan | Proses |
| --- | --- |
| Hakim agung | Diusulkan KY → persetujuan DPR → ditetapkan Presiden |
| Hakim konstitusi | 3 dari MA, 3 dari DPR, 3 dari Presiden → ditetapkan Presiden |
| Anggota BPK | Dipilih DPR dengan pertimbangan DPD → diresmikan Presiden |
| Presiden/Wapres | Dipilih langsung rakyat → dilantik MPR |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Sekelompok warga menilai sebuah undang-undang bertentangan dengan hak konstitusional mereka. Lembaga yang berwenang mengujinya adalah …*

Penalaran: UU terhadap UUD → **Mahkamah Konstitusi**. Jika yang diuji peraturan daerah atau peraturan menteri terhadap UU → **Mahkamah Agung**.

**Contoh 2.** *Lembaga yang berwenang memeriksa laporan keuangan pemerintah daerah adalah …*

Penalaran: pemeriksaan keuangan negara → **BPK**, bukan KPK atau Inspektorat.

## Ringkasan

- MPR: ubah/tetapkan UUD, melantik, dan memberhentikan Presiden/Wapres menurut UUD.
- DPR: legislasi, anggaran, pengawasan; DPD: urusan daerah, maksimal sepertiga jumlah DPR.
- MA: kasasi dan uji peraturan di bawah UU; MK: uji UU terhadap UUD, sengketa kewenangan, bubar parpol, hasil pemilu; KY: usul hakim agung dan jaga perilaku hakim.
- BPK: memeriksa pengelolaan keuangan negara.

## Tips mengerjakan soal

- Buat kartu hafalan "lembaga – pasal – wewenang".
- Ingat jebakan klasik: grasi (MA) vs amnesti (DPR), MA vs MK dalam pengujian peraturan.
- Presiden tidak dapat membubarkan DPR (Pasal 7C) — opsi yang menyatakan sebaliknya pasti salah.
$md$, false, 3, 14),

('twk-uud-1945', 'Hak Asasi Manusia, Warga Negara, dan Pasal-Pasal Kesejahteraan', 'twk-ham-warga-negara-kesejahteraan',
 'Pasal 26–34 UUD 1945: warga negara, HAM Pasal 28A–28J, agama, pertahanan, pendidikan, perekonomian Pasal 33, kesejahteraan sosial, wilayah, dan tata cara perubahan Pasal 37.',
$md$
## Warga negara dan penduduk (Pasal 26–27)

- **Pasal 26 ayat (1)**: yang menjadi warga negara ialah orang-orang bangsa Indonesia asli dan orang bangsa lain yang disahkan dengan undang-undang sebagai warga negara.
- **Pasal 26 ayat (2)**: penduduk ialah warga negara Indonesia dan orang asing yang bertempat tinggal di Indonesia.
- **Pasal 27 ayat (1)**: segala warga negara bersamaan kedudukannya di dalam hukum dan pemerintahan serta wajib menjunjung hukum dan pemerintahan itu tanpa kecuali.
- **Pasal 27 ayat (2)**: hak atas pekerjaan dan penghidupan yang layak bagi kemanusiaan.
- **Pasal 27 ayat (3)**: hak dan kewajiban ikut serta dalam upaya pembelaan negara.

## Hak asasi manusia (Bab XA, Pasal 28A–28J)

Bab XA ditambahkan pada **perubahan kedua (2000)**.

| Pasal | Inti pengaturan |
| --- | --- |
| 28A | Hak untuk hidup serta mempertahankan hidup dan kehidupan |
| 28B | Hak membentuk keluarga dan melanjutkan keturunan melalui perkawinan yang sah; hak anak atas kelangsungan hidup, tumbuh, berkembang, dan perlindungan dari kekerasan dan diskriminasi |
| 28C | Hak mengembangkan diri, mendapat pendidikan, dan memperoleh manfaat ilmu pengetahuan dan teknologi; hak memajukan diri secara kolektif |
| 28D | Hak atas pengakuan, jaminan, perlindungan, dan kepastian hukum yang adil; hak bekerja; kesempatan yang sama dalam pemerintahan; hak atas status kewarganegaraan |
| 28E | Kebebasan memeluk agama dan beribadat, memilih pendidikan, pekerjaan, kewarganegaraan, tempat tinggal; kebebasan berserikat, berkumpul, dan mengeluarkan pendapat |
| 28F | Hak berkomunikasi dan memperoleh informasi |
| 28G | Hak atas perlindungan diri pribadi, keluarga, kehormatan, martabat, dan harta benda; hak bebas dari penyiksaan; hak memperoleh suaka politik dari negara lain |
| 28H | Hak hidup sejahtera lahir dan batin, bertempat tinggal, lingkungan hidup yang baik dan sehat, pelayanan kesehatan; jaminan sosial; hak milik pribadi |
| 28I | Hak yang **tidak dapat dikurangi dalam keadaan apa pun**; perlindungan HAM adalah tanggung jawab negara, terutama pemerintah |
| 28J | **Kewajiban** menghormati HAM orang lain; pembatasan hak hanya dengan undang-undang |

### Hak yang tidak dapat dikurangi (non-derogable rights, Pasal 28I ayat 1)

Hak untuk hidup, hak untuk tidak disiksa, hak kemerdekaan pikiran dan hati nurani, hak beragama, hak untuk tidak diperbudak, hak untuk diakui sebagai pribadi di hadapan hukum, dan **hak untuk tidak dituntut atas dasar hukum yang berlaku surut**.

> **Tips ujian:** Hak berserikat dan menyatakan pendapat **bukan** non-derogable rights; hak ini dapat dibatasi dengan undang-undang (Pasal 28J ayat 2).

## Agama (Pasal 29)

- Ayat (1): Negara berdasar atas Ketuhanan Yang Maha Esa.
- Ayat (2): Negara menjamin kemerdekaan tiap-tiap penduduk untuk memeluk agamanya masing-masing dan beribadat menurut agama dan kepercayaannya itu.

## Pertahanan dan keamanan (Pasal 30)

Usaha pertahanan dan keamanan negara dilaksanakan melalui **sistem pertahanan dan keamanan rakyat semesta**, dengan TNI dan Polri sebagai kekuatan utama dan rakyat sebagai kekuatan pendukung.

## Pendidikan dan kebudayaan (Pasal 31–32)

| Ayat | Isi |
| --- | --- |
| 31 (1) | Setiap warga negara berhak mendapat pendidikan |
| 31 (2) | Setiap warga negara **wajib mengikuti pendidikan dasar** dan pemerintah **wajib membiayainya** |
| 31 (3) | Pemerintah mengusahakan satu sistem pendidikan nasional yang meningkatkan keimanan, ketakwaan, dan akhlak mulia |
| 31 (4) | Negara memprioritaskan anggaran pendidikan **sekurang-kurangnya 20%** dari APBN dan APBD |
| 32 (1) | Negara memajukan kebudayaan nasional dan menjamin kebebasan masyarakat memelihara dan mengembangkan nilai-nilai budayanya |
| 32 (2) | Negara menghormati dan memelihara bahasa daerah sebagai kekayaan budaya nasional |

## Perekonomian dan kesejahteraan sosial (Pasal 33–34)

| Ayat | Isi pokok |
| --- | --- |
| 33 (1) | Perekonomian disusun sebagai **usaha bersama berdasar atas asas kekeluargaan** |
| 33 (2) | Cabang-cabang produksi yang penting bagi negara dan yang menguasai hajat hidup orang banyak dikuasai oleh negara |
| 33 (3) | Bumi, air, dan kekayaan alam yang terkandung di dalamnya dikuasai oleh negara dan dipergunakan untuk **sebesar-besar kemakmuran rakyat** |
| 33 (4) | Perekonomian nasional diselenggarakan berdasar **demokrasi ekonomi** dengan prinsip kebersamaan, efisiensi berkeadilan, berkelanjutan, berwawasan lingkungan, kemandirian, serta keseimbangan kemajuan dan kesatuan ekonomi nasional |
| 34 (1) | Fakir miskin dan anak-anak terlantar dipelihara oleh negara |
| 34 (2) | Negara mengembangkan sistem jaminan sosial bagi seluruh rakyat |
| 34 (3) | Negara bertanggung jawab atas penyediaan fasilitas pelayanan kesehatan dan fasilitas pelayanan umum yang layak |

Bentuk usaha yang paling sesuai dengan semangat Pasal 33 ayat (1) adalah **koperasi**. Mohammad Hatta dikenal sebagai **Bapak Koperasi Indonesia**.

## Wilayah negara (Pasal 25A)

Negara Kesatuan Republik Indonesia adalah sebuah **negara kepulauan yang berciri Nusantara** dengan wilayah yang batas-batas dan hak-haknya ditetapkan dengan undang-undang.

## Perubahan UUD (Pasal 37)

| Ayat | Ketentuan |
| --- | --- |
| (1) | Usul perubahan pasal dapat diagendakan dalam sidang MPR apabila diajukan oleh **sekurang-kurangnya 1/3** jumlah anggota MPR |
| (2) | Usul diajukan secara tertulis dan menunjukkan dengan jelas bagian yang diusulkan diubah beserta alasannya |
| (3) | Sidang untuk mengubah pasal dihadiri **sekurang-kurangnya 2/3** jumlah anggota MPR |
| (4) | Putusan disetujui oleh **sekurang-kurangnya 50% ditambah satu** anggota dari seluruh anggota MPR |
| (5) | Khusus mengenai **bentuk Negara Kesatuan Republik Indonesia** tidak dapat dilakukan perubahan |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pemerintah daerah membangun sekolah gratis di wilayah terpencil agar semua anak menyelesaikan pendidikan dasar. Kebijakan ini melaksanakan …*

Penalaran: kewajiban pemerintah membiayai pendidikan dasar → **Pasal 31 ayat (2)**.

**Contoh 2.** *Seseorang dituntut berdasarkan peraturan pidana yang baru dibuat setelah perbuatannya dilakukan. Hak yang dilanggar …*

Penalaran: hak untuk **tidak dituntut atas dasar hukum yang berlaku surut** — termasuk hak yang tidak dapat dikurangi (Pasal 28I ayat 1).

**Contoh 3.** *Jika MPR beranggota 711 orang, berapa minimal anggota yang harus hadir dalam sidang perubahan UUD?*

Penalaran: 2/3 × 711 = 474 → minimal **474 anggota**. Persetujuan minimal 50% + 1 dari 711 = 355,5 + 1, dibulatkan menjadi **357 anggota** (lebih dari setengah ditambah satu). Dalam soal, cukup pahami aturan pecahannya.

## Ringkasan

- HAM diatur dalam Pasal 28A–28J; Pasal 28I memuat hak yang tidak dapat dikurangi, Pasal 28J memuat kewajiban dan pembatasan.
- Pendidikan: wajib pendidikan dasar dibiayai pemerintah, anggaran minimal 20%.
- Pasal 33: asas kekeluargaan, kekayaan alam dikuasai negara untuk kemakmuran rakyat.
- Pasal 37: usul 1/3, hadir 2/3, setuju 50% + 1; bentuk NKRI tidak dapat diubah.

## Tips mengerjakan soal

- Kaitkan kasus dengan nomor pasal: pendidikan 31, ekonomi 33, fakir miskin 34, agama 29, pertahanan 30, HAM 28.
- Hafalkan tiga pecahan Pasal 37 secara berurutan: **1/3 – 2/3 – 50% + 1**.
- Bedakan "dikuasai negara" (Pasal 33) dengan "dimiliki negara"; yang tertulis adalah **dikuasai**.
$md$, false, 4, 14),

-- ================================ NKRI ======================================
('twk-nkri', 'Sejarah Kebangsaan: dari Pergerakan Nasional hingga Dekrit 1959', 'twk-sejarah-kebangsaan-proklamasi-dekrit',
 'Kronologi penting sejarah Indonesia: Sumpah Pemuda, persiapan dan peristiwa Proklamasi, revolusi fisik, perjanjian-perjanjian dengan Belanda, KMB dan RIS, hingga Dekrit Presiden 5 Juli 1959.',
$md$
## Mengapa penting?

Kisi-kisi TWK mencakup sejarah perjuangan bangsa dalam kaitannya dengan **NKRI**. Soal biasanya menanyakan urutan peristiwa, isi perjanjian, dan makna peristiwa bagi persatuan.

## Sumpah Pemuda (28 Oktober 1928)

Dihasilkan **Kongres Pemuda II** di Batavia (27–28 Oktober 1928). Isi ikrarnya:

1. Mengaku **bertumpah darah yang satu**, tanah Indonesia;
2. Mengaku **berbangsa yang satu**, bangsa Indonesia;
3. **Menjunjung bahasa persatuan**, bahasa Indonesia.

Makna: pemuda dari berbagai organisasi kedaerahan (seperti Jong Java, Jong Sumatranen Bond, Jong Ambon, dan lainnya) menyatakan diri sebagai satu bangsa.

## Menuju Proklamasi

| Tanggal | Peristiwa |
| --- | --- |
| 6 dan 9 Agustus 1945 | Bom atom dijatuhkan di Hiroshima dan Nagasaki |
| 15 Agustus 1945 | Jepang menyerah kepada Sekutu |
| 16 Agustus 1945 | **Peristiwa Rengasdengklok**: golongan muda membawa Soekarno dan Hatta ke Rengasdengklok agar proklamasi segera dilakukan tanpa pengaruh Jepang |
| Malam 16–17 Agustus 1945 | Perumusan teks proklamasi di rumah **Laksamana Tadashi Maeda**; naskah tulisan tangan Soekarno diketik oleh **Sayuti Melik** |
| 17 Agustus 1945 | Proklamasi dibacakan Soekarno di **Jalan Pegangsaan Timur 56, Jakarta** |

Perbedaan pendapat golongan tua dan golongan muda menyangkut **waktu dan cara** proklamasi, bukan soal perlu atau tidaknya merdeka. Perbedaan itu diselesaikan dengan musyawarah — nilai yang sering ditanyakan.

> **Tips ujian:** Tokoh golongan muda yang sering disebut antara lain Sukarni, Wikana, dan Chaerul Saleh. Achmad Soebardjo berperan menjemput Soekarno-Hatta dari Rengasdengklok dan menjamin proklamasi dilaksanakan keesokan harinya.

## Revolusi fisik dan diplomasi (1945–1949)

| Waktu | Peristiwa | Catatan |
| --- | --- | --- |
| 10 November 1945 | Pertempuran Surabaya | Diperingati sebagai Hari Pahlawan |
| November 1946 (ditandatangani Maret 1947) | **Perjanjian Linggarjati** | Belanda mengakui secara de facto wilayah RI atas Jawa, Madura, dan Sumatra |
| 21 Juli 1947 | **Agresi Militer Belanda I** | Melanggar Linggarjati |
| Januari 1948 | **Perjanjian Renville** (di atas kapal USS Renville) | Wilayah RI makin sempit; berlaku garis demarkasi (garis Van Mook) |
| 19 Desember 1948 | **Agresi Militer Belanda II** | Yogyakarta, ibu kota RI saat itu, diduduki; Soekarno-Hatta ditawan; dibentuk **PDRI** di Sumatra Barat |
| 1 Maret 1949 | **Serangan Umum 1 Maret** di Yogyakarta | Membuktikan kepada dunia bahwa TNI dan RI masih ada |
| 7 Mei 1949 | **Perjanjian Roem-Royen** | Pemimpin RI dikembalikan ke Yogyakarta; kesepakatan menuju KMB |
| 23 Agustus – 2 November 1949 | **Konferensi Meja Bundar (KMB)** di Den Haag | Belanda menyerahkan kedaulatan kepada Republik Indonesia Serikat (RIS) |
| 27 Desember 1949 | **Pengakuan/penyerahan kedaulatan** | Berlakunya Konstitusi RIS |

Hasil KMB yang sering ditanyakan: pembentukan RIS, penyerahan kedaulatan pada akhir 1949, dan **masalah Irian Barat ditunda** untuk dibicarakan kemudian.

## Kembali ke negara kesatuan

Bentuk federal RIS tidak sesuai dengan cita-cita Proklamasi. Banyak negara bagian menggabungkan diri ke Republik Indonesia. Pada **17 Agustus 1950**, Indonesia kembali menjadi **negara kesatuan** dengan **UUD Sementara 1950** dan sistem pemerintahan parlementer.

## Dekrit Presiden 5 Juli 1959

Badan **Konstituante** hasil Pemilu 1955 gagal menyepakati undang-undang dasar baru. Presiden Soekarno kemudian mengeluarkan Dekrit Presiden **5 Juli 1959** yang isinya:

1. **Pembubaran Konstituante**;
2. **Berlakunya kembali UUD 1945** dan tidak berlakunya lagi UUDS 1950;
3. Pembentukan **MPRS dan DPAS** dalam waktu sesingkat-singkatnya.

Dekrit ini menandai dimulainya masa **Demokrasi Terpimpin**.

## Nilai kebangsaan dari peristiwa sejarah

| Peristiwa | Nilai |
| --- | --- |
| Sumpah Pemuda | Persatuan di atas kedaerahan |
| Rengasdengklok | Musyawarah dan semangat kemandirian |
| Pertempuran Surabaya | Rela berkorban, cinta tanah air |
| PDRI | Pantang menyerah; menjaga keberlangsungan negara (dasar Hari Bela Negara) |
| Diplomasi Linggarjati–KMB | Perjuangan tidak hanya dengan senjata, tetapi juga dengan diplomasi |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Tujuan utama Serangan Umum 1 Maret 1949 adalah …*

Penalaran: serangan ini bersifat politis-psikologis, yaitu **menunjukkan kepada dunia internasional bahwa RI dan TNI masih ada**, bukan merebut kota secara permanen.

**Contoh 2.** *Salah satu isi Dekrit Presiden 5 Juli 1959 adalah …*

Penalaran: cari opsi **pembubaran Konstituante** atau **berlakunya kembali UUD 1945**. Pengecoh: "pembubaran DPR" atau "pembentukan RIS".

## Ringkasan

- Sumpah Pemuda (1928) meneguhkan satu tanah air, satu bangsa, dan bahasa persatuan.
- Proklamasi 17 Agustus 1945 didahului Peristiwa Rengasdengklok dan perumusan teks di rumah Maeda.
- Revolusi fisik: Linggarjati, Agresi I, Renville, Agresi II, Serangan Umum 1 Maret, Roem-Royen, KMB.
- RIS (1949) → negara kesatuan (17 Agustus 1950) → Dekrit 5 Juli 1959 kembali ke UUD 1945.

## Tips mengerjakan soal

- Hafalkan urutan perjanjian: **Linggarjati → Renville → Roem-Royen → KMB**.
- Ingat tiga isi Dekrit 5 Juli 1959 dalam satu kalimat: *bubarkan Konstituante, kembali ke UUD 1945, bentuk MPRS–DPAS*.
- Pada soal nilai, pilih opsi yang menekankan **persatuan dan musyawarah**.
$md$, true, 2, 13),

('twk-nkri', 'Wilayah NKRI, Wawasan Nusantara, dan Deklarasi Djuanda', 'twk-wilayah-wawasan-nusantara',
 'Konsep negara kepulauan, Deklarasi Djuanda 1957, pengakuan UNCLOS 1982, zona laut, serta pengertian, aspek, dan implementasi Wawasan Nusantara.',
$md$
## Indonesia sebagai negara kepulauan

Pasal 25A UUD 1945 menyatakan NKRI adalah **negara kepulauan yang berciri Nusantara**. Artinya, laut **bukan pemisah**, melainkan **pemersatu** pulau-pulau.

## Deklarasi Djuanda (13 Desember 1957)

Sebelum 1957, batas laut Indonesia mengikuti aturan kolonial (*Territoriale Zee en Maritieme Kringen Ordonantie* 1939) yang menetapkan laut teritorial hanya **3 mil** dari garis pantai setiap pulau. Akibatnya, terdapat laut bebas di antara pulau-pulau Indonesia.

Melalui **Deklarasi Djuanda** yang diumumkan Perdana Menteri **Djuanda Kartawidjaja** pada **13 Desember 1957**, Indonesia menyatakan bahwa:

- Laut di sekitar, di antara, dan di dalam kepulauan Indonesia merupakan satu kesatuan dengan wilayah daratan;
- Penarikan batas laut teritorial menggunakan **garis pangkal lurus** yang menghubungkan titik-titik terluar pulau terluar.

Tanggal 13 Desember kini diperingati sebagai **Hari Nusantara**. Konsep negara kepulauan ini akhirnya diakui dunia melalui **Konvensi Hukum Laut PBB (UNCLOS) 1982**, yang diratifikasi Indonesia dengan **UU Nomor 17 Tahun 1985**.

> **Tips ujian:** Deklarasi Djuanda = **wawasan kewilayahan**. Jika ditanya dokumen internasional yang mengakuinya → **UNCLOS 1982**.

## Zona laut menurut UNCLOS

| Zona | Lebar (diukur dari garis pangkal) | Hak negara pantai |
| --- | --- | --- |
| Laut teritorial | Hingga **12 mil laut** | Kedaulatan penuh (dengan hak lintas damai bagi kapal asing) |
| Zona tambahan | Hingga 24 mil laut | Pengawasan untuk bea cukai, imigrasi, fiskal, dan kesehatan |
| Zona Ekonomi Eksklusif (ZEE) | Hingga **200 mil laut** | Hak berdaulat atas eksplorasi dan pemanfaatan sumber daya alam |
| Landas kontinen | Kelanjutan alamiah daratan di bawah laut | Hak berdaulat atas sumber daya dasar laut |

Bedakan **kedaulatan** (penuh, di laut teritorial) dan **hak berdaulat** (terbatas pada sumber daya, di ZEE).

## Wawasan Nusantara

**Wawasan Nusantara** adalah cara pandang dan sikap bangsa Indonesia mengenai diri dan lingkungannya yang serba beragam dan bernilai strategis, dengan **mengutamakan persatuan dan kesatuan bangsa** serta kesatuan wilayah dalam menyelenggarakan kehidupan bermasyarakat, berbangsa, dan bernegara untuk mencapai tujuan nasional.

### Landasan

| Landasan | Isi |
| --- | --- |
| Idiil | Pancasila |
| Konstitusional | UUD 1945 |
| Visional | Wawasan Nusantara itu sendiri |
| Konsepsional | Ketahanan Nasional |

### Empat aspek kesatuan Wawasan Nusantara

1. **Kesatuan politik** — satu wilayah, satu bangsa, satu ideologi (Pancasila), satu hukum nasional.
2. **Kesatuan ekonomi** — kekayaan wilayah adalah modal bersama; pembangunan merata di seluruh daerah.
3. **Kesatuan sosial budaya** — keragaman budaya adalah kekayaan bersama; kehidupan yang serasi dan seimbang.
4. **Kesatuan pertahanan dan keamanan** — ancaman terhadap satu pulau/daerah adalah ancaman bagi seluruh bangsa.

### Astagatra

| Kelompok | Unsur |
| --- | --- |
| **Trigatra** (aspek alamiah) | Geografi, kekayaan alam (sumber daya alam), kependudukan |
| **Pancagatra** (aspek sosial) | Ideologi, politik, ekonomi, sosial budaya, pertahanan keamanan |

## Contoh implementasi

| Bidang | Contoh |
| --- | --- |
| Politik | Pelaksanaan pemilu yang jujur dan adil; penyelesaian sengketa perbatasan secara damai |
| Ekonomi | Program tol laut untuk menekan disparitas harga antarwilayah; kebijakan harga BBM yang seragam |
| Sosial budaya | Pertukaran pelajar antardaerah; pelestarian budaya daerah |
| Pertahanan keamanan | Patroli wilayah perbatasan dan pulau terluar |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Program pemerintah yang mengupayakan harga barang kebutuhan pokok di Papua tidak jauh berbeda dengan di Jawa merupakan implementasi Wawasan Nusantara di bidang …*

Penalaran: pemerataan harga/ekonomi → **kesatuan ekonomi**.

**Contoh 2.** *Kapal penangkap ikan berbendera asing beroperasi di ZEE Indonesia tanpa izin. Hal ini melanggar …*

Penalaran: di ZEE Indonesia memiliki **hak berdaulat atas sumber daya alam**, sehingga penangkapan ikan tanpa izin melanggar hak tersebut. Opsi "kedaulatan penuh atas ZEE" adalah pengecoh.

## Ringkasan

- Indonesia adalah negara kepulauan berciri Nusantara (Pasal 25A).
- Deklarasi Djuanda (13 Desember 1957) menyatukan laut dan darat; diakui melalui UNCLOS 1982.
- Laut teritorial 12 mil; ZEE 200 mil.
- Wawasan Nusantara memiliki empat aspek kesatuan: politik, ekonomi, sosial budaya, pertahanan keamanan.

## Tips mengerjakan soal

- Ingat: laut adalah **pemersatu**, bukan pemisah.
- Bedakan **kedaulatan** dan **hak berdaulat**.
- Pada soal implementasi, cocokkan kata kunci kebijakan dengan salah satu dari empat aspek kesatuan.
$md$, false, 3, 12),

('twk-nkri', 'Otonomi Daerah, Bhinneka Tunggal Ika, dan Empat Pilar Kebangsaan', 'twk-otonomi-daerah-bhinneka',
 'Asas penyelenggaraan pemerintahan daerah, pembagian urusan pemerintahan, daerah khusus dan istimewa, serta makna Bhinneka Tunggal Ika dalam menjaga keutuhan NKRI.',
$md$
## NKRI sebagai negara kesatuan

Indonesia adalah **negara kesatuan** (Pasal 1 ayat 1). Dalam negara kesatuan, kedaulatan berada pada pemerintah pusat, tetapi sebagian urusan pemerintahan dapat **diserahkan** kepada daerah. Inilah dasar **otonomi daerah**.

Pasal 18 UUD 1945 mengatur bahwa NKRI dibagi atas daerah provinsi, dan daerah provinsi dibagi atas kabupaten dan kota, yang masing-masing mempunyai pemerintahan daerah. Undang-undang pelaksana yang berlaku saat ini adalah **UU Nomor 23 Tahun 2014 tentang Pemerintahan Daerah** beserta perubahannya.

## Tiga asas penyelenggaraan pemerintahan daerah

| Asas | Pengertian | Contoh |
| --- | --- | --- |
| **Desentralisasi** | Penyerahan urusan pemerintahan oleh pemerintah pusat kepada daerah otonom berdasarkan asas otonomi | Kabupaten mengurus layanan kesehatan dasar dan pendidikan dasar |
| **Dekonsentrasi** | Pelimpahan sebagian urusan pemerintahan pusat kepada **gubernur sebagai wakil pemerintah pusat**, kepada instansi vertikal, dan/atau kepada pejabat tertentu | Gubernur mengoordinasikan pembinaan kabupaten/kota |
| **Tugas pembantuan** | Penugasan dari pemerintah pusat kepada daerah, atau dari provinsi kepada kabupaten/kota, untuk melaksanakan sebagian urusan yang menjadi kewenangan pihak yang menugaskan | Desa ditugasi membantu pendataan program pusat |

> **Tips ujian:** Kata kunci **"menyerahkan"** → desentralisasi; **"melimpahkan kepada gubernur sebagai wakil pusat"** → dekonsentrasi; **"menugaskan"** → tugas pembantuan.

## Pembagian urusan pemerintahan

| Jenis urusan | Penjelasan |
| --- | --- |
| **Absolut** | Sepenuhnya kewenangan pusat: **politik luar negeri, pertahanan, keamanan, yustisi, moneter dan fiskal nasional, serta agama** |
| **Konkuren** | Dibagi antara pusat, provinsi, dan kabupaten/kota; terdiri atas urusan wajib (pelayanan dasar dan nonpelayanan dasar) dan urusan pilihan |
| **Pemerintahan umum** | Kewenangan Presiden sebagai kepala pemerintahan, misalnya pembinaan wawasan kebangsaan dan persatuan |

## Daerah khusus dan istimewa

Pasal 18B UUD 1945: negara mengakui dan menghormati satuan pemerintahan daerah yang bersifat **khusus atau istimewa**, serta mengakui dan menghormati **kesatuan masyarakat hukum adat** beserta hak tradisionalnya sepanjang masih hidup dan sesuai prinsip NKRI.

Contoh: Aceh, Daerah Istimewa Yogyakarta, provinsi-provinsi di Papua dengan otonomi khusus, dan Jakarta sebagai daerah khusus.

## Bhinneka Tunggal Ika

Semboyan **Bhinneka Tunggal Ika** berasal dari **kitab Sutasoma karya Mpu Tantular** pada masa Kerajaan Majapahit. Maknanya: **berbeda-beda tetapi tetap satu jua**. Dalam kitab tersebut, semboyan ini lengkapnya berbunyi *"Bhinneka tunggal ika tan hana dharma mangrwa"*, yang kurang lebih berarti berbeda-beda tetapi satu, tidak ada kebenaran yang mendua.

Semboyan ini tercantum pada pita yang dicengkeram Garuda Pancasila (Pasal 36A UUD 1945).

### Prinsip-prinsip Bhinneka Tunggal Ika

- **Tidak bersifat sektarian dan eksklusif** — tidak menganggap kelompoknya paling benar.
- **Tidak bersifat formalistis**, tetapi dilandasi rasa saling percaya dan menghormati.
- **Bersifat konvergen**, bukan divergen — mencari titik temu, bukan memperbesar perbedaan.
- Menghargai keberagaman suku, agama, ras, budaya, dan bahasa sebagai kekayaan bangsa.

## Empat pilar kebangsaan

MPR mensosialisasikan **Empat Pilar** (kini juga disebut Empat Konsensus Dasar Berbangsa dan Bernegara): **Pancasila, UUD 1945, NKRI, dan Bhinneka Tunggal Ika**. Keempatnya saling terkait: Pancasila sebagai dasar, UUD 1945 sebagai konstitusi, NKRI sebagai bentuk negara, dan Bhinneka Tunggal Ika sebagai semboyan pemersatu.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pemerintah kabupaten menetapkan peraturan daerah tentang pengelolaan pasar tradisional. Hal ini merupakan wujud asas …*

Penalaran: urusan yang sudah diserahkan dan diatur sendiri oleh daerah → **desentralisasi**.

**Contoh 2.** *Urusan berikut yang tidak dapat diserahkan kepada pemerintah daerah adalah …*

Penalaran: cari urusan absolut, misalnya **moneter dan fiskal nasional** atau **politik luar negeri**. Pengecoh: pendidikan, kesehatan, pekerjaan umum (urusan konkuren).

**Contoh 3.** *Di sebuah kompleks perumahan, warga dari berbagai suku dan agama bergiliran menjaga keamanan saat hari raya umat lain. Sikap ini mencerminkan …*

Penalaran: kerja sama di tengah keberagaman → **pengamalan Bhinneka Tunggal Ika** (bersifat konvergen).

## Ringkasan

- NKRI adalah negara kesatuan yang menerapkan otonomi daerah melalui asas desentralisasi, dekonsentrasi, dan tugas pembantuan.
- Enam urusan absolut pusat: politik luar negeri, pertahanan, keamanan, yustisi, moneter dan fiskal nasional, agama.
- Pasal 18B mengakui daerah khusus/istimewa dan masyarakat hukum adat.
- Bhinneka Tunggal Ika berasal dari kitab Sutasoma (Mpu Tantular).

## Tips mengerjakan soal

- Hafalkan enam urusan absolut — sering keluar dalam bentuk "kecuali".
- Otonomi daerah bukan kemerdekaan daerah: semuanya tetap dalam bingkai NKRI.
- Untuk soal keberagaman, pilih sikap yang **inklusif dan mencari titik temu**.
$md$, false, 4, 12),

-- ============================ KAIDAH BAHASA =================================
('twk-kaidah-bahasa', 'EYD Edisi V: Huruf Kapital, Huruf Miring, dan Tanda Baca', 'twk-eyd-kapital-tanda-baca',
 'Kaidah penulisan huruf kapital, huruf miring, serta penggunaan tanda titik, koma, titik dua, dan tanda hubung menurut Ejaan yang Disempurnakan Edisi V.',
$md$
## Sekilas EYD Edisi V

Pedoman ejaan bahasa Indonesia yang berlaku saat ini adalah **Ejaan Bahasa Indonesia yang Disempurnakan Edisi V (EYD V)**, yang diluncurkan pada 2022 menggantikan PUEBI. Prinsip-prinsip besarnya tetap sama; soal TWK paling sering menguji **huruf kapital** dan **tanda baca**.

## Huruf kapital

| Dipakai pada | Contoh benar | Catatan |
| --- | --- | --- |
| Awal kalimat | **Kami** berangkat pagi. | |
| Nama Tuhan, kitab suci, dan kata ganti untuk Tuhan | Allah, Alkitab, Al-Qur'an; *Engkau*, *-Mu*, *-Nya* | |
| Gelar kehormatan, keturunan, keagamaan **yang diikuti nama** | Haji Agus Salim, Sultan Hasanuddin | *Ia pergi haji* (tidak diikuti nama → huruf kecil) |
| Jabatan **yang diikuti nama orang, instansi, atau tempat** | Gubernur Jawa Barat, Presiden Soekarno | *Ia diangkat menjadi gubernur* → huruf kecil |
| Nama bangsa, suku, dan bahasa | bangsa **I**ndonesia, suku **S**unda, bahasa **J**awa | Kata "bangsa", "suku", "bahasa" tetap kecil; bentuk turunan: *keinggris-inggrisan* (kecil) |
| Nama hari, bulan, tahun, hari raya | Senin, Agustus, Idulfitri, Natal | |
| Peristiwa sejarah | Proklamasi Kemerdekaan Indonesia, Perang Diponegoro | *perang dunia* sebagai istilah umum → kecil |
| Nama geografi | Gunung Merapi, Selat Sunda, Danau Toba | *mandi di sungai* (tanpa nama) → kecil; *jeruk bali* (nama jenis) → kecil |
| Nama lembaga, dokumen resmi | Dewan Perwakilan Rakyat, Undang-Undang Dasar Negara Republik Indonesia Tahun 1945 | |
| Setiap kata dalam judul (kecuali kata tugas yang tidak di awal) | *Di Bawah Lindungan Ka'bah* | kata *di*, *ke*, *dari*, *dan*, *yang*, *untuk* kecil jika tidak di awal |
| Singkatan gelar dan sapaan | Dr., S.H., Bpk. | |
| Kata kekerabatan sebagai **sapaan/acuan** | "Kapan **Bapak** berangkat?" | *Semua bapak di desa itu ikut* → kecil |

> **Tips ujian:** Kunci tersering: jabatan/gelar **diikuti nama** → kapital; **tidak diikuti nama** → kecil. Begitu pula nama geografi yang menjadi **nama jenis** (misalnya *gula jawa*, *pisang ambon*) → kecil.

## Huruf miring

Dipakai untuk:

- Judul buku, nama majalah, atau surat kabar yang dikutip dalam tulisan (*Kompas*, *Laskar Pelangi*);
- Menegaskan huruf, bagian kata, kata, atau kelompok kata;
- Kata atau ungkapan dalam bahasa daerah atau bahasa asing yang belum diserap ke dalam bahasa Indonesia, misalnya *tut wuri handayani* atau *online*. Kata yang sudah diserap, seperti *gotong royong*, tidak perlu dimiringkan.

## Tanda baca

### Tanda titik (.)

- Akhir kalimat pernyataan.
- Di belakang angka atau huruf dalam bagan/ikhtisar (1., A.).
- Memisahkan angka jam, menit, detik (pukul 09.30.15).
- Pada singkatan nama orang dan gelar (Moh. Hatta, S.Pd.).
- **Tidak** dipakai pada singkatan yang terdiri atas huruf awal nama lembaga atau dokumen (**DPR**, **KTP**, **UUD**) dan pada akronim (**pemilu**, **Polri**).
- **Tidak** dipakai di akhir judul atau kepala karangan.

### Tanda koma (,)

| Kaidah | Contoh benar |
| --- | --- |
| Di antara unsur dalam perincian | Saya membeli buku, pensil, dan penghapus. |
| Sebelum kata penghubung **tetapi, melainkan, sedangkan** | Ia rajin, tetapi kurang teliti. |
| Memisahkan anak kalimat yang **mendahului** induk kalimat | Kalau hujan reda, kami berangkat. |
| **Tidak dipakai** jika induk kalimat mendahului anak kalimat | Kami berangkat kalau hujan reda. |
| Sesudah ungkapan penghubung antarkalimat | **Oleh karena itu,** kita harus waspada. / **Jadi,** … / **Meskipun demikian,** … |
| Sebelum dan/atau sesudah kata seru | Wah, bagus sekali! |
| Memisahkan petikan langsung | Kata Ibu, "Jangan lupa makan." |
| Antara nama dan gelar akademik | Rina Wulandari, S.E. |
| Mengapit keterangan tambahan/aposisi | Pak Hadi, guru kami, terpilih menjadi juara. |

### Tanda titik dua (:)

- Pada akhir pernyataan lengkap yang diikuti perincian: *Kita memerlukan perabot: kursi, meja, dan lemari.*
- **Tidak** dipakai jika perincian merupakan pelengkap yang mengakhiri pernyataan: *Kita memerlukan kursi, meja, dan lemari.* (tanpa titik dua)

### Tanda hubung (-)

- Menyambung unsur kata ulang: *anak-anak*, *berulang-ulang*.
- Merangkai *se-* dengan huruf kapital atau angka: *se-Indonesia*, *se-Jawa Barat*, *tahun 2000-an*.
- Merangkai *ke-* dengan angka: *peringkat ke-2*; tetapi *keempat* (huruf) ditulis serangkai.
- Merangkai unsur bahasa Indonesia dengan unsur asing: *di-update*, *pen-tackle-an* (jika unsur asing belum diserap).

## Contoh pola soal dan penalarannya

**Contoh 1.** *Penulisan yang benar adalah …*
- (A) Ia diangkat menjadi Gubernur tahun lalu.
- (B) Kami berlibur ke pulau Bali.
- (C) **Kepala Dinas Pendidikan Kota Bandung membuka acara itu.**

Penalaran: (A) "gubernur" tidak diikuti nama → kecil. (B) "Pulau Bali" adalah nama geografi lengkap → *Pulau* kapital. (C) benar karena jabatan diikuti nama instansi.

**Contoh 2.** *Penggunaan koma yang benar adalah …*

Penalaran: periksa letak anak kalimat. *"Kami tidak akan berangkat, jika hujan turun"* salah karena induk kalimat di depan.

## Ringkasan

- Kapital untuk nama diri; gelar/jabatan kapital hanya jika diikuti nama.
- Koma sebelum *tetapi/melainkan/sedangkan*, sesudah penghubung antarkalimat, dan sesudah anak kalimat yang mendahului induk kalimat.
- Tidak ada titik pada singkatan lembaga (DPR) dan akronim (pemilu).

## Tips mengerjakan soal

- Periksa satu per satu: **kapital → tanda baca → kata baku**.
- Waspadai kata *pulau, sungai, gunung, bapak, ibu, haji* — perhatikan apakah diikuti nama atau dipakai sebagai sapaan.
- Kalimat dengan *bahwa* tidak memerlukan koma sebelum *bahwa*.
$md$, true, 2, 14),

('twk-kaidah-bahasa', 'Kata Baku, Penulisan Kata, dan Unsur Serapan', 'twk-kata-baku-penulisan-kata',
 'Tabel besar kata baku dan tidak baku, kaidah penulisan kata depan, imbuhan, gabungan kata, dan kata ulang, serta pola penyerapan kata asing.',
$md$
## Kata baku dan tidak baku

**Kata baku** adalah kata yang penulisan dan pengucapannya sesuai dengan kaidah yang dibakukan, dengan rujukan utama **Kamus Besar Bahasa Indonesia (KBBI)** dan pedoman ejaan. Kata tidak baku biasanya muncul karena pengaruh lisan, bahasa daerah, atau kesalahan penyerapan.

### Tabel kata baku (wajib hafal)

| Baku | Tidak baku | | Baku | Tidak baku |
| --- | --- | --- | --- | --- |
| aktivitas | aktifitas | | kualitas | kwalitas |
| analisis | analisa | | kuitansi | kwitansi |
| andal | handal | | lembap | lembab |
| antre | antri | | manajemen | managemen |
| apotek | apotik | | metode | metoda |
| atlet | atlit | | miliar | milyar |
| atmosfer | atmosfir | | nakhoda | nahkoda |
| azan | adzan | | napas | nafas |
| cabai | cabe | | nasihat | nasehat |
| cendekiawan | cendikiawan | | objek | obyek |
| cokelat | coklat | | paham | faham |
| detail | detil | | praktik | praktek |
| diagnosis | diagnosa | | provinsi | propinsi |
| ekstrem | ekstrim | | rapi | rapih |
| embus | hembus | | risiko | resiko |
| februari | pebruari | | saksama | seksama |
| fondasi | pondasi | | sekadar | sekedar |
| frekuensi | frekwensi | | sekretaris | sekertaris |
| hakikat | hakekat | | silakan | silahkan |
| hipotesis | hipotesa | | sistem | sistim |
| ijazah | ijasah | | standar | standart |
| imbau | himbau | | subjek | subyek |
| izin | ijin | | survei | survey |
| jadwal | jadual | | telepon | telpon |
| jenderal | jendral | | teoretis | teoritis |
| kaus | kaos | | terampil | trampil |
| karier | karir | | ubah (mengubah) | rubah (merubah) |
| kategori | katagori | | utang | hutang |
| khawatir | kuatir | | zaman | jaman |
| komoditas | komoditi | | konkret | kongkrit |
| kreativitas | kreatifitas | | Jumat | Jum'at |

Catatan: nama bulan ditulis dengan huruf kapital dalam kalimat (*Februari*); tabel di atas hanya menunjukkan bentuk ejaannya.

> **Tips ujian:** Kata serapan berakhiran *-sis* (analisis, hipotesis, diagnosis, sintesis) adalah bentuk baku. Bentuk *-sa* (analisa, hipotesa) tidak baku.

### Pola yang membantu menghafal

- **-tas** dari *-ty*: aktivitas, kualitas, kreativitas, komoditas, efektivitas.
- **-if** dari *-ive*: aktif, kreatif, efektif, sportif → tetapi bentuk turunannya *-ivitas*.
- **Gugus bunyi /kw/ ditulis ku**: kualitas, kuantitas, kuitansi, frekuensi.
- **ph → f**, **th → t**: foto, farmasi, teologi.
- **y** pada *-ject* menjadi **j**: objek, subjek, proyek.

## Penulisan kata

### Kata depan vs awalan

| Kaidah | Benar | Salah |
| --- | --- | --- |
| Kata depan *di*, *ke*, *dari* ditulis **terpisah** dari kata yang mengikutinya (biasanya menunjukkan tempat/arah) | di rumah, ke kantor, di mana | dirumah, kekantor, dimana |
| Awalan *di-* dan *ke-* ditulis **serangkai** dengan kata dasar (membentuk kata kerja atau kata bilangan/benda) | ditulis, dibaca, ketua, kedua | di tulis, di baca |
| Kata *ke luar* (arah) vs *keluar* (kata kerja) | Ia pergi ke luar kota; Ia keluar dari ruangan | — |
| *daripada* ditulis serangkai | lebih baik daripada | dari pada |

Cara cepat: jika bisa diganti dengan kata depan lain (*di kantor* → *ke kantor*), berarti **kata depan** dan ditulis terpisah.

### Gabungan kata

| Kaidah | Contoh |
| --- | --- |
| Gabungan kata umumnya ditulis terpisah | tanggung jawab, kereta api, rumah sakit |
| Jika mendapat awalan **dan** akhiran sekaligus → serangkai | **pertanggungjawaban**, dilipatgandakan |
| Jika hanya mendapat awalan atau akhiran → hanya unsur yang berimbuhan yang dirangkai | bertanggung jawab, tanggung jawabnya, garis bawahi |
| Gabungan kata yang sudah padu ditulis serangkai | **bagaimana, barangkali, kacamata, matahari, olahraga, peribahasa, saputangan, sukarela** |
| Unsur terikat (*antar-, pasca-, non-, pra-, sub-, multi-, swa-*) ditulis serangkai | antarkota, pascapanen, nonformal, prasejarah, swadaya |
| Unsur terikat diikuti huruf kapital → pakai tanda hubung | non-Indonesia, pan-Afrika |

### Kata ulang

Ditulis lengkap dengan tanda hubung: *anak-anak*, *sayur-mayur*, *bolak-balik*, *ramah-tamah*. Bentuk *anak2* tidak baku.

### Partikel

- *-lah*, *-kah*, *-tah* ditulis serangkai: *bacalah*, *apakah*.
- *pun* ditulis terpisah (*apa pun*, *siapa pun*, *satu kali pun*), **kecuali** pada gabungan yang sudah padu: *adapun, andaipun, ataupun, bagaimanapun, biarpun, kalaupun, kendatipun, maupun, meskipun, sekalipun, sungguhpun, walaupun*.
- *per* yang berarti "demi", "tiap", atau "mulai" ditulis terpisah: *satu per satu*, *per 1 Januari*.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Kalimat yang seluruh katanya baku adalah …*
- (A) Para atlit itu menjalani praktek di lapangan.
- (B) Kami menganalisa resiko proyek itu.
- (C) **Petugas mengimbau warga antre dengan tertib.**

Penalaran: (A) *atlit*, *praktek* tidak baku; (B) *menganalisa*, *resiko* tidak baku; (C) *mengimbau*, *antre* baku.

**Contoh 2.** *Penulisan gabungan kata yang benar adalah …*

Penalaran: *mempertanggungjawabkan* (awalan + akhiran → serangkai) benar; *mempertanggung jawabkan* salah.

## Ringkasan

- Rujukan kata baku adalah KBBI dan pedoman EYD.
- Bentuk *-sis*, *-tas*, *ku-* dan ejaan *objek/subjek* adalah pola baku yang sering diuji.
- *di/ke* kata depan → terpisah; *di-/ke-* awalan → serangkai.
- Gabungan kata mendapat awalan dan akhiran sekaligus → serangkai.

## Tips mengerjakan soal

- Saat ragu, uji dengan **pola** (misalnya *-isasi*, *-tas*) daripada mengandalkan "terasa benar".
- Soal kata baku sering memuat **satu kata jebakan** dalam kalimat panjang — periksa semua kata.
- Kata yang paling sering salah: *silakan, sekadar, saksama, imbau, risiko, praktik, analisis, izin, napas, zaman*.
$md$, false, 3, 14),

('twk-kaidah-bahasa', 'Kalimat Efektif dan Struktur Paragraf', 'twk-kalimat-efektif-paragraf',
 'Ciri kalimat efektif (kesatuan, kepaduan, kehematan, kecermatan, kelogisan, kesejajaran), menentukan ide pokok, jenis paragraf berdasarkan letak gagasan utama, dan jenis karangan.',
$md$
## Kalimat efektif

**Kalimat efektif** adalah kalimat yang mampu menyampaikan gagasan penulis secara tepat sehingga dipahami pembaca sesuai maksud penulis. Ciri-cirinya:

| Ciri | Penjelasan | Contoh salah → benar |
| --- | --- | --- |
| **Kesatuan (kesepadanan)** | Memiliki subjek dan predikat yang jelas; subjek tidak didahului kata depan | *Di dalam rapat itu membahas anggaran.* → *Rapat itu membahas anggaran.* |
| **Kepaduan (koherensi)** | Hubungan antarunsur logis; tidak menyisipkan kata di antara predikat dan objek atau memakai *daripada* secara salah | *Saran daripada peserta ditampung.* → *Saran peserta ditampung.* |
| **Kehematan** | Tidak memakai kata berlebih/bermakna sama (pleonasme) | *Para hadirin dimohon berdiri.* → *Hadirin dimohon berdiri.* |
| **Kecermatan** | Tidak menimbulkan makna ganda (ambigu) | *Istri pejabat yang baru itu cantik.* → perjelas siapa yang baru |
| **Kelogisan** | Masuk akal | *Kepada Bapak Camat, waktu dan tempat kami persilakan.* → *Bapak Camat, kami persilakan.* |
| **Kesejajaran (paralelisme)** | Unsur yang setara memakai bentuk yang sama | *Kegiatannya meliputi pendataan, menganalisis, dan pelaporan.* → *pendataan, penganalisisan, dan pelaporan.* |

### Bentuk pemborosan yang sering diuji

| Boros | Hemat |
| --- | --- |
| naik ke atas, turun ke bawah, mundur ke belakang | naik, turun, mundur |
| agar supaya, demi untuk | agar / supaya, demi / untuk |
| sangat bagus sekali | sangat bagus / bagus sekali |
| para hadirin, para bapak-bapak | hadirin, para bapak / bapak-bapak |
| banyak siswa-siswa | banyak siswa |
| adalah merupakan | adalah / merupakan |
| saling bantu-membantu | saling membantu / bantu-membantu |
| sejak dari | sejak / dari |
| zaman dahulu kala | dahulu kala / zaman dahulu |

> **Tips ujian:** Pola soal "Kalimat berikut yang **tidak efektif** adalah …" hampir selalu memuat pleonasme, subjek yang didahului kata depan (*di, dalam, bagi, kepada, menurut*), atau ketidaksejajaran.

### Subjek yang "hilang"

Kalimat seperti *"Bagi peserta yang terlambat harus melapor."* tidak memiliki subjek karena frasa *bagi peserta* adalah keterangan. Perbaikan: hapus *bagi* → *"Peserta yang terlambat harus melapor."*

### Kalimat ambigu

*"Rumah sang jenderal yang megah itu dijual."* — yang megah rumahnya atau jenderalnya? Perjelas: *"Rumah megah milik sang jenderal itu dijual."*

## Paragraf dan gagasan utama

Setiap paragraf yang baik memiliki **satu gagasan utama** (ide pokok) yang dijelaskan oleh **kalimat penjelas**. Kalimat yang memuat gagasan utama disebut **kalimat utama**.

### Jenis paragraf berdasarkan letak kalimat utama

| Jenis | Letak kalimat utama | Ciri |
| --- | --- | --- |
| **Deduktif** | Awal paragraf | Umum → khusus |
| **Induktif** | Akhir paragraf | Khusus → umum; sering diawali penanda simpulan *jadi, dengan demikian, oleh karena itu* |
| **Campuran (deduktif-induktif)** | Awal dan diulang di akhir | Kalimat utama ditegaskan kembali |
| **Ineratif** (istilah di sebagian buku) | Tengah paragraf | Khusus → umum → khusus |
| **Deskriptif/naratif** tanpa kalimat utama tersurat | Menyebar | Gagasan utama harus disimpulkan sendiri |

### Cara menentukan gagasan utama

1. Cari kalimat yang **paling umum** dan dapat mewakili seluruh paragraf.
2. Kalimat yang berisi **contoh, rincian, angka, atau alasan** biasanya kalimat penjelas.
3. Perhatikan penanda simpulan di akhir paragraf.
4. Jika semua kalimat setara, rumuskan gagasan utama dengan kata-kata sendiri yang mencakup semuanya.

### Contoh

*"Desa Wisata Nglanggeran menarik ribuan pengunjung setiap bulan. Warga mengelola penginapan, kuliner, dan pemandu wisata secara mandiri. Pendapatan desa pun meningkat dan banyak pemuda tidak lagi merantau. Pariwisata berbasis masyarakat terbukti mampu menggerakkan ekonomi desa."*

Gagasan utama ada di kalimat terakhir (bersifat umum) → **paragraf induktif**. Gagasan utama: *pariwisata berbasis masyarakat menggerakkan ekonomi desa*.

## Jenis karangan berdasarkan tujuan

| Jenis | Tujuan | Penanda |
| --- | --- | --- |
| **Narasi** | Menceritakan peristiwa secara kronologis | Ada tokoh, alur, waktu |
| **Deskripsi** | Menggambarkan objek sehingga pembaca seolah melihat/merasakan | Detail pancaindra |
| **Eksposisi** | Menjelaskan atau menginformasikan | Data, fakta, langkah-langkah, tanpa ajakan |
| **Argumentasi** | Meyakinkan dengan alasan dan bukti | Pendapat + bukti + simpulan |
| **Persuasi** | Mengajak/membujuk pembaca berbuat sesuatu | Kata ajakan: *mari, ayo, sebaiknya, hendaknya* |

Perbedaan argumentasi dan persuasi: argumentasi ingin pembaca **setuju** berdasarkan bukti, persuasi ingin pembaca **bertindak**.

## Ringkasan

- Kalimat efektif: kesatuan, kepaduan, kehematan, kecermatan, kelogisan, kesejajaran.
- Kesalahan tersering: subjek didahului kata depan, pleonasme, tidak paralel, ambigu.
- Paragraf deduktif (utama di awal), induktif (di akhir), campuran (awal dan akhir).
- Lima jenis karangan: narasi, deskripsi, eksposisi, argumentasi, persuasi.

## Tips mengerjakan soal

- Untuk kalimat efektif, cari dulu **subjek dan predikat**; jika tidak jelas, kalimat itu tidak efektif.
- Untuk ide pokok, abaikan kalimat berisi contoh dan angka.
- Pada soal jenis paragraf, kata *mari/ayo/hendaknya* adalah sinyal kuat persuasi.
$md$, false, 4, 14),

('twk-kaidah-bahasa', 'Makna Kata: Sinonim, Antonim, dan Relasi Makna', 'twk-makna-kata-relasi',
 'Sinonim, antonim, homonim, homofon, homograf, polisemi, hiponim, makna denotatif dan konotatif, serta perubahan makna kata, dengan strategi menjawab soal padanan kata.',
$md$
## Relasi makna

| Istilah | Pengertian | Contoh |
| --- | --- | --- |
| **Sinonim** | Kata berbeda bentuk dengan makna sama atau mirip | *pandai – cerdas*, *mufakat – sepakat* |
| **Antonim** | Kata yang maknanya berlawanan | *besar – kecil*, *membeli – menjual* |
| **Homonim** | Sama bentuk tulis dan bunyi, makna berbeda | *bisa* (racun ular) – *bisa* (mampu) |
| **Homofon** | Sama bunyi, beda tulisan dan makna | *bank* – *bang*; *sangsi* (ragu) – *sanksi* (hukuman) |
| **Homograf** | Sama tulisan, beda bunyi dan makna | *apel* (buah) – *apel* (upacara); *tahu* (makanan) – *tahu* (mengerti) |
| **Polisemi** | Satu kata dengan beberapa makna yang masih berhubungan | *kepala* (bagian tubuh), *kepala* sekolah, *kepala* surat |
| **Hiponim–hipernim** | Hubungan bagian (khusus) dan payung (umum) | *mawar, melati* (hiponim) – *bunga* (hipernim) |

### Jenis antonim

| Jenis | Ciri | Contoh |
| --- | --- | --- |
| Mutlak/komplementer | Menyangkal satu berarti menegaskan yang lain | *hidup – mati* |
| Kutub/gradual | Ada tingkatan di antaranya | *panas – dingin* (ada hangat, sejuk) |
| Hubungan/relasional | Saling melengkapi | *guru – murid*, *menjual – membeli* |
| Hierarkis | Tingkatan dalam satu deret | *tamtama – bintara – perwira* |

## Makna denotatif dan konotatif

- **Denotatif**: makna sebenarnya/lugas. *Kambing hitam itu sedang makan rumput.*
- **Konotatif**: makna tambahan atau kiasan. *Ia dijadikan kambing hitam atas kegagalan itu* (orang yang dipersalahkan).

Konotasi bisa bernilai rasa **positif** (*wafat*, *tunawisma*) atau **negatif** (*mampus*, *gelandangan*).

## Perubahan makna

| Jenis | Pengertian | Contoh |
| --- | --- | --- |
| **Generalisasi (meluas)** | Makna sekarang lebih luas dari makna asal | *saudara* (dulu: sekandung; kini juga sapaan umum) |
| **Spesialisasi (menyempit)** | Makna sekarang lebih sempit | *sarjana* (dulu: cendekiawan; kini: lulusan perguruan tinggi) |
| **Ameliorasi** | Nilai rasa makna menjadi lebih baik/halus | *tunanetra* dirasa lebih halus daripada *buta*; *tunawisma* lebih halus daripada *gelandangan* |
| **Peyorasi** | Nilai rasa makna menjadi lebih rendah | *bini* kini dirasa lebih kasar daripada *istri* |
| **Sinestesia** | Pertukaran tanggapan antarindra | *suaranya manis* (indra pendengar ↔ pengecap) |
| **Asosiasi** | Makna timbul karena persamaan sifat | *amplop* untuk menyebut uang suap |

## Strategi soal padanan kata (sinonim) dan lawan kata (antonim)

1. **Pahami kelas kata** soal: kata sifat → cari kata sifat juga.
2. **Masukkan ke dalam kalimat** untuk menguji kecocokan makna.
3. **Waspadai kata yang hanya berasosiasi**, misalnya *kendala* bukan sinonim *jalan*, walau sering berdekatan.
4. Untuk antonim, perhatikan **arah** makna: *antagonis* lawannya *protagonis*, bukan *netral*.

### Contoh sinonim yang sering muncul

| Kata | Sinonim |
| --- | --- |
| absah | sah, valid |
| adiwangsa | bangsawan |
| baku | standar |
| bahtera | kapal, perahu |
| canggih | modern, mutakhir |
| dikotomi | pembagian atas dua kelompok yang bertentangan |
| eksplisit | tersurat, gamblang |
| implisit | tersirat |
| kendala | hambatan |
| konsisten | taat asas, ajek |
| mufakat | setuju, sepakat |
| nirlaba | tidak mencari keuntungan |
| prasaran | pidato pengantar/makalah dalam sidang |
| relevan | berkaitan, sesuai |
| semiotika | ilmu tentang tanda |
| siasat | taktik, strategi |
| spontan | serta-merta |
| tenggat | batas waktu |

### Contoh antonim yang sering muncul

| Kata | Antonim |
| --- | --- |
| eksplisit | implisit |
| ekspor | impor |
| sporadis | kontinu, terus-menerus |
| optimis | pesimis |
| progresif | regresif/konservatif |
| abstrak | konkret |
| statis | dinamis |
| skeptis | yakin, percaya |
| mayoritas | minoritas |
| heterogen | homogen |

> **Tips ujian:** Kata serapan berpasangan seperti *eksplisit–implisit*, *ekspor–impor*, *heterogen–homogen*, *makro–mikro* sering menjadi pasangan antonim. Hafalkan sebagai paket.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Kata yang bermakna konotatif terdapat pada kalimat …*

Penalaran: cari kalimat dengan makna kiasan, misalnya *"Pejabat itu dikenal bertangan besi"* (keras dan otoriter), bukan *"Pagar itu terbuat dari besi"*.

**Contoh 2.** *"Pemerintah memberikan sanksi kepada perusahaan pencemar." Kata yang memiliki hubungan homofon dengan kata bercetak miring adalah …*

Penalaran: *sanksi* (hukuman) dan *sangsi* (ragu) berbunyi hampir sama tetapi berbeda tulisan dan makna → **homofon**.

## Ringkasan

- Kuasai tujuh relasi makna: sinonim, antonim, homonim, homofon, homograf, polisemi, hiponim.
- Denotasi = makna lugas; konotasi = makna tambahan/kiasan.
- Perubahan makna: generalisasi, spesialisasi, ameliorasi, peyorasi, sinestesia, asosiasi.

## Tips mengerjakan soal

- Selalu uji kata dalam kalimat sebelum memilih sinonim.
- Bedakan homonim (sama tulis dan bunyi) dengan homograf (sama tulis, beda bunyi).
- Polisemi maknanya **masih berhubungan**; homonim **tidak berhubungan**.
$md$, false, 5, 13)

) as v(sub, title, slug, summary, content, is_free, sort_order, est_minutes)
join public.subtopics s on s.slug = v.sub
on conflict (slug) do nothing;

-- ---------------------------------------------------------------------------
-- PRACTICE QUESTIONS (TWK)
-- k = huruf kunci jawaban (5 poin); opsi lainnya 0 poin.
-- ---------------------------------------------------------------------------
create temporary table _twk_q (
  sub text, stem text, a text, b text, c text, d text, e text,
  k char(1), expl text, diff public.difficulty
) on commit drop;

insert into _twk_q values
-- ============================ NASIONALISME ==================================
('twk-nasionalisme-dasar',
 'Sikap cinta terhadap bangsa sendiri secara berlebihan sehingga memandang rendah bangsa lain disebut …',
 'Patriotisme', 'Primordialisme', 'Kosmopolitanisme', 'Chauvinisme', 'Liberalisme',
 'D', 'Chauvinisme adalah cinta tanah air yang berlebihan hingga merendahkan bangsa lain. Primordialisme berkaitan dengan ikatan asal (suku, daerah) di dalam bangsa sendiri, sedangkan patriotisme justru sikap positif rela berkorban untuk bangsa.', 'easy'),
('twk-nasionalisme-dasar',
 'Bunyi ikrar ketiga Sumpah Pemuda 28 Oktober 1928 adalah …',
 'Kami putra dan putri Indonesia menjunjung bahasa persatuan, bahasa Indonesia', 'Kami putra dan putri Indonesia mengaku berbahasa yang satu, bahasa Indonesia', 'Kami putra dan putri Indonesia mengaku berbangsa yang satu, bangsa Indonesia', 'Kami putra dan putri Indonesia mengaku bertumpah darah yang satu, tanah Indonesia', 'Kami putra dan putri Indonesia berjanji membela tanah air Indonesia',
 'A', 'Ikrar ketiga berbunyi menjunjung bahasa persatuan, bahasa Indonesia. Jebakan umum adalah redaksi mengaku berbahasa yang satu, padahal para pemuda tidak meniadakan bahasa daerah. Opsi C dan D adalah ikrar kedua dan pertama.', 'easy'),
('twk-nasionalisme-dasar',
 'Warga sebuah dusun menolak kehadiran bidan desa yang baru ditugaskan karena bidan tersebut berasal dari provinsi lain, padahal kompetensinya memenuhi syarat. Sikap warga tersebut paling tepat digolongkan sebagai …',
 'Chauvinisme', 'Separatisme', 'Kosmopolitanisme', 'Patriotisme', 'Primordialisme',
 'E', 'Penolakan didasarkan pada asal daerah, yaitu ikatan primordial, bukan pada kemampuan. Chauvinisme berkaitan dengan merendahkan bangsa lain, sedangkan separatisme adalah keinginan memisahkan diri dari negara.', 'medium'),
('twk-nasionalisme-dasar',
 'Ketentuan bahwa lambang negara ialah Garuda Pancasila dengan semboyan Bhinneka Tunggal Ika diatur dalam UUD 1945 pasal …',
 'Pasal 35', 'Pasal 36A', 'Pasal 36B', 'Pasal 36C', 'Pasal 32',
 'B', 'Pasal 36A mengatur lambang negara. Pasal 35 mengatur bendera, Pasal 36B lagu kebangsaan, dan Pasal 36C menyatakan ketentuan lebih lanjut diatur dengan undang-undang.', 'medium'),
('twk-nasionalisme-dasar',
 'Seorang mahasiswa ingin menunjukkan sikap nasionalisme di media sosial. Tindakan yang paling tepat adalah …',
 'Mengganti foto profil dengan bendera Merah Putih setiap bulan Agustus saja', 'Membalas dengan kata-kata kasar setiap akun asing yang mengkritik Indonesia', 'Membuat konten edukatif tentang budaya daerah dan tidak ikut menyebarkan hoaks yang memecah belah', 'Hanya mengikuti akun-akun yang berasal dari daerah asalnya', 'Menolak menggunakan semua aplikasi buatan luar negeri',
 'C', 'Nasionalisme yang tepat bersifat aktif, konstruktif, dan inklusif. Opsi B cenderung chauvinistis, D bersifat primordial, E berlebihan karena nasionalisme Pancasila tidak anti-asing, sedangkan A hanya simbolis dan musiman.', 'medium'),
('twk-nasionalisme-dasar',
 'Hari Kebangkitan Nasional yang diperingati setiap 20 Mei didasarkan pada peristiwa …',
 'Lahirnya Sumpah Pemuda', 'Berdirinya Indische Partij', 'Berdirinya Budi Utomo', 'Berdirinya Taman Siswa', 'Kongres Pemuda I',
 'C', 'Budi Utomo berdiri pada 20 Mei 1908 dan dipandang sebagai awal pergerakan nasional modern, sehingga tanggal tersebut diperingati sebagai Hari Kebangkitan Nasional. Taman Siswa berdiri 3 Juli 1922, sedangkan Sumpah Pemuda terjadi pada 28 Oktober 1928.', 'easy'),
('twk-nasionalisme-dasar',
 'Perbedaan paling mendasar antara perjuangan bangsa Indonesia sebelum dan sesudah tahun 1908 adalah …',
 'Sebelum 1908 bersifat kedaerahan dan mengandalkan kekuatan senjata, sesudahnya bersifat nasional melalui organisasi modern', 'Sebelum 1908 dipimpin kaum terpelajar, sesudahnya dipimpin para raja', 'Sebelum 1908 bersifat nasional, sesudahnya bersifat kedaerahan', 'Sesudah 1908 perjuangan sama sekali tidak menggunakan kekuatan bersenjata', 'Sebelum 1908 perjuangan didukung oleh pemerintah kolonial',
 'A', 'Perjuangan sebelum 1908 umumnya bersifat lokal dan bergantung pada tokoh karismatik, sedangkan setelah Budi Utomo perjuangan memakai organisasi modern dan berskala nasional. Opsi D keliru karena perjuangan bersenjata tetap terjadi, misalnya pada masa revolusi fisik.', 'medium'),
('twk-nasionalisme-dasar',
 'Seorang pegawai kelurahan melihat bendera Merah Putih di halaman kantornya sudah robek dan warnanya pudar. Tindakan yang paling tepat adalah …',
 'Membiarkannya karena bukan tugasnya mengurus bendera', 'Menurunkan bendera lalu membuangnya ke tempat sampah', 'Memotong bagian yang robek agar terlihat rapi', 'Melaporkan kepada penanggung jawab sarana kantor dan mengusulkan penggantian bendera', 'Menunggu peringatan 17 Agustus untuk menggantinya',
 'D', 'Bendera negara tidak boleh dikibarkan dalam keadaan rusak, robek, atau kusam, sehingga harus segera diganti melalui jalur yang tepat. Membuang, memotong, atau membiarkannya justru tidak menghormati simbol negara.', 'medium'),
('twk-nasionalisme-dasar',
 'Semboyan pendidikan Ki Hajar Dewantara "ing madya mangun karsa" memiliki makna …',
 'Di depan memberi teladan', 'Di tengah membangun semangat dan kemauan', 'Di belakang memberi dorongan', 'Belajar sepanjang hayat', 'Bekerja keras tanpa pamrih',
 'B', 'Ing madya mangun karsa berarti di tengah membangun semangat/kemauan. Ing ngarsa sung tuladha berarti di depan memberi teladan, dan tut wuri handayani berarti di belakang memberi dorongan.', 'medium'),
('twk-nasionalisme-dasar',
 'Fungsi bahasa Indonesia berikut yang merupakan fungsinya sebagai bahasa negara, bukan sebagai bahasa nasional, adalah …',
 'Lambang kebanggaan nasional', 'Lambang identitas nasional', 'Alat pemersatu berbagai suku bangsa', 'Alat perhubungan antarbudaya dan antardaerah', 'Bahasa pengantar dalam dunia pendidikan',
 'E', 'Sebagai bahasa negara (Pasal 36 UUD 1945), bahasa Indonesia berfungsi sebagai bahasa resmi kenegaraan, pengantar pendidikan, serta bahasa pembangunan dan iptek. Kebanggaan, identitas, pemersatu, dan perhubungan antardaerah adalah fungsi sebagai bahasa nasional yang berakar pada Sumpah Pemuda.', 'hard'),
('twk-nasionalisme-dasar',
 'Seorang ASN ditempatkan di kabupaten yang baru saja mengalami ketegangan antara dua kelompok warga berbeda suku. Sikap yang paling mencerminkan nasionalisme adalah …',
 'Lebih banyak melayani kelompok yang sesuku dengannya agar merasa aman', 'Meminta mutasi ke daerah lain secepatnya', 'Melayani kedua kelompok secara adil dan mendukung forum dialog yang difasilitasi pemerintah daerah', 'Menghindari berinteraksi dengan warga sampai situasi benar-benar pulih', 'Mengunggah pendapat pribadinya tentang kelompok yang dianggap bersalah di media sosial',
 'C', 'Nasionalisme ASN tampak dari pelayanan tanpa diskriminasi dan peran sebagai perekat persatuan. Opsi A bersifat primordial, E berpotensi memperkeruh suasana, sedangkan B dan D menghindari tanggung jawab.', 'hard'),
('twk-nasionalisme-dasar',
 'Menurut ketentuan perundang-undangan tentang bendera negara, perbandingan lebar dan panjang bendera Merah Putih adalah …',
 '1 : 2', '3 : 4', '1 : 3', '2 : 3', '3 : 5',
 'D', 'Bendera Merah Putih berbentuk persegi panjang dengan lebar dua per tiga dari panjangnya, atau perbandingan 2 : 3, dengan bagian merah di atas dan putih di bawah yang sama ukurannya.', 'medium'),

-- ============================== INTEGRITAS ==================================
('twk-integritas',
 'Berikut ini yang tidak termasuk sembilan nilai antikorupsi yang dirumuskan KPK adalah …',
 'Jujur', 'Loyal', 'Sederhana', 'Mandiri', 'Berani',
 'B', 'Sembilan nilai antikorupsi adalah jujur, disiplin, tanggung jawab, adil, berani, peduli, kerja keras, sederhana, dan mandiri. Loyal merupakan salah satu nilai dasar ASN BerAKHLAK, bukan bagian dari sembilan nilai antikorupsi.', 'easy'),
('twk-integritas',
 'Penerima gratifikasi dapat terhindar dari anggapan menerima suap apabila melaporkannya kepada KPK paling lambat …',
 '7 hari kalender', '14 hari kerja', '1 bulan kalender', '60 hari kerja', '30 hari kerja',
 'E', 'Undang-undang tindak pidana korupsi menentukan bahwa gratifikasi wajib dilaporkan kepada KPK paling lambat 30 hari kerja sejak diterima. Jika dilaporkan dalam batas waktu itu, ketentuan gratifikasi yang dianggap suap tidak berlaku.', 'easy'),
('twk-integritas',
 'Dimas adalah anggota panitia pengadaan. Saat proses lelang masih berjalan, salah satu peserta lelang mengirim parsel berisi barang elektronik mahal ke rumahnya. Tindakan Dimas yang paling tepat adalah …',
 'Tidak menggunakan parsel itu, menolak atau mengembalikannya, dan melaporkannya ke unit pengendalian gratifikasi', 'Menerima parsel karena dikirim ke rumah, bukan ke kantor', 'Menerima parsel lalu menyumbangkannya ke panti asuhan tanpa melapor', 'Menerima parsel, tetapi tetap menilai peserta lelang secara objektif', 'Membagikan isi parsel kepada seluruh anggota panitia agar adil',
 'A', 'Pemberian dari peserta lelang jelas berhubungan dengan jabatan Dimas dan berpotensi memengaruhi keputusannya. Ia harus menolak dan melaporkannya agar tercatat. Menyumbangkan sendiri atau berjanji tetap objektif tidak menghapus kewajiban melapor.', 'medium'),
('twk-integritas',
 'Sinta ditunjuk menjadi penilai berkas seleksi pegawai kontrak. Ternyata salah satu pelamar adalah adik kandungnya. Sikap Sinta yang paling tepat adalah …',
 'Tetap menilai karena ia yakin bisa bersikap objektif', 'Memberi nilai lebih rendah kepada adiknya agar terlihat adil', 'Meminta adiknya mengundurkan diri dari seleksi', 'Melaporkan hubungan keluarga itu kepada atasan dan tidak ikut menilai berkas adiknya', 'Menilai berkas adiknya terakhir setelah pelamar lain selesai',
 'D', 'Hubungan keluarga menimbulkan konflik kepentingan. Cara mengelolanya adalah mengungkapkan konflik tersebut dan mundur dari proses penilaian yang terkait. Memberi nilai lebih rendah juga tidak objektif, dan meminta adiknya mundur merugikan hak adiknya.', 'medium'),
('twk-integritas',
 'Sepulang dari perjalanan dinas, Hendra mendapati sebagian uang muka perjalanan tidak terpakai karena kegiatan dipersingkat. Ia segera mengembalikan sisa uang itu ke kas kantor beserta laporan pertanggungjawaban. Nilai dasar ASN BerAKHLAK yang paling menonjol adalah …',
 'Kompeten', 'Adaptif', 'Akuntabel', 'Harmonis', 'Kolaboratif',
 'C', 'Akuntabel berarti bertanggung jawab atas kepercayaan yang diberikan, termasuk jujur dan menggunakan keuangan negara secara tepat. Kompeten dan adaptif berkaitan dengan kemampuan dan penyesuaian diri, bukan pertanggungjawaban keuangan.', 'medium'),
('twk-integritas',
 'Petugas loket memberi tahu seorang pemohon bahwa berkasnya baru akan diproses jika pemohon memberikan sejumlah uang di luar tarif resmi. Perbuatan petugas tersebut termasuk …',
 'Gratifikasi', 'Pemerasan', 'Nepotisme', 'Penggelapan dalam jabatan', 'Benturan kepentingan dalam pengadaan',
 'B', 'Inisiatif datang dari petugas yang memaksa dengan menyalahgunakan kewenangannya, sehingga termasuk pemerasan. Gratifikasi umumnya berasal dari inisiatif pemberi tanpa paksaan, sedangkan penggelapan berkaitan dengan uang atau barang yang dikuasai karena jabatan.', 'medium'),
('twk-integritas',
 'Contoh perbuatan yang termasuk kolusi adalah …',
 'Pejabat mengangkat keponakannya tanpa seleksi', 'Pegawai memakai mobil dinas untuk berlibur', 'Bendahara memakai uang kas untuk kepentingan pribadi', 'Petugas meminta uang tambahan dari warga', 'Panitia lelang bersekongkol dengan rekanan untuk menentukan pemenang sebelum lelang dibuka',
 'E', 'Kolusi adalah persekongkolan secara melawan hukum antarpihak. Mengangkat keponakan tanpa seleksi adalah nepotisme, memakai uang kas untuk diri sendiri termasuk korupsi/penggelapan, dan meminta uang tambahan dari warga termasuk pemerasan.', 'easy'),
('twk-integritas',
 'Rekan kerja Anda meminta Anda menandatangani daftar hadirnya karena ia akan datang terlambat dua jam. Sikap yang paling mencerminkan integritas adalah …',
 'Menolak dengan sopan dan menyarankannya melapor langsung kepada atasan tentang keterlambatannya', 'Menandatangani karena ia teman dekat', 'Menandatangani sekali ini saja dengan syarat tidak diulangi', 'Menolak lalu menceritakan hal itu kepada rekan-rekan lain', 'Menandatangani tetapi melaporkannya kepada atasan keesokan harinya',
 'A', 'Integritas berarti tidak ikut memalsukan kehadiran sekecil apa pun, sekaligus tetap santun. Menyarankan rekan berkomunikasi dengan atasan adalah solusi yang jujur. Menyebarkan cerita ke rekan lain tidak menyelesaikan masalah dan dapat merusak hubungan kerja.', 'medium'),
('twk-integritas',
 'Atasan meminta Rudi, staf keuangan, mencantumkan harga satuan barang lebih tinggi dari harga sebenarnya dalam dokumen pengadaan dengan alasan "semua kantor juga begitu". Sikap Rudi yang paling tepat sesuai nilai loyal dan akuntabel adalah …',
 'Mengikuti perintah karena loyal berarti patuh kepada atasan', 'Mengikuti perintah tetapi menyimpan bukti untuk berjaga-jaga', 'Mengundurkan diri dari pekerjaannya tanpa penjelasan', 'Menolak secara santun dengan menjelaskan aturan, dan menempuh saluran pengaduan resmi bila tetap dipaksa', 'Membocorkan dokumen itu ke media sosial agar viral',
 'D', 'Loyal dalam BerAKHLAK berarti setia kepada negara dan aturan, bukan pada perintah yang menyimpang. Rudi harus menolak penggelembungan harga dan menggunakan whistleblowing system bila ditekan. Mengikuti perintah tetap menjadikannya pelaku, sedangkan menyebarkan ke media sosial melewati jalur resmi.', 'hard'),
('twk-integritas',
 'Menjelang pemilihan kepala daerah, seorang ASN diminta tim sukses untuk hadir dan memberi sambutan dalam acara kampanye salah satu calon. Sikap yang tepat adalah …',
 'Hadir karena acara dilaksanakan di luar jam kerja', 'Hadir tanpa memberi sambutan', 'Menolak karena ASN wajib menjaga netralitas dalam pemilihan', 'Hadir dengan mengenakan pakaian bebas agar tidak dikenali', 'Mengirim perwakilan dari unit kerjanya',
 'C', 'ASN wajib netral dan tidak boleh terlibat dalam kegiatan kampanye untuk mendukung calon tertentu, baik di dalam maupun di luar jam kerja. Mengirim perwakilan atau hadir tanpa sambutan tetap merupakan bentuk keberpihakan.', 'medium'),
('twk-integritas',
 'Situasi berikut yang paling jelas menunjukkan adanya konflik kepentingan adalah …',
 'Pegawai mengikuti pelatihan yang dibiayai instansinya', 'Pejabat pengadaan memiliki saham pada perusahaan yang sedang mengikuti lelang di instansinya', 'Pegawai menerima gaji ketiga belas sesuai ketentuan', 'Kepala dinas memberikan penghargaan kepada pegawai berprestasi berdasarkan penilaian kinerja', 'Pegawai membeli produk UMKM binaan instansinya dengan harga pasar',
 'B', 'Konflik kepentingan terjadi ketika kepentingan pribadi, seperti kepemilikan saham, dapat memengaruhi objektivitas keputusan jabatan. Opsi lain merupakan hak atau kegiatan yang dijalankan sesuai ketentuan dan tidak memengaruhi keputusan secara tidak patut.', 'hard'),
('twk-integritas',
 'Lina menyadari bahwa data yang ia masukkan pekan lalu keliru sehingga laporan bulanan kantornya salah. Belum ada yang mengetahui kesalahan itu. Tindakan Lina yang mencerminkan integritas adalah …',
 'Diam saja karena kesalahannya kecil', 'Menunggu sampai ada yang menyadari kesalahan itu', 'Menyalahkan sistem aplikasi yang digunakan', 'Memperbaiki data diam-diam tanpa memberi tahu siapa pun', 'Melapor kepada atasan, mengakui kesalahan, dan segera memperbaiki laporan',
 'E', 'Integritas tampak dari kejujuran dan tanggung jawab walaupun tidak ada yang mengetahui. Memperbaiki diam-diam kurang tepat karena laporan yang salah mungkin sudah dipakai pihak lain, sehingga atasan perlu tahu.', 'medium'),

-- ============================== BELA NEGARA =================================
('twk-bela-negara',
 'Pasal 27 ayat (3) UUD 1945 menyatakan bahwa ikut serta dalam upaya pembelaan negara merupakan …',
 'Kewajiban anggota TNI dan Polri', 'Hak warga negara yang telah berusia 18 tahun', 'Hak dan kewajiban setiap warga negara', 'Kewajiban pemerintah pusat dan daerah', 'Kewajiban setiap penduduk, termasuk warga negara asing',
 'C', 'Pasal 27 ayat (3) menyebutkan setiap warga negara berhak dan wajib ikut serta dalam upaya pembelaan negara. Bela negara bukan hanya tugas TNI/Polri dan tidak dibatasi usia tertentu dalam rumusan pasal tersebut.', 'easy'),
('twk-bela-negara',
 'Berikut ini yang bukan termasuk nilai dasar bela negara adalah …',
 'Mahir menggunakan senjata api', 'Cinta tanah air', 'Sadar berbangsa dan bernegara', 'Setia kepada Pancasila sebagai ideologi negara', 'Rela berkorban untuk bangsa dan negara',
 'A', 'Lima nilai dasar bela negara adalah cinta tanah air, sadar berbangsa dan bernegara, setia kepada Pancasila sebagai ideologi negara, rela berkorban untuk bangsa dan negara, serta kemampuan awal bela negara. Kemampuan awal bela negara bukan berarti mahir menggunakan senjata.', 'easy'),
('twk-bela-negara',
 'Setelah lulus, dr. Arif memilih bertugas di puskesmas pulau terluar yang minim tenaga kesehatan. Keikutsertaan dr. Arif dalam bela negara menurut UU Pertahanan Negara termasuk bentuk …',
 'Pendidikan kewarganegaraan', 'Pelatihan dasar kemiliteran secara wajib', 'Pengabdian sebagai prajurit TNI secara sukarela', 'Pengabdian sesuai dengan profesi', 'Komponen utama pertahanan negara',
 'D', 'Bertugas sebagai dokter di daerah terpencil adalah pengabdian sesuai profesi. Pelatihan dasar kemiliteran dan pengabdian sebagai prajurit TNI adalah bentuk lain, sedangkan komponen utama pertahanan adalah TNI.', 'medium'),
('twk-bela-negara',
 'Meningkatnya penyalahgunaan narkoba di kalangan pelajar daerah perbatasan merupakan ancaman …',
 'Militer di bidang pertahanan', 'Nonmiliter di bidang sosial budaya', 'Militer berupa sabotase', 'Nonmiliter di bidang ideologi', 'Hibrida di bidang politik',
 'B', 'Narkoba tidak menggunakan kekuatan bersenjata, tetapi merusak kualitas generasi muda dan tatanan sosial, sehingga termasuk ancaman nonmiliter di bidang sosial budaya.', 'medium'),
('twk-bela-negara',
 'Sebuah kapal perang negara lain memasuki perairan teritorial Indonesia tanpa izin dan menolak meninggalkan wilayah tersebut ketika diperingatkan. Peristiwa ini tergolong ancaman …',
 'Nonmiliter di bidang ekonomi', 'Nonmiliter di bidang politik', 'Nonmiliter di bidang keselamatan umum', 'Hibrida di bidang teknologi', 'Militer berupa pelanggaran wilayah',
 'E', 'Pelanggaran wilayah oleh kekuatan bersenjata negara lain merupakan ancaman militer. Ciri utama ancaman militer adalah penggunaan kekuatan bersenjata yang terorganisasi.', 'medium'),
('twk-bela-negara',
 'Hari Bela Negara diperingati setiap 19 Desember untuk mengenang peristiwa …',
 'Pertempuran Surabaya', 'Pembentukan Pemerintah Darurat Republik Indonesia (PDRI)', 'Serangan Umum 1 Maret', 'Perjanjian Roem-Royen', 'Konferensi Meja Bundar',
 'B', 'PDRI dibentuk di Sumatra Barat pada Desember 1948 di bawah pimpinan Sjafruddin Prawiranegara setelah Yogyakarta diduduki Belanda dalam Agresi Militer II. Pertempuran Surabaya diperingati sebagai Hari Pahlawan.', 'easy'),
('twk-bela-negara',
 'Di grup percakapan keluarga beredar pesan yang menuduh suatu kelompok agama merencanakan kerusuhan, lengkap dengan ajakan untuk menyebarkannya. Tindakan yang paling mencerminkan bela negara adalah …',
 'Meneruskan pesan itu ke grup lain agar orang waspada', 'Membalas dengan kemarahan terhadap kelompok yang dituduh', 'Memeriksa kebenarannya, tidak menyebarkan, memberi klarifikasi santun, dan melaporkan konten tersebut', 'Keluar dari grup percakapan tanpa berkata apa pun', 'Menyimpan pesan itu untuk dibaca lagi nanti',
 'C', 'Bela negara nonfisik di ruang digital adalah memverifikasi informasi, menghentikan penyebaran hoaks, mengedukasi, dan melaporkannya. Meneruskan pesan justru memperluas potensi perpecahan, sedangkan keluar dari grup tidak mencegah penyebaran.', 'medium'),
('twk-bela-negara',
 'Dalam menghadapi wabah penyakit menular yang meluas, unsur utama sistem pertahanan negara adalah …',
 'Kementerian/lembaga di luar bidang pertahanan yang membidangi kesehatan dan penanggulangan bencana', 'TNI sebagai komponen utama', 'Komponen cadangan', 'Polri sebagai kekuatan utama', 'Masyarakat sebagai komponen pendukung',
 'A', 'Wabah adalah ancaman nonmiliter di bidang keselamatan umum. Untuk ancaman nonmiliter, unsur utamanya adalah kementerian/lembaga di luar bidang pertahanan sesuai jenis ancaman, sedangkan TNI dan unsur lain dapat membantu.', 'medium'),
('twk-bela-negara',
 'Dalam konsep ketahanan nasional, usaha yang berasal dari luar, bersifat atau bertujuan melemahkan atau menghalangi secara tidak konsepsional disebut …',
 'Ancaman', 'Tantangan', 'Hambatan', 'Gangguan', 'Ketahanan',
 'D', 'Gangguan berasal dari luar dan bersifat tidak konsepsional, sedangkan hambatan serupa tetapi berasal dari dalam. Ancaman bersifat konsepsional untuk mengubah atau merombak kebijakan, dan tantangan bersifat menggugah kemampuan.', 'hard'),
('twk-bela-negara',
 'Keikutsertaan warga negara sebagai komponen cadangan pertahanan negara bersifat …',
 'Wajib bagi seluruh warga negara laki-laki', 'Wajib bagi seluruh ASN', 'Wajib bagi lulusan perguruan tinggi', 'Ditentukan oleh kepala daerah masing-masing', 'Sukarela',
 'E', 'Undang-undang tentang pengelolaan sumber daya nasional untuk pertahanan negara mengatur bahwa warga negara ikut serta menjadi komponen cadangan secara sukarela melalui pendaftaran dan seleksi.', 'medium'),
('twk-bela-negara',
 'Wujud bela negara nonfisik yang paling sesuai bagi seorang pedagang bahan pokok adalah …',
 'Mengikuti latihan menembak setiap pekan', 'Menjual barang yang legal dan layak dengan harga wajar, tidak menimbun, dan membayar pajak', 'Menimbun barang saat harga naik agar usahanya bertahan', 'Hanya menjual produk impor karena kualitasnya lebih baik', 'Ikut berpatroli di wilayah perbatasan',
 'B', 'Bela negara nonfisik disesuaikan dengan peran masing-masing. Bagi pedagang, menjaga ketersediaan barang, tidak menimbun, dan taat pajak mendukung ketahanan ekonomi. Latihan menembak dan patroli perbatasan bukan peran pedagang.', 'medium'),
('twk-bela-negara',
 'Menurut Pasal 30 ayat (2) UUD 1945, dalam sistem pertahanan dan keamanan rakyat semesta, kedudukan rakyat adalah sebagai …',
 'Kekuatan pendukung, sedangkan TNI dan Polri sebagai kekuatan utama', 'Kekuatan utama bersama TNI', 'Kekuatan utama, sedangkan TNI dan Polri sebagai pendukung', 'Komponen cadangan wajib', 'Pelaksana tunggal pertahanan nonmiliter',
 'A', 'Pasal 30 ayat (2) menyatakan usaha pertahanan dan keamanan negara dilaksanakan melalui sistem pertahanan dan keamanan rakyat semesta oleh TNI dan Polri sebagai kekuatan utama dan rakyat sebagai kekuatan pendukung.', 'hard'),

-- =============================== PANCASILA ==================================
('twk-pancasila',
 'Tokoh yang pertama kali mengusulkan nama "Pancasila" untuk dasar negara dalam sidang BPUPKI adalah …',
 'Mohammad Hatta', 'Mohammad Yamin', 'Soepomo', 'Radjiman Wedyodiningrat', 'Soekarno',
 'E', 'Soekarno menyampaikan pidatonya pada 1 Juni 1945 dan memberi nama Pancasila untuk dasar negara. Yamin berpidato pada 29 Mei dan Soepomo pada 31 Mei, sedangkan Radjiman adalah ketua BPUPKI.', 'easy'),
('twk-pancasila',
 'Piagam Jakarta yang memuat rumusan dasar negara disusun oleh Panitia Sembilan pada tanggal …',
 '22 Juni 1945', '1 Juni 1945', '17 Juli 1945', '7 Agustus 1945', '18 Agustus 1945',
 'A', 'Panitia Sembilan menghasilkan Piagam Jakarta pada 22 Juni 1945. Tanggal 1 Juni adalah pidato Soekarno, 7 Agustus pembentukan PPKI, dan 18 Agustus pengesahan UUD 1945.', 'easy'),
('twk-pancasila',
 'Agenda utama sidang kedua BPUPKI pada 10–17 Juli 1945 adalah …',
 'Mengesahkan UUD 1945', 'Memilih presiden dan wakil presiden', 'Membahas rancangan undang-undang dasar', 'Membentuk Komite Nasional Indonesia Pusat', 'Merumuskan teks proklamasi',
 'C', 'Sidang I BPUPKI membahas dasar negara, sedangkan sidang II membahas rancangan undang-undang dasar beserta bentuk dan wilayah negara. Pengesahan UUD dan pemilihan presiden dilakukan oleh PPKI.', 'medium'),
('twk-pancasila',
 'Pada sidang BPUPKI tanggal 31 Mei 1945, tokoh yang menyampaikan gagasan dasar negara meliputi persatuan, kekeluargaan, keseimbangan lahir dan batin, musyawarah, serta keadilan rakyat adalah …',
 'Soekarno', 'Mohammad Yamin', 'Ki Bagus Hadikusumo', 'Soepomo', 'Abdul Wahid Hasjim',
 'D', 'Gagasan tersebut disampaikan oleh Soepomo pada 31 Mei 1945. Mohammad Yamin berpidato pada 29 Mei 1945, sedangkan Soekarno pada 1 Juni 1945.', 'medium'),
('twk-pancasila',
 'Kesediaan para tokoh Islam menerima perubahan rumusan sila pertama Piagam Jakarta menjadi "Ketuhanan Yang Maha Esa" pada 18 Agustus 1945 mencerminkan sikap …',
 'Mengutamakan kepentingan golongan agar diterima semua pihak', 'Mengutamakan persatuan dan kesatuan bangsa di atas kepentingan golongan', 'Tunduk pada tekanan pemerintah pendudukan Jepang', 'Menolak peran agama dalam kehidupan bernegara', 'Menunda pembahasan dasar negara sampai pemilu',
 'B', 'Perubahan dilakukan untuk menjaga keutuhan bangsa setelah muncul keberatan dari wakil Indonesia bagian timur. Sikap ini menunjukkan pengutamaan persatuan, bukan penolakan peran agama, karena sila pertama tetap menegaskan Ketuhanan.', 'medium'),
('twk-pancasila',
 'Pada perisai Garuda Pancasila, sila keempat dilambangkan dengan …',
 'Bintang', 'Rantai', 'Kepala banteng', 'Pohon beringin', 'Padi dan kapas',
 'C', 'Kepala banteng melambangkan sila keempat. Bintang untuk sila pertama, rantai sila kedua, pohon beringin sila ketiga, dan padi dan kapas sila kelima.', 'easy'),
('twk-pancasila',
 'Dalam rapat RW, usulan Bu Ratna agar iuran kebersihan dinaikkan kalah dalam pemungutan suara. Bu Ratna tetap membayar iuran sesuai keputusan rapat dan mengajak tetangganya melakukan hal yang sama. Sikap Bu Ratna mencerminkan pengamalan sila …',
 'Keempat', 'Pertama', 'Kedua', 'Ketiga', 'Kelima',
 'A', 'Menerima dan melaksanakan hasil musyawarah dengan iktikad baik dan tanggung jawab adalah pengamalan sila keempat. Pengecoh yang sering dipilih adalah sila ketiga, padahal fokus kasus adalah sikap terhadap keputusan bersama.', 'medium'),
('twk-pancasila',
 'Seorang perawat di rumah sakit tetap mendahulukan pasien dengan kondisi paling gawat, meskipun ada keluarga pasien lain yang menawarkan imbalan agar dilayani lebih dulu. Nilai yang paling menonjol adalah sila …',
 'Pertama, karena perawat menjalankan ajaran agama', 'Ketiga, karena menjaga persatuan', 'Keempat, karena memutuskan secara bijaksana', 'Kelima, karena membagi pelayanan secara merata', 'Kedua, karena memperlakukan setiap manusia sesuai harkat dan martabatnya tanpa membeda-bedakan',
 'E', 'Inti kasus adalah persamaan derajat manusia dan tidak membeda-bedakan orang berdasarkan kemampuan membayar, yang merupakan pengamalan sila kedua. Sila kelima bersinggungan, tetapi kasus ini lebih menekankan martabat kemanusiaan.', 'medium'),
('twk-pancasila',
 'Pemerintah dan DPR menetapkan undang-undang baru untuk melindungi data pribadi warga di era digital dengan tetap berlandaskan nilai-nilai Pancasila. Dalam konsep ideologi terbuka, undang-undang tersebut merupakan wujud nilai …',
 'Dasar', 'Instrumental', 'Praksis', 'Universal', 'Absolut',
 'B', 'Nilai instrumental adalah penjabaran nilai dasar dalam bentuk peraturan perundang-undangan dan kebijakan yang dapat berubah sesuai zaman. Nilai dasar adalah sila-sila Pancasila yang tetap, sedangkan nilai praksis adalah pelaksanaan nyata dalam kehidupan sehari-hari.', 'medium'),
('twk-pancasila',
 'Pernyataan berikut yang bukan merupakan ciri ideologi terbuka adalah …',
 'Nilai-nilainya digali dari kekayaan budaya masyarakat sendiri', 'Merupakan hasil kesepakatan masyarakat', 'Penjabarannya dapat disesuaikan dengan perkembangan zaman', 'Kebenarannya tidak boleh dipersoalkan dan wajib diterima tanpa pertimbangan', 'Menghargai pluralitas dalam masyarakat',
 'D', 'Ideologi yang kebenarannya tidak boleh dipersoalkan dan dipaksakan merupakan ciri ideologi tertutup. Ideologi terbuka bersifat dinamis, berasal dari kesepakatan masyarakat, dan menghargai pluralitas.', 'hard'),
('twk-pancasila',
 'Berikut ini adalah hasil sidang PPKI pada 18 Agustus 1945, kecuali …',
 'Mengesahkan UUD 1945', 'Memilih Soekarno sebagai presiden', 'Membentuk Panitia Sembilan untuk merumuskan dasar negara', 'Memilih Mohammad Hatta sebagai wakil presiden', 'Menetapkan bahwa presiden untuk sementara dibantu sebuah komite nasional',
 'C', 'Panitia Sembilan dibentuk pada masa BPUPKI dan menghasilkan Piagam Jakarta pada 22 Juni 1945. Sidang PPKI 18 Agustus 1945 mengesahkan UUD 1945, memilih presiden dan wakil presiden, serta menetapkan komite nasional sebagai pembantu presiden untuk sementara.', 'medium'),
('twk-pancasila',
 'Dalam susunan Pancasila yang bersifat hierarkis-piramidal, pernyataan yang tepat mengenai sila ketiga adalah …',
 'Dijiwai oleh sila pertama dan kedua, serta menjiwai sila keempat dan kelima', 'Menjiwai seluruh sila lainnya', 'Dijiwai oleh sila keempat dan kelima saja', 'Berdiri sendiri dan tidak terkait dengan sila lain', 'Dijiwai oleh sila kelima dan menjiwai sila pertama',
 'A', 'Dalam susunan hierarkis-piramidal, setiap sila dijiwai oleh sila-sila sebelumnya dan menjiwai sila-sila sesudahnya. Sila ketiga dijiwai sila pertama dan kedua, serta menjiwai sila keempat dan kelima. Hanya sila pertama yang menjiwai seluruh sila lainnya.', 'hard'),
('twk-pancasila',
 'Seorang pemilik lahan tidak menggunakan lahannya untuk usaha yang merusak lingkungan dan merugikan warga sekitar, walaupun usaha itu menguntungkan dirinya. Sikap ini merupakan pengamalan sila …',
 'Ketiga', 'Kelima', 'Kedua', 'Keempat', 'Pertama',
 'B', 'Tidak menggunakan hak milik untuk usaha yang bertentangan dengan atau merugikan kepentingan umum adalah salah satu butir pengamalan sila kelima, yaitu keadilan sosial yang menyeimbangkan hak dan kewajiban.', 'hard'),

-- =============================== UUD 1945 ===================================
('twk-uud-1945',
 'Tujuan negara "melindungi segenap bangsa Indonesia dan seluruh tumpah darah Indonesia" tercantum dalam Pembukaan UUD 1945 alinea …',
 'Pertama', 'Kedua', 'Ketiga', 'Keempat', 'Pasal 1',
 'D', 'Alinea keempat memuat tujuan negara: melindungi segenap bangsa dan seluruh tumpah darah Indonesia, memajukan kesejahteraan umum, mencerdaskan kehidupan bangsa, dan ikut melaksanakan ketertiban dunia.', 'easy'),
('twk-uud-1945',
 'Ketentuan bahwa "Negara Indonesia adalah negara hukum" terdapat dalam UUD 1945 …',
 'Pasal 1 ayat (1)', 'Pasal 1 ayat (3)', 'Pasal 1 ayat (2)', 'Pasal 3 ayat (1)', 'Pasal 27 ayat (1)',
 'B', 'Pasal 1 ayat (3) menyatakan Indonesia adalah negara hukum. Ayat (1) mengatur bentuk negara kesatuan berbentuk republik, dan ayat (2) mengatur kedaulatan di tangan rakyat yang dilaksanakan menurut UUD.', 'easy'),
('twk-uud-1945',
 'Cita-cita nasional bangsa Indonesia sebagaimana tercantum dalam alinea kedua Pembukaan UUD 1945 adalah negara yang …',
 'Merdeka, bersatu, berdaulat, adil, dan makmur', 'Melindungi, memajukan, mencerdaskan, dan menertibkan', 'Berdasarkan kemerdekaan, perdamaian abadi, dan keadilan sosial', 'Berbentuk republik yang berkedaulatan rakyat', 'Bebas dari penjajahan di seluruh dunia',
 'A', 'Alinea kedua memuat cita-cita nasional: negara Indonesia yang merdeka, bersatu, berdaulat, adil, dan makmur. Opsi B merupakan ringkasan tujuan negara pada alinea keempat, yang sering dijadikan pengecoh.', 'medium'),
('twk-uud-1945',
 'Sekelompok buruh menilai salah satu pasal dalam undang-undang ketenagakerjaan melanggar hak konstitusional mereka. Lembaga yang berwenang mengadili permohonan pengujian tersebut adalah …',
 'Mahkamah Agung', 'Komisi Yudisial', 'Dewan Perwakilan Rakyat', 'Majelis Permusyawaratan Rakyat', 'Mahkamah Konstitusi',
 'E', 'Pengujian undang-undang terhadap UUD 1945 merupakan kewenangan Mahkamah Konstitusi (Pasal 24C). Mahkamah Agung menguji peraturan di bawah undang-undang terhadap undang-undang.', 'medium'),
('twk-uud-1945',
 'Warga sebuah kota menilai peraturan daerah tentang retribusi parkir bertentangan dengan undang-undang tentang pajak dan retribusi daerah. Pengujian peraturan daerah tersebut menjadi kewenangan …',
 'Mahkamah Konstitusi', 'Komisi Yudisial', 'Mahkamah Agung', 'Badan Pemeriksa Keuangan', 'Dewan Perwakilan Daerah',
 'C', 'Mahkamah Agung berwenang menguji peraturan perundang-undangan di bawah undang-undang terhadap undang-undang (Pasal 24A). Mahkamah Konstitusi hanya menguji undang-undang terhadap UUD.', 'medium'),
('twk-uud-1945',
 'Menurut Pasal 14 UUD 1945, Presiden memberi grasi dan rehabilitasi dengan memperhatikan pertimbangan …',
 'Dewan Perwakilan Rakyat', 'Mahkamah Konstitusi', 'Majelis Permusyawaratan Rakyat', 'Mahkamah Agung', 'Komisi Yudisial',
 'D', 'Grasi dan rehabilitasi diberikan dengan memperhatikan pertimbangan Mahkamah Agung, sedangkan amnesti dan abolisi dengan memperhatikan pertimbangan DPR. Pasangan ini sering sengaja ditukar dalam opsi.', 'medium'),
('twk-uud-1945',
 'Menurut Pasal 37 UUD 1945, sidang MPR untuk mengubah pasal-pasal UUD harus dihadiri oleh sekurang-kurangnya …',
 '1/3 dari jumlah anggota MPR', '2/3 dari jumlah anggota MPR', '1/2 dari jumlah anggota MPR', '3/4 dari jumlah anggota MPR', 'Seluruh anggota MPR',
 'B', 'Usul perubahan diajukan sekurang-kurangnya 1/3 anggota MPR, sidang dihadiri sekurang-kurangnya 2/3 anggota, dan putusan disetujui sekurang-kurangnya 50% ditambah satu dari seluruh anggota MPR.', 'medium'),
('twk-uud-1945',
 'Berikut ini yang tidak termasuk hak asasi yang tidak dapat dikurangi dalam keadaan apa pun menurut Pasal 28I ayat (1) UUD 1945 adalah …',
 'Hak untuk hidup', 'Hak untuk tidak disiksa', 'Hak beragama', 'Hak untuk tidak dituntut atas dasar hukum yang berlaku surut', 'Hak untuk berserikat dan berkumpul',
 'E', 'Hak berserikat dan berkumpul dijamin Pasal 28E ayat (3), tetapi dapat dibatasi dengan undang-undang sesuai Pasal 28J ayat (2). Hak untuk hidup, tidak disiksa, beragama, dan tidak dituntut berdasarkan hukum yang berlaku surut termasuk non-derogable rights.', 'hard'),
('twk-uud-1945',
 'Pemerintah kabupaten menghapus seluruh pungutan di sekolah dasar negeri agar setiap anak dapat menyelesaikan pendidikan dasar. Kebijakan ini sejalan dengan amanat UUD 1945 …',
 'Pasal 31 ayat (2)', 'Pasal 31 ayat (4)', 'Pasal 32 ayat (1)', 'Pasal 33 ayat (1)', 'Pasal 34 ayat (1)',
 'A', 'Pasal 31 ayat (2) menyatakan setiap warga negara wajib mengikuti pendidikan dasar dan pemerintah wajib membiayainya. Ayat (4) mengatur anggaran pendidikan minimal 20 persen dari APBN dan APBD.', 'medium'),
('twk-uud-1945',
 'Bunyi Pasal 33 ayat (3) UUD 1945 adalah …',
 'Perekonomian disusun sebagai usaha bersama berdasar atas asas kekeluargaan', 'Fakir miskin dan anak-anak terlantar dipelihara oleh negara', 'Bumi dan air dan kekayaan alam yang terkandung di dalamnya dikuasai oleh negara dan dipergunakan untuk sebesar-besar kemakmuran rakyat', 'Negara mengembangkan sistem jaminan sosial bagi seluruh rakyat', 'Cabang-cabang produksi yang penting bagi negara dikuasai oleh negara',
 'C', 'Pasal 33 ayat (3) mengatur penguasaan bumi, air, dan kekayaan alam oleh negara untuk sebesar-besar kemakmuran rakyat. Opsi A adalah ayat (1), opsi E inti ayat (2), sedangkan opsi B dan D berasal dari Pasal 34.', 'easy'),
('twk-uud-1945',
 'Menurut Pasal 22C UUD 1945, jumlah seluruh anggota Dewan Perwakilan Daerah …',
 'Sama dengan jumlah anggota DPR', 'Paling sedikit setengah jumlah anggota DPR', 'Ditentukan oleh masing-masing gubernur', 'Tidak lebih dari sepertiga jumlah anggota DPR', 'Dua orang dari setiap kabupaten/kota',
 'D', 'Anggota DPD dipilih dari setiap provinsi dengan jumlah yang sama untuk tiap provinsi, dan jumlah seluruhnya tidak lebih dari sepertiga jumlah anggota DPR.', 'medium'),
('twk-uud-1945',
 'Apabila Presiden dan Wakil Presiden mangkat, berhenti, diberhentikan, atau tidak dapat melakukan kewajibannya secara bersamaan, pelaksana tugas kepresidenan menurut Pasal 8 ayat (3) UUD 1945 adalah …',
 'Menteri Luar Negeri, Menteri Dalam Negeri, dan Menteri Pertahanan secara bersama-sama', 'Ketua MPR', 'Ketua DPR bersama Ketua DPD', 'Ketua Mahkamah Konstitusi', 'Menteri Sekretaris Negara',
 'A', 'Pasal 8 ayat (3) menetapkan pelaksana tugas kepresidenan adalah Menteri Luar Negeri, Menteri Dalam Negeri, dan Menteri Pertahanan secara bersama-sama, hingga MPR memilih Presiden dan Wakil Presiden dari pasangan calon yang diusulkan partai politik atau gabungan partai politik.', 'hard'),
('twk-uud-1945',
 'Perubahan pertama UUD 1945 disahkan oleh MPR pada tahun …',
 '1998', '1999', '2000', '2001', '2002',
 'B', 'Perubahan UUD 1945 dilakukan empat kali: pertama 1999, kedua 2000, ketiga 2001, dan keempat 2002. Tahun 1998 adalah awal reformasi, bukan tahun perubahan UUD.', 'medium'),
('twk-uud-1945',
 'Mahkamah Konstitusi memiliki sembilan hakim konstitusi yang ditetapkan oleh Presiden. Pihak yang masing-masing mengajukan tiga orang hakim konstitusi adalah …',
 'MA, Komisi Yudisial, dan DPR', 'DPR, DPD, dan Presiden', 'MA, DPR, dan Presiden', 'MPR, DPR, dan MA', 'Komisi Yudisial, DPR, dan Presiden',
 'C', 'Pasal 24C ayat (3) menyatakan sembilan hakim konstitusi diajukan masing-masing tiga orang oleh Mahkamah Agung, tiga orang oleh DPR, dan tiga orang oleh Presiden. Komisi Yudisial berperan mengusulkan pengangkatan hakim agung, bukan hakim konstitusi.', 'hard'),

-- ================================= NKRI =====================================
('twk-nkri',
 'Deklarasi yang menyatakan bahwa laut di sekitar, di antara, dan di dalam kepulauan Indonesia merupakan satu kesatuan wilayah diumumkan pada …',
 '17 Agustus 1945', '27 Desember 1949', '13 Desember 1957', '5 Juli 1959', '10 Desember 1982',
 'C', 'Deklarasi Djuanda diumumkan pada 13 Desember 1957 oleh Perdana Menteri Djuanda Kartawidjaja dan kini diperingati sebagai Hari Nusantara. Konsep ini kemudian diakui dalam UNCLOS 1982.', 'easy'),
('twk-nkri',
 'Semboyan Bhinneka Tunggal Ika berasal dari kitab …',
 'Negarakertagama karya Mpu Prapanca', 'Arjunawiwaha karya Mpu Kanwa', 'Pararaton', 'Bharatayuddha karya Mpu Sedah dan Mpu Panuluh', 'Sutasoma karya Mpu Tantular',
 'E', 'Semboyan Bhinneka Tunggal Ika diambil dari kitab Sutasoma karya Mpu Tantular pada masa Majapahit. Negarakertagama karya Mpu Prapanca juga dari masa Majapahit sehingga sering menjadi pengecoh.', 'easy'),
('twk-nkri',
 'Berdasarkan UNCLOS 1982, lebar laut teritorial suatu negara pantai diukur dari garis pangkal adalah paling jauh …',
 '12 mil laut', '3 mil laut', '24 mil laut', '100 mil laut', '200 mil laut',
 'A', 'Laut teritorial paling jauh 12 mil laut dari garis pangkal. Batas 3 mil berlaku pada masa aturan kolonial 1939, 24 mil adalah batas zona tambahan, dan 200 mil adalah batas Zona Ekonomi Eksklusif.', 'medium'),
('twk-nkri',
 'Pemerintah membangun jalur logistik laut terjadwal agar harga kebutuhan pokok di wilayah timur Indonesia tidak jauh berbeda dengan di wilayah barat. Kebijakan ini merupakan implementasi Wawasan Nusantara dalam aspek …',
 'Kesatuan politik', 'Kesatuan pertahanan dan keamanan', 'Kesatuan sosial budaya', 'Kesatuan ekonomi', 'Kesatuan ideologi',
 'D', 'Pemerataan harga dan pembangunan ekonomi antarwilayah adalah wujud kesatuan ekonomi, yaitu kekayaan dan hasil pembangunan dinikmati secara adil di seluruh wilayah. Ideologi bukan salah satu dari empat aspek kesatuan Wawasan Nusantara.', 'medium'),
('twk-nkri',
 'Berikut ini yang merupakan isi Dekrit Presiden 5 Juli 1959 adalah …',
 'Pembubaran DPR hasil Pemilu 1955 dan pembentukan RIS', 'Pembubaran Konstituante dan berlakunya kembali UUD 1945', 'Berlakunya UUD Sementara 1950 dan pembentukan MPRS', 'Pembentukan Komite Nasional Indonesia Pusat', 'Penggantian sistem presidensial menjadi parlementer',
 'B', 'Dekrit 5 Juli 1959 berisi pembubaran Konstituante, berlakunya kembali UUD 1945 dan tidak berlakunya UUDS 1950, serta pembentukan MPRS dan DPAS. Dekrit justru mengakhiri sistem parlementer UUDS 1950.', 'medium'),
('twk-nkri',
 'Salah satu hasil Konferensi Meja Bundar (KMB) tahun 1949 adalah …',
 'Belanda mengakui wilayah RI secara de facto atas Jawa, Madura, dan Sumatra', 'Pembentukan negara kesatuan dengan UUDS 1950', 'Masalah Irian Barat akan diselesaikan kemudian', 'Pengembalian para pemimpin RI ke Yogyakarta', 'Penetapan garis demarkasi Van Mook',
 'C', 'KMB menghasilkan penyerahan kedaulatan kepada RIS dan menunda penyelesaian masalah Irian Barat. Pengakuan de facto atas Jawa, Madura, dan Sumatra adalah hasil Linggarjati, garis Van Mook terkait Renville, dan pengembalian pemimpin RI ke Yogyakarta adalah hasil Roem-Royen.', 'medium'),
('twk-nkri',
 'Pemerintah kota menetapkan peraturan daerah tentang pengelolaan sampah rumah tangga dan melaksanakannya dengan anggaran daerah. Hal ini merupakan wujud asas …',
 'Desentralisasi', 'Dekonsentrasi', 'Tugas pembantuan', 'Sentralisasi', 'Sistem presidensial',
 'A', 'Pengelolaan sampah merupakan urusan yang telah diserahkan kepada daerah, sehingga daerah mengatur dan mengurusnya sendiri berdasarkan asas desentralisasi. Dekonsentrasi adalah pelimpahan kepada gubernur sebagai wakil pusat atau instansi vertikal.', 'medium'),
('twk-nkri',
 'Urusan pemerintahan berikut yang termasuk urusan absolut sehingga sepenuhnya menjadi kewenangan pemerintah pusat adalah …',
 'Pendidikan', 'Kesehatan', 'Pekerjaan umum', 'Perhubungan', 'Politik luar negeri',
 'E', 'Urusan absolut meliputi politik luar negeri, pertahanan, keamanan, yustisi, moneter dan fiskal nasional, serta agama. Pendidikan, kesehatan, pekerjaan umum, dan perhubungan adalah urusan konkuren yang dibagi antara pusat dan daerah.', 'easy'),
('twk-nkri',
 'Pelimpahan sebagian urusan pemerintahan yang menjadi kewenangan pemerintah pusat kepada gubernur sebagai wakil pemerintah pusat disebut …',
 'Desentralisasi', 'Otonomi khusus', 'Tugas pembantuan', 'Dekonsentrasi', 'Sentralisasi',
 'D', 'Dekonsentrasi adalah pelimpahan urusan pusat kepada gubernur sebagai wakil pemerintah pusat, instansi vertikal, atau pejabat tertentu. Desentralisasi adalah penyerahan urusan kepada daerah otonom, sedangkan tugas pembantuan adalah penugasan untuk melaksanakan sebagian urusan pihak yang menugaskan.', 'hard'),
('twk-nkri',
 'Tujuan utama Serangan Umum 1 Maret 1949 di Yogyakarta adalah …',
 'Merebut dan menguasai Yogyakarta secara permanen', 'Menunjukkan kepada dunia internasional bahwa Republik Indonesia dan TNI masih ada', 'Membebaskan Soekarno dan Hatta dari tahanan', 'Membubarkan negara-negara bagian bentukan Belanda', 'Membentuk Pemerintah Darurat Republik Indonesia',
 'B', 'Serangan Umum 1 Maret 1949 bertujuan politis dan psikologis, yaitu membuktikan eksistensi RI dan TNI kepada dunia sehingga memperkuat posisi diplomasi. PDRI telah dibentuk sebelumnya, pada Desember 1948.', 'medium'),
('twk-nkri',
 'Kapal nelayan berbendera asing kedapatan menangkap ikan tanpa izin di Zona Ekonomi Eksklusif Indonesia. Pernyataan yang paling tepat mengenai kasus ini adalah …',
 'Tidak ada pelanggaran karena ZEE merupakan laut bebas', 'Indonesia memiliki kedaulatan penuh atas ZEE sehingga kapal asing dilarang melintas', 'Indonesia memiliki hak berdaulat atas sumber daya alam di ZEE sehingga penangkapan ikan tanpa izin melanggar hak tersebut', 'Kasus ini hanya dapat ditangani jika kapal masuk ke laut teritorial', 'Penangkapan ikan di ZEE diperbolehkan bagi semua negara anggota PBB',
 'C', 'Di ZEE, Indonesia memiliki hak berdaulat untuk mengeksplorasi dan memanfaatkan sumber daya alam, bukan kedaulatan penuh. Kapal asing tetap boleh berlayar, tetapi tidak boleh mengambil sumber daya tanpa izin.', 'hard'),
('twk-nkri',
 'Dalam konsep astagatra, unsur-unsur yang termasuk trigatra (aspek alamiah) adalah …',
 'Ideologi, politik, dan ekonomi', 'Ekonomi, sosial budaya, dan pertahanan keamanan', 'Politik, hukum, dan keamanan', 'Wilayah, rakyat, dan pemerintahan', 'Geografi, kekayaan alam, dan kependudukan',
 'E', 'Trigatra adalah aspek alamiah: geografi, kekayaan alam, dan kependudukan. Ideologi, politik, ekonomi, sosial budaya, dan pertahanan keamanan termasuk pancagatra (aspek sosial). Opsi D adalah unsur berdirinya negara.', 'medium'),

-- ============================ KAIDAH BAHASA =================================
('twk-kaidah-bahasa',
 'Kalimat yang seluruh katanya baku adalah …',
 'Petugas memberikan ijin kepada atlit yang terlambat.', 'Kami menganalisa resiko kebijakan itu secara seksama.', 'Silahkan isi formulir sesuai jadual yang tersedia.', 'Kepala dinas mengimbau warga agar antre dengan tertib.', 'Hasil praktek siswa itu kurang efektip.',
 'D', 'Opsi D seluruhnya baku: mengimbau dan antre. Kata tidak baku pada opsi lain adalah ijin dan atlit (A), menganalisa, resiko, dan seksama (B), silahkan dan jadual (C), serta praktek dan efektip (E).', 'easy'),
('twk-kaidah-bahasa',
 'Penulisan huruf kapital yang sesuai dengan kaidah EYD terdapat pada kalimat …',
 'Ayah saya baru saja diangkat menjadi Bupati.', 'Bupati Sleman meresmikan pasar tradisional itu.', 'Kami berwisata ke danau Toba bersama keluarga.', 'Ia rajin belajar bahasa inggris setiap malam.', 'Paman pergi Haji tahun ini.',
 'B', 'Jabatan yang diikuti nama tempat atau instansi ditulis kapital, seperti Bupati Sleman. Pada A, bupati tidak diikuti nama sehingga ditulis kecil; C seharusnya Danau Toba; D seharusnya bahasa Inggris; dan E haji tidak diikuti nama sehingga ditulis kecil.', 'easy'),
('twk-kaidah-bahasa',
 'Penggunaan tanda koma yang tepat terdapat pada kalimat …',
 'Kami tidak akan berangkat, jika hujan belum reda.', 'Ia mengatakan, bahwa rapat ditunda.', 'Adik membeli buku pensil, dan penghapus.', 'Oleh karena itu kita harus berhati-hati.', 'Meskipun lelah, para relawan tetap membagikan bantuan.',
 'E', 'Koma dipakai untuk memisahkan anak kalimat yang mendahului induk kalimat, seperti pada opsi E. Opsi A keliru karena induk kalimat berada di depan, B karena koma tidak dipakai sebelum bahwa, C karena perincian tidak dipisah dengan benar, dan D tidak memakai koma sesudah ungkapan penghubung antarkalimat oleh karena itu.', 'medium'),
('twk-kaidah-bahasa',
 'Kalimat berikut yang efektif adalah …',
 'Peserta yang terlambat diminta melapor ke panitia.', 'Bagi peserta yang terlambat diminta melapor ke panitia.', 'Di dalam rapat itu membahas anggaran tahun depan.', 'Menurut para ahli-ahli ekonomi mengatakan inflasi akan turun.', 'Kepada para hadirin dimohon untuk berdiri.',
 'A', 'Opsi A memiliki subjek (peserta yang terlambat) dan predikat (diminta) yang jelas. Opsi B dan C kehilangan subjek karena diawali kata depan, D tidak memiliki subjek jelas dan boros (para ahli-ahli), sedangkan E boros dan diawali kata depan.', 'medium'),
('twk-kaidah-bahasa',
 'Kalimat berikut yang tidak mengandung pemborosan kata adalah …',
 'Para hadirin dipersilakan naik ke atas panggung.', 'Kita harus bekerja keras agar supaya target tercapai.', 'Sejak awal tahun, kinerja unit itu terus membaik.', 'Banyak siswa-siswa yang mengikuti lomba itu.', 'Pemandangan di puncak bukit itu sangat indah sekali.',
 'C', 'Opsi C hemat dan logis. Pemborosan terdapat pada para hadirin dan naik ke atas (A), agar supaya (B), banyak siswa-siswa (D), dan sangat indah sekali (E).', 'medium'),
('twk-kaidah-bahasa',
 'Bacalah paragraf berikut. "Petani di desa itu mulai memakai pupuk organik buatan sendiri. Mereka juga membentuk kelompok untuk membeli benih bersama. Saluran irigasi diperbaiki secara gotong royong. Dengan demikian, hasil panen desa itu meningkat dua kali lipat dalam dua tahun." Jenis paragraf tersebut berdasarkan letak gagasan utamanya adalah …',
 'Deduktif', 'Campuran', 'Deskriptif', 'Induktif', 'Ineratif',
 'D', 'Gagasan utama, yaitu meningkatnya hasil panen, terletak di akhir paragraf dan didahului penanda simpulan dengan demikian. Paragraf yang bergerak dari rincian khusus menuju simpulan umum disebut paragraf induktif.', 'medium'),
('twk-kaidah-bahasa',
 'Bacalah paragraf berikut. "Banyak kantor pemerintahan kini menerapkan layanan berbasis digital. Warga dapat mengurus dokumen kependudukan dari rumah melalui aplikasi. Antrean di loket berkurang dan waktu penyelesaian lebih singkat. Biaya transportasi warga pun dapat ditekan." Gagasan utama paragraf tersebut adalah …',
 'Warga dapat mengurus dokumen dari rumah', 'Penerapan layanan digital di kantor pemerintahan', 'Antrean di loket berkurang', 'Biaya transportasi warga dapat ditekan', 'Waktu penyelesaian dokumen lebih singkat',
 'B', 'Kalimat pertama bersifat paling umum dan dijelaskan oleh kalimat-kalimat sesudahnya, sehingga gagasan utamanya adalah penerapan layanan digital di kantor pemerintahan. Opsi lain merupakan rincian atau dampak yang menjadi kalimat penjelas.', 'medium'),
('twk-kaidah-bahasa',
 'Antonim kata eksplisit adalah …',
 'Implisit', 'Gamblang', 'Tersurat', 'Jelas', 'Konkret',
 'A', 'Eksplisit berarti tersurat atau dinyatakan secara jelas, sehingga lawan katanya adalah implisit (tersirat). Gamblang, tersurat, dan jelas justru bersinonim dengan eksplisit.', 'easy'),
('twk-kaidah-bahasa',
 'Pasangan kata berikut yang merupakan homofon adalah …',
 'Apel (buah) dan apel (upacara)', 'Bisa (racun) dan bisa (mampu)', 'Besar dan kecil', 'Pandai dan cerdas', 'Sanksi (hukuman) dan sangsi (ragu)',
 'E', 'Homofon adalah kata yang bunyinya sama atau hampir sama tetapi tulisan dan maknanya berbeda, seperti sanksi dan sangsi. Opsi A adalah homograf, B homonim, C antonim, dan D sinonim.', 'medium'),
('twk-kaidah-bahasa',
 'Penulisan gabungan kata yang benar terdapat pada kalimat …',
 'Setiap pegawai harus mempertanggung jawabkan penggunaan anggaran.', 'Ia bertanggungjawab atas keberhasilan acara itu.', 'Laporan itu harus dipertanggungjawabkan kepada pimpinan.', 'Panitia akan melipat gandakan jumlah hadiah.', 'Kerja sama antar instansi perlu ditingkatkan.',
 'C', 'Gabungan kata yang mendapat awalan dan akhiran sekaligus ditulis serangkai, seperti dipertanggungjawabkan. Opsi A dan D seharusnya serangkai (mempertanggungjawabkan, melipatgandakan), B seharusnya terpisah (bertanggung jawab) karena hanya berawalan, dan E seharusnya antarinstansi.', 'hard'),
('twk-kaidah-bahasa',
 'Kalimat "Tugas tim ini meliputi pengumpulan data, menganalisis hasil survei, dan pelaporan kepada pimpinan." tidak efektif karena tidak sejajar. Perbaikan yang tepat adalah …',
 'Tugas tim ini meliputi mengumpulkan data, analisis hasil survei, dan melaporkan kepada pimpinan.', 'Tugas tim ini meliputi pengumpulan data, menganalisis hasil survei, serta pelaporan kepada pimpinan.', 'Tugas tim ini adalah meliputi pengumpulan data, penganalisisan hasil survei, dan pelaporan kepada pimpinan.', 'Tugas tim ini meliputi pengumpulan data, penganalisisan hasil survei, dan pelaporan kepada pimpinan.', 'Tugas tim ini meliputi pengumpulan data, dianalisis hasil survei, dan dilaporkan kepada pimpinan.',
 'D', 'Unsur yang setara harus memakai bentuk yang sama. Opsi D menggunakan bentuk nomina pe-an secara konsisten. Opsi A dan E tetap tidak sejajar, B tidak mengubah apa pun, dan C mengandung pemborosan adalah meliputi.', 'hard'),
('twk-kaidah-bahasa',
 'Penulisan kata depan dan awalan yang benar terdapat pada kalimat …',
 'Surat itu ditulis di ruang rapat.', 'Surat itu di tulis diruang rapat.', 'Dimana berkas itu disimpan?', 'Ia pergi kepasar setelah dibangunkan ibunya.', 'Buku itu di letakkan di atas meja.',
 'A', 'Awalan di- pada ditulis dirangkai dengan kata dasarnya, sedangkan kata depan di pada di ruang rapat ditulis terpisah. Pada opsi lain terdapat kesalahan: di tulis dan diruang (B), dimana (C), kepasar (D), dan di letakkan (E).', 'medium'),
('twk-kaidah-bahasa',
 'Bacalah paragraf berikut. "Sampah plastik membutuhkan ratusan tahun untuk terurai. Karena itu, mari kita mulai membawa tas belanja dan botol minum sendiri. Kebiasaan kecil ini, jika dilakukan bersama, akan menyelamatkan lingkungan bagi anak cucu kita." Jenis paragraf tersebut adalah …',
 'Narasi', 'Persuasi', 'Deskripsi', 'Eksposisi', 'Argumentasi',
 'B', 'Paragraf tersebut mengajak pembaca melakukan tindakan tertentu dengan penanda kata mari, sehingga termasuk persuasi. Argumentasi bertujuan meyakinkan pembaca dengan bukti agar setuju, bukan mengajak bertindak.', 'medium'),
('twk-kaidah-bahasa',
 'Kata sarjana dahulu bermakna orang cerdik pandai, sedangkan sekarang lebih banyak dipakai untuk menyebut lulusan perguruan tinggi. Perubahan makna tersebut disebut …',
 'Generalisasi', 'Ameliorasi', 'Spesialisasi', 'Peyorasi', 'Sinestesia',
 'C', 'Makna kata sarjana menyempit dari cendekiawan secara umum menjadi lulusan perguruan tinggi, sehingga termasuk spesialisasi. Generalisasi adalah perluasan makna, sedangkan ameliorasi dan peyorasi berkaitan dengan perubahan nilai rasa.', 'hard');

insert into public.questions (test_code, subtopic_id, stem, options, explanation, difficulty, usage, status, source, year)
select 'TWK', s.id, v.stem,
       jsonb_build_array(
         jsonb_build_object('label','A','text',v.a,'points',case when v.k = 'A' then 5 else 0 end),
         jsonb_build_object('label','B','text',v.b,'points',case when v.k = 'B' then 5 else 0 end),
         jsonb_build_object('label','C','text',v.c,'points',case when v.k = 'C' then 5 else 0 end),
         jsonb_build_object('label','D','text',v.d,'points',case when v.k = 'D' then 5 else 0 end),
         jsonb_build_object('label','E','text',v.e,'points',case when v.k = 'E' then 5 else 0 end)),
       v.expl, v.diff, 'both', 'published', 'SiapASN original', 2026
from _twk_q v
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
