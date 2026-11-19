-- ============================================================================
-- SiapASN — Konten TWK (Tes Wawasan Kebangsaan) — Putaran 2
-- Sub-topik baru (Sejarah Pergerakan, Wawasan Nusantara & Ketahanan Nasional,
-- Sistem Pemerintahan & Lembaga Negara, Pemahaman Bacaan), materi tambahan
-- untuk seluruh sub-topik TWK, dan bank soal orisinal baru.
-- Idempoten: sub-topik & lessons memakai ON CONFLICT (slug), soal memakai
-- NOT EXISTS (stem).
-- ============================================================================

begin;

-- ---------------------------------------------------------------------------
-- SUB-TOPIK BARU
-- ---------------------------------------------------------------------------
insert into public.subtopics (topic_id, name, slug, sort_order)
select t.id, v.name, v.slug, v.sort_order
from (values
  ('twk-nasionalisme',     'Sejarah Pergerakan & Kemerdekaan',          'twk-sejarah-pergerakan',  4),
  ('twk-pilar-negara',     'Wawasan Nusantara & Ketahanan Nasional',    'twk-wawasan-nusantara',   4),
  ('twk-pilar-negara',     'Sistem Pemerintahan & Lembaga Negara',      'twk-sistem-pemerintahan', 5),
  ('twk-bahasa-indonesia', 'Pemahaman Bacaan',                          'twk-pemahaman-bacaan',    2)
) as v(topic, name, slug, sort_order)
join public.topics t on t.slug = v.topic
on conflict (slug) do nothing;

-- ---------------------------------------------------------------------------
-- LESSONS
-- ---------------------------------------------------------------------------
insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values

-- ======================= SEJARAH PERGERAKAN ================================
('twk-sejarah-pergerakan', 'Kolonialisme dan Perlawanan Daerah sebelum 1908', 'twk-kolonialisme-perlawanan-daerah',
 'Garis besar praktik kolonial dari VOC hingga Politik Etis, perlawanan daerah melawan penjajah, serta alasan perlawanan tersebut belum berhasil.',
$md$
## Mengapa masa kolonial diuji di TWK?

Soal sejarah di TWK jarang sekadar menanyakan tahun. Yang lebih sering diuji adalah **pemahaman sebab-akibat**: mengapa bangsa Indonesia dijajah begitu lama, mengapa perlawanan daerah selalu dipatahkan, dan pelajaran apa yang membuat para tokoh kemudian beralih ke perjuangan terorganisasi. Dengan memahami pola ini, Anda bisa menjawab soal analisis tanpa harus menghafal semua detail.

## Tahapan praktik kolonial

| Periode | Penguasa/kebijakan | Ciri utama |
| --- | --- | --- |
| 1602–1799 | **VOC** (kongsi dagang Belanda) | Diberi hak istimewa (hak oktroi) seperti monopoli dagang, mencetak uang, dan membuat perjanjian; dibubarkan akhir 1799 karena korupsi dan utang |
| 1808–1811 | **Daendels** | Membangun Jalan Raya Pos Anyer–Panarukan dengan kerja paksa (rodi) |
| 1811–1816 | **Raffles** (Inggris) | Menerapkan sistem sewa tanah (*landrent*) |
| 1830–1870 | **Tanam Paksa** (*cultuurstelsel*), digagas Van den Bosch | Rakyat wajib menyisihkan sebagian tanah untuk tanaman ekspor; dalam praktik menimbulkan kelaparan dan penderitaan |
| 1870 | **Undang-Undang Agraria** | Membuka pintu bagi modal swasta asing; rakyat menjadi buruh di perkebunan |
| 1901 | **Politik Etis** | Gagasan "utang budi" Belanda; programnya irigasi, emigrasi, dan edukasi |

Politik Etis penting karena **dampaknya tidak terduga**: program edukasi melahirkan golongan terpelajar bumiputra. Golongan inilah yang kelak memelopori organisasi pergerakan modern sejak 1908.

> **Tips ujian:** Jika soal menanyakan "dampak positif yang tidak disengaja dari Politik Etis", jawabannya hampir selalu **lahirnya kaum terpelajar yang memimpin pergerakan nasional**, bukan kesejahteraan rakyat (yang justru tidak banyak berubah).

## Perlawanan daerah yang sering muncul

| Perlawanan | Tokoh | Catatan penting |
| --- | --- | --- |
| Serangan Mataram ke Batavia (1628 dan 1629) | Sultan Agung | Gagal karena jarak jauh dan lumbung perbekalan dihancurkan VOC |
| Perlawanan Gowa | Sultan Hasanuddin ("Ayam Jantan dari Timur") | Berakhir dengan Perjanjian Bongaya (1667) yang merugikan Gowa |
| Perlawanan di Saparua, Maluku (1817) | Pattimura (Thomas Matulessy) | Dipicu kesewenang-wenangan pemerintah kolonial |
| Perang Padri (1821–1837) | Tuanku Imam Bonjol | Awalnya konflik internal, kemudian menjadi perlawanan bersama terhadap Belanda |
| Perang Diponegoro (1825–1830) | Pangeran Diponegoro | Belanda memakai siasat *benteng stelsel*; Diponegoro ditangkap melalui tipu daya perundingan |
| Perang Banjar (1859–1905) | Pangeran Antasari | Perlawanan rakyat Kalimantan Selatan |
| Perang Aceh (mulai 1873) | Teuku Umar, Cut Nyak Dhien, Cut Meutia | Perang panjang; Belanda memanfaatkan kajian Snouck Hurgronje tentang masyarakat Aceh |
| Perlawanan di Tanah Batak | Sisingamangaraja XII | Gugur pada 1907 |
| Puputan di Bali | Raja-raja Bali | *Puputan* berarti perang habis-habisan sampai titik darah penghabisan |

## Mengapa perlawanan sebelum 1908 belum berhasil?

1. **Bersifat kedaerahan.** Setiap daerah berjuang sendiri-sendiri untuk mempertahankan wilayahnya, belum atas nama satu bangsa.
2. **Bergantung pada pemimpin karismatik.** Begitu pemimpin ditangkap, gugur, atau diasingkan, perlawanan melemah.
3. **Mengandalkan kekuatan senjata.** Persenjataan dan organisasi militer kolonial jauh lebih unggul.
4. **Mudah dipecah belah.** Politik *devide et impera* memanfaatkan perselisihan antarkerajaan atau antarkelompok.
5. **Belum memiliki organisasi modern** dengan tujuan, anggaran dasar, dan kaderisasi.

Kelima kelemahan itu menjadi "kurikulum" bagi generasi berikutnya. Pergerakan sesudah 1908 berusaha menjawabnya: bersifat nasional, terorganisasi, mengutamakan pendidikan dan politik, serta tidak bergantung pada satu tokoh.

## Nilai yang dapat diteladani

- **Keberanian dan rela berkorban** demi martabat dan tanah kelahiran.
- **Kesetiaan pada prinsip**, misalnya menolak tunduk walaupun ditawari kedudukan.
- **Pelajaran persatuan**: kekuatan sebesar apa pun mudah dikalahkan bila terpecah.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Belanda membangun benteng-benteng kecil di setiap wilayah yang berhasil dikuasai untuk mempersempit ruang gerak pasukan lawan. Siasat ini dipakai dalam perang …*

Penalaran: siasat itu dikenal sebagai **benteng stelsel** dan identik dengan **Perang Diponegoro**. Jangan tertukar dengan Perang Aceh, yang identik dengan pemanfaatan kajian Snouck Hurgronje.

**Contoh 2.** *Pelajaran terpenting dari kegagalan perlawanan daerah bagi kehidupan berbangsa saat ini adalah …*

Penalaran: pilih jawaban yang menekankan **persatuan dan perjuangan terorganisasi**. Opsi seperti "pentingnya memiliki senjata modern" terlalu sempit dan tidak relevan dengan nilai kebangsaan.

**Contoh 3.** *Seorang kepala desa memanfaatkan perselisihan dua dusun untuk memperkuat kekuasaannya sendiri. Cara ini mirip dengan politik …*

Penalaran: memecah lalu menguasai adalah inti **devide et impera**.

## Dampak tanam paksa dan kritik terhadapnya

Tanam paksa memberi keuntungan besar bagi kas Belanda, tetapi menyengsarakan rakyat: lahan pangan berkurang, beban kerja berat, dan kelaparan terjadi di sejumlah daerah. Kritik justru datang juga dari kalangan Belanda sendiri. Eduard Douwes Dekker, dengan nama pena Multatuli, menulis novel *Max Havelaar* (1860) yang menggambarkan penderitaan rakyat Lebak, Banten. Kritik semacam ini ikut mendorong pemerintah kolonial mengakhiri tanam paksa dan, kelak, memunculkan gagasan Politik Etis. Pelajarannya: kebenaran dapat diperjuangkan melalui tulisan dan opini publik, bukan hanya senjata.

## Ringkasan

- Praktik kolonial bergerak dari monopoli VOC, kerja rodi, tanam paksa, ekonomi liberal, hingga Politik Etis.
- Politik Etis (irigasi, emigrasi, edukasi) melahirkan kaum terpelajar yang memimpin pergerakan.
- Perlawanan daerah gagal karena kedaerahan, bergantung pada tokoh, mengandalkan senjata, mudah dipecah belah, dan belum terorganisasi.
- Nilai utama yang diwariskan: keberanian, rela berkorban, dan kesadaran akan pentingnya persatuan.

## Tips mengerjakan soal

- Hafalkan pasangan **tokoh–daerah–ciri khas** (Diponegoro–benteng stelsel, Aceh–Snouck Hurgronje, Gowa–Bongaya).
- Untuk soal "mengapa gagal", cari opsi yang menyebut sifat **kedaerahan** atau **belum terorganisasi**.
- Hindari opsi yang menyalahkan rakyat atau tokoh; soal TWK menilai pemahaman nilai, bukan menghakimi.
$md$, true, 1, 13),

('twk-sejarah-pergerakan', 'Organisasi Pergerakan Nasional 1908–1942', 'twk-organisasi-pergerakan-nasional',
 'Organisasi pergerakan nasional dari Budi Utomo hingga GAPI, perbedaan strategi kooperatif dan nonkooperatif, serta Kongres Pemuda.',
$md$
## Babak baru: perjuangan terorganisasi

Sejak awal abad ke-20, perjuangan melawan penjajahan berubah wajah. Kaum terpelajar mendirikan **organisasi modern** yang memiliki tujuan tertulis, pengurus, anggota, dan program kerja. Perjuangan tidak lagi bersifat kedaerahan, tetapi mulai diarahkan pada **kesadaran sebagai satu bangsa**.

## Organisasi penting dan cirinya

| Organisasi | Berdiri | Tokoh | Ciri utama |
| --- | --- | --- | --- |
| **Budi Utomo** | 20 Mei 1908, Jakarta | dr. Soetomo dan pelajar STOVIA, terinspirasi gagasan dr. Wahidin Soedirohoesodo | Bergerak di bidang sosial, budaya, dan pendidikan; awalnya terbatas pada masyarakat Jawa dan Madura |
| **Sarekat Islam** | Berkembang dari Sarekat Dagang Islam | H. Samanhudi, H.O.S. Tjokroaminoto | Berawal dari perhimpunan pedagang; menjadi organisasi massa yang besar |
| **Indische Partij** | 25 Desember 1912 | Tiga Serangkai: E.F.E. Douwes Dekker, dr. Tjipto Mangoenkoesoemo, Soewardi Soerjaningrat | Organisasi politik pertama yang terang-terangan mencita-citakan kemerdekaan; tidak berumur panjang karena dilarang |
| **Muhammadiyah** | 18 November 1912, Yogyakarta | K.H. Ahmad Dahlan | Pendidikan, kesehatan, dan pembaruan keagamaan |
| **Perhimpunan Indonesia** | Bermula di Belanda (1908), memakai nama ini sejak 1925 | Mohammad Hatta dan mahasiswa di Belanda | Mulai tegas memakai nama "Indonesia" dan menyuarakan kemerdekaan |
| **Taman Siswa** | 3 Juli 1922, Yogyakarta | Ki Hajar Dewantara | Pendidikan nasional yang berakar pada budaya sendiri |
| **Nahdlatul Ulama** | 31 Januari 1926, Surabaya | K.H. Hasyim Asy'ari | Organisasi keagamaan berbasis pesantren |
| **Partai Nasional Indonesia (PNI)** | 4 Juli 1927, Bandung | Ir. Soekarno | Bersikap nonkooperatif, tujuan Indonesia merdeka |
| **GAPI** | 1939 | Gabungan partai politik | Menyerukan "Indonesia Berparlemen" |

Satu tulisan terkenal dari masa ini adalah karangan Soewardi Soerjaningrat yang berjudul *"Als ik eens Nederlander was"* (Seandainya Aku Seorang Belanda). Tulisan itu menyindir rencana perayaan kemerdekaan Belanda di tanah jajahan yang justru dibiayai rakyat terjajah.

> **Tips ujian:** Budi Utomo sering disebut organisasi modern pertama dan tanggal berdirinya diperingati sebagai **Hari Kebangkitan Nasional**. Namun organisasi politik pertama yang secara tegas menuntut kemerdekaan adalah **Indische Partij**. Dua fakta ini sering dijadikan pengecoh.

## Strategi kooperatif dan nonkooperatif

| Aspek | Kooperatif | Nonkooperatif |
| --- | --- | --- |
| Sikap terhadap pemerintah kolonial | Mau bekerja sama, misalnya duduk dalam dewan buatan Belanda | Menolak bekerja sama |
| Tujuan | Perbaikan bertahap, termasuk pemerintahan sendiri | Kemerdekaan penuh |
| Contoh | Organisasi pada masa 1930-an seperti Parindra; Petisi Soetardjo (1936) | PNI, Perhimpunan Indonesia |

Mengapa pada 1930-an banyak organisasi beralih ke strategi kooperatif? Karena pemerintah kolonial bertindak sangat keras: tokoh-tokoh nonkooperatif ditangkap dan diasingkan, organisasinya dibatasi. Strategi kooperatif dipakai agar perjuangan **tetap hidup** dalam ruang yang sempit. Jadi, kooperatif tidak sama dengan berkhianat; itu adalah **taktik bertahan**.

## Kongres Pemuda dan Sumpah Pemuda

Organisasi pemuda awalnya juga bersifat kedaerahan, misalnya Jong Java, Jong Sumatranen Bond, Jong Ambon, dan Jong Celebes. Melalui **Kongres Pemuda I (1926)** dan **Kongres Pemuda II (27–28 Oktober 1928)**, para pemuda melebur semangat kedaerahan menjadi satu ikrar: satu tanah air, satu bangsa, dan menjunjung bahasa persatuan, Indonesia. Pada Kongres II pula lagu *Indonesia Raya* ciptaan W.R. Supratman pertama kali diperdengarkan.

## Nilai yang dapat diteladani

- **Mengutamakan pendidikan** sebagai jalan membebaskan bangsa.
- **Mengalahkan ego kedaerahan** demi persatuan.
- **Fleksibel dalam strategi, teguh dalam tujuan**: kooperatif atau nonkooperatif, tujuannya tetap kemajuan dan kemerdekaan bangsa.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pada akhir 1930-an, sejumlah partai bergabung dan menuntut dibentuknya parlemen yang dipilih rakyat. Gabungan itu adalah …*

Penalaran: tuntutan "Indonesia Berparlemen" adalah ciri **GAPI**. Jangan terkecoh dengan PPKI, yang baru dibentuk pada 1945.

**Contoh 2.** *Seorang pegawai muda memilih memperbaiki sistem dari dalam kantor walaupun banyak aturan yang belum ideal, ketimbang keluar dan mengkritik dari luar. Strategi ini analog dengan …*

Penalaran: bekerja di dalam sistem untuk melakukan perubahan bertahap adalah analogi **strategi kooperatif**.

**Contoh 3.** *Perbedaan utama Perhimpunan Indonesia dibandingkan Budi Utomo pada awal berdirinya adalah …*

Penalaran: Budi Utomo awalnya bergerak di bidang sosial-budaya dengan cakupan terbatas, sedangkan Perhimpunan Indonesia **bersifat politik dan tegas menuntut kemerdekaan**.

## Peran pers dan bahasa dalam pergerakan

Surat kabar menjadi alat perjuangan yang penting. *Medan Prijaji* yang dipimpin Tirto Adhi Soerjo dikenal sebagai pelopor pers milik bumiputra. Selain pers, organisasi pergerakan memanfaatkan rapat umum, sekolah, dan koperasi untuk menumbuhkan kesadaran. Bahasa Melayu, yang kemudian diikrarkan sebagai bahasa Indonesia, menjadi alat komunikasi lintas daerah sehingga gagasan kebangsaan dapat menyebar dari Sumatra hingga Maluku.

## Ringkasan

- 1908 menandai awal perjuangan terorganisasi yang bersifat nasional.
- Organisasi pergerakan bergerak di berbagai bidang: pendidikan, ekonomi, keagamaan, dan politik.
- Strategi kooperatif (bertahan) dan nonkooperatif (menolak kerja sama) sama-sama bagian dari perjuangan.
- Sumpah Pemuda 1928 menyatukan organisasi pemuda kedaerahan dalam satu identitas kebangsaan.

## Tips mengerjakan soal

- Kelompokkan organisasi berdasarkan **bidang gerak** (sosial, ekonomi, agama, politik); soal sering meminta ciri khas.
- Hafalkan **Tiga Serangkai** (Indische Partij) dan bedakan dengan **Empat Serangkai** (Putera, masa Jepang).
- Untuk soal analogi, cari kata kunci: "bekerja sama dengan pemerintah" berarti kooperatif, "menolak duduk di dewan" berarti nonkooperatif.
$md$, false, 2, 13),

('twk-sejarah-pergerakan', 'Pendudukan Jepang, Detik-Detik Proklamasi, dan Pertempuran Mempertahankan Kemerdekaan', 'twk-pendudukan-jepang-proklamasi',
 'Organisasi bentukan Jepang, peristiwa menjelang proklamasi dari Rengasdengklok hingga Pegangsaan Timur 56, serta pertempuran heroik di berbagai daerah.',
$md$
## Pendudukan Jepang (1942–1945)

Belanda menyerah tanpa syarat kepada Jepang pada **8 Maret 1942 di Kalijati, Subang**. Sejak saat itu Indonesia berada di bawah pendudukan militer Jepang. Jepang datang dengan propaganda sebagai "saudara tua" yang akan membebaskan Asia, tetapi dalam praktiknya mengerahkan rakyat untuk kepentingan perang.

### Organisasi bentukan Jepang

| Organisasi | Keterangan |
| --- | --- |
| **Gerakan 3A** | Propaganda "Nippon Pelindung Asia, Nippon Cahaya Asia, Nippon Pemimpin Asia"; kurang diminati rakyat |
| **Putera** (Pusat Tenaga Rakyat, 1943) | Dipimpin **Empat Serangkai**: Soekarno, Mohammad Hatta, Ki Hajar Dewantara, K.H. Mas Mansur; dimanfaatkan para tokoh untuk menanamkan semangat kebangsaan |
| **Jawa Hokokai** (1944) | Himpunan kebaktian rakyat Jawa, di bawah kendali langsung Jepang |
| **PETA** (Pembela Tanah Air, 1943) | Pasukan sukarela bumiputra; kelak banyak anggotanya menjadi inti tentara nasional |
| **Heiho** | Pembantu prajurit Jepang |
| **Seinendan dan Keibodan** | Barisan pemuda dan barisan pembantu polisi |
| **Romusha** | Pengerahan tenaga kerja paksa yang menimbulkan banyak korban |

Pemberontakan PETA di Blitar yang dipimpin **Supriyadi** (Februari 1945) menunjukkan bahwa latihan militer dari Jepang justru dipakai untuk melawan penindasan.

> **Tips ujian:** Dampak positif pendudukan Jepang yang sering ditanyakan: **pelatihan militer bagi pemuda**, makin luasnya **penggunaan bahasa Indonesia** (bahasa Belanda dilarang), dan kesempatan tokoh nasional berhubungan langsung dengan rakyat melalui organisasi resmi.

## Menjelang proklamasi

1. Posisi Jepang dalam Perang Pasifik terdesak. Jepang menjanjikan kemerdekaan dan membentuk **BPUPKI**, lalu **PPKI** (7 Agustus 1945).
2. Bom atom dijatuhkan di **Hiroshima (6 Agustus)** dan **Nagasaki (9 Agustus 1945)**. Jepang menyerah kepada Sekutu pada **15 Agustus 1945**, sehingga terjadi **kekosongan kekuasaan** (*vacuum of power*).
3. **Perbedaan pendapat.** Golongan muda (antara lain Sukarni, Wikana, Chaerul Saleh) mendesak proklamasi segera tanpa melibatkan Jepang. Golongan tua (Soekarno, Hatta) ingin membahasnya dulu melalui PPKI agar tidak terjadi pertumpahan darah.
4. **Peristiwa Rengasdengklok (16 Agustus 1945).** Golongan muda membawa Soekarno dan Hatta ke Rengasdengklok agar terhindar dari pengaruh Jepang. Ahmad Soebardjo kemudian menjemput keduanya dan memberi jaminan bahwa proklamasi akan dilaksanakan paling lambat keesokan harinya.
5. **Perumusan teks** dilakukan malam hari di rumah **Laksamana Tadashi Maeda** oleh Soekarno, Hatta, dan Ahmad Soebardjo. Naskah tulisan tangan diketik oleh **Sayuti Melik**. Atas usul Sukarni, naskah ditandatangani Soekarno–Hatta **atas nama bangsa Indonesia**.
6. **Pembacaan proklamasi**: Jumat, **17 Agustus 1945**, di **Jalan Pegangsaan Timur 56**, Jakarta. Bendera Merah Putih yang dikibarkan dijahit oleh **Fatmawati**.

### Perbedaan naskah klad dan naskah otentik

| Naskah tulisan tangan (klad) | Naskah ketikan (otentik) |
| --- | --- |
| "tempoe" | "tempo" |
| "wakil-wakil bangsa Indonesia" | "Atas nama bangsa Indonesia" |
| Penulisan tanggal ringkas | "hari 17 boelan 8 tahoen '05" (tahun Jepang 2605) |
| Tanpa tanda tangan | Ditandatangani Soekarno–Hatta |

## Mempertahankan kemerdekaan: pertempuran di berbagai daerah

| Peristiwa | Waktu | Catatan |
| --- | --- | --- |
| Pertempuran Lima Hari di Semarang | Oktober 1945 | Melibatkan pemuda melawan tentara Jepang |
| **Pertempuran Surabaya** | **10 November 1945** | Diperingati sebagai **Hari Pahlawan** |
| **Palagan Ambarawa** | Desember 1945 | Pasukan dipimpin Kolonel Soedirman; kemenangan diperingati sebagai Hari Juang (15 Desember) |
| **Bandung Lautan Api** | **24 Maret 1946** | Pejuang membakar kota agar tidak dimanfaatkan Sekutu/Belanda |
| Pertempuran Medan Area | 1945–1947 | Perlawanan rakyat Sumatra Utara |
| **Puputan Margarana** | 20 November 1946 | Pasukan I Gusti Ngurah Rai bertempur habis-habisan di Bali |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Golongan muda membawa Soekarno dan Hatta ke Rengasdengklok. Tujuan utama tindakan tersebut adalah …*

Penalaran: tujuannya **menjauhkan kedua tokoh dari pengaruh Jepang** agar proklamasi segera dilaksanakan. Opsi "menculik untuk menggantikan kepemimpinan" keliru dan merupakan pengecoh.

**Contoh 2.** *Sikap golongan tua dan golongan muda yang akhirnya berhasil mencapai kesepakatan menunjukkan nilai …*

Penalaran: meski berbeda pendapat, keduanya mengutamakan **musyawarah dan kepentingan bangsa**. Inilah teladan bagi ASN ketika menghadapi perbedaan pendapat di tempat kerja.

## Penyebaran berita proklamasi

Berita proklamasi disebarkan melalui kantor berita, radio, surat kabar, selebaran, dan kurir ke berbagai daerah. Penyebarannya tidak mudah karena Jepang masih berkuasa dan melakukan sensor ketat. Meski demikian, para pemuda dan wartawan terus menyiarkannya dengan berbagai cara. Rakyat di banyak daerah menyambutnya dengan rapat-rapat besar, salah satunya **Rapat Raksasa di Lapangan Ikada, Jakarta, pada 19 September 1945**, yang menunjukkan dukungan rakyat terhadap pemerintahan yang baru berdiri.

## Ringkasan

- Jepang membentuk organisasi untuk kepentingan perang, tetapi para tokoh memanfaatkannya untuk menyebarkan semangat kebangsaan.
- Kekalahan Jepang menimbulkan kekosongan kekuasaan yang dimanfaatkan untuk proklamasi.
- Rengasdengklok, rumah Laksamana Maeda, dan Pegangsaan Timur 56 adalah tiga lokasi kunci.
- Kemerdekaan dipertahankan melalui pertempuran rakyat di berbagai daerah, sejalan dengan perjuangan diplomasi.

## Tips mengerjakan soal

- Hafalkan pasangan **peristiwa–tanggal peringatan**: 10 November (Hari Pahlawan), 24 Maret (Bandung Lautan Api).
- Bedakan peran: **perumus** (Soekarno, Hatta, Soebardjo), **pengetik** (Sayuti Melik), **pengusul tanda tangan** (Sukarni).
- Untuk soal nilai, jawaban terbaik biasanya menonjolkan **persatuan, musyawarah, dan rela berkorban**.
$md$, false, 3, 14),

-- ======================= WAWASAN NUSANTARA ================================
('twk-wawasan-nusantara', 'Ketahanan Nasional: Konsep, Sifat, Asas, dan Gatra', 'twk-ketahanan-nasional-konsep',
 'Pengertian ketahanan nasional, ATHG, sifat dan asasnya, pendekatan astagatra, serta ketahanan berlapis dari pribadi hingga nasional.',
$md$
## Pengertian ketahanan nasional

**Ketahanan nasional** adalah kondisi dinamis suatu bangsa yang mencakup seluruh aspek kehidupan secara terpadu. Kondisi itu berisi **keuletan dan ketangguhan** untuk mengembangkan kekuatan nasional dalam menghadapi tantangan, ancaman, hambatan, dan gangguan, baik dari dalam maupun dari luar, demi menjamin **identitas, integritas, dan kelangsungan hidup** bangsa serta tercapainya tujuan nasional.

Ketahanan nasional dapat dipahami dalam tiga wajah:

| Wajah | Maksud |
| --- | --- |
| **Kondisi** | Keadaan nyata suatu bangsa pada waktu tertentu (bisa kuat, bisa lemah) |
| **Konsepsi** | Cara pandang atau metode untuk membangun ketahanan, yaitu melalui pendekatan kesejahteraan dan keamanan |
| **Doktrin** | Ajaran yang dijadikan pedoman dalam penyelenggaraan negara |

## ATHG: empat bentuk tekanan

| Istilah | Ciri |
| --- | --- |
| **Tantangan** | Hal yang menggugah dan menguji kemampuan, bisa menjadi pendorong kemajuan |
| **Ancaman** | Usaha yang bersifat konsepsional dan terencana untuk mengubah atau merusak tatanan |
| **Hambatan** | Usaha dari **dalam** yang melemahkan atau menghalangi secara tidak konsepsional |
| **Gangguan** | Usaha dari **luar** yang melemahkan atau menghalangi secara tidak konsepsional |

> **Tips ujian:** Kata kunci pembeda adalah **konsepsional** (terencana) dan **arah datangnya** (dalam/luar). Ancaman = terencana; hambatan = dari dalam, tidak terencana; gangguan = dari luar, tidak terencana; tantangan = menggugah kemampuan.

## Sifat ketahanan nasional

1. **Mandiri**: percaya pada kemampuan dan kekuatan sendiri, tanpa menutup diri dari kerja sama.
2. **Dinamis**: dapat naik atau turun, sehingga harus terus dibina.
3. **Manunggal**: semua aspek kehidupan saling terkait dan membentuk satu kesatuan.
4. **Wibawa**: ketahanan yang kuat membuat bangsa disegani pihak lain.
5. **Konsultasi dan kerja sama**: mengutamakan dialog dan kerja sama, bukan konfrontasi atau adu kekuatan.

## Asas ketahanan nasional

| Asas | Penjelasan singkat |
| --- | --- |
| **Kesejahteraan dan keamanan** | Dua kebutuhan yang tidak dapat dipisahkan; keduanya harus seimbang |
| **Komprehensif integral (menyeluruh terpadu)** | Seluruh aspek kehidupan diperhatikan secara utuh dan saling terkait |
| **Mawas ke dalam dan mawas ke luar** | Mengenali kekuatan dan kelemahan diri sekaligus memperhatikan perkembangan lingkungan luar |
| **Kekeluargaan** | Bersikap adil, gotong royong, dan bertanggung jawab dalam kebersamaan |

## Pendekatan astagatra

Ketahanan nasional diukur dari delapan gatra (aspek):

- **Trigatra (aspek alamiah)**: letak dan kondisi geografi, kekayaan alam, serta keadaan dan kemampuan penduduk.
- **Pancagatra (aspek sosial)**: ideologi, politik, ekonomi, sosial budaya, serta pertahanan dan keamanan (sering disingkat **ipoleksosbudhankam**).

Contoh penerapan per gatra:

| Gatra | Contoh kondisi tangguh |
| --- | --- |
| Ideologi | Masyarakat memahami Pancasila dan tidak mudah terpengaruh paham radikal |
| Politik | Pemilu berjalan damai, lembaga negara berfungsi sesuai konstitusi |
| Ekonomi | Ketersediaan pangan dan energi terjaga, kesenjangan antardaerah menyempit |
| Sosial budaya | Kerukunan antarumat beragama dan antarsuku terpelihara |
| Pertahanan dan keamanan | Kesiapan komponen pertahanan dan rasa aman warga |

## Ketahanan berlapis

Ketahanan nasional dibangun dari lapisan terkecil:

**ketahanan pribadi → ketahanan keluarga → ketahanan wilayah/daerah → ketahanan regional → ketahanan nasional**

Artinya, ASN yang jujur, sehat, dan berdisiplin turut menyumbang pada ketahanan nasional. Begitu pula keluarga yang harmonis dan komunitas yang rukun.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pemerintah mendorong diversifikasi pangan agar tidak bergantung pada satu komoditas impor, tetapi tetap membuka kerja sama dagang dengan negara lain. Sifat ketahanan nasional yang tercermin adalah …*

Penalaran: mengandalkan kekuatan sendiri tanpa menutup diri dari kerja sama adalah sifat **mandiri**.

**Contoh 2.** *Sebuah kebijakan membangun bendungan juga mempertimbangkan dampak sosial, budaya, dan keamanan warga sekitar. Asas yang paling sesuai adalah …*

Penalaran: memperhatikan seluruh aspek secara terpadu adalah asas **komprehensif integral**.

**Contoh 3.** *Konflik antarwarga akibat sengketa batas lahan yang terjadi spontan dan tidak terencana tergolong …*

Penalaran: datang dari dalam dan tidak konsepsional, sehingga termasuk **hambatan**.

**Contoh 4.** *Indeks ketahanan suatu provinsi menurun setelah terjadi krisis air bersih, padahal tahun sebelumnya tergolong tangguh. Sifat ketahanan nasional yang paling tepat menjelaskan keadaan ini adalah …*

Penalaran: kondisi ketahanan dapat naik dan turun mengikuti perubahan keadaan, sehingga sifat yang tepat adalah **dinamis**. Karena itu ketahanan harus terus dibina dan dipantau, tidak cukup dibangun sekali.

## Kontribusi ASN terhadap ketahanan nasional

ASN berperan langsung dalam beberapa gatra. Pada gatra politik, ASN menjaga **netralitas** sehingga kepercayaan publik terhadap pemerintahan terjaga. Pada gatra ekonomi, ASN mengelola anggaran secara efisien dan bebas korupsi. Pada gatra sosial budaya, ASN melayani tanpa diskriminasi sehingga kerukunan terpelihara. Dengan demikian, kinerja birokrasi yang bersih adalah bagian nyata dari ketahanan nasional.

## Ringkasan

- Ketahanan nasional adalah kondisi dinamis berisi keuletan dan ketangguhan menghadapi ATHG.
- Sifat: mandiri, dinamis, manunggal, wibawa, konsultasi dan kerja sama.
- Asas: kesejahteraan dan keamanan, komprehensif integral, mawas ke dalam dan ke luar, kekeluargaan.
- Diukur melalui astagatra (trigatra dan pancagatra) dan dibangun berlapis dari pribadi hingga nasional.

## Tips mengerjakan soal

- Cocokkan kata kunci kasus dengan **sifat** atau **asas**; keduanya sering dipertukarkan dalam opsi.
- "Dinamis" berarti kondisi bisa berubah; jangan disamakan dengan "mandiri".
- Untuk soal gatra, tentukan dulu apakah aspeknya **alamiah** (trigatra) atau **sosial** (pancagatra).
$md$, true, 1, 13),

('twk-wawasan-nusantara', 'Kedudukan, Unsur, dan Implementasi Wawasan Nusantara', 'twk-kedudukan-implementasi-wasantara',
 'Wawasan Nusantara dalam paradigma nasional, unsur wadah–isi–tata laku, asas, teori geopolitik pembanding, alur laut kepulauan, dan pengelolaan perbatasan.',
$md$
## Wawasan Nusantara dalam paradigma nasional

Wawasan Nusantara adalah cara pandang bangsa Indonesia tentang diri dan lingkungannya yang serba beragam, dengan mengutamakan **persatuan bangsa dan kesatuan wilayah**. Agar tidak tertukar dengan konsep lain, perhatikan kedudukannya dalam paradigma nasional:

| Konsep | Kedudukan |
| --- | --- |
| Pancasila | Landasan **idiil** |
| UUD 1945 | Landasan **konstitusional** |
| **Wawasan Nusantara** | Landasan **visional** |
| Ketahanan Nasional | Landasan **konsepsional** |
| Politik dan strategi nasional (perencanaan pembangunan) | Landasan **operasional** |

> **Tips ujian:** Pasangan "Wawasan Nusantara–visional" dan "Ketahanan Nasional–konsepsional" adalah pengecoh klasik. Ingat: *visi* = cara memandang; *konsep* = cara membangun kekuatan.

## Tiga unsur dasar konsepsi Wawasan Nusantara

| Unsur | Maksud |
| --- | --- |
| **Wadah** (*contour*) | Wilayah Nusantara beserta tata kelembagaan dan organisasi negara |
| **Isi** (*content*) | Aspirasi bangsa: cita-cita dan tujuan nasional yang tercantum dalam Pembukaan UUD 1945 |
| **Tata laku** (*conduct*) | Interaksi lahiriah dan batiniah masyarakat, berupa sikap, perilaku, dan mentalitas kebangsaan |

## Asas Wawasan Nusantara

Asas Wawasan Nusantara meliputi **kepentingan dan tujuan yang sama, keadilan, kejujuran, solidaritas, kerja sama, serta kesetiaan terhadap kesepakatan bersama**. Asas-asas ini menjaga agar keberagaman tidak berubah menjadi perpecahan. Contoh: warga dari berbagai daerah tetap setia pada kesepakatan bahwa NKRI adalah bentuk final negara.

## Arah pandang

- **Ke dalam**: menjamin persatuan dan kesatuan di segenap aspek kehidupan, baik aspek alamiah maupun sosial.
- **Ke luar**: menjamin kepentingan nasional dalam pergaulan dunia serta ikut melaksanakan ketertiban dunia berdasarkan kemerdekaan, perdamaian abadi, dan keadilan sosial.

## Pembanding: teori geopolitik

Wawasan Nusantara adalah geopolitik khas Indonesia. Bandingkan dengan teori-teori berikut:

| Tokoh | Gagasan pokok |
| --- | --- |
| Friedrich Ratzel | Negara dipandang seperti organisme yang tumbuh dan membutuhkan ruang hidup |
| Rudolf Kjellen | Mengembangkan istilah geopolitik; negara sebagai satuan politik yang menyeluruh |
| Karl Haushofer | Ruang hidup (*lebensraum*) yang membenarkan ekspansi |
| Halford Mackinder | Wawasan benua: penguasa "jantung dunia" akan menguasai dunia |
| Alfred Thayer Mahan | Wawasan bahari: kekuatan laut adalah kunci kejayaan |
| Giulio Douhet, William Mitchell | Wawasan dirgantara: kekuatan udara sebagai penentu |

Berbeda dengan teori yang membenarkan ekspansi, **Wawasan Nusantara menolak ekspansi** dan berorientasi pada persatuan di dalam serta perdamaian di luar.

## Wilayah laut: dari TZMKO ke negara kepulauan

Pada masa kolonial berlaku aturan tahun 1939 yang menetapkan laut wilayah hanya **3 mil** dari garis pantai setiap pulau, sehingga di antara pulau-pulau terdapat laut bebas. Deklarasi Djuanda (1957) mengubah cara pandang itu menjadi **satu kesatuan wilayah kepulauan**, yang kemudian diakui melalui UNCLOS 1982. Indonesia mengesahkan UNCLOS melalui **Undang-Undang Nomor 17 Tahun 1985**.

Sebagai negara kepulauan, Indonesia menetapkan **tiga Alur Laut Kepulauan Indonesia (ALKI)**, yaitu jalur yang dapat dilalui kapal asing secara damai dan terus-menerus:

| ALKI | Jalur garis besar |
| --- | --- |
| ALKI I | Selat Sunda – Selat Karimata – Laut Natuna – Laut Cina Selatan |
| ALKI II | Selat Lombok – Selat Makassar – Laut Sulawesi |
| ALKI III | Perairan Nusa Tenggara Timur – Laut Banda – Laut Maluku menuju Samudra Pasifik |

## Pengelolaan perbatasan

Indonesia berbatasan darat dengan **Malaysia** (Kalimantan), **Papua Nugini** (Papua), dan **Timor Leste** (Nusa Tenggara Timur). Pelajaran penting datang dari kasus **Pulau Sipadan dan Ligitan**: pada 2002 Mahkamah Internasional memutuskan kedua pulau menjadi milik Malaysia, antara lain karena Malaysia dinilai lebih nyata mengelola pulau tersebut. Pesannya: kedaulatan tidak cukup diklaim, tetapi juga harus **dikelola dan diisi** dengan kehadiran negara.

## Implementasi di berbagai bidang

| Bidang | Contoh implementasi |
| --- | --- |
| Politik | Kebijakan pusat dan daerah yang selaras, pemilu yang menjaga persatuan |
| Ekonomi | Pemerataan pembangunan dan konektivitas antarpulau |
| Sosial budaya | Menghargai keberagaman budaya sebagai kekayaan bersama |
| Pertahanan keamanan | Ancaman terhadap satu pulau dianggap ancaman bagi seluruh bangsa |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Kedudukan Wawasan Nusantara dalam paradigma nasional adalah sebagai landasan …*

Penalaran: jawabannya **visional**. Konsepsional adalah kedudukan Ketahanan Nasional.

**Contoh 2.** *Pemerintah membangun pos lintas batas, sekolah, dan puskesmas di pulau kecil terluar. Pelajaran dari kasus sengketa pulau yang mendasari kebijakan ini adalah …*

Penalaran: kedaulatan diperkuat melalui **pengelolaan efektif dan kehadiran negara**, bukan sekadar klaim di peta.

### Menjaga kepentingan nasional di laut

Penangkapan ikan ilegal, penyelundupan, dan pencemaran laut mengancam kesatuan wilayah sekaligus perekonomian. Di Zona Ekonomi Eksklusif, Indonesia memiliki **hak berdaulat** atas sumber daya alam, sehingga berwenang menindak kapal asing yang menangkap ikan tanpa izin. Implementasi Wawasan Nusantara di laut menuntut patroli yang konsisten, pengawasan berbasis teknologi, dan pemberdayaan nelayan lokal sebagai "mata dan telinga" negara.

## Ringkasan

- Wawasan Nusantara = landasan visional; Ketahanan Nasional = landasan konsepsional.
- Unsur: wadah, isi, tata laku. Asas: kepentingan sama, keadilan, kejujuran, solidaritas, kerja sama, kesetiaan.
- Wawasan Nusantara berbeda dari teori geopolitik ekspansionis.
- Indonesia mengakui tiga ALKI dan harus mengelola perbatasan secara nyata.

## Tips mengerjakan soal

- Bedakan **unsur** (wadah, isi, tata laku) dan **asas**; soal sering mencampur keduanya.
- Untuk soal teori geopolitik, kenali pasangan tokoh–wawasan (Mahan–bahari, Mackinder–benua).
- Kasus perbatasan biasanya menuntut jawaban **pembangunan dan pengelolaan**, bukan konfrontasi.
$md$, false, 2, 13),

-- ======================= SISTEM PEMERINTAHAN ==============================
('twk-sistem-pemerintahan', 'Sistem Pemerintahan Presidensial dan Parlementer di Indonesia', 'twk-presidensial-parlementer',
 'Ciri sistem presidensial dan parlementer, teori pembagian kekuasaan, serta perjalanan sistem pemerintahan Indonesia dari 1945 hingga era reformasi.',
$md$
## Dua model utama sistem pemerintahan

Sistem pemerintahan menjelaskan **hubungan antara eksekutif dan legislatif**. Dua model yang paling sering diuji adalah presidensial dan parlementer.

| Aspek | Presidensial | Parlementer |
| --- | --- | --- |
| Kepala negara dan kepala pemerintahan | Dijabat **satu orang** (presiden) | **Dipisah**: kepala negara (raja/presiden) dan kepala pemerintahan (perdana menteri) |
| Pertanggungjawaban menteri | Kepada **presiden** | Kepada **parlemen** |
| Masa jabatan eksekutif | **Tetap** (*fixed term*) | Bergantung pada dukungan parlemen |
| Mosi tidak percaya | Tidak dikenal | Parlemen dapat menjatuhkan kabinet |
| Pembubaran parlemen | Presiden **tidak dapat** membubarkan parlemen | Kepala negara dapat membubarkan parlemen dan menggelar pemilu baru |
| Contoh negara | Indonesia, Amerika Serikat, Filipina | Inggris, Jepang, Malaysia, India |

> **Tips ujian:** Kata kunci "mosi tidak percaya", "kabinet jatuh", dan "perdana menteri sebagai kepala pemerintahan" menunjuk sistem **parlementer**. Kata kunci "menteri sebagai pembantu presiden" dan "masa jabatan tetap" menunjuk **presidensial**.

## Teori pembagian kekuasaan

- **John Locke** membagi kekuasaan menjadi legislatif, eksekutif, dan federatif (hubungan luar negeri).
- **Montesquieu** melalui konsep *trias politica* membagi kekuasaan menjadi legislatif, eksekutif, dan yudikatif yang **dipisahkan** satu sama lain.

Indonesia tidak menerapkan pemisahan kekuasaan secara mutlak. Yang dianut adalah **pembagian kekuasaan disertai mekanisme saling mengawasi dan mengimbangi** (*checks and balances*). Contohnya, undang-undang dibahas bersama oleh DPR dan Presiden, sedangkan Mahkamah Konstitusi dapat menguji undang-undang terhadap UUD.

## Perjalanan sistem pemerintahan Indonesia

| Periode | Konstitusi | Sistem dan catatan |
| --- | --- | --- |
| 18 Agustus 1945 – November 1945 | UUD 1945 | Presidensial; KNIP membantu presiden |
| Akhir 1945 – 1949 | UUD 1945 | Dalam praktik bergeser ke parlementer. **Maklumat Wakil Presiden Nomor X (16 Oktober 1945)** memberi KNIP fungsi legislatif; sejak November 1945 kabinet dipimpin perdana menteri (Sutan Sjahrir) dan bertanggung jawab kepada KNIP |
| 27 Desember 1949 – 17 Agustus 1950 | Konstitusi RIS | Negara serikat dengan sistem parlementer |
| 17 Agustus 1950 – 5 Juli 1959 | UUDS 1950 | Demokrasi parlementer (liberal); kabinet sering berganti. Pemilu pertama digelar pada 1955 |
| 5 Juli 1959 – 1966 | UUD 1945 (Dekrit Presiden) | Demokrasi terpimpin; kekuasaan terpusat pada presiden |
| 1966 – 1998 | UUD 1945 | Orde Baru; presidensial dengan dominasi eksekutif |
| 1999 – sekarang | UUD 1945 hasil perubahan | Presidensial yang dipertegas dengan *checks and balances* |

Selain Maklumat X, **Maklumat Pemerintah 3 November 1945** juga penting karena menganjurkan pembentukan partai-partai politik, cikal bakal sistem multipartai.

## Penguatan sistem presidensial setelah perubahan UUD 1945

| Ketentuan | Isi pokok |
| --- | --- |
| Pasal 4 ayat (1) | Presiden memegang kekuasaan pemerintahan menurut UUD |
| Pasal 6A ayat (1) | Presiden dan Wakil Presiden dipilih dalam satu pasangan **secara langsung oleh rakyat** |
| Pasal 7 | Masa jabatan lima tahun, dapat dipilih kembali dalam jabatan yang sama **hanya untuk satu kali masa jabatan** |
| Pasal 7A–7B | Pemberhentian presiden hanya melalui prosedur hukum dan politik yang ketat (DPR, Mahkamah Konstitusi, MPR) |
| **Pasal 7C** | Presiden **tidak dapat membekukan dan/atau membubarkan DPR** |
| Pasal 17 | Menteri diangkat dan diberhentikan oleh presiden |
| Pasal 20 ayat (1) | DPR memegang kekuasaan membentuk undang-undang |

Sebelum perubahan, Presiden dipilih oleh MPR dan tidak ada batas tegas periode jabatan. Perubahan UUD menjadikan presiden memperoleh mandat langsung dari rakyat sehingga tidak dapat dijatuhkan hanya karena perbedaan politik.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Di negara X, perdana menteri dan kabinetnya mengundurkan diri setelah parlemen menyatakan tidak lagi mempercayai kabinet. Sistem pemerintahan negara X adalah …*

Penalaran: mosi tidak percaya yang menjatuhkan kabinet adalah ciri **parlementer**.

**Contoh 2.** *Seorang menteri berbeda pendapat dengan mayoritas DPR. Menurut sistem presidensial di Indonesia, menteri tersebut …*

Penalaran: menteri **bertanggung jawab kepada presiden**, sehingga ia tidak otomatis harus mundur karena tekanan DPR. DPR tetap dapat menjalankan fungsi pengawasan melalui hak-haknya.

**Contoh 3.** *Ketentuan yang menunjukkan bahwa Indonesia menganut checks and balances adalah …*

Penalaran: pilih opsi yang menunjukkan **saling mengawasi**, misalnya pengujian undang-undang oleh Mahkamah Konstitusi atau persetujuan bersama DPR dan Presiden atas RUU.

### Kelebihan dan kelemahan

| Sistem | Kelebihan | Kelemahan |
| --- | --- | --- |
| Presidensial | Pemerintahan relatif stabil karena masa jabatan tetap | Dapat terjadi kebuntuan bila presiden dan parlemen berselisih |
| Parlementer | Responsif karena kabinet harus menjaga dukungan parlemen | Kabinet dapat sering jatuh sehingga program tidak berkelanjutan |

## Ringkasan

- Presidensial: satu kepala negara sekaligus kepala pemerintahan, menteri bertanggung jawab kepada presiden, masa jabatan tetap.
- Parlementer: kepala negara dan kepala pemerintahan terpisah, kabinet bertanggung jawab kepada parlemen.
- Indonesia pernah mengalami praktik parlementer (1945–1959) sebelum kembali ke UUD 1945.
- Perubahan UUD 1945 memperkuat presidensial dan mekanisme *checks and balances*.

## Tips mengerjakan soal

- Bacalah stem untuk mencari **siapa bertanggung jawab kepada siapa**; itulah penentu sistemnya.
- Hafalkan **Maklumat X (16 Oktober 1945)** dan **Pasal 7C**; keduanya sering keluar.
- Bedakan *pemisahan* kekuasaan (Montesquieu) dan *pembagian* kekuasaan (praktik Indonesia).
- Jika stem menyebut negara dengan raja atau ratu sebagai kepala negara, kemungkinan besar sistemnya parlementer, tetapi tetap periksa siapa yang memimpin pemerintahan sehari-hari.
$md$, true, 1, 13),

('twk-sistem-pemerintahan', 'Hierarki Peraturan Perundang-undangan dan Proses Legislasi', 'twk-hierarki-perundangan-legislasi',
 'Jenis dan hierarki peraturan menurut UU 12/2011, alur pembentukan undang-undang, Perppu, asas penyelesaian konflik norma, dan lembaga penguji.',
$md$
## Hierarki menurut Undang-Undang Nomor 12 Tahun 2011

Pasal 7 ayat (1) UU Nomor 12 Tahun 2011 tentang Pembentukan Peraturan Perundang-undangan menetapkan jenis dan hierarki berikut (dari tertinggi):

1. **Undang-Undang Dasar Negara Republik Indonesia Tahun 1945**
2. **Ketetapan Majelis Permusyawaratan Rakyat**
3. **Undang-Undang / Peraturan Pemerintah Pengganti Undang-Undang (Perppu)**
4. **Peraturan Pemerintah**
5. **Peraturan Presiden**
6. **Peraturan Daerah Provinsi**
7. **Peraturan Daerah Kabupaten/Kota**

Kekuatan hukum setiap peraturan sesuai dengan hierarkinya. Peraturan yang lebih rendah **tidak boleh bertentangan** dengan peraturan yang lebih tinggi. Undang-undang ini juga menegaskan bahwa **Pancasila merupakan sumber segala sumber hukum negara**.

Selain tujuh jenis tersebut, ada peraturan lain yang diakui, misalnya peraturan menteri, peraturan lembaga negara, atau peraturan desa, sepanjang diperintahkan oleh peraturan yang lebih tinggi atau dibentuk berdasarkan kewenangan.

> **Tips ujian:** Perhatikan posisi **Tap MPR** (di bawah UUD, di atas UU) dan **Perppu** (sejajar dengan UU). Pengecoh paling umum adalah menempatkan Peraturan Presiden di atas Peraturan Pemerintah.

## Siapa membentuk apa?

| Jenis | Pembentuk |
| --- | --- |
| Undang-undang | DPR bersama Presiden (persetujuan bersama) |
| Perppu | Presiden, dalam hal ihwal kegentingan yang memaksa |
| Peraturan Pemerintah | Presiden, untuk menjalankan undang-undang sebagaimana mestinya (Pasal 5 ayat 2 UUD 1945) |
| Peraturan Presiden | Presiden |
| Perda Provinsi | DPRD Provinsi dengan persetujuan bersama gubernur |
| Perda Kabupaten/Kota | DPRD kabupaten/kota dengan persetujuan bersama bupati/wali kota |

**Ketentuan pidana** hanya dapat dimuat dalam undang-undang dan peraturan daerah. Untuk perda, ancaman pidananya dibatasi, yaitu kurungan paling lama 6 bulan atau denda paling banyak Rp50 juta.

## Alur pembentukan undang-undang (Pasal 20 UUD 1945)

1. **Pengusulan.** RUU dapat berasal dari DPR, Presiden, atau DPD (khusus RUU yang berkaitan dengan otonomi daerah, hubungan pusat dan daerah, pembentukan dan pemekaran daerah, pengelolaan sumber daya alam, serta perimbangan keuangan pusat dan daerah). Perencanaan RUU disusun dalam **Program Legislasi Nasional (Prolegnas)**.
2. **Pembahasan.** Setiap RUU dibahas oleh DPR dan Presiden untuk mendapat **persetujuan bersama**.
3. **Jika tidak disetujui bersama**, RUU itu tidak boleh diajukan lagi dalam persidangan DPR masa itu.
4. **Pengesahan.** Presiden mengesahkan RUU yang telah disetujui bersama.
5. **Batas waktu 30 hari.** Bila RUU yang telah disetujui bersama tidak disahkan presiden dalam 30 hari sejak disetujui, RUU itu **sah menjadi undang-undang dan wajib diundangkan**.
6. **Pengundangan** dalam Lembaran Negara agar setiap orang dianggap mengetahuinya.

## Perppu (Pasal 22 UUD 1945)

- Ditetapkan Presiden **dalam hal ihwal kegentingan yang memaksa**.
- Harus mendapat **persetujuan DPR pada persidangan berikutnya**.
- Jika tidak disetujui, Perppu **harus dicabut**.

## Asas penyelesaian pertentangan norma

| Asas | Arti | Contoh |
| --- | --- | --- |
| *Lex superior derogat legi inferiori* | Aturan lebih tinggi mengesampingkan yang lebih rendah | UU mengalahkan perda yang bertentangan |
| *Lex specialis derogat legi generali* | Aturan khusus mengesampingkan aturan umum | Ketentuan khusus tentang suatu kejahatan mengalahkan ketentuan umum |
| *Lex posterior derogat legi priori* | Aturan baru mengesampingkan aturan lama yang setingkat | UU baru tentang hal yang sama menggantikan UU lama |

## Lembaga penguji

| Objek yang diuji | Batu uji | Lembaga |
| --- | --- | --- |
| Undang-undang | UUD 1945 | **Mahkamah Konstitusi** |
| Peraturan di bawah undang-undang | Undang-undang | **Mahkamah Agung** |

## Contoh pola soal dan penalarannya

**Contoh 1.** *DPR dan Presiden telah menyetujui bersama suatu RUU, tetapi Presiden tidak menandatanganinya. Setelah 30 hari, status RUU tersebut adalah …*

Penalaran: menurut Pasal 20 ayat (5), RUU itu **sah menjadi undang-undang dan wajib diundangkan**. Opsi "batal demi hukum" atau "dikembalikan ke DPR" adalah pengecoh.

**Contoh 2.** *Sebuah peraturan bupati memuat ancaman pidana penjara bagi pelanggar. Ketentuan ini bermasalah karena …*

Penalaran: ketentuan pidana **hanya boleh dimuat dalam undang-undang dan perda**, bukan peraturan kepala daerah.

**Contoh 3.** *Presiden menetapkan Perppu untuk menangani bencana besar. Pada masa sidang berikutnya DPR menolaknya. Akibatnya …*

Penalaran: Perppu **harus dicabut**.

## Asas pembentukan dan partisipasi masyarakat

UU 12/2011 menetapkan asas pembentukan peraturan yang baik, antara lain **kejelasan tujuan, kelembagaan atau pejabat pembentuk yang tepat, kesesuaian antara jenis, hierarki, dan materi muatan, dapat dilaksanakan, kedayagunaan dan kehasilgunaan, kejelasan rumusan,** serta **keterbukaan**. Masyarakat juga berhak memberikan masukan secara lisan maupun tertulis, misalnya melalui rapat dengar pendapat umum, kunjungan kerja, sosialisasi, atau seminar. Karena itu, setiap rancangan peraturan seharusnya mudah diakses publik.

## Ringkasan

- Hierarki: UUD 1945 → Tap MPR → UU/Perppu → PP → Perpres → Perda Provinsi → Perda Kabupaten/Kota.
- UU dibentuk DPR bersama Presiden; RUU yang disetujui bersama otomatis sah setelah 30 hari.
- Perppu memerlukan persetujuan DPR pada persidangan berikutnya.
- MK menguji UU terhadap UUD; MA menguji peraturan di bawah UU terhadap UU.

## Tips mengerjakan soal

- Tulis cepat urutan hierarki di kertas buram sebelum menjawab soal urutan.
- Bedakan **PP** (menjalankan UU) dan **Perppu** (keadaan genting).
- Untuk soal konflik aturan, tentukan dulu apakah aturannya **beda tingkat**, **umum–khusus**, atau **lama–baru**.
$md$, false, 2, 14),

('twk-sistem-pemerintahan', 'Pemilu, Kementerian, dan Lembaga Negara Penunjang', 'twk-pemilu-kementerian-lembaga-penunjang',
 'Asas dan penyelenggara pemilu, syarat kemenangan pemilihan presiden, prosedur pemberhentian presiden, kementerian negara, serta lembaga independen seperti KY, Ombudsman, Komnas HAM, dan KPK.',
$md$
## Pemilihan umum dalam UUD 1945 (Pasal 22E)

| Ayat | Isi pokok |
| --- | --- |
| (1) | Pemilu dilaksanakan secara **langsung, umum, bebas, rahasia, jujur, dan adil** setiap **lima tahun sekali** |
| (2) | Pemilu memilih anggota DPR, DPD, Presiden dan Wakil Presiden, serta DPRD |
| (3) | Peserta pemilu anggota DPR dan DPRD adalah **partai politik** |
| (4) | Peserta pemilu anggota DPD adalah **perseorangan** |
| (5) | Pemilu diselenggarakan oleh suatu komisi pemilihan umum yang bersifat **nasional, tetap, dan mandiri** |

Penyelenggara pemilu terdiri atas **KPU** (pelaksana), **Bawaslu** (pengawas), dan **DKPP** (penegak kode etik penyelenggara pemilu).

> **Tips ujian:** Calon anggota DPD tidak dicalonkan partai politik karena DPD mewakili **daerah**, sedangkan DPR mewakili **rakyat melalui partai**.

### Syarat kemenangan pemilihan presiden (Pasal 6A)

- Pasangan calon diusulkan oleh **partai politik atau gabungan partai politik** peserta pemilu.
- Pasangan dinyatakan terpilih jika memperoleh **lebih dari 50% suara** dengan **sedikitnya 20% suara di setiap provinsi yang tersebar di lebih dari setengah jumlah provinsi**.
- Jika tidak ada pasangan yang memenuhi syarat, dua pasangan dengan suara terbanyak pertama dan kedua dipilih kembali langsung oleh rakyat; pasangan yang memperoleh suara terbanyak dilantik.

## Pemberhentian presiden (Pasal 7A dan 7B)

**Alasan:** pengkhianatan terhadap negara, korupsi, penyuapan, tindak pidana berat lainnya, perbuatan tercela, atau tidak lagi memenuhi syarat sebagai presiden/wakil presiden.

| Tahap | Lembaga | Ketentuan pokok |
| --- | --- | --- |
| 1 | **DPR** | Usul diajukan dengan dukungan sekurang-kurangnya 2/3 anggota yang hadir dalam sidang paripurna yang dihadiri sekurang-kurangnya 2/3 anggota |
| 2 | **Mahkamah Konstitusi** | Memeriksa, mengadili, dan memutus pendapat DPR paling lama 90 hari |
| 3 | **MPR** | Bersidang paling lambat 30 hari setelah menerima usul; keputusan diambil dalam rapat yang dihadiri sekurang-kurangnya 3/4 anggota dan disetujui sekurang-kurangnya 2/3 anggota yang hadir |

Presiden atau wakil presiden diberi **kesempatan menyampaikan penjelasan** dalam rapat paripurna MPR. Urutan ini menunjukkan perpaduan proses **hukum** (MK) dan **politik** (DPR dan MPR).

## Kementerian negara (Pasal 17)

- Presiden dibantu oleh menteri-menteri negara.
- Menteri **diangkat dan diberhentikan oleh presiden**.
- Setiap menteri membidangi urusan tertentu dalam pemerintahan.
- Pembentukan, pengubahan, dan pembubaran kementerian negara **diatur dalam undang-undang**.

## Pemerintahan daerah

Gubernur, bupati, dan wali kota dipilih **secara demokratis** (Pasal 18 ayat 4), sedangkan anggota DPRD dipilih melalui pemilu (Pasal 18 ayat 3). Kepala daerah dan DPRD sama-sama unsur penyelenggara pemerintahan daerah.

## Lembaga negara penunjang (independen)

Selain lembaga utama (MPR, DPR, DPD, Presiden, MA, MK, BPK), terdapat lembaga yang dibentuk untuk tugas khusus dan bekerja secara mandiri.

| Lembaga | Dasar pembentukan | Fungsi pokok |
| --- | --- | --- |
| **Komisi Yudisial** | Pasal 24B UUD 1945 | Mengusulkan pengangkatan hakim agung; menjaga kehormatan, keluhuran martabat, dan perilaku hakim |
| **Bank sentral** (Bank Indonesia) | Pasal 23D UUD 1945 | Susunan, kedudukan, kewenangan, tanggung jawab, dan independensinya diatur undang-undang |
| **KPU** | Pasal 22E UUD 1945 dan UU Pemilu | Menyelenggarakan pemilu |
| **Ombudsman Republik Indonesia** | UU Nomor 37 Tahun 2008 | Mengawasi penyelenggaraan pelayanan publik dan menangani laporan maladministrasi |
| **Komnas HAM** | UU Nomor 39 Tahun 1999 | Pengkajian, penelitian, penyuluhan, pemantauan, dan mediasi hak asasi manusia |
| **KPK** | UU Nomor 30 Tahun 2002 dan perubahannya | Pencegahan dan pemberantasan tindak pidana korupsi |

> **Tips ujian:** **Komisi Yudisial tidak mengadili perkara.** Ia mengawasi perilaku hakim dan mengusulkan calon hakim agung. Opsi "KY memutus sengketa" pasti salah.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Warga mengeluhkan pengurusan izin yang ditunda berbulan-bulan tanpa alasan jelas oleh sebuah dinas. Lembaga yang tepat untuk menerima laporan maladministrasi tersebut adalah …*

Penalaran: penundaan berlarut adalah bentuk maladministrasi pelayanan publik, sehingga yang tepat adalah **Ombudsman RI**, bukan KPK (korupsi) atau Komnas HAM.

**Contoh 2.** *Pasangan calon A memperoleh 52% suara nasional, tetapi hanya meraih minimal 20% suara di sepertiga provinsi. Pernyataan yang tepat adalah …*

Penalaran: syarat sebaran **lebih dari setengah jumlah provinsi** belum terpenuhi, sehingga pasangan A **belum dapat langsung ditetapkan**; dilakukan pemilihan putaran berikutnya.

**Contoh 3.** *Dalam proses pemberhentian presiden, lembaga yang memberi putusan hukum atas pendapat DPR adalah …*

Penalaran: **Mahkamah Konstitusi**. Keputusan akhir pemberhentian tetap berada di **MPR**.

## Kedaulatan rakyat sebagai dasar

Semua mekanisme di atas berakar pada **Pasal 1 ayat (2) UUD 1945**: kedaulatan berada di tangan rakyat dan dilaksanakan menurut Undang-Undang Dasar. Pemilu adalah sarana utama rakyat menjalankan kedaulatannya, sedangkan lembaga independen membantu memastikan kekuasaan tetap diawasi.

## Ringkasan

- Pemilu: luber jurdil, lima tahun sekali, diselenggarakan komisi yang nasional, tetap, dan mandiri.
- Kemenangan presiden membutuhkan mayoritas suara dan sebaran dukungan di lebih dari separuh provinsi.
- Pemberhentian presiden: DPR → MK → MPR.
- Lembaga penunjang (KY, BI, KPU, Ombudsman, Komnas HAM, KPK) bekerja mandiri sesuai fungsi khususnya.

## Tips mengerjakan soal

- Petakan masalah kasus ke lembaga: pelayanan publik → Ombudsman; korupsi → KPK; pelanggaran HAM → Komnas HAM; perilaku hakim → KY.
- Untuk soal angka, ingat pola **2/3 – 90 hari – 30 hari – 3/4 – 2/3** pada pemberhentian presiden.
- Bedakan peserta pemilu DPR/DPRD (partai) dan DPD (perseorangan).
$md$, false, 3, 14),

-- ======================= PEMAHAMAN BACAAN =================================
('twk-pemahaman-bacaan', 'Menemukan Ide Pokok, Informasi Tersurat, dan Simpulan Bacaan', 'twk-ide-pokok-simpulan-bacaan',
 'Strategi membaca cepat untuk soal SKD: menemukan ide pokok, menjawab pertanyaan tersurat, menarik simpulan, memilih judul, dan memahami kata rujukan.',
$md$
## Mengapa pemahaman bacaan muncul di TWK?

Kisi-kisi TWK pada aspek bahasa Indonesia tidak hanya menguji ejaan, tetapi juga kemampuan **memahami teks** secara cepat dan tepat. Teks yang dipakai sering bertema kebangsaan, pelayanan publik, atau isu sosial. Soal bacaan memakan waktu, sehingga strategi yang efisien sangat menentukan.

## Strategi umum: baca soal dulu, baru teks

1. **Baca pertanyaannya terlebih dahulu.** Tentukan jenisnya: ide pokok, informasi tersurat, simpulan, judul, atau makna kata.
2. **Baca teks dengan tujuan.** Jika yang ditanya informasi tersurat, cari kata kunci; jika yang ditanya ide pokok, perhatikan kalimat pertama dan terakhir.
3. **Coret opsi yang jelas keliru**: tidak disebut dalam teks, bertentangan dengan teks, atau terlalu luas/sempit.
4. **Kembali ke teks** untuk memastikan opsi yang tersisa memang didukung bacaan.

> **Tips ujian:** Jawaban soal bacaan **harus didukung teks**, bukan pengetahuan umum Anda. Opsi yang "benar secara umum" tetapi tidak disebut dalam bacaan adalah pengecoh favorit.

## Ide pokok (gagasan utama)

Ide pokok adalah gagasan yang **dikembangkan oleh seluruh kalimat** dalam paragraf. Cara menemukannya:

- Cari kalimat yang **paling umum**; kalimat lain biasanya memberi contoh, alasan, atau rincian.
- Uji dengan pertanyaan: "Apakah kalimat-kalimat lain menjelaskan kalimat ini?"
- Waspadai paragraf yang dibuka dengan contoh dan **baru menyimpulkan di akhir** (paragraf induktif).

| Jenis opsi pengecoh | Ciri |
| --- | --- |
| Terlalu sempit | Hanya menyebut satu rincian atau contoh |
| Terlalu luas | Melampaui cakupan paragraf |
| Bergeser fokus | Memakai kata-kata dari teks, tetapi pokok bahasannya berbeda |

## Informasi tersurat dan tersirat

| Jenis | Ciri | Cara menjawab |
| --- | --- | --- |
| **Tersurat** | Tertulis jelas dalam teks | Cari kata kunci, cocokkan dengan opsi; waspadai perubahan angka atau kata "semua/sebagian" |
| **Tersirat** | Tidak tertulis langsung, tetapi dapat disimpulkan | Gabungkan beberapa informasi dalam teks; jangan menambah asumsi baru |

Soal yang berbunyi **"pernyataan yang sesuai dengan bacaan"** menuntut ketelitian kata. Perhatikan kata-kata seperti *semua, sebagian, selalu, kadang-kadang, meningkat, menurun*. Satu kata yang diubah dapat membuat opsi menjadi salah.

## Simpulan

Simpulan adalah pernyataan yang **merangkum isi** dan **dapat dipertanggungjawabkan** berdasarkan teks. Ciri simpulan yang baik:

- Mencakup gagasan utama, bukan sekadar rincian.
- Tidak menambah informasi yang tidak ada di teks.
- Tidak berlawanan dengan data dalam teks.

## Judul yang tepat

Judul yang baik **mewakili seluruh isi**, singkat, dan menarik. Langkahnya: tentukan topik (apa yang dibicarakan) dan fokus (aspek apa yang ditekankan). Judul "Peran Pemuda" terlalu luas untuk teks yang khusus membahas peran pemuda dalam literasi digital di desa.

## Kata rujukan

Kata seperti *ini, itu, tersebut, -nya, mereka,* dan *hal itu* merujuk pada bagian tertentu dalam teks. Untuk menentukan rujukannya, **baca satu atau dua kalimat sebelumnya**, lalu ganti kata rujukan dengan kandidat jawaban dan periksa apakah kalimatnya tetap logis.

## Contoh latihan dan penalarannya

> Banyak desa kini memiliki balai informasi yang dikelola pemuda. Di tempat itu warga belajar memeriksa kebenaran berita sebelum membagikannya. Para pemuda juga mengajari orang tua cara melindungi data pribadi di ponsel. Kegiatan sederhana ini membuat warga tidak mudah termakan kabar bohong.

**Soal 1: ide pokok.** Kalimat kedua dan ketiga adalah rincian kegiatan, sedangkan kalimat keempat menyatakan dampaknya. Ide pokoknya adalah **balai informasi yang dikelola pemuda membantu warga menghadapi kabar bohong**. Opsi "pemuda mengajari orang tua memakai ponsel" terlalu sempit.

**Soal 2: kata rujukan.** Frasa "tempat itu" merujuk pada **balai informasi**.

**Soal 3: simpulan.** Simpulan yang tepat adalah **literasi digital yang digerakkan pemuda dapat memperkuat ketahanan warga terhadap hoaks**. Opsi "semua warga desa sudah bebas dari hoaks" terlalu mutlak dan tidak didukung teks.

## Kesalahan yang sering terjadi

1. **Membaca seluruh teks dengan kecepatan sama.** Bagian yang tidak relevan dengan pertanyaan cukup dibaca sekilas.
2. **Memasukkan pengetahuan pribadi.** Misalnya memilih opsi tentang manfaat literasi digital yang benar secara umum, padahal teks tidak membahasnya.
3. **Terpaku pada kalimat pertama.** Tidak semua paragraf deduktif; banyak teks SKD menaruh gagasan utama di akhir.
4. **Mengabaikan kata pembatas** seperti *sebagian, beberapa,* dan *cenderung* yang membedakan opsi benar dari opsi yang berlebihan.

**Soal 4: judul.** Judul "Balai Informasi Desa: Benteng Warga dari Kabar Bohong" lebih tepat daripada "Teknologi Ponsel" karena mencakup topik dan fokus teks sekaligus.

## Ringkasan

- Baca pertanyaan lebih dulu, lalu baca teks dengan tujuan.
- Ide pokok adalah gagasan yang dijelaskan oleh kalimat-kalimat lain.
- Pernyataan yang sesuai bacaan harus tersurat atau dapat disimpulkan langsung dari teks.
- Simpulan dan judul harus mencakup keseluruhan isi tanpa menambah asumsi.

## Tips mengerjakan soal

- Batasi waktu: jika satu soal bacaan memakan lebih dari dua menit, tandai dan lanjutkan.
- Garis bawahi kata mutlak (*semua, selalu, tidak pernah*) pada opsi; sering kali itulah jebakannya.
- Jangan memilih opsi hanya karena memakai kata yang sama persis dengan teks; periksa maknanya.
$md$, true, 1, 13),

('twk-pemahaman-bacaan', 'Tujuan Penulis, Fakta dan Opini, serta Hubungan Antarkalimat', 'twk-tujuan-penulis-fakta-opini',
 'Menentukan tujuan dan sikap penulis, membedakan fakta dan opini, mengenali kalimat yang tidak padu, hubungan antarparagraf, serta makna kata sesuai konteks.',
$md$
## Membaca lebih dalam

Setelah mampu menemukan ide pokok, langkah berikutnya adalah membaca **maksud di balik teks**: untuk apa penulis menulis, bagaimana sikapnya, dan bagaimana kalimat-kalimat disusun. Soal jenis ini lebih analitis sehingga banyak menjadi soal tingkat sedang hingga sulit.

## Tujuan penulis

| Tujuan | Penanda dalam teks |
| --- | --- |
| **Menginformasikan** | Menyajikan data atau fakta secara netral |
| **Menjelaskan** | Menguraikan proses, sebab-akibat, atau langkah |
| **Meyakinkan** | Mengajukan pendapat disertai alasan dan bukti |
| **Mengajak** | Memuat ajakan seperti *mari, ayo, hendaknya, sudah saatnya* |
| **Menghibur/menceritakan** | Alur peristiwa dan tokoh |
| **Mengkritik** | Menunjukkan kelemahan suatu kebijakan atau keadaan |

## Sikap penulis

| Sikap | Ciri |
| --- | --- |
| **Netral/objektif** | Menyajikan berbagai sisi tanpa memihak |
| **Mendukung** | Menonjolkan manfaat, menilai positif |
| **Kritis** | Mengakui sisi baik tetapi menyoroti kekurangan dan meminta perbaikan |
| **Skeptis** | Meragukan klaim atau keberhasilan suatu hal |
| **Optimistis/pesimistis** | Yakin atau ragu terhadap masa depan suatu keadaan |

> **Tips ujian:** Sikap **kritis** tidak sama dengan menolak. Penulis yang berkata "program ini bermanfaat, tetapi pengawasannya lemah sehingga perlu dibenahi" bersikap kritis, bukan menentang.

## Fakta dan opini

| Fakta | Opini |
| --- | --- |
| Dapat dibuktikan kebenarannya | Berupa pendapat, penilaian, atau perkiraan |
| Biasanya memuat data, tanggal, angka, tempat, atau peristiwa | Memuat kata penilaian: *sebaiknya, seharusnya, menurut saya, tampaknya, paling, sangat, mungkin* |
| Contoh: "Rapat dihadiri 40 orang." | Contoh: "Rapat itu berlangsung sangat membosankan." |

Hati-hati dengan **opini yang memakai angka**, misalnya "Dalam lima tahun, desa ini pasti menjadi desa terbaik." Kata *pasti* dan isi yang belum terjadi menunjukkan perkiraan, sehingga tetap opini.

## Kalimat yang tidak padu

Paragraf yang baik memenuhi syarat **kesatuan** (semua kalimat membahas satu gagasan) dan **kepaduan** (hubungan antarkalimat lancar). Soal SKD sering meminta Anda menemukan **kalimat sumbang**, yaitu kalimat yang keluar dari pokok bahasan.

Cara menemukannya:

1. Tentukan ide pokok paragraf.
2. Uji setiap kalimat: apakah kalimat ini menjelaskan ide pokok?
3. Kalimat yang membahas topik lain, walaupun masih berhubungan secara umum, adalah kalimat sumbang.

## Hubungan antarkalimat dan antarparagraf

| Hubungan | Penanda |
| --- | --- |
| Sebab-akibat | *oleh karena itu, akibatnya, sebab itu* |
| Pertentangan | *namun, akan tetapi, sebaliknya* |
| Penambahan | *selain itu, di samping itu, lagi pula* |
| Penegasan/contoh | *misalnya, contohnya, bahkan* |
| Simpulan | *jadi, dengan demikian, singkatnya* |

Untuk soal "paragraf kedua berfungsi untuk …", bandingkan isi paragraf kedua dengan paragraf pertama: apakah memberi contoh, menyanggah, menjelaskan penyebab, atau menawarkan solusi?

## Makna kata sesuai konteks

Satu kata bisa bermakna berbeda dalam teks berbeda. Kata *mengawal* dalam "masyarakat ikut **mengawal** penggunaan dana desa" bermakna **mengawasi**, bukan menjaga secara fisik. Strateginya: ganti kata itu dengan setiap opsi, lalu pilih yang membuat kalimat paling logis.

## Contoh latihan dan penalarannya

> Pemerintah kota menyediakan layanan pengaduan daring yang dapat diakses 24 jam. Sepanjang tahun lalu, layanan itu menerima lebih dari dua ribu laporan. Sayangnya, banyak warga mengeluhkan tanggapan yang lambat dan berulang kali dialihkan ke instansi lain. Sudah saatnya pemerintah menetapkan batas waktu tanggapan yang jelas agar layanan ini benar-benar dipercaya warga.

**Tujuan penulis:** kalimat terakhir memuat penanda *sudah saatnya*, sehingga tujuannya **mendorong pemerintah memperbaiki layanan pengaduan**.

**Sikap penulis:** mengakui adanya layanan (sisi baik), lalu menyoroti kelemahan dan meminta perbaikan, sehingga sikapnya **kritis**.

**Fakta:** "Sepanjang tahun lalu, layanan itu menerima lebih dari dua ribu laporan" adalah fakta karena dapat dibuktikan dengan data.

**Kalimat sumbang.** Perhatikan rangkaian berikut: (1) Bank sampah membantu warga memilah sampah rumah tangga. (2) Sampah yang terkumpul ditimbang dan dicatat sebagai tabungan. (3) Harga cabai di pasar sedang naik. (4) Tabungan itu dapat dicairkan menjelang hari raya. Kalimat (3) tidak menjelaskan cara kerja bank sampah sehingga merupakan **kalimat sumbang** yang merusak kesatuan paragraf.

## Soal melengkapi dan menyusun paragraf

Jenis soal lain meminta Anda **melengkapi bagian rumpang** atau **mengurutkan kalimat acak**. Untuk melengkapi, perhatikan kalimat sebelum dan sesudah bagian rumpang, lalu pilih opsi yang menyambung secara logis dan memakai konjungsi yang tepat. Untuk mengurutkan, cari kalimat yang paling umum atau yang tidak memuat kata rujukan (*itu, tersebut, -nya*) sebagai pembuka. Kalimat yang memuat penanda simpulan seperti *dengan demikian* biasanya menjadi penutup. Uji urutan pilihan dengan membacanya sekali secara utuh.

## Ringkasan

- Tujuan penulis dikenali dari penanda dan bagian akhir teks.
- Sikap kritis = mengakui sisi baik, menyoroti kekurangan, menawarkan perbaikan.
- Fakta dapat dibuktikan; opini berisi penilaian atau perkiraan, walaupun memakai angka.
- Kalimat sumbang adalah kalimat yang tidak menjelaskan ide pokok paragraf.

## Tips mengerjakan soal

- Perhatikan **kalimat terakhir**: penulis sering menyimpan tujuan atau sarannya di sana.
- Cari kata penilaian untuk memisahkan opini dari fakta.
- Pada soal makna kata, jangan memakai makna kamus yang paling umum; ikuti **konteks kalimat**.
- Untuk soal sikap penulis, kumpulkan kata penilai (*sayangnya, patut diapresiasi, perlu dibenahi*) lalu simpulkan arahnya sebelum melihat opsi.
$md$, false, 2, 13),

-- ======================= SUB-TOPIK LAMA: MATERI TAMBAHAN ==================
('twk-nasionalisme-dasar', 'Nasionalisme di Era Globalisasi: Tantangan dan Sikap yang Tepat', 'twk-nasionalisme-era-globalisasi',
 'Dampak globalisasi terhadap identitas nasional, cara menyaring pengaruh asing, cinta produk dalam negeri secara rasional, dan wujud nasionalisme ASN di tengah persaingan global.',
$md$
## Globalisasi: peluang sekaligus ujian

**Globalisasi** adalah proses makin terhubungnya masyarakat dunia dalam bidang ekonomi, teknologi, informasi, dan budaya. Batas negara tidak lagi menghalangi arus barang, modal, ide, dan gaya hidup. Bagi nasionalisme, globalisasi bukan musuh, tetapi **ujian**: apakah bangsa mampu mengambil manfaatnya tanpa kehilangan jati diri?

Soal TWK tentang globalisasi hampir selalu mengarah pada satu prinsip: **terbuka secara selektif**. Jawaban yang menolak total maupun yang menerima tanpa saringan sama-sama keliru.

## Dampak globalisasi terhadap nasionalisme

| Bidang | Dampak positif | Dampak negatif |
| --- | --- | --- |
| Ekonomi | Pasar ekspor lebih luas, investasi masuk, lapangan kerja baru | Produk lokal kalah bersaing, ketergantungan pada impor |
| Teknologi dan informasi | Akses ilmu pengetahuan, layanan publik digital | Hoaks lintas negara, kejahatan siber |
| Sosial budaya | Pertukaran budaya, promosi budaya Indonesia ke dunia | Konsumerisme, individualisme, lunturnya budaya lokal |
| Politik | Kerja sama internasional, penguatan demokrasi | Masuknya ideologi yang bertentangan dengan Pancasila |

## Sikap yang perlu dihindari

| Sikap | Mengapa keliru |
| --- | --- |
| **Xenosentrisme** (memuja budaya asing dan merendahkan budaya sendiri) | Melemahkan rasa bangga sebagai bangsa |
| **Anti-asing total** | Menutup peluang belajar dan bekerja sama; bertentangan dengan nasionalisme yang terbuka |
| **Konsumerisme** | Mengonsumsi berlebihan demi gengsi, sering kali produk impor yang tidak dibutuhkan |
| **Individualisme ekstrem** | Mengikis gotong royong dan kepedulian sosial |

> **Tips ujian:** Bila opsi berisi kata "menolak semua", "melarang seluruh", atau sebaliknya "meniru sepenuhnya", hampir pasti bukan jawaban terbaik. Carilah opsi yang **menyaring, mengadaptasi, dan memperkuat jati diri**.

## Menyaring pengaruh asing: tiga pertanyaan

Untuk menilai pengaruh asing, ajukan tiga pertanyaan sederhana:

1. **Apakah sesuai dengan nilai Pancasila?** (misalnya tidak bertentangan dengan nilai ketuhanan, kemanusiaan, dan persatuan)
2. **Apakah bermanfaat** bagi kemajuan diri dan masyarakat?
3. **Apakah dapat diadaptasi** tanpa menghilangkan identitas budaya sendiri?

Contoh: belajar etos kerja disiplin dan tepat waktu dari bangsa lain lolos ketiga pertanyaan. Gaya hidup hedonis yang mendorong utang konsumtif tidak lolos.

## Cinta produk dalam negeri secara rasional

Mencintai produk Indonesia adalah wujud nasionalisme ekonomi. Namun, bentuknya harus rasional:

- **Mengutamakan** produk dalam negeri yang berkualitas, terutama dalam pengadaan barang/jasa pemerintah sesuai ketentuan.
- **Mendorong peningkatan mutu** produk lokal melalui masukan dan pembinaan, bukan membeli tanpa peduli kualitas.
- **Tidak memusuhi** produk atau pelaku usaha asing yang sah.
- **Mempromosikan** produk lokal di media sosial dan pasar internasional.

## Identitas nasional sebagai jangkar

Identitas nasional Indonesia tercermin dalam **Pancasila, bahasa Indonesia, bendera, lambang negara, lagu kebangsaan,** serta keragaman budaya daerah. Di era global, identitas ini berfungsi sebagai **jangkar**: kita boleh berlayar jauh, tetapi tidak hanyut. Contohnya, diaspora Indonesia yang tinggal di luar negeri tetap mengenalkan budaya Indonesia dan menjaga nama baik bangsa.

## Nasionalisme ASN di tengah persaingan global

- **Meningkatkan kompetensi** agar pelayanan publik setara standar global.
- **Melayani investor dan warga asing secara profesional** tanpa mengorbankan kepentingan nasional dan aturan.
- **Menjaga kerahasiaan dan keamanan data negara** dalam pemanfaatan teknologi.
- **Menggunakan bahasa Indonesia** dalam dokumen resmi sesuai ketentuan, sambil menguasai bahasa asing untuk kebutuhan kerja.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Sebuah sanggar tari memadukan musik elektronik modern dengan gerak tari tradisional untuk menarik minat remaja tanpa mengubah makna tarian. Sikap ini mencerminkan …*

Penalaran: inilah **adaptasi selektif**: unsur modern dipakai sebagai sarana, sementara nilai dan identitas tradisi tetap dipertahankan.

**Contoh 2.** *Seorang pegawai menolak bekerja sama dengan tenaga ahli asing dalam proyek irigasi, padahal kerja sama itu sah dan dibutuhkan. Sikapnya …*

Penalaran: sikap ini **tidak tepat** karena nasionalisme Pancasila bersifat terbuka. Kerja sama yang sah dan bermanfaat justru memperkuat bangsa.

**Contoh 3.** *Remaja lebih bangga memakai istilah asing dan menganggap bahasa daerahnya kuno. Gejala ini disebut …*

Penalaran: memuja budaya asing sambil merendahkan budaya sendiri adalah **xenosentrisme**.

**Contoh 4.** *Seorang pelaku UMKM menolak masukan pembeli tentang kemasan produknya dengan alasan "yang penting buatan Indonesia". Sikap yang lebih mencerminkan nasionalisme ekonomi adalah …*

Penalaran: nasionalisme ekonomi menuntut **peningkatan mutu agar produk dalam negeri mampu bersaing**, bukan berlindung di balik label lokal.

Ingat pula bahwa nasionalisme di era global tidak diukur dari seberapa keras seseorang menolak hal asing, melainkan dari **kontribusinya** bagi kemajuan bangsa.

## Ringkasan

- Globalisasi membawa dampak positif dan negatif; sikap yang benar adalah terbuka secara selektif.
- Hindari xenosentrisme, anti-asing total, konsumerisme, dan individualisme ekstrem.
- Saring pengaruh asing dengan tolok ukur Pancasila, manfaat, dan kemampuan beradaptasi.
- Cinta produk dalam negeri harus rasional dan disertai dorongan peningkatan mutu.

## Tips mengerjakan soal

- Utamakan opsi yang **aktif dan konstruktif** (meningkatkan mutu, mempromosikan, berprestasi).
- Bedakan **xenosentrisme** (memuja budaya asing) dari **etnosentrisme** (menganggap budaya sendiri paling unggul).
- Dalam kasus ASN, jawaban terbaik menggabungkan **profesionalisme global** dan **kepentingan nasional**.
$md$, false, 5, 12),

('twk-integritas', 'Akuntabilitas Pelayanan Publik, Maladministrasi, dan Pelaporan Pelanggaran', 'twk-akuntabilitas-maladministrasi-pelaporan',
 'Asas pelayanan publik, bentuk maladministrasi, saluran pelaporan pelanggaran (whistleblowing), perlindungan pelapor, LHKPN, dan gambaran hukuman disiplin PNS.',
$md$
## Integritas yang dapat diukur: akuntabilitas

Integritas bukan hanya urusan hati. Dalam birokrasi, integritas diwujudkan melalui **akuntabilitas**: kewajiban mempertanggungjawabkan keputusan, penggunaan anggaran, dan hasil kerja kepada pihak yang berwenang dan kepada publik. Pegawai yang akuntabel bekerja dengan **jelas tujuannya, terdokumentasi prosesnya, dan siap menerima konsekuensi**.

Beberapa aspek akuntabilitas yang perlu dikenali:

| Aspek | Maksud |
| --- | --- |
| Berbasis hubungan | Ada pihak yang memberi amanah dan pihak yang bertanggung jawab |
| Berorientasi hasil | Yang dinilai bukan hanya proses, tetapi juga capaian |
| Membutuhkan pelaporan | Pertanggungjawaban disampaikan melalui laporan yang dapat diperiksa |
| Memerlukan konsekuensi | Kinerja baik dihargai, pelanggaran diberi sanksi |
| Memperbaiki kinerja | Hasil evaluasi dipakai untuk perbaikan berkelanjutan |

## Asas pelayanan publik (UU Nomor 25 Tahun 2009)

Undang-Undang Pelayanan Publik menetapkan asas-asas antara lain: **kepentingan umum, kepastian hukum, kesamaan hak, keseimbangan hak dan kewajiban, keprofesionalan, partisipatif, persamaan perlakuan/tidak diskriminatif, keterbukaan, akuntabilitas, fasilitas dan perlakuan khusus bagi kelompok rentan, ketepatan waktu,** serta **kecepatan, kemudahan, dan keterjangkauan**.

> **Tips ujian:** Kasus "loket khusus bagi penyandang disabilitas dan lansia" mencerminkan asas **fasilitas dan perlakuan khusus bagi kelompok rentan**, bukan diskriminasi. Perlakuan khusus yang dibenarkan aturan justru mewujudkan keadilan.

## Maladministrasi

Menurut UU Nomor 37 Tahun 2008 tentang Ombudsman, **maladministrasi** adalah perilaku atau perbuatan melawan hukum, melampaui wewenang, menggunakan wewenang untuk tujuan lain, termasuk kelalaian atau pengabaian kewajiban hukum dalam pelayanan publik, yang menimbulkan kerugian bagi masyarakat.

Bentuk yang sering dijadikan kasus:

| Bentuk | Contoh |
| --- | --- |
| **Penundaan berlarut** | Berkas lengkap, tetapi tidak diproses berbulan-bulan |
| **Penyimpangan prosedur** | Meminta syarat tambahan yang tidak tercantum dalam standar pelayanan |
| **Permintaan imbalan** | Meminta uang di luar tarif resmi |
| **Diskriminasi** | Mendahulukan kenalan atau membeda-bedakan warga |
| **Tidak kompeten** | Petugas tidak mampu menjelaskan prosedur dasar |
| **Tidak patut** | Bersikap kasar atau merendahkan pemohon |

Warga yang dirugikan dapat melapor melalui unit pengaduan instansi dan, jika tidak tertangani, kepada **Ombudsman Republik Indonesia**.

## Pelaporan pelanggaran (*whistleblowing*)

*Whistleblower* adalah orang yang melaporkan dugaan pelanggaran di lingkungan organisasinya. Banyak instansi menyediakan **Whistleblowing System (WBS)** untuk menerima laporan secara rahasia.

Prinsip melapor yang tepat:

1. **Berdasarkan fakta**, bukan gosip atau dendam pribadi.
2. **Melalui saluran resmi** (atasan yang tidak terlibat, WBS, inspektorat, atau aparat penegak hukum), bukan langsung mengumbar di media sosial.
3. **Menyertakan bukti awal** sebisa mungkin: dokumen, waktu, tempat, pihak yang terlibat.
4. **Menjaga kerahasiaan** proses agar tidak merusak penyelidikan.

Saksi dan pelapor tindak pidana tertentu dapat memperoleh perlindungan dari **Lembaga Perlindungan Saksi dan Korban (LPSK)**.

## LHKPN

Penyelenggara negara wajib melaporkan harta kekayaannya melalui **Laporan Harta Kekayaan Penyelenggara Negara (LHKPN)** kepada KPK. Tujuannya mendorong transparansi dan mencegah perolehan harta yang tidak wajar.

## Gambaran hukuman disiplin PNS

Peraturan Pemerintah Nomor 94 Tahun 2021 tentang Disiplin PNS membagi hukuman disiplin menjadi tiga tingkat:

| Tingkat | Contoh jenis hukuman |
| --- | --- |
| **Ringan** | Teguran lisan, teguran tertulis, pernyataan tidak puas secara tertulis |
| **Sedang** | Pemotongan tunjangan kinerja untuk jangka waktu tertentu |
| **Berat** | Penurunan jabatan, pembebasan dari jabatan, hingga pemberhentian |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Petugas meminta pemohon melengkapi surat keterangan dari RT, padahal syarat itu tidak tercantum dalam standar pelayanan. Tindakan ini tergolong …*

Penalaran: menambah syarat di luar ketentuan adalah **penyimpangan prosedur**.

**Contoh 2.** *Anda menemukan bukti rekan memanipulasi data absensi untuk memperoleh tunjangan. Langkah paling tepat adalah …*

Penalaran: **melaporkan melalui saluran resmi dengan bukti**, misalnya WBS atau atasan yang berwenang. Mengunggah ke media sosial atau mendiamkan sama-sama tidak tepat.

**Contoh 3.** *Sebuah kantor menyediakan kursi roda dan loket prioritas bagi lansia dan penyandang disabilitas. Warga lain mengeluh merasa dinomorduakan. Penjelasan yang tepat adalah …*

Penalaran: kebijakan itu sesuai asas **fasilitas dan perlakuan khusus bagi kelompok rentan** dalam UU Pelayanan Publik, sehingga bukan diskriminasi. Petugas sebaiknya menjelaskan dasar aturannya dengan santun.

## Standar pelayanan sebagai alat ukur

Setiap unit pelayanan wajib memiliki **standar pelayanan** yang diumumkan kepada publik. Komponennya antara lain persyaratan, prosedur, jangka waktu penyelesaian, biaya atau tarif, produk layanan, dan mekanisme penanganan pengaduan. Standar ini menjadi alat ukur akuntabilitas: warga dapat menilai apakah petugas bekerja sesuai janji layanan, dan petugas memiliki pegangan yang jelas ketika menghadapi permintaan di luar aturan.

## Ringkasan

- Akuntabilitas adalah wujud integritas yang dapat diperiksa melalui pelaporan dan konsekuensi.
- Pelayanan publik berpegang pada asas kepastian hukum, tidak diskriminatif, keterbukaan, ketepatan waktu, dan lainnya.
- Maladministrasi meliputi penundaan berlarut, penyimpangan prosedur, permintaan imbalan, diskriminasi, dan perilaku tidak patut.
- Pelaporan pelanggaran dilakukan berdasarkan fakta, lewat saluran resmi, dan dengan menjaga kerahasiaan.

## Tips mengerjakan soal

- Petakan kasus ke **bentuk maladministrasi** yang paling spesifik.
- Pilih jawaban yang **menyelesaikan masalah lewat jalur resmi**, bukan jalur emosional.
- Ingat: memberi perlakuan khusus kepada kelompok rentan **bukan** diskriminasi.
$md$, false, 5, 13),

('twk-bela-negara', 'Komponen Cadangan, Komponen Pendukung, dan Pembinaan Kesadaran Bela Negara', 'twk-komcad-komduk-pembinaan-bela-negara',
 'Pengelolaan sumber daya nasional untuk pertahanan menurut UU 23/2019: komponen utama, cadangan, dan pendukung, serta pembinaan kesadaran bela negara di lingkup pendidikan, masyarakat, dan pekerjaan.',
$md$
## Sistem pertahanan semesta dan sumber daya nasional

Indonesia menganut **sistem pertahanan yang bersifat semesta**: melibatkan seluruh warga negara, wilayah, dan sumber daya nasional, yang dipersiapkan secara dini oleh pemerintah serta diselenggarakan secara total, terpadu, terarah, dan berlanjut. Undang-Undang Nomor 23 Tahun 2019 tentang **Pengelolaan Sumber Daya Nasional untuk Pertahanan Negara** mengatur bagaimana sumber daya itu disiapkan.

## Tiga komponen pertahanan

| Komponen | Isi | Kedudukan |
| --- | --- | --- |
| **Komponen Utama** | Tentara Nasional Indonesia (TNI) | Siap digunakan untuk melaksanakan tugas pertahanan |
| **Komponen Cadangan (Komcad)** | Sumber daya nasional yang telah disiapkan untuk dikerahkan melalui mobilisasi, guna memperbesar dan memperkuat komponen utama | Dikerahkan melalui mobilisasi |
| **Komponen Pendukung (Komduk)** | Sumber daya nasional yang dapat digunakan untuk meningkatkan kekuatan dan kemampuan komponen utama dan komponen cadangan | Mendukung, tidak membentuk kekuatan tempur langsung |

Sumber daya yang dimaksud tidak hanya manusia, tetapi juga **sumber daya alam, sumber daya buatan, serta sarana dan prasarana nasional**. Misalnya, jalan tol, pelabuhan, dan rumah sakit dapat dipersiapkan sebagai bagian dari pendukung pertahanan.

### Ciri komponen cadangan dari unsur warga negara

- Pendaftarannya bersifat **sukarela**.
- Calon harus memenuhi persyaratan, termasuk batas usia tertentu, dan mengikuti seleksi.
- Anggota yang lolos mengikuti **pelatihan dasar kemiliteran**.
- Di luar masa aktif, anggota Komcad kembali menjalankan profesinya masing-masing dan baru dikerahkan ketika negara melakukan **mobilisasi**.

> **Tips ujian:** Kata kunci **sukarela** dan **mobilisasi** menunjuk komponen cadangan. Jika kasus menyebut warga sipil dengan keahlian tertentu atau fasilitas umum yang mendukung pertahanan tanpa kekuatan tempur, arahkan ke **komponen pendukung**.

## Pembinaan kesadaran bela negara

UU 23/2019 menempatkan pembinaan kesadaran bela negara dalam **tiga lingkup**:

| Lingkup | Contoh pelaksanaan |
| --- | --- |
| **Pendidikan** | Pendidikan kewarganegaraan, kegiatan kepramukaan, pembiasaan upacara dan disiplin di sekolah |
| **Masyarakat** | Kegiatan ronda, gotong royong, organisasi kepemudaan, penyuluhan antinarkoba dan antihoaks |
| **Pekerjaan** | Pengabdian sesuai profesi, misalnya ASN yang melayani dengan jujur, dokter yang bertugas di daerah terpencil |

Sebagai pengingat, UU Nomor 3 Tahun 2002 tentang Pertahanan Negara menyebut bentuk keikutsertaan warga negara dalam bela negara melalui **pendidikan kewarganegaraan, pelatihan dasar kemiliteran secara wajib, pengabdian sebagai prajurit TNI secara sukarela atau secara wajib, dan pengabdian sesuai profesi**.

## Bela negara sesuai profesi: peta kasus

| Profesi | Wujud bela negara |
| --- | --- |
| ASN | Melayani tanpa diskriminasi, menjaga data negara, menolak korupsi |
| Guru | Menanamkan nilai kebangsaan dan berpikir kritis pada siswa |
| Petani dan nelayan | Menjaga ketahanan pangan, melaporkan aktivitas mencurigakan di perairan |
| Pengusaha | Taat pajak, membuka lapangan kerja, mengutamakan produksi dalam negeri |
| Tenaga kesehatan | Siaga saat wabah dan bencana |
| Pelajar | Belajar sungguh-sungguh, tidak tawuran, menjauhi narkoba |

## Mengapa pertahanan disiapkan sejak masa damai?

Ancaman modern dapat datang cepat dan beragam: militer, nonmiliter, maupun hibrida (gabungan keduanya). Sumber daya yang baru disiapkan ketika ancaman datang akan terlambat. Karena itu, **penyiapan sejak dini** adalah salah satu ciri sistem pertahanan semesta.

## Contoh pola soal dan penalarannya

**Contoh 1.** *Seorang insinyur telekomunikasi terdaftar dalam program yang menyiapkan keahliannya untuk mendukung kemampuan pertahanan bila diperlukan, tanpa menjadi pasukan tempur. Ia termasuk …*

Penalaran: keahlian yang disiapkan untuk **meningkatkan kemampuan** komponen utama dan cadangan tanpa kekuatan tempur langsung adalah ciri **komponen pendukung**.

**Contoh 2.** *Kegiatan siswa melakukan bakti sosial di panti jompo setiap bulan merupakan pembinaan kesadaran bela negara di lingkup …*

Penalaran: kegiatan dilakukan oleh siswa sebagai bagian dari program sekolah, sehingga lingkupnya **pendidikan**; bila dilakukan oleh karang taruna, lingkupnya masyarakat. Perhatikan pelaku dan wadahnya.

**Contoh 3.** *Pengerahan komponen cadangan dilakukan melalui …*

Penalaran: melalui **mobilisasi** oleh negara. Opsi "wajib militer bagi seluruh warga" adalah pengecoh.

**Contoh 4.** *Pengelola rumah sakit swasta besar didata oleh pemerintah agar fasilitasnya dapat dimanfaatkan untuk mendukung pertahanan dalam keadaan darurat. Fasilitas tersebut termasuk sumber daya …*

Penalaran: rumah sakit adalah **sarana dan prasarana nasional** yang dapat disiapkan sebagai bagian dari komponen pendukung. Pertahanan semesta tidak hanya mengandalkan manusia bersenjata.

## Bela negara ASN di masa damai

Bagi ASN, bela negara di masa damai tidak berarti mengangkat senjata. Wujudnya adalah bekerja profesional, menjaga kerahasiaan dokumen negara, menolak paham yang bertentangan dengan Pancasila, dan siap membantu masyarakat ketika terjadi bencana sesuai kewenangannya.

## Ringkasan

- Pertahanan semesta melibatkan seluruh warga, wilayah, dan sumber daya nasional.
- Komponen utama: TNI; komponen cadangan: disiapkan dan dikerahkan melalui mobilisasi, warga mendaftar secara sukarela; komponen pendukung: meningkatkan kemampuan komponen utama dan cadangan.
- Pembinaan kesadaran bela negara berlangsung di lingkup pendidikan, masyarakat, dan pekerjaan.
- Setiap profesi memiliki wujud bela negaranya sendiri.

## Tips mengerjakan soal

- Bedakan **cadangan** (memperbesar kekuatan, mobilisasi) dan **pendukung** (meningkatkan kemampuan).
- Untuk soal lingkup pembinaan, tentukan **wadah kegiatan**: sekolah, lingkungan warga, atau tempat kerja.
- Jawaban bela negara yang terbaik biasanya **sesuai profesi dan berdampak nyata**.
$md$, false, 5, 12),

('twk-pancasila', 'Pancasila sebagai Sumber Hukum, Sistem Filsafat, dan Dinamikanya dalam Sejarah', 'twk-pancasila-sumber-hukum-filsafat-dinamika',
 'Kedudukan Pancasila sebagai sumber segala sumber hukum, landasan ontologis–epistemologis–aksiologis, dinamika pelaksanaan Pancasila dari masa ke masa, serta lembaga dan peringatan terkait.',
$md$
## Pancasila sebagai sumber segala sumber hukum

Pasal 2 Undang-Undang Nomor 12 Tahun 2011 menegaskan bahwa **Pancasila merupakan sumber segala sumber hukum negara**. Artinya, setiap peraturan perundang-undangan harus sejalan dengan nilai-nilai Pancasila. Penempatan Pancasila dalam Pembukaan UUD 1945 juga menjadikannya **dasar dan ideologi negara** sekaligus **dasar filosofis negara**.

Dalam teori jenjang norma, Pembukaan UUD 1945 yang memuat Pancasila sering disebut sebagai **norma fundamental negara** (*staatsfundamentalnorm*). Norma ini menjadi sumber bagi pembentukan UUD dan peraturan di bawahnya.

> **Tips ujian:** Jika soal menanyakan konsekuensi Pancasila sebagai sumber segala sumber hukum, jawaban terbaik adalah **peraturan yang bertentangan dengan nilai Pancasila tidak boleh berlaku/harus diuji dan dibatalkan**, bukan "Pancasila menggantikan seluruh undang-undang".

## Pancasila sebagai sistem filsafat

Pancasila disebut sistem filsafat karena sila-silanya saling berkaitan dan membentuk satu kesatuan utuh. Kajiannya meliputi tiga landasan:

| Landasan | Pertanyaan pokok | Jawaban dalam Pancasila |
| --- | --- | --- |
| **Ontologis** | Apa hakikat yang menjadi dasar? | Hakikat manusia sebagai makhluk monopluralis: tersusun atas jiwa dan raga, makhluk individu dan sosial, makhluk pribadi dan ciptaan Tuhan |
| **Epistemologis** | Bagaimana pengetahuan tentang Pancasila diperoleh? | Digali dari nilai adat, budaya, dan agama yang hidup dalam masyarakat Indonesia, lalu dirumuskan para pendiri bangsa |
| **Aksiologis** | Nilai apa yang dikandung dan untuk apa? | Nilai ketuhanan, kemanusiaan, persatuan, kerakyatan, dan keadilan sebagai pedoman bertindak |

Pancasila juga berfungsi sebagai **sistem etika**, yaitu pedoman menilai baik-buruknya tindakan, termasuk dalam kehidupan politik. Etika politik Pancasila menuntut kekuasaan diperoleh dan dijalankan secara sah, demokratis, dan untuk kesejahteraan rakyat.

## Dinamika pelaksanaan Pancasila

| Masa | Ciri pelaksanaan | Catatan pembelajaran |
| --- | --- | --- |
| Awal kemerdekaan dan demokrasi parlementer (1945–1959) | Pancasila sebagai dasar negara mulai diuji perbedaan pandangan ideologi; Konstituante gagal menyepakati dasar negara | Muncul Dekrit Presiden 5 Juli 1959 |
| Demokrasi Terpimpin (1959–1966) | Muncul konsep Nasakom dan pemusatan kekuasaan | Penyimpangan berujung pada krisis politik 1965 |
| Orde Baru (1966–1998) | Tekad melaksanakan Pancasila secara murni dan konsekuen; penataran P4; Pancasila dijadikan asas tunggal bagi partai dan organisasi kemasyarakatan | Penafsiran cenderung dimonopoli negara |
| Reformasi (1998–sekarang) | Ketetapan MPR Nomor XVIII/MPR/1998 mencabut ketetapan tentang P4 dan menegaskan Pancasila sebagai dasar negara; ruang demokrasi lebih terbuka | Tantangan berupa radikalisme, intoleransi, dan polarisasi |

Pelajaran dari dinamika ini: Pancasila tetap kokoh sebagai dasar negara, tetapi **cara mengamalkannya harus demokratis, tidak dimonopoli, dan relevan** dengan zaman.

## Peringatan dan lembaga yang perlu diketahui

| Hal | Keterangan |
| --- | --- |
| **Hari Lahir Pancasila (1 Juni)** | Ditetapkan melalui Keputusan Presiden Nomor 24 Tahun 2016 dan menjadi hari libur nasional; merujuk pada pidato Soekarno 1 Juni 1945 |
| **Hari Kesaktian Pancasila (1 Oktober)** | Mengenang kegagalan upaya mengganti Pancasila pada peristiwa 1965 |
| **BPIP** (Badan Pembinaan Ideologi Pancasila) | Dibentuk melalui Peraturan Presiden Nomor 7 Tahun 2018; membantu presiden merumuskan arah kebijakan pembinaan ideologi Pancasila |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pernyataan bahwa nilai-nilai Pancasila telah hidup dalam adat dan budaya bangsa jauh sebelum dirumuskan secara resmi berkaitan dengan landasan …*

Penalaran: pertanyaan tentang **asal-usul pengetahuan** adalah ranah **epistemologis**.

**Contoh 2.** *Sebuah perda dinilai membatasi hak beribadah kelompok tertentu. Sikap paling tepat berdasarkan kedudukan Pancasila sebagai sumber segala sumber hukum adalah …*

Penalaran: perda tersebut dapat **diuji melalui mekanisme hukum** karena bertentangan dengan nilai Pancasila dan peraturan yang lebih tinggi, bukan diabaikan sepihak atau ditolak dengan kekerasan.

**Contoh 3.** *Penetapan Pancasila sebagai satu-satunya asas organisasi kemasyarakatan terjadi pada masa …*

Penalaran: kebijakan asas tunggal adalah ciri masa **Orde Baru**.

**Contoh 4.** *Seorang calon kepala daerah membagikan uang kepada pemilih agar dipilih. Ditinjau dari Pancasila sebagai sistem etika politik, tindakan ini keliru karena …*

Penalaran: etika politik Pancasila menuntut kekuasaan **diperoleh secara sah dan demokratis**. Politik uang merusak kedaulatan rakyat yang dijiwai sila keempat dan mencederai keadilan yang dijiwai sila kelima.

## Pancasila sebagai paradigma pembangunan

Pancasila juga dipandang sebagai **paradigma pembangunan**, yaitu kerangka berpikir yang menentukan arah pembangunan nasional. Pembangunan politik harus menghormati kedaulatan rakyat, pembangunan ekonomi harus berkeadilan sosial, pembangunan hukum harus menjunjung kemanusiaan, dan pembangunan sosial budaya harus memperkuat persatuan. Dengan paradigma ini, keberhasilan pembangunan tidak cukup diukur dari pertumbuhan ekonomi, tetapi juga dari martabat manusia yang terjaga.

## Ringkasan

- Pancasila adalah sumber segala sumber hukum negara (UU 12/2011) dan norma fundamental negara.
- Sebagai sistem filsafat, Pancasila memiliki landasan ontologis, epistemologis, dan aksiologis.
- Pelaksanaan Pancasila mengalami dinamika dari Orde Lama, Orde Baru, hingga Reformasi.
- 1 Juni: Hari Lahir Pancasila; 1 Oktober: Hari Kesaktian Pancasila; BPIP membina ideologi Pancasila.

## Tips mengerjakan soal

- Ontologis = hakikat; epistemologis = sumber pengetahuan; aksiologis = nilai dan kegunaan.
- Jangan tertukar antara **1 Juni** (lahir) dan **1 Oktober** (kesaktian).
- Pada kasus peraturan yang bertentangan dengan Pancasila, pilih jalur **pengujian hukum**.
$md$, false, 5, 13),

('twk-uud-1945', 'UUD 1945: Keuangan Negara, Pemerintahan Daerah, dan Aturan Peralihan', 'twk-uud-keuangan-daerah-peralihan',
 'Pasal-pasal tentang pemerintahan daerah (18–18B), keuangan negara dan APBN (23–23D), simbol negara (Bab XV), serta Aturan Peralihan dan Aturan Tambahan.',
$md$
## Mengapa bagian ini penting?

Banyak peserta menghafal pasal tentang lembaga negara dan HAM, tetapi melewatkan pasal tentang **pemerintahan daerah, keuangan negara,** dan **aturan peralihan**. Padahal bagian ini sering muncul sebagai soal kasus kebijakan daerah atau anggaran.

## Pemerintahan daerah (Bab VI, Pasal 18–18B)

| Ketentuan | Isi pokok |
| --- | --- |
| Pasal 18 ayat (1) | NKRI dibagi atas daerah provinsi, dan provinsi dibagi atas kabupaten dan kota, yang masing-masing mempunyai pemerintahan daerah |
| Pasal 18 ayat (2) | Pemerintahan daerah mengatur dan mengurus sendiri urusan pemerintahan menurut **asas otonomi dan tugas pembantuan** |
| Pasal 18 ayat (3) | Pemerintahan daerah memiliki **DPRD** yang anggotanya dipilih melalui pemilu |
| Pasal 18 ayat (4) | Gubernur, bupati, dan wali kota dipilih **secara demokratis** |
| Pasal 18 ayat (5) | Otonomi **seluas-luasnya**, kecuali urusan yang oleh undang-undang ditentukan sebagai urusan pemerintah pusat |
| Pasal 18 ayat (6) | Pemerintahan daerah berhak menetapkan **peraturan daerah** dan peraturan lain |
| Pasal 18A | Hubungan wewenang pusat–daerah serta hubungan keuangan, pelayanan umum, dan pemanfaatan sumber daya alam diatur dengan undang-undang secara **adil dan selaras** |
| Pasal 18B ayat (1) | Negara mengakui dan menghormati satuan pemerintahan daerah yang bersifat **khusus atau istimewa** |
| Pasal 18B ayat (2) | Negara mengakui dan menghormati **kesatuan masyarakat hukum adat** beserta hak tradisionalnya sepanjang masih hidup dan sesuai dengan perkembangan masyarakat dan prinsip NKRI |

> **Tips ujian:** Pengakuan terhadap masyarakat adat dalam Pasal 18B ayat (2) bersyarat: **masih hidup, sesuai perkembangan masyarakat, dan sesuai prinsip NKRI**. Opsi yang menyebut pengakuan "tanpa syarat" adalah pengecoh.

## Keuangan negara (Bab VIII, Pasal 23–23D)

| Ketentuan | Isi pokok |
| --- | --- |
| Pasal 23 ayat (1) | APBN ditetapkan **setiap tahun dengan undang-undang** dan dilaksanakan secara terbuka dan bertanggung jawab untuk sebesar-besarnya kemakmuran rakyat |
| Pasal 23 ayat (2) | RUU APBN diajukan oleh **Presiden** untuk dibahas bersama DPR dengan memperhatikan **pertimbangan DPD** |
| Pasal 23 ayat (3) | Jika DPR tidak menyetujui RAPBN, pemerintah menjalankan **APBN tahun yang lalu** |
| Pasal 23A | Pajak dan pungutan lain yang bersifat memaksa untuk keperluan negara diatur dengan **undang-undang** |
| Pasal 23B | Macam dan harga mata uang ditetapkan dengan undang-undang |
| Pasal 23C | Hal-hal lain mengenai keuangan negara diatur dengan undang-undang |
| Pasal 23D | Negara memiliki suatu **bank sentral** yang susunan, kedudukan, kewenangan, tanggung jawab, dan independensinya diatur dengan undang-undang |

Pemeriksaan pengelolaan dan tanggung jawab keuangan negara dilakukan oleh **BPK** (Pasal 23E–23G), yang telah dibahas pada materi lembaga negara.

**Mengapa pajak harus diatur undang-undang?** Karena undang-undang dibentuk bersama wakil rakyat. Prinsipnya: pungutan yang memaksa harus mendapat persetujuan rakyat melalui wakilnya.

## Simbol negara (Bab XV, Pasal 35–36C)

| Pasal | Isi |
| --- | --- |
| 35 | Bendera Negara Indonesia ialah Sang Merah Putih |
| 36 | Bahasa negara ialah bahasa Indonesia |
| 36A | Lambang negara ialah Garuda Pancasila dengan semboyan Bhinneka Tunggal Ika |
| 36B | Lagu kebangsaan ialah Indonesia Raya |
| 36C | Ketentuan lebih lanjut diatur dengan undang-undang |

## Aturan Peralihan dan Aturan Tambahan

| Ketentuan | Isi pokok |
| --- | --- |
| Aturan Peralihan Pasal I | Segala peraturan perundang-undangan yang ada **masih tetap berlaku** selama belum diadakan yang baru menurut UUD ini |
| Aturan Peralihan Pasal II | Semua lembaga negara yang ada masih tetap berfungsi sepanjang untuk melaksanakan ketentuan UUD dan belum diadakan yang baru |
| Aturan Peralihan Pasal III | **Mahkamah Konstitusi** dibentuk paling lambat 17 Agustus 2003; sebelum dibentuk, kewenangannya dilakukan oleh **Mahkamah Agung** |
| Aturan Tambahan Pasal I | MPR ditugasi meninjau materi dan status hukum Ketetapan MPRS dan MPR untuk diputuskan pada Sidang MPR 2003 |
| Aturan Tambahan Pasal II | Dengan ditetapkannya perubahan UUD, UUD 1945 terdiri atas **Pembukaan dan pasal-pasal** |

Aturan Peralihan Pasal I sangat penting karena mencegah **kekosongan hukum**. Tanpa ketentuan ini, peraturan lama otomatis tidak berlaku ketika konstitusi berubah.

## Contoh pola soal dan penalarannya

**Contoh 1.** *DPR menolak RAPBN yang diajukan pemerintah. Akibat hukumnya menurut UUD 1945 adalah …*

Penalaran: Pasal 23 ayat (3): pemerintah **menjalankan APBN tahun yang lalu**. Bukan pemerintahan berhenti, bukan pula Perppu.

**Contoh 2.** *Pemerintah kabupaten berencana memungut iuran wajib kepada setiap pengunjung pasar tanpa dasar hukum. Kebijakan ini bermasalah karena …*

Penalaran: pungutan yang memaksa harus memiliki **dasar hukum yang sah**; untuk pajak dan pungutan negara, Pasal 23A mensyaratkan pengaturan dengan undang-undang, sedangkan pungutan daerah harus berdasarkan perda yang dibentuk sesuai undang-undang.

**Contoh 3.** *Ketentuan yang menjamin peraturan lama tetap berlaku setelah perubahan UUD terdapat dalam …*

Penalaran: **Aturan Peralihan Pasal I**.

## Ringkasan

- Pasal 18–18B: otonomi seluas-luasnya, DPRD dipilih melalui pemilu, kepala daerah dipilih secara demokratis, pengakuan daerah khusus/istimewa dan masyarakat adat.
- Pasal 23–23D: APBN ditetapkan tiap tahun dengan UU; jika RAPBN ditolak, berlaku APBN tahun lalu; pajak diatur UU; bank sentral independen.
- Bab XV memuat simbol negara.
- Aturan Peralihan mencegah kekosongan hukum; Aturan Tambahan menegaskan UUD terdiri atas Pembukaan dan pasal-pasal.

## Tips mengerjakan soal

- Hafalkan **Pasal 23 ayat (3)** dan **Pasal 23A**; keduanya sering menjadi soal kasus.
- Bedakan Pasal 18B ayat (1) (daerah khusus/istimewa) dan ayat (2) (masyarakat hukum adat).
- Ingat bahwa MK baru dibentuk pada 2003; sebelumnya kewenangannya dijalankan MA.
$md$, false, 5, 13),

('twk-nkri', 'Integrasi Nasional dan Ancaman Disintegrasi dalam Sejarah NKRI', 'twk-integrasi-nasional-disintegrasi',
 'Pengertian integrasi nasional, faktor pendorong dan penghambatnya, pergolakan dan pemberontakan dalam sejarah NKRI beserta penyebabnya, serta strategi menjaga keutuhan bangsa.',
$md$
## Pengertian integrasi nasional

**Integrasi nasional** adalah proses menyatukan berbagai kelompok sosial, budaya, dan wilayah menjadi satu kesatuan bangsa yang utuh. Integrasi memiliki dua dimensi:

| Dimensi | Maksud |
| --- | --- |
| **Vertikal** | Menjembatani hubungan antara pemerintah dan rakyat |
| **Horizontal** | Menjembatani hubungan antarkelompok masyarakat yang beragam (suku, agama, daerah) |

Lawan dari integrasi adalah **disintegrasi**, yaitu keadaan terpecah belah yang dapat mengancam keutuhan negara.

## Faktor pendorong dan penghambat

| Faktor pendorong | Faktor penghambat |
| --- | --- |
| Pengalaman sejarah bersama melawan penjajah | Keragaman yang tidak dikelola dengan baik |
| Ideologi Pancasila sebagai titik temu | Wilayah kepulauan yang luas dan konektivitas terbatas |
| Bahasa Indonesia sebagai bahasa persatuan | Kesenjangan pembangunan antardaerah |
| Simbol negara dan semboyan Bhinneka Tunggal Ika | Primordialisme dan etnosentrisme |
| Pemerataan pembangunan dan pendidikan | Provokasi dan disinformasi |

## Pergolakan dalam sejarah NKRI

| Peristiwa | Waktu | Wilayah dan tokoh | Latar belakang pokok |
| --- | --- | --- | --- |
| **PKI Madiun** | September 1948 | Madiun; Musso | Ideologi: ingin mendirikan negara berhaluan komunis |
| **DI/TII** | Diproklamasikan di Jawa Barat pada 1949 | Kartosoewirjo (Jawa Barat); gerakan serupa di Jawa Tengah, Aceh (Daud Beureueh), Sulawesi Selatan (Kahar Muzakkar), Kalimantan Selatan | Ideologi: ingin mendirikan negara berdasarkan agama |
| **APRA** | Januari 1950 | Bandung; Westerling | Kepentingan mempertahankan bentuk negara federal |
| **Andi Azis** | April 1950 | Makassar | Menolak masuknya pasukan APRIS dari unsur TNI ke Sulawesi Selatan |
| **RMS** | April 1950 | Maluku; Soumokil | Ingin memisahkan diri dan menolak bergabung dengan negara kesatuan |
| **PRRI dan Permesta** | 1957–1958 | Sumatra dan Sulawesi | Ketidakpuasan daerah terhadap pemerintah pusat, terutama soal ketimpangan pembangunan |
| **G30S** | 1965 | Jakarta dan sejumlah daerah | Ideologi: upaya mengganti dasar negara |

Para ahli sejarah kerap mengelompokkan pergolakan itu menjadi tiga jenis:

1. **Berlatar ideologi**: PKI Madiun, DI/TII, G30S.
2. **Berlatar kepentingan** (sisa sistem federal/kolonial): APRA, Andi Azis, RMS.
3. **Berlatar sistem pemerintahan dan hubungan pusat–daerah**: PRRI dan Permesta.

> **Tips ujian:** Soal sering meminta pengelompokan berdasarkan **latar belakang**. Hafalkan tiga kelompok tersebut. PRRI/Permesta adalah contoh khas ketidakpuasan daerah terhadap pusat, bukan masalah ideologi.

## Pelajaran untuk masa kini

1. **Keadilan pembangunan** adalah perekat persatuan. Ketimpangan yang dibiarkan dapat memicu ketidakpuasan daerah.
2. **Ideologi Pancasila** perlu terus dibina agar tidak tergeser ideologi yang memecah belah.
3. **Penyelesaian damai dan dialog** lebih diutamakan, misalnya pemberian otonomi khusus dan kesepakatan damai.
4. **Kewaspadaan terhadap provokasi** di media sosial yang mempertentangkan suku, agama, dan daerah.

## Strategi menjaga integrasi

| Strategi | Contoh |
| --- | --- |
| Asimilasi | Peleburan budaya sehingga membentuk budaya baru |
| Akulturasi | Penerimaan unsur budaya luar tanpa menghilangkan budaya asli |
| Pluralis | Menghargai keberagaman dan memberi ruang setiap kelompok untuk berkembang |
| Pembangunan merata | Infrastruktur, pendidikan, dan kesehatan di daerah tertinggal dan perbatasan |
| Otonomi daerah | Memberi ruang daerah mengelola potensinya dalam bingkai NKRI |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Pergolakan yang dipicu ketidakpuasan sejumlah daerah terhadap kebijakan pembangunan pemerintah pusat pada akhir 1950-an adalah …*

Penalaran: ciri ini menunjuk **PRRI/Permesta**. RMS memang separatis, tetapi latarnya keinginan memisahkan diri, bukan ketidakpuasan pembangunan.

**Contoh 2.** *Dua kampung bertikai karena isu pembagian lahan. Pendekatan yang paling sesuai dengan semangat integrasi nasional adalah …*

Penalaran: pilih **mediasi dan dialog yang difasilitasi pemerintah setempat dan tokoh masyarakat**, bukan memisahkan kedua kampung secara permanen atau menggunakan kekerasan.

**Contoh 3.** *Pemerintah membangun jaringan internet, jalan, dan sekolah di wilayah perbatasan agar warga tidak merasa tertinggal dari daerah lain. Kebijakan ini memperkuat integrasi nasional karena …*

Penalaran: kebijakan itu mengurangi **kesenjangan pembangunan**, salah satu faktor penghambat integrasi. Ia juga memperkuat dimensi **vertikal** integrasi, yaitu kepercayaan rakyat kepada pemerintah.

## Penyelesaian damai: contoh di era reformasi

Era reformasi menunjukkan bahwa konflik yang panjang dapat diselesaikan melalui dialog. Konflik bersenjata di Aceh diakhiri dengan **Nota Kesepahaman Helsinki (15 Agustus 2005)** antara Pemerintah Republik Indonesia dan Gerakan Aceh Merdeka, yang kemudian ditindaklanjuti dengan **Undang-Undang Nomor 11 Tahun 2006 tentang Pemerintahan Aceh**. Untuk Papua, negara memberikan **otonomi khusus** melalui Undang-Undang Nomor 21 Tahun 2001 beserta perubahannya. Pendekatan ini memperlihatkan bahwa keutuhan NKRI dijaga bukan hanya dengan kekuatan, tetapi juga dengan keadilan, pengakuan kekhasan daerah, dan kesepakatan bersama.

## Ringkasan

- Integrasi nasional mencakup dimensi vertikal (pemerintah–rakyat) dan horizontal (antarkelompok).
- Pendorong: sejarah bersama, Pancasila, bahasa persatuan; penghambat: kesenjangan, primordialisme, provokasi.
- Pergolakan dalam sejarah dapat dikelompokkan berdasarkan ideologi, kepentingan, dan hubungan pusat–daerah.
- Keadilan pembangunan, pembinaan ideologi, dan dialog adalah kunci menjaga keutuhan NKRI.

## Tips mengerjakan soal

- Kenali pasangan **peristiwa–tokoh–wilayah** (Madiun–Musso, RMS–Soumokil, APRA–Westerling).
- Untuk soal sikap, pilih jawaban yang menekankan **dialog, keadilan, dan penegakan hukum**.
- Bedakan **asimilasi** (melebur jadi budaya baru) dan **akulturasi** (unsur asli tetap ada).
- Ingat urutan waktu: Madiun (1948), DI/TII (1949), APRA, Andi Azis, dan RMS (1950), Permesta dan PRRI (1957–1958), serta G30S (1965). Urutan ini membantu menjawab soal kronologi.
$md$, false, 5, 13),

('twk-kaidah-bahasa', 'Imbuhan, Pembentukan Kata, dan Konjungsi dalam Kalimat Baku', 'twk-imbuhan-konjungsi',
 'Kaidah imbuhan meN- dan peN- termasuk peluluhan KTSP, konfiks, makna imbuhan, konjungsi intrakalimat dan antarkalimat, konjungsi korelatif, serta kesalahan yang sering muncul.',
$md$
## Imbuhan dan peluluhan

Imbuhan (afiks) adalah bentuk terikat yang ditambahkan pada kata dasar. Yang paling sering diuji adalah **meN-** dan **peN-** karena bentuknya berubah sesuai huruf awal kata dasar.

| Huruf awal kata dasar | Bentuk | Contoh |
| --- | --- | --- |
| Vokal, k, g, h | meng-/peng- | mengambil, mengirim, menggambar, menghapus |
| t, d | men-/pen- | menulis, mendengar |
| s | meny-/peny- | menyapu, penyusun |
| c, j | men-/pen- | mencari, menjual |
| p, b | mem-/pem- | memukul, membaca |
| l, m, n, r, w, y | me-/pe- | melatih, merawat, mewarnai |
| Satu suku kata | menge-/penge- | mengecat, mengebom, pengelas |

### Kaidah KTSP

Kata dasar yang diawali **k, t, s, p** akan **luluh** bila mendapat meN- atau peN-: *kirim → mengirim, tulis → menulis, sapu → menyapu, pukul → memukul*.

Pengecualian penting: **gugus konsonan** (dua konsonan di awal) **tidak luluh**: *mentransfer, memproses, memprioritaskan, menstabilkan, mengkritik, mengklasifikasi*.

> **Tips ujian:** Bentuk *mengkonsumsi, mempengaruhi,* dan *mensukseskan* tidak baku. Yang baku adalah **mengonsumsi, memengaruhi, menyukseskan**, karena huruf awalnya k, p, dan s tunggal (bukan gugus konsonan). Sebaliknya, *mengkritik* baku karena *kr* adalah gugus konsonan.

## Konfiks dan gabungan imbuhan

**Konfiks** adalah imbuhan yang dipasang bersamaan di awal dan akhir kata serta membentuk satu makna, misalnya **ke-an** (*kesehatan, kemerdekaan*), **peN-an** (*pembangunan, penyelesaian*), **per-an** (*perumahan, persatuan*), dan **ber-an** (*berdatangan, berhamburan*).

Hati-hati dengan kata dasar yang berawalan huruf yang sama dengan imbuhan:

| Bentuk benar | Bentuk salah | Alasan |
| --- | --- | --- |
| **memperhatikan** | memerhatikan | *per-* adalah imbuhan (memper- + hati + -kan), bukan huruf awal kata dasar, sehingga tidak luluh |
| **mengesampingkan** | mengenyampingkan | kata dasar *samping* dengan bentuk *ke-samping* |
| **pertanggungjawaban** | pertanggung jawaban | gabungan kata yang mendapat imbuhan awal dan akhir sekaligus ditulis serangkai |
| **menyukseskan** | mensukseskan | s luluh |

## Makna imbuhan

| Imbuhan | Makna | Contoh |
| --- | --- | --- |
| ber- | memiliki/memakai | bersepatu, berkebun |
| meN-kan | membuat jadi / menyebabkan | membersihkan, menyatukan |
| meN-i | melakukan berulang / memberi | memukuli, menandai |
| ter- | tidak sengaja / paling / dapat di- | tertidur, terbaik, terbaca |
| ke-an | hal / terlalu / mengalami | keadilan, kebesaran, kehujanan |
| peN- | pelaku / alat | penulis, penghapus |

## Konjungsi

### Intrakalimat dan antarkalimat

| Jenis | Posisi | Contoh |
| --- | --- | --- |
| **Intrakalimat** | Menghubungkan klausa dalam satu kalimat | *tetapi, sehingga, karena, meskipun, agar* |
| **Antarkalimat** | Mengawali kalimat baru dan diikuti tanda koma | *Akan tetapi, Oleh karena itu, Namun, Selain itu, Meskipun demikian* |

Kesalahan umum:

- Memulai kalimat dengan *Tetapi* atau *Sehingga*. Gunakan **Akan tetapi** atau **Oleh karena itu** di awal kalimat.
- Memakai dua konjungsi bermakna sama sekaligus: *Meskipun ia sakit, tetapi ia tetap bekerja.* Yang baku: **Meskipun ia sakit, ia tetap bekerja** atau **Ia sakit, tetapi tetap bekerja.**
- Menempatkan koma sebelum *bahwa*, *karena*, atau *sehingga* ketika induk kalimat berada di depan.

### Konjungsi korelatif

Konjungsi korelatif bekerja berpasangan dan **tidak boleh ditukar pasangannya**:

| Pasangan benar | Pasangan salah |
| --- | --- |
| **baik … maupun …** | baik … ataupun … / baik … dan … |
| **tidak hanya … tetapi juga …** | tidak hanya … namun juga … |
| **bukan … melainkan …** (untuk kata benda) | bukan … tetapi … |
| **tidak … tetapi …** (untuk kata kerja/sifat) | tidak … melainkan … |
| **entah … entah …** | entah … atau … |

## Contoh pola soal dan penalarannya

**Contoh 1.** *Kalimat yang menggunakan imbuhan secara baku adalah …*

Penalaran: periksa kata berawalan k, t, s, p. Opsi yang memuat *memengaruhi* atau *mengonsumsi* benar; opsi dengan *mempengaruhi* salah.

**Contoh 2.** *Perbaikan kalimat "Walaupun hujan deras, tetapi petugas tetap berjaga." adalah …*

Penalaran: hilangkan salah satu konjungsi: **Walaupun hujan deras, petugas tetap berjaga.**

**Contoh 3.** *Konjungsi yang tepat untuk "Yang dibutuhkan warga bukan janji, … bukti nyata."*

Penalaran: pasangan *bukan* adalah **melainkan**.

## Kalimat majemuk dan konjungsinya

| Jenis kalimat majemuk | Hubungan | Konjungsi |
| --- | --- | --- |
| Setara | Penjumlahan | dan, serta |
| Setara | Pemilihan | atau |
| Setara | Pertentangan | tetapi, sedangkan |
| Setara | Urutan waktu | lalu, kemudian |
| Bertingkat | Sebab | karena, sebab |
| Bertingkat | Syarat | jika, apabila, kalau |
| Bertingkat | Tujuan | agar, supaya |
| Bertingkat | Konsesif | meskipun, walaupun |
| Bertingkat | Akibat | sehingga |
| Bertingkat | Waktu | ketika, setelah, sebelum |

Dalam kalimat majemuk bertingkat, jika **anak kalimat mendahului induk kalimat**, keduanya dipisahkan dengan koma: *Jika berkas lengkap, permohonan langsung diproses.* Sebaliknya, jika induk kalimat di depan, koma tidak dipakai: *Permohonan langsung diproses jika berkas lengkap.*

**Contoh 4.** *Kata berimbuhan yang ditulis sesuai kaidah adalah …* Penalaran: dari pilihan *menterjemahkan, menerjemahkan, mentaati, menyontoh, mensosialisasikan*, yang baku hanya **menerjemahkan**, karena t pada *terjemah* luluh. Bentuk baku lainnya adalah *menaati, mencontoh,* dan *menyosialisasikan*.

## Ringkasan

- meN-/peN- berubah bentuk sesuai huruf awal; k, t, s, p luluh kecuali gugus konsonan.
- Konfiks dipasang serentak dan membentuk satu makna.
- Konjungsi antarkalimat (Akan tetapi, Oleh karena itu) berbeda dari intrakalimat (tetapi, sehingga).
- Konjungsi korelatif memiliki pasangan tetap.

## Tips mengerjakan soal

- Saat ragu, cek apakah huruf kedua kata dasar adalah **vokal** (luluh) atau **konsonan** (gugus, tidak luluh).
- Waspadai **konjungsi ganda** dalam satu kalimat; itu tanda kalimat tidak efektif.
- Hafalkan pasangan **bukan–melainkan** dan **baik–maupun**.
- Biasakan membaca ulang kalimat secara lengkap setelah memilih jawaban; kesalahan imbuhan dan konjungsi biasanya langsung terasa janggal bila dibaca utuh.
$md$, false, 6, 13)

) as v(sub, title, slug, summary, content, is_free, sort_order, est_minutes)
join public.subtopics s on s.slug = v.sub
on conflict (slug) do nothing;

-- ---------------------------------------------------------------------------
-- BANK SOAL (TWK) — putaran 2
-- ---------------------------------------------------------------------------
create temporary table _twk2_q (
  sub text, stem text, a text, b text, c text, d text, e text,
  k char(1), expl text, diff public.difficulty
) on commit drop;

insert into _twk2_q values
('twk-sejarah-pergerakan',
 'Kebijakan Politik Etis yang dijalankan pemerintah kolonial Belanda pada awal abad ke-20 memuat tiga program utama, yaitu …',
 'irigasi, emigrasi, dan edukasi', 'irigasi, industrialisasi, dan edukasi', 'edukasi, ekonomi, dan emansipasi', 'emigrasi, ekspor, dan eksploitasi', 'irigasi, emigrasi, dan ekspansi',
 'A', 'Politik Etis dikenal dengan trilogi irigasi (pengairan), emigrasi (perpindahan penduduk), dan edukasi (pendidikan). Pengecoh biasanya mengganti salah satu unsur dengan istilah berawalan huruf yang sama, seperti industrialisasi atau ekspansi.', 'easy'),
('twk-sejarah-pergerakan',
 'Dampak Politik Etis yang paling besar pengaruhnya terhadap lahirnya pergerakan nasional Indonesia adalah …',
 'meningkatnya kesejahteraan petani secara merata di seluruh Hindia Belanda', 'berakhirnya kekuasaan Belanda atas wilayah di luar Pulau Jawa', 'terbentuknya parlemen yang seluruh anggotanya dipilih rakyat', 'munculnya golongan terpelajar bumiputra yang sadar akan nasib bangsanya', 'dihapuskannya seluruh pajak yang dibebankan kepada rakyat',
 'D', 'Program edukasi melahirkan kaum terpelajar yang kemudian memelopori organisasi pergerakan modern. Kesejahteraan rakyat justru tidak banyak berubah, sehingga opsi tentang kesejahteraan merata adalah jebakan.', 'medium'),
('twk-sejarah-pergerakan',
 'Siasat benteng stelsel, yaitu membangun benteng di setiap wilayah yang dikuasai untuk mempersempit ruang gerak lawan, dikenal luas sebagai siasat Belanda dalam menghadapi …',
 'Perang Banjar', 'perlawanan Pattimura di Saparua', 'perlawanan Sultan Hasanuddin di Gowa', 'Puputan Badung di Bali', 'Perang Diponegoro',
 'E', 'Benteng stelsel identik dengan upaya Belanda mempersempit gerak pasukan Pangeran Diponegoro (1825–1830). Perlawanan lain dipatahkan dengan cara berbeda, misalnya Gowa melalui Perjanjian Bongaya.', 'easy'),
('twk-sejarah-pergerakan',
 'Perjanjian Bongaya tahun 1667 menandai berakhirnya perlawanan … terhadap VOC.',
 'Kerajaan Gowa di bawah Sultan Hasanuddin', 'Kerajaan Mataram di bawah Sultan Agung', 'Kesultanan Banten di bawah Sultan Ageng Tirtayasa', 'Kesultanan Ternate di bawah Sultan Baabullah', 'Kesultanan Aceh di bawah Sultan Iskandar Muda',
 'A', 'Perjanjian Bongaya mengakhiri perlawanan Gowa yang dipimpin Sultan Hasanuddin dan sangat merugikan Gowa. Sultan Agung menyerang Batavia pada 1628 dan 1629, jauh sebelum perjanjian ini, sehingga tidak tepat.', 'medium'),
('twk-sejarah-pergerakan',
 'Pemerintah kolonial memanfaatkan hasil kajian Snouck Hurgronje tentang struktur sosial dan keagamaan masyarakat setempat untuk mematahkan perlawanan di …',
 'Aceh', 'Maluku', 'Bali', 'Kalimantan Selatan', 'Tanah Batak',
 'A', 'Snouck Hurgronje mempelajari masyarakat Aceh dan sarannya dipakai Belanda dalam Perang Aceh. Pengecoh lain adalah wilayah perlawanan yang juga terkenal, tetapi tidak identik dengan kajian Snouck Hurgronje.', 'medium'),
('twk-sejarah-pergerakan',
 'Perlawanan rakyat di berbagai daerah pada abad ke-19 umumnya dapat dipatahkan oleh Belanda. Faktor yang paling mendasar menyebabkan kegagalan tersebut adalah …',
 'rakyat tidak memiliki keberanian untuk melawan penjajah', 'para pemimpin perlawanan tidak dihormati oleh rakyatnya', 'Belanda tidak pernah menggunakan siasat adu domba', 'perjuangan masih bersifat kedaerahan dan belum dipersatukan oleh kesadaran sebagai satu bangsa', 'perlawanan hanya dilakukan kaum bangsawan tanpa dukungan rakyat',
 'D', 'Kelemahan pokok perlawanan sebelum 1908 adalah sifatnya yang kedaerahan sehingga mudah dipatahkan satu per satu. Opsi yang meragukan keberanian rakyat atau menyangkal politik adu domba justru bertentangan dengan fakta sejarah.', 'hard'),
('twk-sejarah-pergerakan',
 'Organisasi yang didirikan oleh Tiga Serangkai pada tahun 1912 dan secara tegas mencita-citakan kemerdekaan adalah …',
 'Budi Utomo', 'Sarekat Islam', 'Indische Partij', 'Perhimpunan Indonesia', 'Partai Nasional Indonesia',
 'C', 'Indische Partij didirikan Douwes Dekker, Tjipto Mangoenkoesoemo, dan Soewardi Soerjaningrat pada 25 Desember 1912. Budi Utomo memang organisasi modern pertama, tetapi bergerak di bidang sosial budaya, bukan politik kemerdekaan.', 'easy'),
('twk-sejarah-pergerakan',
 'Tulisan Soewardi Soerjaningrat yang berjudul "Als ik eens Nederlander was" (Seandainya Aku Seorang Belanda) berisi …',
 'pujian terhadap keberhasilan pelaksanaan Politik Etis', 'sindiran terhadap rencana perayaan kemerdekaan Belanda di tanah jajahan yang dibiayai rakyat terjajah', 'ajakan kepada kaum terpelajar untuk bekerja sama dengan pemerintah kolonial', 'usulan pendirian perguruan Taman Siswa di Yogyakarta', 'rancangan dasar negara bagi Indonesia merdeka',
 'B', 'Tulisan itu menyindir ironi bangsa terjajah yang dipaksa ikut membiayai perayaan kemerdekaan penjajahnya. Taman Siswa memang didirikan oleh tokoh yang sama, tetapi baru pada 1922 dan bukan isi tulisan tersebut.', 'medium'),
('twk-sejarah-pergerakan',
 'Pada dekade 1930-an banyak organisasi pergerakan beralih dari strategi nonkooperatif ke kooperatif. Alasan yang paling tepat adalah …',
 'para tokoh pergerakan sudah tidak lagi menginginkan kemerdekaan', 'pemerintah kolonial telah memberikan kemerdekaan penuh kepada Indonesia', 'tindakan represif pemerintah kolonial terhadap tokoh dan organisasi nonkooperatif sehingga perjuangan perlu tetap berjalan secara legal', 'Jepang memerintahkan seluruh organisasi bekerja sama dengan Belanda', 'organisasi kooperatif selalu memperoleh anggota lebih banyak',
 'C', 'Penangkapan dan pengasingan tokoh nonkooperatif membuat ruang gerak sempit, sehingga strategi kooperatif dipakai sebagai taktik bertahan. Jepang baru datang pada 1942, sehingga opsi tentang perintah Jepang tidak sesuai kronologi.', 'medium'),
('twk-sejarah-pergerakan',
 'Gabungan Politik Indonesia (GAPI) yang dibentuk pada tahun 1939 terkenal dengan tuntutan …',
 'Indonesia Merdeka Sekarang Juga', 'Indonesia Menggugat', 'Hindia untuk Bangsa Belanda', 'Satu Nusa, Satu Bangsa, Satu Bahasa', 'Indonesia Berparlemen',
 'E', 'GAPI menuntut dibentuknya parlemen yang dipilih rakyat melalui seruan Indonesia Berparlemen. Indonesia Menggugat adalah judul pembelaan Soekarno di pengadilan kolonial, bukan semboyan GAPI.', 'medium'),
('twk-sejarah-pergerakan',
 'Empat Serangkai yang memimpin Pusat Tenaga Rakyat (Putera) pada masa pendudukan Jepang terdiri atas Soekarno, Mohammad Hatta, Ki Hajar Dewantara, dan …',
 'dr. Tjipto Mangoenkoesoemo', 'E.F.E. Douwes Dekker', 'H.O.S. Tjokroaminoto', 'K.H. Mas Mansur', 'Sutan Sjahrir',
 'D', 'Empat Serangkai Putera adalah Soekarno, Hatta, Ki Hajar Dewantara, dan K.H. Mas Mansur. Tjipto Mangoenkoesoemo dan Douwes Dekker adalah anggota Tiga Serangkai Indische Partij, pengecoh yang sering muncul.', 'easy'),
('twk-sejarah-pergerakan',
 'Kebijakan pemerintah pendudukan Jepang yang secara tidak langsung memperkuat kedudukan bahasa Indonesia adalah …',
 'kewajiban seluruh rakyat memakai bahasa Jepang di rumah', 'pembentukan Jawa Hokokai untuk menghimpun hasil bumi', 'pengerahan romusha untuk membangun sarana perang', 'pembentukan Heiho sebagai pembantu prajurit Jepang', 'pelarangan penggunaan bahasa Belanda sehingga bahasa Indonesia banyak dipakai dalam pendidikan dan pemerintahan',
 'E', 'Larangan bahasa Belanda membuat bahasa Indonesia mengisi ruang resmi, sehingga penggunaannya meluas. Romusha dan Heiho memang kebijakan Jepang, tetapi tidak berkaitan dengan perkembangan bahasa.', 'medium'),
('twk-sejarah-pergerakan',
 'Tujuan golongan muda membawa Soekarno dan Hatta ke Rengasdengklok pada 16 Agustus 1945 adalah …',
 'menyiapkan pasukan untuk menyerang markas Jepang di Jakarta', 'meminta keduanya membubarkan PPKI yang dibentuk Jepang', 'menjauhkan keduanya dari pengaruh Jepang agar proklamasi kemerdekaan segera dilaksanakan', 'menyelenggarakan sidang terakhir BPUPKI di luar Jakarta', 'menyerahkan kepemimpinan nasional kepada golongan muda',
 'C', 'Golongan muda ingin proklamasi dilakukan segera tanpa campur tangan Jepang, sehingga kedua tokoh dibawa ke Rengasdengklok. Opsi pengambilalihan kepemimpinan keliru karena golongan muda tetap menghendaki Soekarno-Hatta memproklamasikan kemerdekaan.', 'medium'),
('twk-sejarah-pergerakan',
 'Naskah proklamasi tulisan tangan Soekarno kemudian diketik oleh …',
 'Sukarni', 'Ahmad Soebardjo', 'Latief Hendraningrat', 'Sayuti Melik', 'Wikana',
 'D', 'Sayuti Melik mengetik naskah proklamasi di rumah Laksamana Maeda. Sukarni berperan mengusulkan agar naskah ditandatangani Soekarno-Hatta atas nama bangsa Indonesia, sedangkan Ahmad Soebardjo ikut merumuskan teks.', 'easy'),
('twk-sejarah-pergerakan',
 'Salah satu perubahan pada naskah proklamasi ketikan dibandingkan konsep tulisan tangan adalah …',
 'kata "kekuasaan" diganti menjadi "kedaulatan"', 'tempat pembacaan diubah dari Rengasdengklok menjadi Jakarta', 'naskah ditandatangani oleh seluruh anggota PPKI', 'kalimat pertama diganti menjadi pernyataan pembentukan kabinet', 'frasa "wakil-wakil bangsa Indonesia" diganti menjadi "Atas nama bangsa Indonesia"',
 'E', 'Perubahan pada naskah otentik meliputi kata tempoe menjadi tempo, frasa wakil-wakil bangsa Indonesia menjadi Atas nama bangsa Indonesia, dan penulisan tanggal. Naskah hanya ditandatangani Soekarno dan Hatta, bukan seluruh anggota PPKI.', 'hard'),
('twk-sejarah-pergerakan',
 'Peringatan Hari Pahlawan setiap tanggal 10 November berkaitan dengan peristiwa …',
 'Palagan Ambarawa', 'Pertempuran Surabaya tahun 1945 melawan pasukan Sekutu', 'Bandung Lautan Api', 'Puputan Margarana', 'Pertempuran Medan Area',
 'B', 'Hari Pahlawan mengenang pertempuran besar di Surabaya pada 10 November 1945. Palagan Ambarawa diperingati pada 15 Desember, sedangkan Bandung Lautan Api terjadi pada 24 Maret 1946.', 'medium'),
('twk-sejarah-pergerakan',
 'Pada Maret 1946 para pejuang dan warga memilih membakar kota lalu mengungsi ke arah selatan daripada menyerahkan kota dalam keadaan utuh kepada pihak Sekutu dan Belanda. Peristiwa ini dikenal sebagai …',
 'Pertempuran Lima Hari di Semarang', 'Palagan Ambarawa', 'Pertempuran Surabaya', 'Puputan Margarana', 'Bandung Lautan Api',
 'E', 'Pembakaran kota oleh pejuang dan warga pada 24 Maret 1946 dikenal sebagai Bandung Lautan Api. Peristiwa lain adalah pertempuran terbuka, bukan aksi bumi hangus kota.', 'easy'),
('twk-sejarah-pergerakan',
 'Pemberontakan tentara PETA di Blitar pada Februari 1945 yang dipimpin Supriyadi menunjukkan bahwa …',
 'PETA dibentuk Belanda untuk melawan pendudukan Jepang', 'Jepang telah menyerah kepada Sekutu sebelum pemberontakan terjadi', 'rakyat Blitar menolak gagasan kemerdekaan Indonesia', 'PETA adalah organisasi politik yang dipimpin Empat Serangkai', 'pelatihan militer dari Jepang justru dimanfaatkan pemuda Indonesia untuk melawan penindasan',
 'E', 'PETA dibentuk Jepang, tetapi para anggotanya memakai keterampilan militer itu untuk melawan kesewenang-wenangan Jepang. Jepang baru menyerah pada Agustus 1945, sehingga opsi tentang penyerahan Jepang tidak sesuai urutan waktu.', 'hard'),
('twk-sejarah-pergerakan',
 'Golongan tua dan golongan muda berbeda pendapat tentang waktu proklamasi, tetapi akhirnya bersama-sama merumuskan teks proklamasi pada malam 16 Agustus 1945. Sikap yang paling patut diteladani seorang ASN dari peristiwa tersebut adalah …',
 'berani menyampaikan pendapat yang berbeda, lalu mencari titik temu demi kepentingan bersama', 'selalu mengikuti pendapat pihak yang lebih senior tanpa diskusi', 'memaksakan kehendak jika merasa pendapatnya paling benar', 'menghindari perbedaan pendapat agar suasana kerja tetap tenang', 'menyerahkan keputusan kepada pihak luar agar dianggap netral',
 'A', 'Peristiwa itu menunjukkan bahwa perbedaan pendapat dapat berakhir dengan kesepakatan bila semua pihak mengutamakan kepentingan bangsa. Menghindari perbedaan atau mengikuti senior tanpa diskusi bukanlah teladan musyawarah.', 'hard'),
('twk-wawasan-nusantara',
 'Dalam paradigma nasional, Ketahanan Nasional berkedudukan sebagai landasan …',
 'idiil', 'konstitusional', 'visional', 'konsepsional', 'operasional',
 'D', 'Pancasila adalah landasan idiil, UUD 1945 landasan konstitusional, Wawasan Nusantara landasan visional, dan Ketahanan Nasional landasan konsepsional. Visional adalah pengecoh karena sering tertukar dengan kedudukan Wawasan Nusantara.', 'easy'),
('twk-wawasan-nusantara',
 'Tiga unsur dasar konsepsi Wawasan Nusantara adalah …',
 'wadah, isi, dan tata laku', 'wilayah, penduduk, dan pemerintahan', 'ideologi, politik, dan ekonomi', 'geografi, demografi, dan kekayaan alam', 'kesejahteraan, keamanan, dan kekeluargaan',
 'A', 'Unsur dasar Wawasan Nusantara adalah wadah (contour), isi (content), dan tata laku (conduct). Wilayah, penduduk, dan pemerintahan adalah unsur berdirinya negara, sedangkan geografi, demografi, dan kekayaan alam adalah trigatra.', 'easy'),
('twk-wawasan-nusantara',
 'Dalam konsep ketahanan nasional, hal yang bersifat menggugah dan menguji kemampuan bangsa sehingga dapat menjadi pendorong kemajuan disebut …',
 'tantangan', 'ancaman', 'hambatan', 'gangguan', 'kerawanan',
 'A', 'Tantangan adalah hal yang menggugah kemampuan dan dapat mendorong kemajuan. Ancaman bersifat konsepsional dan terencana, sedangkan hambatan dan gangguan bersifat melemahkan secara tidak konsepsional.', 'medium'),
('twk-wawasan-nusantara',
 'Dalam sengketa batas laut dengan negara tetangga, Indonesia memilih jalur perundingan bilateral dan tidak mengedepankan unjuk kekuatan militer. Sifat ketahanan nasional yang tercermin dari sikap tersebut adalah …',
 'mandiri', 'dinamis', 'manunggal', 'konsultasi dan kerja sama', 'wibawa',
 'D', 'Sifat konsultasi dan kerja sama berarti mengutamakan dialog dan kerja sama, bukan konfrontasi atau adu kekuatan. Wibawa adalah hasil dari ketahanan yang kuat, bukan cara menyelesaikan sengketa.', 'medium'),
('twk-wawasan-nusantara',
 'Pemerintah daerah menyusun rencana penanggulangan banjir dengan terlebih dahulu memetakan kelemahan sistem drainasenya sendiri sekaligus mempelajari perubahan pola cuaca di kawasan sekitarnya. Asas ketahanan nasional yang paling sesuai adalah …',
 'mawas ke dalam dan mawas ke luar', 'kesejahteraan dan keamanan', 'komprehensif integral', 'kekeluargaan', 'konsultasi dan kerja sama',
 'A', 'Mengenali kelemahan sendiri (ke dalam) sekaligus memperhatikan perubahan lingkungan luar adalah asas mawas ke dalam dan mawas ke luar. Konsultasi dan kerja sama adalah sifat ketahanan nasional, bukan asas, sehingga menjadi pengecoh.', 'medium'),
('twk-wawasan-nusantara',
 'Ketahanan nasional disebut bersifat dinamis. Maksud pernyataan tersebut adalah …',
 'ketahanan nasional hanya berkaitan dengan kekuatan militer', 'ketahanan nasional tidak dapat dipengaruhi oleh faktor dari luar', 'ketahanan nasional bergantung sepenuhnya pada bantuan negara lain', 'ketahanan nasional bersifat tetap setelah berhasil dicapai', 'kondisi ketahanan dapat meningkat atau menurun sesuai keadaan sehingga harus terus dibina',
 'E', 'Dinamis berarti kondisi ketahanan dapat berubah naik atau turun, sehingga perlu dibina secara berkelanjutan. Opsi yang menyebut ketahanan bersifat tetap justru berlawanan dengan makna dinamis.', 'medium'),
('twk-wawasan-nusantara',
 'Yang termasuk pancagatra dalam konsep astagatra adalah …',
 'geografi, demografi, kekayaan alam, politik, dan ekonomi', 'ideologi, geografi, ekonomi, demografi, dan hukum', 'politik, ekonomi, kekayaan alam, penduduk, dan budaya', 'Pancasila, UUD 1945, NKRI, Bhinneka Tunggal Ika, dan Wawasan Nusantara', 'ideologi, politik, ekonomi, sosial budaya, serta pertahanan dan keamanan',
 'E', 'Pancagatra adalah aspek sosial kehidupan nasional yang disingkat ipoleksosbudhankam. Geografi, demografi, dan kekayaan alam termasuk trigatra (aspek alamiah), sehingga opsi yang mencampurnya keliru.', 'easy'),
('twk-wawasan-nusantara',
 'Urutan ketahanan berlapis dari lingkup terkecil hingga terbesar adalah …',
 'ketahanan nasional, regional, daerah, keluarga, dan pribadi', 'ketahanan pribadi, keluarga, daerah, regional, dan nasional', 'ketahanan keluarga, pribadi, daerah, nasional, dan regional', 'ketahanan pribadi, daerah, keluarga, nasional, dan regional', 'ketahanan daerah, keluarga, pribadi, regional, dan nasional',
 'B', 'Ketahanan nasional dibangun dari lapisan terkecil, yaitu pribadi, lalu keluarga, daerah, regional, hingga nasional. Opsi pertama yang dibalik dari besar ke kecil adalah jebakan bagi yang kurang teliti membaca kata dari lingkup terkecil.', 'easy'),
('twk-wawasan-nusantara',
 'Teori geopolitik yang memandang kekuatan laut sebagai kunci untuk menguasai dunia dikemukakan oleh …',
 'Halford Mackinder', 'Karl Haushofer', 'Friedrich Ratzel', 'Giulio Douhet', 'Alfred Thayer Mahan',
 'E', 'Mahan dikenal dengan wawasan bahari (sea power). Mackinder mengemukakan wawasan benua, Douhet menekankan kekuatan udara, sedangkan Ratzel dan Haushofer berkaitan dengan konsep ruang hidup negara.', 'medium'),
('twk-wawasan-nusantara',
 'Perbedaan mendasar antara Wawasan Nusantara dan ajaran geopolitik Karl Haushofer adalah …',
 'Wawasan Nusantara mengutamakan kekuatan udara, sedangkan Haushofer mengutamakan kekuatan laut', 'Wawasan Nusantara hanya berlaku di wilayah darat, sedangkan ajaran Haushofer berlaku di laut', 'Haushofer menolak segala bentuk ekspansi, sedangkan Wawasan Nusantara membenarkannya', 'Wawasan Nusantara menolak ekspansi dan mengutamakan persatuan serta perdamaian, sedangkan ajaran Haushofer membenarkan perluasan ruang hidup', 'keduanya sama-sama menekankan perluasan wilayah negara',
 'D', 'Ajaran Haushofer tentang ruang hidup dipakai untuk membenarkan ekspansi, sedangkan Wawasan Nusantara berorientasi pada persatuan ke dalam dan perdamaian ke luar. Opsi yang menyamakan keduanya bertentangan dengan sifat anti-ekspansi Wawasan Nusantara.', 'hard'),
('twk-wawasan-nusantara',
 'Sebelum Deklarasi Djuanda, laut wilayah di kepulauan Indonesia diatur berdasarkan ordonansi kolonial tahun 1939 yang menetapkan lebar laut teritorial …',
 '12 mil laut diukur dari garis pangkal kepulauan', '200 mil laut diukur dari garis pangkal', '3 mil laut diukur dari garis pangkal lurus yang menghubungkan pulau terluar', '3 mil laut diukur dari garis pantai masing-masing pulau', '12 mil laut diukur dari pulau terbesar',
 'D', 'Aturan tahun 1939 menetapkan laut teritorial 3 mil dari garis pantai tiap pulau, sehingga ada laut bebas di antara pulau-pulau. Garis pangkal lurus kepulauan justru merupakan gagasan Deklarasi Djuanda yang kemudian diakui UNCLOS.', 'medium'),
('twk-wawasan-nusantara',
 'Indonesia mengesahkan Konvensi Perserikatan Bangsa-Bangsa tentang Hukum Laut (UNCLOS) 1982 melalui …',
 'Undang-Undang Nomor 4 Prp Tahun 1960', 'Undang-Undang Nomor 6 Tahun 1996', 'Undang-Undang Nomor 43 Tahun 2008', 'Undang-Undang Nomor 17 Tahun 1985', 'Undang-Undang Nomor 23 Tahun 2019',
 'D', 'UNCLOS 1982 disahkan Indonesia melalui UU Nomor 17 Tahun 1985. UU Nomor 43 Tahun 2008 mengatur wilayah negara, sedangkan UU Nomor 23 Tahun 2019 mengatur sumber daya nasional untuk pertahanan, sehingga keduanya pengecoh.', 'medium'),
('twk-wawasan-nusantara',
 'Yang dimaksud dengan Alur Laut Kepulauan Indonesia (ALKI) adalah …',
 'jalur khusus yang hanya boleh dilalui kapal perang Indonesia', 'zona larangan bagi seluruh kapal asing di perairan Indonesia', 'alur yang ditetapkan agar kapal dan pesawat udara asing dapat melintas secara damai dan terus-menerus melalui perairan kepulauan Indonesia', 'jalur penangkapan ikan yang diperuntukkan bagi nelayan asing', 'garis batas terluar Zona Ekonomi Eksklusif Indonesia',
 'C', 'Sebagai negara kepulauan, Indonesia menetapkan ALKI sebagai jalur lintas damai bagi kapal dan pesawat asing. ALKI bukan wilayah penangkapan ikan asing dan bukan batas ZEE.', 'medium'),
('twk-wawasan-nusantara',
 'Selat Lombok dan Selat Makassar merupakan bagian dari jalur …',
 'ALKI II', 'ALKI I', 'ALKI III', 'Zona Ekonomi Eksklusif', 'landas kontinen',
 'A', 'ALKI II melintasi Selat Lombok, Selat Makassar, hingga Laut Sulawesi. ALKI I melewati Selat Sunda dan Selat Karimata, sedangkan ALKI III melintasi perairan timur seperti Laut Banda dan Laut Maluku.', 'hard'),
('twk-wawasan-nusantara',
 'Mahkamah Internasional pada tahun 2002 memutuskan Pulau Sipadan dan Ligitan menjadi milik Malaysia. Pelajaran yang paling relevan dari putusan tersebut bagi pengelolaan pulau-pulau terluar Indonesia adalah …',
 'Indonesia sebaiknya tidak lagi menyelesaikan sengketa melalui jalur hukum internasional', 'pulau-pulau kecil tidak berpengaruh terhadap kedaulatan negara', 'klaim pada peta resmi sudah cukup untuk mempertahankan pulau', 'kedaulatan perlu diperkuat dengan pengelolaan dan kehadiran negara secara nyata di pulau tersebut', 'pulau terluar yang tidak berpenghuni sebaiknya dilepaskan',
 'D', 'Salah satu pertimbangan putusan adalah pengelolaan efektif yang dilakukan pihak lain atas pulau tersebut. Karena itu, kehadiran dan pengelolaan nyata oleh negara jauh lebih penting daripada sekadar klaim pada peta.', 'hard'),
('twk-wawasan-nusantara',
 'Indonesia memiliki perbatasan darat dengan …',
 'Malaysia, Singapura, dan Timor Leste', 'Malaysia, Papua Nugini, dan Timor Leste', 'Papua Nugini, Australia, dan Timor Leste', 'Malaysia, Filipina, dan Papua Nugini', 'Brunei Darussalam, Malaysia, dan Singapura',
 'B', 'Perbatasan darat Indonesia ada di Kalimantan (Malaysia), Papua (Papua Nugini), dan Nusa Tenggara Timur (Timor Leste). Singapura, Australia, dan Filipina hanya berbatasan laut dengan Indonesia.', 'easy'),
('twk-wawasan-nusantara',
 'Pemerintah membangun sekolah, puskesmas, dan pos lintas batas negara di kecamatan perbatasan. Dalam kerangka Wawasan Nusantara, kebijakan ini terutama bertujuan …',
 'mewujudkan pemerataan pembangunan dan memperkuat kehadiran negara di wilayah perbatasan', 'memindahkan seluruh penduduk perbatasan ke kota besar', 'menutup sepenuhnya interaksi warga dengan negara tetangga', 'menjadikan wilayah perbatasan sebagai zona militer tertutup', 'mengurangi anggaran pembangunan bagi daerah lain',
 'A', 'Wawasan Nusantara memandang wilayah perbatasan sebagai bagian utuh NKRI yang berhak atas pembangunan setara. Menutup interaksi atau memindahkan penduduk justru melemahkan kehadiran negara di perbatasan.', 'easy'),
('twk-wawasan-nusantara',
 'Asas Wawasan Nusantara berupa kesetiaan terhadap kesepakatan bersama paling tepat dicontohkan oleh …',
 'warga yang hanya setia pada kesepakatan adat di daerahnya sendiri', 'masyarakat berbagai daerah yang tetap berpegang pada kesepakatan bahwa NKRI berdasarkan Pancasila adalah bentuk negara yang final', 'kelompok yang menuntut perubahan dasar negara melalui kekerasan', 'daerah yang menolak keputusan pemerintah pusat meskipun keputusan itu sah', 'pengusaha yang patuh pada kontrak dagang dengan perusahaan asing',
 'B', 'Kesetiaan terhadap kesepakatan bersama dalam Wawasan Nusantara merujuk pada kesepakatan kebangsaan, seperti Pancasila dan NKRI. Kepatuhan pada kontrak dagang memang baik, tetapi bukan kesepakatan kebangsaan yang dimaksud asas ini.', 'hard'),
('twk-wawasan-nusantara',
 'Harga beras melonjak tajam di beberapa provinsi akibat gagal panen dan memicu kepanikan pembelian di masyarakat. Dalam kerangka astagatra, peristiwa tersebut terutama menguji ketahanan pada gatra …',
 'ideologi', 'politik', 'pertahanan dan keamanan', 'ekonomi', 'geografi',
 'D', 'Ketersediaan dan keterjangkauan pangan berkaitan langsung dengan gatra ekonomi. Gagal panen memang dapat dipengaruhi faktor alam, tetapi yang terutama diuji dalam kasus ini adalah daya tahan ekonomi masyarakat.', 'medium'),
('twk-sistem-pemerintahan',
 'Berikut ini yang merupakan ciri sistem pemerintahan presidensial adalah …',
 'kabinet dapat dijatuhkan parlemen melalui mosi tidak percaya', 'kepala pemerintahan dijabat oleh perdana menteri', 'kepala negara dapat membubarkan parlemen', 'masa jabatan eksekutif bergantung pada dukungan parlemen', 'menteri diangkat oleh dan bertanggung jawab kepada presiden',
 'E', 'Dalam sistem presidensial, menteri adalah pembantu presiden dan bertanggung jawab kepadanya. Mosi tidak percaya, perdana menteri, dan pembubaran parlemen adalah ciri sistem parlementer.', 'easy'),
('twk-sistem-pemerintahan',
 'Menurut Pasal 7C UUD 1945, Presiden …',
 'dapat membubarkan DPR dengan persetujuan MPR', 'dapat membekukan DPR dalam keadaan bahaya', 'berwenang memberhentikan anggota DPR yang melanggar etika', 'tidak dapat membekukan dan/atau membubarkan Dewan Perwakilan Rakyat', 'dapat membubarkan DPD atas usul DPR',
 'D', 'Pasal 7C menegaskan bahwa Presiden tidak dapat membekukan atau membubarkan DPR, salah satu ciri penguatan sistem presidensial. Ketentuan itu berlaku tanpa pengecualian, sehingga opsi tentang keadaan bahaya keliru.', 'easy'),
('twk-sistem-pemerintahan',
 'Maklumat Wakil Presiden Nomor X tanggal 16 Oktober 1945 berisi …',
 'anjuran kepada rakyat untuk mendirikan partai-partai politik', 'pemberian kekuasaan legislatif kepada KNIP dan keikutsertaannya menetapkan GBHN sebelum MPR dan DPR terbentuk', 'pembubaran KNIP dan pembentukan DPR hasil pemilu', 'pengangkatan Sutan Sjahrir sebagai perdana menteri pertama', 'pemberlakuan kembali UUD 1945 dan pembubaran Konstituante',
 'B', 'Maklumat X mengubah fungsi KNIP dari pembantu presiden menjadi lembaga yang memegang kekuasaan legislatif. Anjuran mendirikan partai politik adalah isi Maklumat Pemerintah 3 November 1945, sedangkan pembubaran Konstituante adalah isi Dekrit 5 Juli 1959.', 'medium'),
('twk-sistem-pemerintahan',
 'Masa berlakunya UUDS 1950 ditandai oleh …',
 'sistem parlementer dengan kabinet yang sering berganti', 'sistem presidensial dengan presiden yang dipilih langsung oleh rakyat', 'bentuk negara serikat yang terdiri atas negara-negara bagian', 'pemusatan kekuasaan pada presiden dalam demokrasi terpimpin', 'MPR sebagai lembaga tertinggi yang memilih presiden',
 'A', 'Pada masa UUDS 1950 (1950–1959) berlaku demokrasi parlementer dan kabinet silih berganti dalam waktu singkat. Negara serikat berlaku pada masa Konstitusi RIS, sedangkan demokrasi terpimpin dimulai setelah Dekrit 1959.', 'medium'),
('twk-sistem-pemerintahan',
 'Di negara Y, raja berkedudukan sebagai kepala negara, sedangkan pemerintahan sehari-hari dipimpin perdana menteri dari partai pemenang pemilu yang bertanggung jawab kepada parlemen. Sistem pemerintahan negara Y adalah …',
 'presidensial', 'semipresidensial dengan presiden yang dipilih langsung', 'parlementer', 'presidensial dengan kabinet profesional', 'pemerintahan kolektif tanpa kepala negara',
 'C', 'Pemisahan kepala negara dan kepala pemerintahan serta tanggung jawab kabinet kepada parlemen adalah ciri sistem parlementer. Keberadaan raja tidak mengubah sistem menjadi presidensial.', 'easy'),
('twk-sistem-pemerintahan',
 'Pernyataan yang paling tepat mengenai penerapan prinsip kekuasaan negara di Indonesia setelah perubahan UUD 1945 adalah …',
 'kekuasaan dipisahkan secara mutlak sehingga lembaga negara tidak saling berhubungan', 'kekuasaan dibagi kepada lembaga-lembaga negara yang saling mengawasi dan mengimbangi', 'seluruh kekuasaan negara berpuncak pada MPR sebagai lembaga tertinggi negara', 'Presiden memegang kekuasaan membentuk undang-undang tanpa melibatkan DPR', 'Mahkamah Agung berwenang membubarkan DPR yang melanggar konstitusi',
 'B', 'Setelah perubahan, Indonesia menganut pembagian kekuasaan dengan mekanisme checks and balances, misalnya UU dibahas bersama DPR dan Presiden serta dapat diuji MK. MPR tidak lagi menjadi lembaga tertinggi, sehingga opsi itu menggambarkan keadaan sebelum perubahan.', 'hard'),
('twk-sistem-pemerintahan',
 'Urutan jenis dan hierarki peraturan perundang-undangan yang benar menurut Undang-Undang Nomor 12 Tahun 2011 adalah …',
 'UUD 1945, UU/Perppu, Ketetapan MPR, Peraturan Pemerintah, Peraturan Presiden, Perda Provinsi, Perda Kabupaten/Kota', 'UUD 1945, Ketetapan MPR, UU/Perppu, Peraturan Presiden, Peraturan Pemerintah, Perda Provinsi, Perda Kabupaten/Kota', 'UUD 1945, Ketetapan MPR, Peraturan Pemerintah, UU/Perppu, Peraturan Presiden, Perda Provinsi, Perda Kabupaten/Kota', 'Ketetapan MPR, UUD 1945, UU/Perppu, Peraturan Pemerintah, Peraturan Presiden, Perda Provinsi, Perda Kabupaten/Kota', 'UUD 1945, Ketetapan MPR, UU/Perppu, Peraturan Pemerintah, Peraturan Presiden, Perda Provinsi, Perda Kabupaten/Kota',
 'E', 'Pasal 7 ayat (1) UU 12/2011 menempatkan Tap MPR di bawah UUD dan di atas UU/Perppu, serta Peraturan Pemerintah di atas Peraturan Presiden. Pengecoh paling umum adalah menukar posisi PP dan Perpres.', 'easy'),
('twk-sistem-pemerintahan',
 'Sebuah RUU telah mendapat persetujuan bersama DPR dan Presiden. Sampai 30 hari sejak disetujui, Presiden belum mengesahkannya. Menurut Pasal 20 ayat (5) UUD 1945, RUU tersebut …',
 'sah menjadi undang-undang dan wajib diundangkan', 'batal dan harus dibahas ulang dari awal', 'dikembalikan kepada DPR untuk disahkan oleh Ketua DPR', 'diserahkan kepada Mahkamah Konstitusi untuk diputus', 'berlaku sementara sebagai Perppu sampai disahkan Presiden',
 'A', 'Pasal 20 ayat (5) menyatakan RUU yang telah disetujui bersama dan tidak disahkan Presiden dalam 30 hari sah menjadi UU dan wajib diundangkan. Ketentuan ini mencegah RUU yang telah disepakati tertahan tanpa batas waktu.', 'medium'),
('twk-sistem-pemerintahan',
 'Menurut Pasal 20 ayat (3) UUD 1945, RUU yang tidak mendapat persetujuan bersama DPR dan Presiden …',
 'otomatis menjadi undang-undang setelah 30 hari', 'dapat langsung ditetapkan Presiden sebagai peraturan pemerintah', 'tidak boleh diajukan lagi dalam persidangan DPR masa itu', 'diserahkan kepada DPD untuk diputuskan', 'wajib diuji terlebih dahulu oleh Mahkamah Konstitusi',
 'C', 'RUU yang gagal mendapat persetujuan bersama tidak boleh diajukan lagi pada masa persidangan yang sama. Ketentuan 30 hari hanya berlaku bagi RUU yang sudah disetujui bersama, sehingga opsi itu keliru.', 'medium'),
('twk-sistem-pemerintahan',
 'Presiden menetapkan Perppu karena terjadi kegentingan yang memaksa. Pada persidangan berikutnya, DPR tidak memberikan persetujuan terhadap Perppu tersebut. Konsekuensinya menurut Pasal 22 UUD 1945 adalah …',
 'Perppu tetap berlaku sampai masa jabatan Presiden berakhir', 'Perppu otomatis menjadi undang-undang', 'Perppu harus diuji terlebih dahulu oleh Mahkamah Agung', 'Perppu tersebut harus dicabut', 'Presiden dapat membubarkan DPR dan menetapkan Perppu kembali',
 'D', 'Pasal 22 ayat (3) menyatakan Perppu yang tidak mendapat persetujuan DPR harus dicabut. Presiden tidak dapat membubarkan DPR (Pasal 7C), sehingga opsi terakhir jelas keliru.', 'medium'),
('twk-sistem-pemerintahan',
 'Rancangan peraturan bupati di sebuah kabupaten memuat ancaman pidana kurungan bagi warga yang membuang sampah sembarangan. Pendapat yang paling tepat mengenai rancangan tersebut adalah …',
 'peraturan bupati boleh memuat pidana asalkan disetujui seluruh camat', 'peraturan bupati boleh memuat ancaman pidana tanpa batas', 'ketentuan pidana tidak dapat dimuat dalam peraturan bupati karena materi pidana hanya dapat dimuat dalam undang-undang dan peraturan daerah', 'peraturan bupati lebih tinggi daripada perda sehingga boleh memuat pidana', 'ketentuan pidana hanya boleh dimuat dalam peraturan presiden',
 'C', 'UU 12/2011 membatasi materi muatan ketentuan pidana hanya pada undang-undang dan peraturan daerah. Jika kabupaten ingin memberi sanksi pidana, sarananya adalah perda yang dibentuk bersama DPRD, bukan peraturan bupati.', 'hard'),
('twk-sistem-pemerintahan',
 'Terdapat dua undang-undang setingkat yang sama-sama berlaku: satu mengatur hal secara umum, satu lagi mengatur secara khusus untuk sektor tertentu. Dalam perkara di sektor tersebut, hakim memberlakukan undang-undang yang khusus. Asas yang digunakan adalah …',
 'lex specialis derogat legi generali', 'lex superior derogat legi inferiori', 'lex posterior derogat legi priori', 'nullum crimen sine lege', 'praduga tak bersalah',
 'A', 'Aturan khusus mengesampingkan aturan umum yang setingkat adalah asas lex specialis. Lex superior dipakai bila tingkatannya berbeda, sedangkan lex posterior dipakai untuk aturan baru dan lama.', 'hard'),
('twk-sistem-pemerintahan',
 'Menurut Pasal 5 ayat (2) UUD 1945, Presiden menetapkan peraturan pemerintah untuk …',
 'menjalankan undang-undang sebagaimana mestinya', 'menggantikan undang-undang dalam hal ihwal kegentingan yang memaksa', 'mengubah ketentuan dalam UUD 1945', 'mengesahkan anggaran pendapatan dan belanja daerah', 'membatalkan putusan Mahkamah Konstitusi',
 'A', 'Peraturan pemerintah berfungsi melaksanakan undang-undang. Peraturan yang dibentuk dalam kegentingan memaksa adalah Perppu, sehingga opsi itu adalah pengecoh yang paling sering dipilih.', 'medium'),
('twk-sistem-pemerintahan',
 'Menurut Pasal 22E ayat (1) UUD 1945, pemilihan umum dilaksanakan secara …',
 'langsung, umum, bebas, dan rahasia setiap empat tahun sekali', 'jujur, adil, terbuka, dan akuntabel setiap lima tahun sekali', 'langsung, umum, bebas, rahasia, jujur, dan adil setiap lima tahun sekali', 'langsung, terbuka, dan demokratis setiap lima tahun sekali', 'umum, bebas, rahasia, dan terbuka setiap enam tahun sekali',
 'C', 'Asas pemilu dalam UUD 1945 adalah luber jurdil dan pemilu digelar lima tahun sekali. Opsi yang hanya memuat luber adalah asas lama yang belum mencakup jujur dan adil.', 'easy'),
('twk-sistem-pemerintahan',
 'Menurut Pasal 22E ayat (4) UUD 1945, peserta pemilu untuk memilih anggota DPD adalah …',
 'partai politik', 'perseorangan', 'gabungan partai politik', 'organisasi kemasyarakatan', 'utusan pemerintah daerah',
 'B', 'Calon anggota DPD maju secara perseorangan karena DPD mewakili daerah. Partai politik adalah peserta pemilu untuk anggota DPR dan DPRD.', 'easy'),
('twk-sistem-pemerintahan',
 'Dalam pemilihan presiden, pasangan P memperoleh 55% suara nasional dan sedikitnya 20% suara di 30 dari 38 provinsi. Berdasarkan Pasal 6A ayat (3) UUD 1945, pasangan P …',
 'harus mengikuti putaran kedua karena tidak menang di semua provinsi', 'dinyatakan terpilih karena memperoleh lebih dari 50% suara dengan sebaran sedikitnya 20% di lebih dari setengah jumlah provinsi', 'harus mendapat persetujuan MPR sebelum dinyatakan terpilih', 'belum terpilih karena harus memperoleh sedikitnya 60% suara nasional', 'terpilih hanya jika DPR menyetujui hasil pemilu',
 'B', 'Syarat Pasal 6A ayat (3) adalah lebih dari 50% suara dengan sedikitnya 20% suara di setiap provinsi yang tersebar di lebih dari setengah jumlah provinsi. Tiga puluh dari 38 provinsi sudah lebih dari setengah, sehingga pasangan P terpilih tanpa perlu menang di semua provinsi.', 'hard'),
('twk-sistem-pemerintahan',
 'Dalam proses pemberhentian Presiden menurut UUD 1945, pendapat DPR bahwa Presiden telah melakukan pelanggaran hukum harus terlebih dahulu …',
 'diperiksa, diadili, dan diputus oleh Mahkamah Konstitusi', 'disetujui oleh seluruh anggota DPD', 'diputus oleh Mahkamah Agung dalam sidang kasasi', 'disahkan oleh Komisi Yudisial', 'diserahkan kepada KPU untuk diverifikasi',
 'A', 'Pasal 7B menetapkan bahwa pendapat DPR harus diuji secara hukum oleh Mahkamah Konstitusi sebelum diteruskan ke MPR. Keputusan akhir pemberhentian tetap berada di tangan MPR, bukan MK.', 'medium'),
('twk-sistem-pemerintahan',
 'Warga melaporkan petugas kelurahan yang menunda penerbitan surat keterangan selama berbulan-bulan tanpa alasan. Pengaduan ke instansi tersebut tidak mendapat tanggapan. Lembaga negara yang tepat menerima laporan maladministrasi pelayanan publik ini adalah …',
 'Komisi Yudisial', 'Komisi Pemilihan Umum', 'Ombudsman Republik Indonesia', 'Mahkamah Konstitusi', 'Badan Pemeriksa Keuangan',
 'C', 'Ombudsman RI berwenang mengawasi pelayanan publik dan menangani laporan maladministrasi, termasuk penundaan berlarut. Komisi Yudisial mengawasi perilaku hakim, sedangkan BPK memeriksa keuangan negara.', 'medium'),
('twk-sistem-pemerintahan',
 'Pernyataan yang tepat tentang Komisi Yudisial menurut Pasal 24B UUD 1945 adalah …',
 'berwenang mengadili sengketa kewenangan lembaga negara', 'berwenang memutus perselisihan hasil pemilihan umum', 'bersifat mandiri dan berwenang mengusulkan pengangkatan hakim agung serta menjaga kehormatan, keluhuran martabat, dan perilaku hakim', 'berwenang menguji peraturan di bawah undang-undang terhadap undang-undang', 'berwenang mengangkat dan memberhentikan hakim konstitusi',
 'C', 'Komisi Yudisial tidak mengadili perkara; tugasnya mengusulkan calon hakim agung dan menjaga perilaku hakim. Sengketa kewenangan lembaga dan perselisihan hasil pemilu adalah kewenangan MK, sedangkan pengujian peraturan di bawah UU adalah kewenangan MA.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Berbagai penelitian menunjukkan bahwa sejumlah bahasa daerah di Indonesia kini hanya dituturkan oleh kelompok usia lanjut. Anak-anak di daerah tersebut lebih sering memakai bahasa Indonesia atau bahasa asing, baik di sekolah maupun di rumah. Jika keadaan ini dibiarkan, bahasa-bahasa itu dapat punah dalam satu atau dua generasi. Padahal, setiap bahasa daerah menyimpan pengetahuan lokal, seperti nama tumbuhan obat, cara membaca tanda-tanda musim, dan nilai-nilai adat. Oleh karena itu, pelestarian bahasa daerah perlu dilakukan bersama oleh keluarga, sekolah, dan pemerintah daerah, misalnya melalui muatan lokal, festival bercerita, dan dokumentasi kosakata.

Gagasan utama teks tersebut adalah …',
 'anak-anak lebih suka memakai bahasa asing di sekolah', 'bahasa daerah berisi nama-nama tumbuhan obat', 'festival bercerita adalah satu-satunya cara melestarikan bahasa daerah', 'bahasa daerah terancam punah sehingga perlu dilestarikan bersama karena menyimpan pengetahuan lokal', 'pemerintah daerah harus melarang penggunaan bahasa asing',
 'D', 'Seluruh kalimat mengarah pada ancaman kepunahan bahasa daerah dan perlunya pelestarian bersama. Opsi tentang tumbuhan obat dan festival bercerita hanyalah rincian, sedangkan larangan bahasa asing tidak disebut dalam teks.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Berbagai penelitian menunjukkan bahwa sejumlah bahasa daerah di Indonesia kini hanya dituturkan oleh kelompok usia lanjut. Anak-anak di daerah tersebut lebih sering memakai bahasa Indonesia atau bahasa asing, baik di sekolah maupun di rumah. Jika keadaan ini dibiarkan, bahasa-bahasa itu dapat punah dalam satu atau dua generasi. Padahal, setiap bahasa daerah menyimpan pengetahuan lokal, seperti nama tumbuhan obat, cara membaca tanda-tanda musim, dan nilai-nilai adat. Oleh karena itu, pelestarian bahasa daerah perlu dilakukan bersama oleh keluarga, sekolah, dan pemerintah daerah, misalnya melalui muatan lokal, festival bercerita, dan dokumentasi kosakata.

Pernyataan yang sesuai dengan isi teks adalah …',
 'Semua bahasa daerah di Indonesia sudah punah.', 'Anak-anak di daerah tersebut tidak lagi memakai bahasa Indonesia.', 'Pengetahuan lokal dapat ikut hilang apabila bahasa daerah yang menyimpannya punah.', 'Pelestarian bahasa daerah cukup dilakukan oleh pemerintah pusat.', 'Penutur bahasa daerah saat ini sebagian besar adalah anak-anak.',
 'C', 'Teks menyebut bahasa daerah menyimpan pengetahuan lokal dan dapat punah jika dibiarkan, sehingga pengetahuan itu ikut terancam. Opsi lain mengubah informasi: teks menyebut sejumlah bahasa, bukan semua, dan pelestarian melibatkan keluarga, sekolah, serta pemerintah daerah.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Selama masa pembatasan kegiatan, sejumlah museum sejarah membuka tur virtual yang dapat diakses tanpa biaya. Pengunjung dapat melihat koleksi, membaca keterangan, dan mendengarkan penjelasan pemandu dari rumah. Sebagian tur bahkan dilengkapi fitur perbesaran gambar sehingga detail koleksi dapat diamati dengan jelas. Beberapa museum melaporkan jumlah pengunjung daring yang jauh lebih banyak daripada perkiraan. Meski begitu, pengelola museum mengakui bahwa pengalaman melihat benda bersejarah secara langsung tidak sepenuhnya dapat tergantikan. Karena itu, banyak museum kini memadukan layanan daring dan kunjungan langsung agar dapat menjangkau lebih banyak orang tanpa kehilangan pengalaman yang autentik.

Simpulan yang tepat berdasarkan teks tersebut adalah …',
 'Tur virtual telah sepenuhnya menggantikan kunjungan langsung ke museum.', 'Museum sejarah menutup layanan kunjungan langsung secara permanen.', 'Jumlah pengunjung daring selalu lebih sedikit daripada pengunjung langsung.', 'Tur virtual museum hanya dapat diakses oleh pelajar.', 'Museum memadukan layanan daring dan kunjungan langsung untuk memperluas jangkauan sekaligus menjaga pengalaman autentik.',
 'E', 'Kalimat terakhir merangkum isi teks: museum memadukan kedua layanan. Opsi tentang tur virtual yang menggantikan kunjungan langsung justru bertentangan dengan pengakuan pengelola museum.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Selama masa pembatasan kegiatan, sejumlah museum sejarah membuka tur virtual yang dapat diakses tanpa biaya. Pengunjung dapat melihat koleksi, membaca keterangan, dan mendengarkan penjelasan pemandu dari rumah. Sebagian tur bahkan dilengkapi fitur perbesaran gambar sehingga detail koleksi dapat diamati dengan jelas. Beberapa museum melaporkan jumlah pengunjung daring yang jauh lebih banyak daripada perkiraan. Meski begitu, pengelola museum mengakui bahwa pengalaman melihat benda bersejarah secara langsung tidak sepenuhnya dapat tergantikan. Karena itu, banyak museum kini memadukan layanan daring dan kunjungan langsung agar dapat menjangkau lebih banyak orang tanpa kehilangan pengalaman yang autentik.

Makna kata autentik dalam teks tersebut adalah …',
 'modern dan canggih', 'asli dan dapat dipercaya', 'mahal dan eksklusif', 'ramai dan meriah', 'baru dan populer',
 'B', 'Autentik berarti asli atau dapat dipercaya; dalam teks, pengalaman autentik adalah pengalaman melihat benda bersejarah yang asli secara langsung. Pengecoh seperti modern dan canggih justru lebih dekat dengan makna layanan daring.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

(1) Pemerintah kota merevitalisasi Pasar Sentosa pada tahun lalu dengan menggunakan anggaran pendapatan dan belanja daerah. (2) Kini pasar itu memiliki 400 los yang tertata, saluran air baru, toilet umum, dan area parkir yang lebih luas daripada sebelumnya. (3) Menurut saya, pasar yang bersih dan nyaman seperti ini akan membuat pembeli kembali memilih berbelanja di pasar tradisional. (4) Sebagian pedagang mengeluhkan biaya sewa los yang naik setelah revitalisasi selesai dikerjakan. (5) Sebaiknya pemerintah kota memberikan keringanan sewa bagi pedagang kecil pada tahun pertama agar mereka tidak meninggalkan pasar.

Kalimat yang berisi fakta ditunjukkan oleh nomor …',
 '(1), (3), dan (4)', '(2), (3), dan (5)', '(3) dan (5)', '(1), (4), dan (5)', '(1), (2), dan (4)',
 'E', 'Kalimat (1), (2), dan (4) berisi peristiwa dan data yang dapat dibuktikan. Kalimat (3) memuat penanda opini menurut saya, sedangkan kalimat (5) memuat saran dengan kata sebaiknya.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

(1) Pemerintah kota merevitalisasi Pasar Sentosa pada tahun lalu dengan menggunakan anggaran pendapatan dan belanja daerah. (2) Kini pasar itu memiliki 400 los yang tertata, saluran air baru, toilet umum, dan area parkir yang lebih luas daripada sebelumnya. (3) Menurut saya, pasar yang bersih dan nyaman seperti ini akan membuat pembeli kembali memilih berbelanja di pasar tradisional. (4) Sebagian pedagang mengeluhkan biaya sewa los yang naik setelah revitalisasi selesai dikerjakan. (5) Sebaiknya pemerintah kota memberikan keringanan sewa bagi pedagang kecil pada tahun pertama agar mereka tidak meninggalkan pasar.

Sikap penulis terhadap revitalisasi pasar dalam teks tersebut adalah …',
 'menolak revitalisasi karena merugikan semua pedagang', 'netral karena sama sekali tidak menyampaikan pendapat', 'skeptis bahwa pasar tradisional akan kembali diminati', 'tidak peduli terhadap keluhan para pedagang', 'mendukung revitalisasi, tetapi memperhatikan beban pedagang kecil dan mengusulkan keringanan',
 'E', 'Penulis menilai positif pasar yang bersih (kalimat 3), lalu mengusulkan keringanan sewa (kalimat 5) karena keluhan pedagang. Penulis jelas menyampaikan pendapat, sehingga opsi netral keliru.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah paragraf berikut.

(1) Program sarapan bergizi di sekolah dasar bertujuan memastikan setiap siswa memperoleh asupan yang cukup sebelum mulai belajar pada pagi hari. (2) Menu disusun bersama ahli gizi puskesmas dengan memanfaatkan bahan pangan lokal, seperti ubi, jagung, telur, dan sayuran dari kebun warga. (3) Setelah program berjalan tiga bulan, para guru melaporkan siswa lebih mudah berkonsentrasi pada jam pelajaran pertama. (4) Lapangan sekolah juga baru saja dicat ulang dengan warna cerah menjelang lomba antarkelas. (5) Pemanfaatan bahan lokal sekaligus membantu meningkatkan pendapatan petani dan pedagang di sekitar sekolah.

Kalimat yang tidak padu dengan gagasan utama paragraf tersebut adalah kalimat nomor …',
 '(1)', '(2)', '(4)', '(3)', '(5)',
 'C', 'Gagasan utama paragraf adalah program sarapan bergizi beserta manfaatnya. Kalimat (4) tentang pengecatan lapangan sekolah tidak berkaitan dengan program tersebut, meskipun latarnya sama-sama sekolah.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Stok darah di unit transfusi kota kita sering menipis menjelang hari raya, saat banyak pendonor rutin pulang kampung. Padahal, kebutuhan darah bagi pasien kecelakaan, ibu melahirkan, dan penderita penyakit tertentu tidak pernah libur. Satu kantong darah dapat menjadi penentu keselamatan seseorang. Sebelum pengambilan darah, petugas juga akan memeriksa kesehatan calon pendonor terlebih dahulu. Donor darah juga tidak memerlukan waktu lama dan dilakukan oleh petugas terlatih dengan peralatan steril. Mari luangkan sedikit waktu sebelum mudik untuk singgah ke unit transfusi terdekat.

Tujuan penulis menulis teks tersebut adalah …',
 'menjelaskan prosedur medis transfusi darah di rumah sakit', 'melaporkan jumlah pendonor darah selama hari raya', 'mengkritik kinerja petugas unit transfusi darah', 'menceritakan pengalaman pribadi penulis saat mudik', 'mengajak pembaca mendonorkan darah sebelum mudik agar stok darah tetap mencukupi',
 'E', 'Kalimat terakhir memuat ajakan dengan kata mari, dan kalimat-kalimat sebelumnya memberi alasan mengapa donor darah penting menjelang hari raya. Teks tidak memuat data jumlah pendonor maupun kritik terhadap petugas.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Stok darah di unit transfusi kota kita sering menipis menjelang hari raya, saat banyak pendonor rutin pulang kampung. Padahal, kebutuhan darah bagi pasien kecelakaan, ibu melahirkan, dan penderita penyakit tertentu tidak pernah libur. Satu kantong darah dapat menjadi penentu keselamatan seseorang. Sebelum pengambilan darah, petugas juga akan memeriksa kesehatan calon pendonor terlebih dahulu. Donor darah juga tidak memerlukan waktu lama dan dilakukan oleh petugas terlatih dengan peralatan steril. Mari luangkan sedikit waktu sebelum mudik untuk singgah ke unit transfusi terdekat.

Hubungan isi kalimat pertama dan kalimat kedua dalam teks tersebut adalah …',
 'pertentangan, yaitu stok darah menipis padahal kebutuhan darah tetap ada', 'sebab-akibat, yaitu kebutuhan darah menyebabkan pendonor pulang kampung', 'contoh, yaitu kalimat kedua memberi contoh pendonor rutin', 'urutan waktu, yaitu kalimat kedua terjadi setelah hari raya', 'simpulan, yaitu kalimat kedua merangkum seluruh isi teks',
 'A', 'Kata padahal menandai pertentangan antara keadaan stok yang menipis dan kebutuhan yang tidak berkurang. Kalimat kedua memang menyebut contoh pasien, tetapi fungsinya terhadap kalimat pertama adalah mempertentangkan, bukan mencontohkan pendonor.', 'hard'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Pinjaman daring ilegal kerap menawarkan pencairan dana dalam hitungan menit tanpa syarat yang rumit. Tawaran itu menarik bagi warga yang sedang terdesak kebutuhan. Namun, di balik kemudahan tersebut tersimpan bunga yang sangat tinggi dan cara penagihan yang kerap melanggar privasi, seperti menyebarkan data kontak peminjam. Sebelum meminjam, warga sebaiknya memastikan penyelenggara pinjaman telah terdaftar dan berizin dari otoritas yang berwenang. Daftar penyelenggara yang berizin umumnya dapat diperiksa melalui kanal resmi otoritas tersebut. Langkah sederhana ini dapat mencegah kerugian yang jauh lebih besar.

Frasa kemudahan tersebut dalam teks merujuk pada …',
 'bunga pinjaman yang sangat tinggi', 'pencairan dana yang cepat tanpa syarat yang rumit', 'cara penagihan yang melanggar privasi', 'pendaftaran penyelenggara pinjaman kepada otoritas', 'kebutuhan warga yang sedang mendesak',
 'B', 'Kata tersebut merujuk pada hal yang disebut sebelumnya, yaitu pencairan dana cepat tanpa syarat rumit pada kalimat pertama. Bunga tinggi dan penagihan yang melanggar privasi justru merupakan sisi buruk di balik kemudahan itu.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Pinjaman daring ilegal kerap menawarkan pencairan dana dalam hitungan menit tanpa syarat yang rumit. Tawaran itu menarik bagi warga yang sedang terdesak kebutuhan. Namun, di balik kemudahan tersebut tersimpan bunga yang sangat tinggi dan cara penagihan yang kerap melanggar privasi, seperti menyebarkan data kontak peminjam. Sebelum meminjam, warga sebaiknya memastikan penyelenggara pinjaman telah terdaftar dan berizin dari otoritas yang berwenang. Daftar penyelenggara yang berizin umumnya dapat diperiksa melalui kanal resmi otoritas tersebut. Langkah sederhana ini dapat mencegah kerugian yang jauh lebih besar.

Hal yang dapat disimpulkan dari teks tersebut adalah …',
 'Semua layanan pinjaman daring adalah ilegal.', 'Persyaratan yang mudah tidak selalu menandakan layanan pinjaman itu aman.', 'Warga yang terdesak kebutuhan tidak boleh meminjam uang.', 'Otoritas yang berwenang menyebarkan data kontak peminjam.', 'Bunga tinggi hanya dikenakan oleh penyelenggara yang berizin.',
 'B', 'Teks menunjukkan bahwa kemudahan pinjaman ilegal menyembunyikan risiko, sehingga kemudahan bukan jaminan keamanan. Teks hanya membahas pinjaman ilegal dan justru menyarankan memeriksa izin, jadi opsi semua layanan ilegal terlalu mutlak.', 'hard'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Setiap Sabtu, sekelompok mahasiswa membawa ratusan buku dengan perahu motor ke pulau-pulau kecil di sekitar kabupaten mereka. Di setiap dermaga, anak-anak sudah menunggu untuk meminjam buku cerita, ensiklopedia, dan komik pendidikan. Buku-buku itu sebagian besar berasal dari sumbangan warga kota yang dikumpulkan setiap bulan. Para relawan juga membacakan dongeng dan mengajak anak-anak menulis cerita sendiri. Kegiatan yang dimulai dengan dana patungan itu kini mendapat dukungan pemerintah desa dan sejumlah donatur. Kepala sekolah di salah satu pulau menyebut minat baca siswanya meningkat sejak perahu buku rutin datang.

Judul yang paling tepat untuk teks tersebut adalah …',
 'Transportasi Perahu Motor di Daerah Kepulauan', 'Dana Patungan Mahasiswa', 'Dongeng Sebelum Tidur untuk Anak', 'Perahu Buku Relawan Mahasiswa Menumbuhkan Minat Baca Anak Pulau', 'Pemerintah Desa Membangun Dermaga Baru',
 'D', 'Judul yang baik mencakup topik (perahu buku relawan) dan fokus (meningkatnya minat baca anak pulau). Opsi lain hanya menyentuh rincian kecil atau sama sekali tidak dibahas, seperti pembangunan dermaga.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Setiap Sabtu, sekelompok mahasiswa membawa ratusan buku dengan perahu motor ke pulau-pulau kecil di sekitar kabupaten mereka. Di setiap dermaga, anak-anak sudah menunggu untuk meminjam buku cerita, ensiklopedia, dan komik pendidikan. Buku-buku itu sebagian besar berasal dari sumbangan warga kota yang dikumpulkan setiap bulan. Para relawan juga membacakan dongeng dan mengajak anak-anak menulis cerita sendiri. Kegiatan yang dimulai dengan dana patungan itu kini mendapat dukungan pemerintah desa dan sejumlah donatur. Kepala sekolah di salah satu pulau menyebut minat baca siswanya meningkat sejak perahu buku rutin datang.

Nilai kebangsaan yang paling menonjol dari kegiatan dalam teks tersebut adalah …',
 'persaingan antarpulau dalam meraih prestasi', 'ketaatan pada aturan keselamatan pelayaran', 'kebanggaan menggunakan produk dalam negeri', 'kepedulian dan gotong royong untuk memeratakan akses pendidikan', 'kedisiplinan dalam menepati jadwal keberangkatan',
 'D', 'Relawan, pemerintah desa, dan donatur bekerja sama membawa buku ke anak-anak yang sulit menjangkau perpustakaan, sehingga nilai utamanya kepedulian dan gotong royong demi pemerataan pendidikan. Kegiatan rutin setiap Sabtu memang menunjukkan konsistensi, tetapi bukan nilai yang paling ditonjolkan.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah paragraf berikut.

Di kantor kecamatan itu, antrean kini diatur dengan nomor urut elektronik. Persyaratan setiap layanan ditempel di papan informasi yang mudah dibaca dan diunggah di laman resmi. Ruang tunggu dilengkapi kursi prioritas bagi warga lanjut usia, ibu hamil, dan penyandang disabilitas. Petugas mengenakan tanda pengenal dan wajib menjelaskan alasan apabila berkas ditolak. Warga juga dapat memantau status permohonannya melalui pesan singkat. Kotak saran dibuka setiap pekan, dan hasilnya diumumkan kepada warga. Berbagai langkah tersebut menunjukkan upaya kecamatan menghadirkan pelayanan yang transparan dan akuntabel.

Berdasarkan letak kalimat utamanya, paragraf tersebut termasuk paragraf …',
 'deduktif', 'induktif', 'campuran', 'naratif', 'deskriptif',
 'B', 'Kalimat utama terletak di akhir paragraf dan menyimpulkan rincian sebelumnya, sehingga paragraf ini induktif. Naratif dan deskriptif adalah jenis berdasarkan tujuan karangan, bukan berdasarkan letak kalimat utama.', 'easy'),
('twk-pemahaman-bacaan',
 'Bacalah paragraf berikut.

Di kantor kecamatan itu, antrean kini diatur dengan nomor urut elektronik. Persyaratan setiap layanan ditempel di papan informasi yang mudah dibaca dan diunggah di laman resmi. Ruang tunggu dilengkapi kursi prioritas bagi warga lanjut usia, ibu hamil, dan penyandang disabilitas. Petugas mengenakan tanda pengenal dan wajib menjelaskan alasan apabila berkas ditolak. Warga juga dapat memantau status permohonannya melalui pesan singkat. Kotak saran dibuka setiap pekan, dan hasilnya diumumkan kepada warga. Berbagai langkah tersebut menunjukkan upaya kecamatan menghadirkan pelayanan yang transparan dan akuntabel.

Pernyataan berikut yang tidak sesuai dengan isi paragraf adalah …',
 'Petugas boleh menolak berkas tanpa memberikan alasan kepada warga.', 'Antrean diatur dengan nomor urut elektronik.', 'Persyaratan layanan diunggah di laman resmi.', 'Kotak saran dibuka setiap pekan.', 'Petugas mengenakan tanda pengenal.',
 'A', 'Paragraf menyebut petugas wajib menjelaskan alasan apabila berkas ditolak, sehingga pernyataan bahwa petugas boleh menolak tanpa alasan bertentangan dengan teks. Empat opsi lain tersurat dalam paragraf.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah paragraf rumpang berikut.

Indonesia memiliki ribuan pulau dengan garis pantai yang sangat panjang. Kondisi ini menyimpan potensi besar di bidang perikanan, pariwisata bahari, dan transportasi laut. Hasil laut dari berbagai perairan Nusantara, misalnya, banyak diminati pasar dalam dan luar negeri. ( … ). Kapal pengangkut barang belum menjangkau semua pulau secara terjadwal, sementara biaya angkutnya pun tinggi. Di banyak pulau kecil, bahan bakar dan bahan bangunan juga harus didatangkan dari pulau lain. Akibatnya, harga barang kebutuhan pokok di daerah kepulauan sering jauh lebih mahal daripada di kota-kota besar.

Kalimat yang paling tepat untuk melengkapi bagian rumpang tersebut adalah …',
 'Namun, konektivitas antarpulau di banyak wilayah masih terbatas', 'Oleh karena itu, nelayan Indonesia dikenal sebagai pelaut yang ulung', 'Selain itu, banyak wisatawan asing berkunjung ke pantai-pantai Indonesia', 'Dengan demikian, Indonesia menjadi negara kepulauan yang besar', 'Misalnya, pulau-pulau kecil memiliki pemandangan yang indah',
 'A', 'Kalimat sesudah rumpang membahas kapal yang belum menjangkau semua pulau dan berujung pada harga barang yang mahal, sehingga rumpang harus memperkenalkan masalah konektivitas sekaligus berlawanan dengan potensi besar yang disebut sebelumnya. Hanya kalimat yang diawali namun dan membahas keterbatasan konektivitas memenuhi kedua syarat itu.', 'hard'),
('twk-pemahaman-bacaan',
 'Bacalah kalimat-kalimat acak berikut.

(1) Setelah itu, data yang terkumpul dicocokkan dengan dokumen kependudukan oleh petugas desa untuk memastikan tidak ada nama ganda.
(2) Penyaluran bantuan sosial di desa itu dimulai dengan pendataan warga yang memenuhi kriteria, seperti tidak memiliki penghasilan tetap atau merawat anggota keluarga yang sakit menahun.
(3) Dengan demikian, bantuan diharapkan benar-benar tepat sasaran, transparan, dan dipercaya oleh seluruh warga desa.
(4) Daftar penerima yang sudah diverifikasi kemudian diumumkan di balai desa agar warga dapat memberikan sanggahan apabila menemukan data yang keliru.

Urutan kalimat yang membentuk paragraf padu adalah …',
 '(1) – (2) – (4) – (3)', '(2) – (4) – (1) – (3)', '(4) – (2) – (1) – (3)', '(2) – (1) – (4) – (3)', '(2) – (1) – (3) – (4)',
 'D', 'Kalimat (2) cocok sebagai pembuka karena tidak memuat kata penghubung yang merujuk ke kalimat sebelumnya. Penanda setelah itu dan kemudian menunjukkan urutan (1) lalu (4), sedangkan dengan demikian menandai kalimat (3) sebagai penutup.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Program penanaman sejuta pohon di daerah aliran sungai patut diapresiasi karena melibatkan pelajar, warga, dan perusahaan. Dalam satu hari, ribuan bibit ditanam di sepanjang bantaran sungai. Sayangnya, setelah seremoni penanaman selesai, banyak bibit dibiarkan tanpa perawatan. Di beberapa titik, lebih dari separuh bibit mati karena kekeringan pada musim kemarau, dan bibit yang mati itu belum diganti hingga sekarang. Akibatnya, sebagian lahan bantaran kembali gundul. Program serupa ke depan perlu menyertakan rencana perawatan dan penanggung jawab di setiap lokasi, bukan hanya target jumlah pohon yang ditanam.

Sikap penulis terhadap program penanaman pohon tersebut adalah …',
 'mendukung sepenuhnya tanpa memberikan catatan apa pun', 'menolak program karena dianggap tidak bermanfaat', 'netral, karena hanya menyajikan data tanpa penilaian', 'pesimistis bahwa pohon tidak akan pernah dapat tumbuh di daerah aliran sungai', 'kritis, karena mengapresiasi program tetapi menyoroti lemahnya perawatan dan mengusulkan perbaikan',
 'E', 'Penulis memuji keterlibatan banyak pihak, lalu memakai kata sayangnya untuk menyoroti kelemahan dan menutup dengan usulan perbaikan. Itulah ciri sikap kritis; penulis tidak menolak program dan juga tidak netral.', 'medium'),
('twk-pemahaman-bacaan',
 'Bacalah teks berikut.

Program penanaman sejuta pohon di daerah aliran sungai patut diapresiasi karena melibatkan pelajar, warga, dan perusahaan. Dalam satu hari, ribuan bibit ditanam di sepanjang bantaran sungai. Sayangnya, setelah seremoni penanaman selesai, banyak bibit dibiarkan tanpa perawatan. Di beberapa titik, lebih dari separuh bibit mati karena kekeringan pada musim kemarau, dan bibit yang mati itu belum diganti hingga sekarang. Akibatnya, sebagian lahan bantaran kembali gundul. Program serupa ke depan perlu menyertakan rencana perawatan dan penanggung jawab di setiap lokasi, bukan hanya target jumlah pohon yang ditanam.

Gagasan yang ingin ditekankan penulis melalui kalimat terakhir adalah …',
 'target program perlu dinaikkan menjadi dua juta pohon', 'pelajar sebaiknya tidak lagi dilibatkan dalam penanaman pohon', 'perusahaan harus menanggung seluruh biaya program', 'keberhasilan program penghijauan sebaiknya diukur dari pohon yang tumbuh dan terawat, bukan sekadar jumlah yang ditanam', 'penanaman pohon sebaiknya ditunda sampai musim kemarau berakhir',
 'D', 'Frasa bukan hanya target jumlah pohon menunjukkan penulis ingin menggeser ukuran keberhasilan dari jumlah tanam ke keberlangsungan hidup pohon. Opsi lain menambahkan gagasan yang tidak pernah disampaikan dalam teks.', 'hard'),
('twk-nasionalisme-dasar',
 'Sikap memuja budaya asing secara berlebihan sambil merendahkan budaya bangsa sendiri disebut …',
 'etnosentrisme', 'xenosentrisme', 'chauvinisme', 'primordialisme', 'patriotisme',
 'B', 'Xenosentrisme adalah kecenderungan menganggap budaya asing lebih unggul dan memandang rendah budaya sendiri. Etnosentrisme justru kebalikannya, yaitu menganggap budaya sendiri paling unggul.', 'easy'),
('twk-nasionalisme-dasar',
 'Sebuah kelompok musik remaja mengaransemen lagu-lagu daerah dengan gaya musik modern tanpa mengubah lirik aslinya, lalu mengunggahnya ke platform digital sehingga diminati pendengar mancanegara. Tindakan ini mencerminkan …',
 'xenosentrisme karena memakai gaya musik dari luar negeri', 'penolakan terhadap seluruh pengaruh budaya asing', 'kemampuan menyaring dan mengadaptasi pengaruh global untuk memperkenalkan budaya bangsa', 'sikap konsumtif terhadap produk budaya populer', 'etnosentrisme karena hanya menyanyikan lagu daerah',
 'C', 'Unsur modern dipakai sebagai sarana, sementara identitas lagu daerah tetap dijaga dan justru dikenalkan ke dunia. Memakai gaya musik modern tidak otomatis berarti xenosentrisme selama budaya sendiri tidak direndahkan.', 'medium'),
('twk-nasionalisme-dasar',
 'Dampak negatif globalisasi di bidang sosial budaya yang dapat melemahkan semangat kebangsaan adalah …',
 'meningkatnya program pertukaran pelajar antarnegara', 'berkembangnya gaya hidup konsumtif dan individualistis yang mengikis semangat gotong royong', 'kemudahan memperoleh informasi ilmu pengetahuan', 'terbukanya pasar ekspor bagi produk dalam negeri', 'semakin luasnya promosi budaya Indonesia di luar negeri',
 'B', 'Konsumerisme dan individualisme mengikis nilai kebersamaan yang menjadi perekat bangsa. Empat opsi lainnya adalah dampak positif globalisasi, sehingga tidak menjawab pertanyaan tentang dampak negatif.', 'medium'),
('twk-nasionalisme-dasar',
 'Seorang pejabat pengadaan memilih produk dalam negeri yang memenuhi spesifikasi teknis dengan harga wajar dibandingkan produk impor sejenis, sesuai ketentuan pengadaan yang berlaku. Tindakan ini mencerminkan …',
 'chauvinisme ekonomi yang merendahkan produk bangsa lain', 'tindakan diskriminatif yang dilarang dalam pengadaan', 'primordialisme karena mengutamakan kelompok sendiri', 'nasionalisme ekonomi yang rasional dan sesuai aturan', 'sikap anti-asing yang menutup kerja sama internasional',
 'D', 'Mengutamakan produk dalam negeri yang memenuhi syarat dan sesuai ketentuan adalah wujud nasionalisme ekonomi yang rasional. Tindakan itu tidak merendahkan produk asing, sehingga bukan chauvinisme atau sikap anti-asing.', 'medium'),
('twk-nasionalisme-dasar',
 'Pernyataan berikut yang paling tepat menggambarkan nasionalisme Indonesia di era globalisasi adalah …',
 'terbuka terhadap kemajuan dari luar dengan tetap berpijak pada jati diri dan kepentingan nasional', 'menutup diri dari semua pengaruh asing agar budaya bangsa tetap murni', 'mengikuti seluruh tren global agar tidak tertinggal dari bangsa lain', 'mengutamakan kepentingan daerah masing-masing di atas kepentingan nasional', 'menganggap bangsa sendiri paling unggul dibanding bangsa lain',
 'A', 'Nasionalisme Pancasila bersifat terbuka tetapi selektif. Menutup diri dan meniru sepenuhnya adalah dua ekstrem yang sama-sama keliru, sedangkan menganggap bangsa sendiri paling unggul adalah chauvinisme.', 'hard'),
('twk-nasionalisme-dasar',
 'Lagu kebangsaan Indonesia Raya diciptakan oleh …',
 'Ismail Marzuki', 'W.R. Supratman', 'Cornel Simanjuntak', 'Kusbini', 'H. Mutahar',
 'B', 'Indonesia Raya diciptakan Wage Rudolf Supratman dan pertama kali diperdengarkan pada Kongres Pemuda II tahun 1928. Tokoh lain adalah pencipta lagu-lagu perjuangan dan nasional, tetapi bukan pencipta lagu kebangsaan.', 'easy'),
('twk-nasionalisme-dasar',
 'Seorang warga negara Indonesia yang bekerja di luar negeri aktif mengajarkan bahasa Indonesia kepada anak-anak diaspora dan memperkenalkan kuliner Nusantara dalam acara komunitas internasional. Sikap tersebut paling tepat disebut …',
 'menjaga identitas nasional di tengah pergaulan global', 'kosmopolitanisme ekstrem yang mengabaikan bangsa sendiri', 'etnosentrisme yang merendahkan budaya lain', 'xenosentrisme yang memuja budaya negara tempat tinggal', 'separatisme budaya dari masyarakat setempat',
 'A', 'Ia tetap terlibat dalam pergaulan internasional sambil merawat dan memperkenalkan identitas Indonesia. Tidak ada unsur merendahkan budaya lain, sehingga bukan etnosentrisme.', 'medium'),
('twk-nasionalisme-dasar',
 'Seorang ASN di dinas penanaman modal mendapat tugas melayani calon investor asing. Sikap yang paling mencerminkan nasionalisme adalah …',
 'mempersulit perizinan karena pemohonnya berasal dari luar negeri', 'memberi kemudahan di luar aturan agar investor merasa senang', 'menolak melayani dengan alasan mencintai produk bangsa sendiri', 'meminta biaya tambahan sebagai jaminan kelancaran izin', 'melayani secara profesional sesuai ketentuan sambil tetap menjaga kepentingan nasional',
 'E', 'Nasionalisme ASN diwujudkan melalui pelayanan yang profesional dan patuh aturan tanpa mengorbankan kepentingan nasional. Mempersulit investor bukanlah nasionalisme, sedangkan memberi kemudahan di luar aturan atau meminta biaya tambahan melanggar integritas.', 'medium'),
('twk-nasionalisme-dasar',
 'Pernyataan yang tepat mengenai hubungan nasionalisme dan patriotisme adalah …',
 'patriotisme berarti memusuhi bangsa lain, sedangkan nasionalisme berarti bersahabat dengan bangsa lain', 'nasionalisme hanya dimiliki anggota militer, sedangkan patriotisme dimiliki warga sipil', 'patriotisme hanya berlaku pada masa penjajahan, sedangkan nasionalisme berlaku setelah merdeka', 'nasionalisme dan patriotisme adalah dua sikap yang saling bertentangan', 'nasionalisme adalah paham yang menempatkan kesetiaan tertinggi pada bangsa dan negara, sedangkan patriotisme adalah semangat cinta tanah air yang diwujudkan dalam kesediaan berkorban',
 'E', 'Nasionalisme adalah paham kebangsaan, sedangkan patriotisme adalah semangat rela berkorban yang lahir dari cinta tanah air; keduanya saling melengkapi. Patriotisme tidak identik dengan memusuhi bangsa lain dan tetap relevan di masa damai.', 'hard'),
('twk-nasionalisme-dasar',
 'Seorang pelajar meraih medali dalam olimpiade sains internasional dan membentangkan bendera Merah Putih di panggung penghargaan. Tindakan tersebut merupakan wujud nasionalisme berupa …',
 'berprestasi untuk mengharumkan nama bangsa', 'chauvinisme yang merendahkan peserta lain', 'primordialisme yang mengutamakan daerah asal', 'kosmopolitanisme yang melupakan identitas bangsa', 'etnosentrisme yang menilai budaya lain lebih rendah',
 'A', 'Prestasi di tingkat internasional yang dipersembahkan untuk bangsa adalah salah satu indikator nasionalisme. Tidak ada unsur merendahkan peserta lain, sehingga bukan chauvinisme.', 'easy'),
('twk-nasionalisme-dasar',
 'Tantangan nasionalisme di era digital yang paling berkaitan langsung dengan persatuan bangsa adalah …',
 'penyebaran konten provokatif bernuansa SARA yang mempertentangkan kelompok masyarakat', 'meningkatnya penggunaan aplikasi belanja daring', 'bertambahnya jumlah kursus daring berbayar', 'semakin cepatnya jaringan internet di perkotaan', 'banyaknya permainan daring yang bersifat edukatif',
 'A', 'Konten provokatif berbasis SARA dapat memecah belah masyarakat sehingga langsung mengancam persatuan. Opsi lain adalah fenomena digital yang tidak secara langsung mempertentangkan kelompok masyarakat.', 'medium'),
('twk-integritas',
 'Sebuah kantor pelayanan menyediakan loket khusus serta kursi roda bagi penyandang disabilitas dan warga lanjut usia. Menurut Undang-Undang Nomor 25 Tahun 2009 tentang Pelayanan Publik, kebijakan ini mencerminkan asas …',
 'persamaan perlakuan', 'kepastian hukum', 'fasilitas dan perlakuan khusus bagi kelompok rentan', 'partisipatif', 'keterbukaan',
 'C', 'Penyediaan layanan khusus bagi kelompok rentan adalah asas tersendiri dalam UU Pelayanan Publik. Kebijakan ini bukan diskriminasi, sehingga tidak bertentangan dengan asas persamaan perlakuan.', 'easy'),
('twk-integritas',
 'Petugas meminta pemohon melampirkan surat rekomendasi tokoh masyarakat, padahal syarat tersebut tidak tercantum dalam standar pelayanan. Bentuk maladministrasi yang dilakukan petugas adalah …',
 'penundaan berlarut', 'penyimpangan prosedur', 'permintaan imbalan', 'diskriminasi', 'tidak kompeten',
 'B', 'Menambah syarat di luar standar pelayanan termasuk penyimpangan prosedur. Tidak ada permintaan uang atau penundaan waktu dalam kasus ini, sehingga opsi itu tidak tepat.', 'medium'),
('twk-integritas',
 'Berkas permohonan izin usaha seorang warga telah lengkap, tetapi tidak diproses selama empat bulan tanpa penjelasan apa pun dari instansi. Tindakan ini termasuk maladministrasi berupa …',
 'penyimpangan prosedur', 'penundaan berlarut', 'penyalahgunaan wewenang', 'perilaku tidak patut', 'konflik kepentingan',
 'B', 'Tidak memproses berkas yang lengkap dalam waktu lama tanpa alasan adalah penundaan berlarut. Tidak ada tambahan syarat atau perilaku kasar dalam kasus ini.', 'medium'),
('twk-integritas',
 'Arif menemukan bukti bahwa beberapa rekan kerjanya memanipulasi daftar penerima bantuan agar keluarga mereka sendiri ikut menerima. Tindakan Arif yang paling tepat adalah …',
 'mengunggah bukti ke media sosial agar segera viral', 'melaporkan temuan beserta buktinya melalui saluran pengaduan resmi, seperti whistleblowing system atau inspektorat', 'mendiamkan temuan tersebut agar tidak dikucilkan rekan kerja', 'menegur rekan di depan umum lalu menganggap masalah selesai', 'meminta bagian dari bantuan sebagai syarat tidak melaporkan',
 'B', 'Pelanggaran dilaporkan berdasarkan bukti melalui saluran resmi agar dapat ditindaklanjuti dan kerahasiaan terjaga. Mengunggah ke media sosial berisiko mengganggu pemeriksaan dan melanggar asas praduga tak bersalah.', 'medium'),
('twk-integritas',
 'Laporan yang wajib disampaikan penyelenggara negara kepada KPK mengenai harta kekayaannya disebut …',
 'Surat Pemberitahuan Tahunan (SPT) Pajak', 'Laporan Akuntabilitas Kinerja Instansi Pemerintah', 'Laporan Harta Kekayaan Penyelenggara Negara (LHKPN)', 'Sasaran Kinerja Pegawai (SKP)', 'Laporan Keuangan Pemerintah Pusat',
 'C', 'LHKPN disampaikan kepada KPK untuk mendorong transparansi harta penyelenggara negara. SPT disampaikan kepada otoritas pajak, sedangkan SKP adalah dokumen penilaian kinerja pegawai.', 'easy'),
('twk-integritas',
 'Menurut Peraturan Pemerintah Nomor 94 Tahun 2021 tentang Disiplin PNS, yang termasuk jenis hukuman disiplin ringan adalah …',
 'pemotongan tunjangan kinerja selama jangka waktu tertentu', 'penurunan jabatan setingkat lebih rendah', 'teguran lisan, teguran tertulis, dan pernyataan tidak puas secara tertulis', 'pembebasan dari jabatan menjadi jabatan pelaksana', 'pemberhentian dengan hormat tidak atas permintaan sendiri',
 'C', 'Hukuman disiplin ringan terdiri atas teguran lisan, teguran tertulis, dan pernyataan tidak puas secara tertulis. Pemotongan tunjangan kinerja termasuk hukuman sedang, sedangkan penurunan jabatan, pembebasan dari jabatan, dan pemberhentian termasuk hukuman berat.', 'medium'),
('twk-integritas',
 'Aspek akuntabilitas yang menekankan bahwa kinerja yang baik perlu dihargai, sedangkan kelalaian dan pelanggaran perlu diberi sanksi, adalah …',
 'akuntabilitas berbasis hubungan', 'akuntabilitas memerlukan konsekuensi', 'akuntabilitas berorientasi hasil', 'akuntabilitas membutuhkan pelaporan', 'akuntabilitas memperbaiki kinerja',
 'B', 'Pemberian penghargaan dan sanksi adalah wujud aspek konsekuensi dalam akuntabilitas. Aspek pelaporan berkaitan dengan penyampaian pertanggungjawaban, bukan dengan penghargaan atau sanksi.', 'hard'),
('twk-integritas',
 'Seorang pegawai yang melaporkan dugaan tindak pidana korupsi di instansinya mendapat ancaman dari pihak terlapor. Lembaga yang berwenang memberikan perlindungan kepada saksi dan pelapor tersebut adalah …',
 'Ombudsman Republik Indonesia', 'Komisi Yudisial', 'Lembaga Perlindungan Saksi dan Korban (LPSK)', 'Badan Kepegawaian Negara', 'Komisi Aparatur Sipil Negara',
 'C', 'LPSK bertugas memberikan perlindungan kepada saksi dan korban, termasuk pelapor dalam perkara pidana tertentu. Ombudsman menangani maladministrasi pelayanan publik, bukan perlindungan saksi.', 'medium'),
('twk-integritas',
 'Seorang petugas pelayanan membentak dan berbicara merendahkan kepada warga yang bertanya tentang prosedur. Perilaku ini termasuk maladministrasi berupa …',
 'perilaku tidak patut', 'penundaan berlarut', 'permintaan imbalan', 'penyimpangan prosedur', 'melampaui wewenang',
 'A', 'Bersikap kasar atau merendahkan warga termasuk perilaku tidak patut dalam pelayanan publik. Prosedur dan waktu layanan tidak dipersoalkan dalam kasus ini.', 'easy'),
('twk-integritas',
 'Kantor tempat Anda bekerja belum mengumumkan standar pelayanan, sehingga warga sering bingung tentang biaya dan lama penyelesaian layanan. Sebagai petugas, langkah yang paling tepat untuk meningkatkan akuntabilitas adalah …',
 'menjelaskan biaya yang berbeda-beda sesuai kemampuan setiap warga', 'membiarkannya karena penyusunan standar pelayanan bukan tugas petugas loket', 'menetapkan biaya sendiri agar warga memiliki kepastian', 'mengusulkan kepada pimpinan agar standar pelayanan berisi persyaratan, prosedur, waktu, dan biaya disusun serta diumumkan secara terbuka', 'memberikan informasi lengkap hanya kepada warga yang dikenal',
 'D', 'Standar pelayanan yang diumumkan memberi kepastian bagi warga dan menjadi alat ukur akuntabilitas petugas. Menetapkan biaya sendiri atau membedakan informasi antarwarga justru melahirkan pungutan liar dan diskriminasi.', 'hard'),
('twk-integritas',
 'Prinsip yang tepat dalam melaporkan dugaan pelanggaran di lingkungan kerja adalah …',
 'didasarkan pada fakta, disampaikan melalui saluran resmi, dan menjaga kerahasiaan proses', 'didasarkan pada kabar yang beredar di antara rekan kerja', 'disampaikan ke media massa sebelum dilaporkan ke instansi', 'disertai ancaman kepada pihak terlapor agar mengaku', 'dilakukan setelah mendapat janji imbalan dari pihak lain',
 'A', 'Laporan yang baik berbasis fakta dan bukti, melalui jalur resmi, serta dijaga kerahasiaannya agar pemeriksaan berjalan efektif. Laporan berbasis kabar burung berisiko menjadi fitnah.', 'medium'),
('twk-bela-negara',
 'Menurut Undang-Undang Nomor 3 Tahun 2002 tentang Pertahanan Negara, komponen utama dalam menghadapi ancaman militer adalah …',
 'Kepolisian Negara Republik Indonesia', 'Tentara Nasional Indonesia', 'komponen cadangan', 'komponen pendukung', 'seluruh warga negara tanpa kecuali',
 'B', 'Dalam menghadapi ancaman militer, TNI berkedudukan sebagai komponen utama yang didukung komponen cadangan dan komponen pendukung. Polri bertugas di bidang keamanan dan ketertiban masyarakat, bukan sebagai komponen utama pertahanan.', 'easy'),
('twk-bela-negara',
 'Sumber daya nasional yang telah disiapkan untuk dikerahkan melalui mobilisasi guna memperbesar dan memperkuat kekuatan dan kemampuan komponen utama disebut …',
 'komponen pendukung', 'komponen cadangan', 'komponen utama', 'rakyat terlatih', 'bela negara nonfisik',
 'B', 'Ciri khas komponen cadangan adalah disiapkan untuk mobilisasi guna memperbesar dan memperkuat komponen utama. Komponen pendukung berfungsi meningkatkan kekuatan dan kemampuan, tetapi tidak dibentuk sebagai kekuatan yang dimobilisasi untuk memperbesar komponen utama.', 'medium'),
('twk-bela-negara',
 'Sebuah pelabuhan dan galangan kapal milik swasta didata pemerintah agar fasilitasnya dapat dimanfaatkan untuk meningkatkan kemampuan pertahanan dalam keadaan darurat. Fasilitas tersebut termasuk …',
 'komponen utama', 'komponen cadangan dari unsur warga negara', 'alat utama sistem persenjataan TNI', 'objek yang tidak berkaitan dengan pertahanan', 'komponen pendukung',
 'E', 'Sarana dan prasarana nasional yang dimanfaatkan untuk meningkatkan kemampuan komponen utama dan cadangan termasuk komponen pendukung. Fasilitas itu bukan bagian dari TNI dan bukan warga negara yang dilatih sebagai komponen cadangan.', 'medium'),
('twk-bela-negara',
 'Menurut Undang-Undang Nomor 23 Tahun 2019, pembinaan kesadaran bela negara diselenggarakan dalam lingkup …',
 'keluarga, sekolah, dan tempat ibadah', 'pendidikan, masyarakat, dan pekerjaan', 'pusat, provinsi, dan kabupaten/kota', 'darat, laut, dan udara', 'politik, ekonomi, dan sosial budaya',
 'B', 'UU 23/2019 menetapkan tiga lingkup pembinaan kesadaran bela negara: pendidikan, masyarakat, dan pekerjaan. Darat, laut, dan udara adalah matra pertahanan, bukan lingkup pembinaan kesadaran bela negara.', 'medium'),
('twk-bela-negara',
 'Karang taruna sebuah kelurahan mengadakan penyuluhan bahaya narkoba bagi remaja di lingkungannya. Kegiatan ini merupakan pembinaan kesadaran bela negara dalam lingkup …',
 'pendidikan', 'pekerjaan', 'kemiliteran', 'masyarakat', 'pemerintahan pusat',
 'D', 'Kegiatan diselenggarakan organisasi kemasyarakatan di lingkungan tempat tinggal, sehingga termasuk lingkup masyarakat. Jika diselenggarakan sekolah sebagai bagian dari kegiatan belajar, lingkupnya pendidikan.', 'easy'),
('twk-bela-negara',
 'Pengerahan komponen cadangan untuk memperbesar kekuatan komponen utama dalam menghadapi ancaman militer dilakukan melalui …',
 'demobilisasi', 'wajib militer bagi seluruh warga negara', 'rekrutmen prajurit TNI secara reguler', 'pelatihan dasar kemiliteran di sekolah', 'mobilisasi',
 'E', 'Komponen cadangan dikerahkan melalui mobilisasi. Demobilisasi adalah kebalikannya, yaitu pengembalian setelah tugas selesai, sedangkan wajib militer bagi seluruh warga tidak dianut dalam pengaturan komponen cadangan yang bersifat sukarela.', 'hard'),
('twk-bela-negara',
 'Seorang guru menanamkan sikap toleransi dan kemampuan memeriksa kebenaran berita kepada siswanya. Menurut UU Pertahanan Negara, keikutsertaan guru tersebut dalam bela negara termasuk bentuk …',
 'pengabdian sebagai prajurit TNI', 'pelatihan dasar kemiliteran secara wajib', 'keanggotaan komponen cadangan', 'pengabdian sesuai dengan profesi', 'mobilisasi sumber daya nasional',
 'D', 'Guru menjalankan bela negara melalui tugas profesinya membentuk generasi yang tangguh secara ideologi dan berpikir kritis. Ia tidak sedang mengikuti pelatihan militer atau menjadi anggota komponen cadangan.', 'medium'),
('twk-bela-negara',
 'Anggota komponen cadangan dari unsur warga negara yang tidak sedang menjalani masa aktif …',
 'wajib tinggal di barak militer sepanjang tahun', 'berstatus sebagai prajurit TNI aktif', 'kembali menjalankan profesi masing-masing seperti biasa', 'dilarang bekerja di instansi pemerintah maupun swasta', 'berhak membawa senjata api dalam kegiatan sehari-hari',
 'C', 'Di luar masa aktif, anggota komponen cadangan kembali ke profesinya dan baru dikerahkan saat mobilisasi. Mereka bukan prajurit TNI aktif, sehingga opsi tentang barak dan senjata api keliru.', 'medium'),
('twk-bela-negara',
 'Sistem pertahanan yang melibatkan seluruh warga negara, wilayah, dan sumber daya nasional lainnya serta dipersiapkan secara dini oleh pemerintah disebut sistem pertahanan yang bersifat …',
 'konvensional', 'terbatas pada wilayah perbatasan', 'militer murni', 'semesta', 'kolektif regional',
 'D', 'Indonesia menganut sistem pertahanan yang bersifat semesta, yaitu melibatkan seluruh warga, wilayah, dan sumber daya nasional. Opsi militer murni keliru karena pertahanan Indonesia tidak hanya bertumpu pada TNI.', 'easy'),
('twk-bela-negara',
 'Ancaman yang memadukan unsur militer dan nonmiliter, misalnya serangan siber terhadap infrastruktur vital yang dibarengi kampanye disinformasi dan pergerakan pasukan di perbatasan, disebut ancaman …',
 'nonmiliter murni', 'militer konvensional', 'tradisional', 'hibrida', 'ideologis semata',
 'D', 'UU 23/2019 mengenal ancaman militer, nonmiliter, dan hibrida. Ancaman hibrida adalah gabungan unsur militer dan nonmiliter, sehingga tidak dapat digolongkan ke salah satu jenis saja.', 'hard'),
('twk-bela-negara',
 'Wujud bela negara yang paling tepat bagi seorang ASN pada masa damai adalah …',
 'mendaftar menjadi prajurit TNI sambil tetap berstatus ASN', 'bekerja profesional, menjaga kerahasiaan dokumen negara, dan menolak paham yang bertentangan dengan Pancasila', 'mengikuti patroli bersenjata di wilayah perbatasan setiap pekan', 'membagikan informasi kekuatan militer negara di media sosial', 'mengikuti latihan perang secara mandiri setiap akhir pekan',
 'B', 'Pada masa damai, bela negara ASN diwujudkan melalui kinerja yang profesional, berintegritas, dan setia pada ideologi negara. Membagikan informasi kekuatan militer justru dapat membahayakan pertahanan.', 'medium'),
('twk-pancasila',
 'Pasal 2 Undang-Undang Nomor 12 Tahun 2011 tentang Pembentukan Peraturan Perundang-undangan menyatakan bahwa Pancasila merupakan …',
 'ideologi terbuka yang dapat diubah sesuai zaman', 'perjanjian luhur bangsa Indonesia', 'sumber segala sumber hukum negara', 'hasil kesepakatan PPKI yang bersifat sementara', 'kepribadian bangsa yang tidak berkaitan dengan hukum',
 'C', 'Pasal 2 UU 12/2011 menegaskan Pancasila sebagai sumber segala sumber hukum negara. Perjanjian luhur memang salah satu kedudukan Pancasila, tetapi bukan rumusan dalam pasal tersebut.', 'easy'),
('twk-pancasila',
 'Hari Lahir Pancasila yang ditetapkan sebagai hari libur nasional diperingati setiap tanggal …',
 '1 Oktober', '1 Juni', '18 Agustus', '22 Juni', '30 September',
 'B', 'Hari Lahir Pancasila diperingati setiap 1 Juni, merujuk pada pidato Soekarno pada 1 Juni 1945. Tanggal 1 Oktober adalah Hari Kesaktian Pancasila, pengecoh yang paling sering muncul.', 'easy'),
('twk-pancasila',
 'Kajian Pancasila sebagai sistem filsafat yang membahas hakikat manusia sebagai makhluk monopluralis termasuk landasan …',
 'epistemologis', 'aksiologis', 'yuridis', 'sosiologis', 'ontologis',
 'E', 'Landasan ontologis membahas hakikat yang menjadi dasar, termasuk hakikat manusia sebagai makhluk monopluralis. Epistemologis membahas sumber pengetahuan, sedangkan aksiologis membahas nilai dan kegunaan.', 'medium'),
('twk-pancasila',
 'Pandangan bahwa nilai-nilai Pancasila digali dari adat istiadat, budaya, dan nilai religius yang telah hidup dalam masyarakat Indonesia berkaitan dengan landasan …',
 'ontologis', 'epistemologis', 'aksiologis', 'teleologis', 'normatif',
 'B', 'Asal-usul dan cara memperoleh pengetahuan tentang Pancasila adalah ranah epistemologis. Ontologis membahas hakikat, sedangkan aksiologis membahas nilai yang terkandung dan kegunaannya.', 'medium'),
('twk-pancasila',
 'Ketetapan MPR yang mencabut ketetapan tentang Pedoman Penghayatan dan Pengamalan Pancasila (P4) sekaligus menegaskan Pancasila sebagai dasar negara adalah …',
 'Ketetapan MPR Nomor II/MPR/1978', 'Ketetapan MPRS Nomor XX/MPRS/1966', 'Ketetapan MPR Nomor I/MPR/2003', 'Ketetapan MPR Nomor XVIII/MPR/1998', 'Ketetapan MPR Nomor XI/MPR/1998',
 'D', 'Tap MPR XVIII/MPR/1998 mencabut ketetapan tentang P4 dan menegaskan kedudukan Pancasila sebagai dasar negara. Tap MPR II/MPR/1978 justru ketetapan yang menetapkan P4, sedangkan Tap MPR XI/MPR/1998 mengatur penyelenggaraan negara yang bebas KKN.', 'hard'),
('twk-pancasila',
 'Kebijakan yang menjadikan Pancasila sebagai satu-satunya asas bagi partai politik dan organisasi kemasyarakatan diterapkan pada masa …',
 'Demokrasi Liberal', 'Demokrasi Terpimpin', 'Reformasi', 'revolusi fisik', 'Orde Baru',
 'E', 'Penerapan asas tunggal Pancasila dilakukan pada masa Orde Baru melalui undang-undang tahun 1985. Pada masa Reformasi, kebijakan penafsiran tunggal seperti P4 justru dicabut.', 'medium'),
('twk-pancasila',
 'Lembaga yang bertugas membantu Presiden merumuskan arah kebijakan pembinaan ideologi Pancasila dan dibentuk melalui Peraturan Presiden Nomor 7 Tahun 2018 adalah …',
 'Lembaga Ketahanan Nasional (Lemhannas)', 'Badan Penyelidik Usaha-Usaha Persiapan Kemerdekaan (BPUPKI)', 'Majelis Permusyawaratan Rakyat (MPR)', 'Badan Pembinaan Ideologi Pancasila (BPIP)', 'Dewan Perwakilan Daerah (DPD)',
 'D', 'BPIP dibentuk pada 2018 untuk membantu Presiden dalam pembinaan ideologi Pancasila. BPUPKI adalah badan pada 1945 yang menyiapkan dasar negara, bukan lembaga pembinaan ideologi saat ini.', 'easy'),
('twk-pancasila',
 'Praktik politik uang dalam pemilihan umum bertentangan dengan Pancasila sebagai etika politik, terutama karena …',
 'melanggar sila pertama, sebab uang tidak boleh digunakan dalam kegiatan apa pun', 'melanggar sila keempat, sebab pilihan rakyat tidak lagi lahir dari pertimbangan yang jernih dan bertanggung jawab', 'melanggar sila ketiga, sebab pemilu seharusnya hanya diikuti satu partai', 'tidak melanggar Pancasila selama uang berasal dari harta pribadi calon', 'melanggar sila kedua, sebab jumlah uang yang dibagikan tidak sama rata',
 'B', 'Sila keempat menuntut kedaulatan rakyat dijalankan dengan hikmat kebijaksanaan, sedangkan politik uang membeli suara dan merusak kedaulatan itu. Asal uang dari harta pribadi tidak menghilangkan pelanggarannya.', 'medium'),
('twk-pancasila',
 'Konsekuensi kedudukan Pancasila sebagai sumber segala sumber hukum negara adalah …',
 'Pancasila menggantikan fungsi UUD 1945 sebagai konstitusi', 'rumusan Pancasila dapat diubah oleh DPR melalui undang-undang', 'materi muatan setiap peraturan perundang-undangan tidak boleh bertentangan dengan nilai-nilai Pancasila', 'setiap peraturan wajib mencantumkan teks lengkap Pancasila dalam pasalnya', 'hakim boleh mengabaikan undang-undang tanpa melalui pengujian',
 'C', 'Sebagai sumber segala sumber hukum, Pancasila menjadi tolok ukur seluruh peraturan, sehingga peraturan yang bertentangan dapat diuji melalui mekanisme yang sah. Pancasila tidak menggantikan UUD dan tidak perlu disalin dalam setiap pasal.', 'hard'),
('twk-pancasila',
 'Hari Kesaktian Pancasila setiap tanggal 1 Oktober diperingati untuk …',
 'memperingati pidato Soekarno tentang dasar negara di sidang BPUPKI', 'mengenang kegagalan upaya mengganti Pancasila dalam peristiwa tahun 1965', 'memperingati pengesahan Pancasila oleh PPKI', 'memperingati disusunnya Piagam Jakarta oleh Panitia Sembilan', 'memperingati penetapan Pancasila sebagai asas tunggal organisasi',
 'B', 'Hari Kesaktian Pancasila berkaitan dengan peristiwa 1965 yang gagal mengganti dasar negara. Pidato Soekarno tentang dasar negara diperingati sebagai Hari Lahir Pancasila pada 1 Juni.', 'medium'),
('twk-pancasila',
 'Pancasila sebagai paradigma pembangunan berarti …',
 'keberhasilan pembangunan cukup diukur dari pertumbuhan ekonomi', 'Pancasila hanya digunakan dalam upacara kenegaraan', 'setiap proyek pembangunan wajib memasang lambang Garuda Pancasila', 'Pancasila menjadi kerangka berpikir dan tolok ukur arah pembangunan di segala bidang', 'arah pembangunan diserahkan sepenuhnya pada mekanisme pasar',
 'D', 'Sebagai paradigma, Pancasila menjadi kerangka dan ukuran arah pembangunan politik, ekonomi, hukum, dan sosial budaya. Mengukur keberhasilan hanya dari pertumbuhan ekonomi mengabaikan nilai kemanusiaan dan keadilan sosial.', 'medium'),
('twk-uud-1945',
 'Menurut Pasal 23 ayat (3) UUD 1945, apabila DPR tidak menyetujui rancangan APBN yang diusulkan Presiden, maka …',
 'Presiden menetapkan APBN melalui Perppu', 'MPR menetapkan APBN dalam sidang istimewa', 'Pemerintah menjalankan APBN tahun yang lalu', 'Pemerintah menghentikan seluruh pengeluaran negara', 'DPD menetapkan APBN sebagai pengganti DPR',
 'C', 'Pasal 23 ayat (3) menyatakan pemerintah menjalankan APBN tahun lalu bila RAPBN tidak disetujui DPR. Ketentuan ini mencegah kekosongan anggaran tanpa memberi Presiden kewenangan menetapkan APBN sendiri.', 'easy'),
('twk-uud-1945',
 'Menurut Pasal 23A UUD 1945, pajak dan pungutan lain yang bersifat memaksa untuk keperluan negara diatur dengan …',
 'peraturan pemerintah', 'peraturan presiden', 'peraturan menteri keuangan', 'keputusan Badan Pemeriksa Keuangan', 'undang-undang',
 'E', 'Pungutan yang memaksa harus mendapat persetujuan rakyat melalui wakilnya, sehingga diatur dengan undang-undang. Peraturan di bawah undang-undang hanya dapat mengatur pelaksanaannya.', 'medium'),
('twk-uud-1945',
 'Pengakuan negara terhadap kesatuan masyarakat hukum adat beserta hak-hak tradisionalnya dalam Pasal 18B ayat (2) UUD 1945 berlaku dengan syarat …',
 'jika telah diakui oleh Perserikatan Bangsa-Bangsa', 'tanpa syarat apa pun', 'sepanjang masih hidup dan sesuai dengan perkembangan masyarakat dan prinsip NKRI', 'hanya berlaku bagi masyarakat adat di Provinsi Papua', 'selama masyarakat adat tersebut tidak memiliki wilayah',
 'C', 'Pengakuan dalam Pasal 18B ayat (2) bersyarat: masih hidup, sesuai perkembangan masyarakat, dan sesuai prinsip NKRI. Opsi tanpa syarat apa pun adalah jebakan yang sering muncul.', 'medium'),
('twk-uud-1945',
 'Menurut Pasal 18 ayat (5) UUD 1945, pemerintahan daerah menjalankan otonomi …',
 'terbatas hanya pada urusan pendidikan dan kesehatan', 'penuh, termasuk urusan politik luar negeri dan pertahanan', 'sesuai ketentuan yang ditetapkan oleh gubernur', 'seluas-luasnya, kecuali urusan pemerintahan yang oleh undang-undang ditentukan sebagai urusan Pemerintah Pusat', 'yang sama persis untuk semua daerah tanpa pengecualian',
 'D', 'Pasal 18 ayat (5) menganut otonomi seluas-luasnya dengan pengecualian urusan yang ditetapkan undang-undang sebagai urusan pusat. Politik luar negeri dan pertahanan termasuk urusan pusat, sehingga opsi otonomi penuh keliru.', 'medium'),
('twk-uud-1945',
 'Bab XV UUD 1945 mengatur tentang …',
 'bendera, bahasa, dan lambang negara, serta lagu kebangsaan', 'pertahanan dan keamanan negara', 'wilayah negara', 'hak asasi manusia', 'perubahan Undang-Undang Dasar',
 'A', 'Bab XV (Pasal 35 sampai 36C) mengatur bendera, bahasa, lambang negara, dan lagu kebangsaan. Hak asasi manusia diatur dalam Bab XA, sedangkan perubahan UUD diatur dalam Bab XVI.', 'easy'),
('twk-uud-1945',
 'Menurut Pasal 23 ayat (2) UUD 1945, rancangan undang-undang APBN diajukan oleh …',
 'DPR untuk dibahas bersama DPD', 'Menteri Keuangan kepada MPR', 'BPK kepada DPR setelah pemeriksaan keuangan', 'DPD kepada Presiden untuk ditetapkan', 'Presiden untuk dibahas bersama DPR dengan memperhatikan pertimbangan DPD',
 'E', 'RUU APBN selalu diajukan Presiden dan dibahas bersama DPR, sementara DPD memberi pertimbangan. BPK memeriksa pertanggungjawaban keuangan negara, bukan mengajukan RUU APBN.', 'medium'),
('twk-uud-1945',
 'Aturan Peralihan Pasal I UUD 1945 menyatakan bahwa segala peraturan perundang-undangan yang ada masih tetap berlaku selama belum diadakan yang baru menurut UUD. Tujuan utama ketentuan tersebut adalah …',
 'mencegah terjadinya kekosongan hukum', 'memberi wewenang kepada MPR untuk membentuk undang-undang', 'menghapus seluruh peraturan peninggalan masa kolonial', 'membatasi masa jabatan presiden dan wakil presiden', 'menjadi dasar pembentukan Mahkamah Konstitusi',
 'A', 'Tanpa Aturan Peralihan Pasal I, perubahan konstitusi dapat membuat peraturan lama kehilangan dasar sehingga terjadi kekosongan hukum. Pembentukan Mahkamah Konstitusi diatur dalam Aturan Peralihan Pasal III, bukan Pasal I.', 'hard'),
('twk-uud-1945',
 'Sebelum Mahkamah Konstitusi terbentuk, segala kewenangannya menurut Aturan Peralihan Pasal III UUD 1945 dilakukan oleh …',
 'Majelis Permusyawaratan Rakyat', 'Dewan Perwakilan Rakyat', 'Mahkamah Agung', 'Komisi Yudisial', 'Presiden',
 'C', 'Aturan Peralihan Pasal III menetapkan MK dibentuk paling lambat 17 Agustus 2003 dan sebelum itu kewenangannya dijalankan Mahkamah Agung. Komisi Yudisial bukan lembaga peradilan, sehingga tidak tepat.', 'medium'),
('twk-uud-1945',
 'Pasal 23D UUD 1945 mengatur bahwa negara memiliki …',
 'suatu bank sentral yang susunan, kedudukan, kewenangan, tanggung jawab, dan independensinya diatur dengan undang-undang', 'suatu badan pemeriksa keuangan yang bebas dan mandiri', 'suatu dewan pertimbangan yang memberi nasihat kepada Presiden', 'satu mata uang yang nilainya ditetapkan oleh Presiden', 'badan usaha milik negara di setiap provinsi',
 'A', 'Pasal 23D mengatur bank sentral beserta independensinya. Badan pemeriksa keuangan yang bebas dan mandiri diatur dalam Pasal 23E, pengecoh yang letaknya berdekatan.', 'easy'),
('twk-uud-1945',
 'Pemerintah provinsi X mewajibkan setiap kendaraan dari luar provinsi membayar "iuran masuk wilayah" tanpa dasar peraturan daerah maupun undang-undang. Ditinjau dari UUD 1945, kebijakan ini bermasalah karena …',
 'pemerintah provinsi sama sekali tidak memiliki hak otonomi', 'hanya Presiden yang berwenang memungut biaya dari warga', 'pajak dan pungutan lain yang bersifat memaksa harus memiliki dasar hukum yang bersumber dari undang-undang sebagaimana Pasal 23A', 'seluruh bentuk pungutan dilarang oleh UUD 1945', 'pengaturan kendaraan bermotor termasuk urusan absolut pemerintah pusat',
 'C', 'Pasal 23A mensyaratkan pungutan yang memaksa diatur dengan undang-undang, sehingga pungutan daerah pun harus berdasar perda yang dibentuk sesuai undang-undang. Provinsi tetap memiliki otonomi, tetapi otonomi tidak membenarkan pungutan tanpa dasar hukum.', 'hard'),
('twk-uud-1945',
 'Menurut Aturan Tambahan Pasal II UUD 1945, setelah perubahan Undang-Undang Dasar terdiri atas …',
 'Pembukaan, Batang Tubuh, dan Penjelasan', 'Pembukaan dan Penjelasan', 'Pembukaan dan pasal-pasal', 'pasal-pasal dan Penjelasan', 'Mukadimah, pasal-pasal, dan lampiran',
 'C', 'Aturan Tambahan Pasal II menegaskan bahwa UUD 1945 terdiri atas Pembukaan dan pasal-pasal. Penjelasan tidak lagi menjadi bagian UUD setelah perubahan, sehingga opsi yang memuat Penjelasan keliru.', 'medium'),
('twk-nkri',
 'Pemberontakan PKI di Madiun pada tahun 1948 dipimpin oleh …',
 'Kartosoewirjo', 'Raymond Westerling', 'Soumokil', 'Kahar Muzakkar', 'Musso',
 'E', 'Pemberontakan PKI Madiun 1948 dipimpin Musso. Kartosoewirjo memimpin DI/TII di Jawa Barat, Westerling memimpin APRA, dan Soumokil terkait RMS.', 'easy'),
('twk-nkri',
 'Gerakan Republik Maluku Selatan (RMS) yang diproklamasikan pada April 1950 bertujuan …',
 'mendirikan negara berdasarkan ideologi komunis', 'memisahkan diri dari Indonesia dan menolak bergabung dengan negara kesatuan', 'mengganti Presiden Soekarno dengan tokoh dari Maluku', 'menuntut otonomi khusus melalui perundingan damai', 'menolak masuknya pasukan APRIS ke Makassar',
 'B', 'RMS adalah gerakan separatis yang ingin memisahkan diri dan menolak kembali ke negara kesatuan. Penolakan masuknya pasukan APRIS ke Makassar adalah latar peristiwa Andi Azis.', 'medium'),
('twk-nkri',
 'Pergolakan PRRI dan Permesta pada akhir 1950-an terutama dilatarbelakangi oleh …',
 'keinginan mendirikan negara berideologi komunis', 'upaya memulihkan negara federal bentukan Belanda', 'ketidakpuasan sejumlah daerah terhadap kebijakan pemerintah pusat, terutama ketimpangan pembangunan', 'penolakan terhadap proklamasi kemerdekaan Indonesia', 'sengketa perbatasan dengan negara tetangga',
 'C', 'PRRI dan Permesta lahir dari ketidakpuasan daerah terhadap pusat, terutama soal pembangunan dan otonomi. Upaya mempertahankan negara federal adalah latar APRA dan Andi Azis.', 'medium'),
('twk-nkri',
 'Pemberontakan Angkatan Perang Ratu Adil (APRA) di Bandung pada Januari 1950 dipimpin oleh …',
 'Raymond Westerling', 'Andi Azis', 'Soumokil', 'Musso', 'Daud Beureueh',
 'A', 'APRA dipimpin Westerling dan berkaitan dengan kepentingan mempertahankan negara federal. Andi Azis memimpin pemberontakan di Makassar pada bulan April 1950.', 'easy'),
('twk-nkri',
 'Pengelompokan pergolakan dalam sejarah NKRI berdasarkan latar belakangnya yang tepat adalah …',
 'APRA dan RMS berlatar ideologi keagamaan', 'PKI Madiun dan DI/TII berlatar ideologi, sedangkan PRRI/Permesta berlatar hubungan pusat dan daerah', 'PRRI dan DI/TII berlatar kepentingan mempertahankan negara federal', 'PKI Madiun dan Andi Azis berlatar ketimpangan pembangunan daerah', 'G30S dan Permesta berlatar keinginan memulihkan pemerintahan kolonial',
 'B', 'Pergolakan berlatar ideologi meliputi PKI Madiun, DI/TII, dan G30S; berlatar kepentingan meliputi APRA, Andi Azis, dan RMS; berlatar hubungan pusat-daerah adalah PRRI/Permesta. Opsi lain menukar latar belakang antarkelompok.', 'hard'),
('twk-nkri',
 'Integrasi nasional dalam dimensi vertikal berarti …',
 'menyatukan berbagai suku bangsa dalam satu wilayah', 'menjalin hubungan antara Indonesia dan negara lain', 'menyeragamkan agama yang dianut masyarakat', 'meleburkan seluruh budaya daerah menjadi satu budaya', 'menjembatani hubungan antara pemerintah dan rakyat',
 'E', 'Dimensi vertikal menyangkut hubungan pemerintah dengan rakyat, sedangkan dimensi horizontal menyangkut hubungan antarkelompok masyarakat. Integrasi tidak berarti menyeragamkan agama atau menghapus budaya daerah.', 'easy'),
('twk-nkri',
 'Konflik bersenjata di Aceh diakhiri melalui nota kesepahaman damai antara Pemerintah Republik Indonesia dan Gerakan Aceh Merdeka yang ditandatangani di …',
 'Den Haag pada tahun 1949', 'Linggarjati pada tahun 1946', 'Bangkok pada tahun 2003', 'Kuala Lumpur pada tahun 2004', 'Helsinki pada tahun 2005',
 'E', 'Nota Kesepahaman Helsinki ditandatangani pada 15 Agustus 2005 dan ditindaklanjuti dengan UU tentang Pemerintahan Aceh. Den Haag dan Linggarjati berkaitan dengan perundingan Indonesia-Belanda masa revolusi.', 'medium'),
('twk-nkri',
 'Proses masuknya unsur budaya luar yang kemudian dipadukan dengan budaya setempat tanpa menghilangkan ciri budaya aslinya disebut …',
 'asimilasi', 'amalgamasi', 'segregasi', 'separatisme', 'akulturasi',
 'E', 'Pada akulturasi, unsur budaya asli tetap tampak setelah berpadu dengan unsur budaya luar. Pada asimilasi, budaya-budaya melebur sehingga membentuk budaya baru dan ciri aslinya memudar.', 'medium'),
('twk-nkri',
 'Dua kelompok warga di sebuah kabupaten bersitegang karena perebutan batas tanah ulayat, sementara pesan berantai yang membawa isu suku beredar dan memanaskan suasana. Langkah pemerintah daerah yang paling sesuai untuk menjaga integrasi nasional adalah …',
 'memindahkan salah satu kelompok warga ke daerah lain', 'membiarkan kedua kelompok menyelesaikan masalahnya sendiri', 'memfasilitasi dialog dengan tokoh adat dan tokoh masyarakat, meluruskan informasi provokatif, dan menyelesaikan batas tanah berdasarkan hukum', 'memihak kelompok yang jumlah warganya lebih banyak', 'memutus seluruh akses komunikasi warga tanpa batas waktu',
 'C', 'Konflik perlu ditangani melalui dialog, penanganan hoaks, dan kepastian hukum agar akar masalahnya selesai. Memihak mayoritas atau memindahkan warga justru menimbulkan ketidakadilan baru.', 'hard'),
('twk-nkri',
 'Faktor berikut yang termasuk penghambat integrasi nasional adalah …',
 'penggunaan bahasa Indonesia sebagai bahasa persatuan', 'Pancasila sebagai dasar negara dan titik temu bangsa', 'kesenjangan pembangunan antardaerah yang dibiarkan berlarut-larut', 'pengalaman sejarah bersama melawan penjajahan', 'semboyan Bhinneka Tunggal Ika sebagai pedoman hidup bersama',
 'C', 'Kesenjangan pembangunan dapat memicu ketidakpuasan dan rasa diperlakukan tidak adil oleh pusat. Empat opsi lainnya justru faktor pendorong integrasi nasional.', 'medium'),
('twk-nkri',
 'Gerakan DI/TII di Sulawesi Selatan dipimpin oleh …',
 'Daud Beureueh', 'Kahar Muzakkar', 'Kartosoewirjo', 'Amir Fatah', 'Ibnu Hadjar',
 'B', 'DI/TII di Sulawesi Selatan dipimpin Kahar Muzakkar. Daud Beureueh memimpin gerakan di Aceh, Kartosoewirjo di Jawa Barat, Amir Fatah di Jawa Tengah, dan Ibnu Hadjar di Kalimantan Selatan.', 'medium'),
('twk-kaidah-bahasa',
 'Kata berimbuhan yang penulisannya sesuai kaidah baku adalah …',
 'mempengaruhi', 'mensukseskan', 'memengaruhi', 'mengkonsumsi', 'mentaati',
 'C', 'Kata dasar pengaruh diawali huruf p tunggal sehingga luluh menjadi memengaruhi. Bentuk baku pengecoh lainnya adalah menyukseskan, mengonsumsi, dan menaati.', 'easy'),
('twk-kaidah-bahasa',
 'Kata berimbuhan berikut yang huruf awal kata dasarnya tidak luluh karena diawali gugus konsonan adalah …',
 'memproduksi', 'memukul', 'menyapu', 'menulis', 'mengirim',
 'A', 'Produksi diawali gugus konsonan pr, sehingga p tidak luluh menjadi memproduksi. Kata memukul, menyapu, menulis, dan mengirim justru contoh peluluhan k, t, s, p.', 'medium'),
('twk-kaidah-bahasa',
 'Kalimat yang menggunakan konjungsi secara tepat adalah …',
 'Meskipun cuaca buruk, tetapi petugas tetap mendistribusikan logistik ke desa terdampak.', 'Karena hujan turun sangat deras, sehingga jalan desa tergenang.', 'Rapat ditunda. Tetapi, laporan tetap harus dikumpulkan hari ini.', 'Baik siswa ataupun guru wajib hadir dalam upacara.', 'Meskipun cuaca buruk, petugas tetap mendistribusikan logistik ke desa terdampak.',
 'E', 'Kalimat yang benar memakai satu konjungsi konsesif tanpa konjungsi ganda. Pengecoh memuat konjungsi ganda (meskipun dengan tetapi, karena dengan sehingga), konjungsi intrakalimat di awal kalimat, dan pasangan korelatif yang salah.', 'medium'),
('twk-kaidah-bahasa',
 'Konjungsi yang tepat untuk melengkapi kalimat "Yang diperlukan masyarakat bukan bantuan sesaat, … program pemberdayaan yang berkelanjutan." adalah …',
 'tetapi', 'namun', 'melainkan', 'sedangkan', 'padahal',
 'C', 'Konjungsi bukan berpasangan dengan melainkan, terutama untuk menyangkal nomina atau frasa nominal. Tetapi dipasangkan dengan tidak untuk menyangkal verba atau adjektiva.', 'medium'),
('twk-kaidah-bahasa',
 'Penulisan konjungsi antarkalimat yang tepat terdapat pada …',
 'Anggaran kegiatan sudah disetujui. Oleh karena itu panitia segera menyusun jadwal.', 'Anggaran kegiatan sudah disetujui. Sehingga panitia segera menyusun jadwal.', 'Anggaran kegiatan sudah disetujui, oleh karena itu panitia segera menyusun jadwal.', 'Anggaran kegiatan sudah disetujui. Oleh karena itu, panitia segera menyusun jadwal.', 'Anggaran kegiatan sudah disetujui. Oleh karenanya maka panitia segera menyusun jadwal.',
 'D', 'Konjungsi antarkalimat diletakkan di awal kalimat baru dan diikuti tanda koma. Sehingga adalah konjungsi intrakalimat, sedangkan oleh karenanya maka mengandung pemborosan.', 'easy'),
('twk-kaidah-bahasa',
 'Makna imbuhan ter- pada kalimat "Map rapat itu terbawa oleh adik ke sekolah." adalah …',
 'paling', 'dapat di-', 'menyatakan pelaku', 'menyatakan alat', 'tidak sengaja',
 'E', 'Terbawa dalam kalimat itu berarti terbawa tanpa sengaja. Makna paling terdapat pada kata seperti terbaik, sedangkan makna dapat di- terdapat pada kata seperti terbaca.', 'medium'),
('twk-kaidah-bahasa',
 'Kalimat majemuk bertingkat yang menyatakan hubungan konsesif (pertentangan yang mengakui keadaan) terdapat pada kalimat …',
 'Walaupun gajinya kecil, ia tidak pernah menerima suap.', 'Ia tidak menerima suap karena takut melanggar sumpah jabatan.', 'Jika berkas lengkap, izin diterbitkan hari ini.', 'Ia belajar dengan tekun agar lulus seleksi.', 'Hujan turun sangat deras sehingga acara ditunda.',
 'A', 'Konjungsi walaupun menandai hubungan konsesif. Opsi lain secara berurutan menyatakan hubungan sebab, syarat, tujuan, dan akibat.', 'medium'),
('twk-kaidah-bahasa',
 'Kalimat majemuk bertingkat berikut yang pemakaian komanya sesuai kaidah adalah …',
 'Jika semua dokumen sudah lengkap, petugas akan memproses permohonan Anda.', 'Petugas akan memproses permohonan Anda, jika semua dokumen sudah lengkap.', 'Kami yakin, bahwa program ini bermanfaat bagi warga.', 'Karena jalan rusak warga, terlambat tiba di kantor desa.', 'Ia tidak hadir dalam rapat, karena sedang sakit.',
 'A', 'Koma dipakai di antara anak kalimat dan induk kalimat apabila anak kalimat mendahului induk kalimat. Jika induk kalimat berada di depan, koma tidak dipakai, dan koma tidak boleh diletakkan sebelum kata bahwa.', 'hard'),
('twk-kaidah-bahasa',
 'Kata berkonfiks ke-an yang menyatakan makna terlalu terdapat pada kalimat …',
 'Sepatu baru itu kebesaran untuk kaki adik.', 'Kami kehujanan dalam perjalanan pulang.', 'Keadilan harus ditegakkan bagi semua warga.', 'Ia bekerja di kedutaan besar.', 'Kemerdekaan diraih dengan perjuangan panjang.',
 'A', 'Kebesaran pada kalimat itu berarti terlalu besar. Kehujanan bermakna mengalami, keadilan dan kemerdekaan bermakna hal atau keadaan, sedangkan kedutaan bermakna tempat atau lembaga.', 'medium'),
('twk-kaidah-bahasa',
 'Pasangan konjungsi korelatif yang tepat adalah …',
 'baik … ataupun …', 'entah … maupun …', 'baik … maupun …', 'bukan … maupun …', 'tidak hanya … dan juga …',
 'C', 'Pasangan korelatif yang baku antara lain baik … maupun …, tidak hanya … tetapi juga …, bukan … melainkan …, dan entah … entah …. Pasangan pada opsi lain mencampur unsur dari pasangan yang berbeda.', 'easy'),
('twk-kaidah-bahasa',
 'Kalimat yang seluruh kata berimbuhannya ditulis sesuai kaidah baku adalah …',
 'Panitia mensosialisasikan aturan baru dan memprioritaskan peserta lansia.', 'Panitia menyosialisasikan aturan baru dan memrioritaskan peserta lansia.', 'Panitia mensosialisasikan aturan baru dan mengkoordinir peserta lansia.', 'Panitia menyosialisasikan aturan baru dan memprioritaskan peserta lansia.', 'Panitia menyosialisasikan aturan baru dan mengkoordinasi peserta lansia.',
 'D', 'Sosialisasi diawali s tunggal sehingga luluh menjadi menyosialisasikan, sedangkan prioritas diawali gugus konsonan pr sehingga tetap memprioritaskan. Bentuk mengkoordinasi tidak baku; yang baku adalah mengoordinasi.', 'hard');

insert into public.questions (test_code, subtopic_id, stem, options, explanation, difficulty, usage, status, source, year)
select 'TWK', s.id, v.stem,
       jsonb_build_array(
         jsonb_build_object('label','A','text',v.a,'points',case when v.k = 'A' then 5 else 0 end),
         jsonb_build_object('label','B','text',v.b,'points',case when v.k = 'B' then 5 else 0 end),
         jsonb_build_object('label','C','text',v.c,'points',case when v.k = 'C' then 5 else 0 end),
         jsonb_build_object('label','D','text',v.d,'points',case when v.k = 'D' then 5 else 0 end),
         jsonb_build_object('label','E','text',v.e,'points',case when v.k = 'E' then 5 else 0 end)),
       v.expl, v.diff, 'both', 'published', 'SiapASN original', 2026
from _twk2_q v
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
