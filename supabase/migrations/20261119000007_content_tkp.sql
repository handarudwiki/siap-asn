-- SiapASN original TKP content: lessons and practice questions (generated, idempotent).
-- All lesson text and questions are original works written for SiapASN.
begin;

insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values
  ('tkp-pelayanan', 'Strategi Umum Menaklukkan TKP', 'tkp-strategi-umum', 'Cara penilaian, nilai BerAKHLAK, membaca peran, dan manajemen waktu TKP.',
$md$## Mengenal TKP: tes sikap, bukan tes hafalan

Tes Karakteristik Pribadi (TKP) mengukur **cara Anda bersikap dan mengambil keputusan** sebagai calon Aparatur Sipil Negara. Soalnya berupa situasi kerja sehari-hari: melayani warga di loket, bekerja sama dengan rekan lintas bidang, menghadapi teknologi baru, atau menyikapi konten intoleran. Tidak ada rumus yang harus dihafal, tetapi ada **pola berpikir** yang konsisten dinilai tinggi.

Aspek yang diuji dalam TKP SKD CPNS:

| Aspek | Fokus penilaian |
| --- | --- |
| Pelayanan publik | Orientasi melayani, ramah, cepat, tuntas, sesuai standar |
| Jejaring kerja | Membangun dan merawat relasi, kolaborasi lintas unit |
| Sosial budaya | Adaptasi, menghargai keberagaman, empati |
| Teknologi informasi dan komunikasi | Kemauan belajar teknologi, keamanan data, etika digital |
| Profesionalisme | Tanggung jawab, integritas, kualitas kerja, disiplin |
| Anti radikalisme | Sikap moderat, setia pada Pancasila, menangkal intoleransi |

## Cara penilaian TKP

| Komponen | Ketentuan |
| --- | --- |
| Jumlah soal | 45 soal |
| Nilai tiap opsi | 1 sampai 5, setiap angka dipakai tepat satu kali |
| Nilai maksimal | 45 × 5 = 225 |
| Nilai ambang batas (formasi umum) | 166 |
| Soal tidak dijawab | 0 poin |

> **Penting:** Di TKP tidak ada jawaban "salah" yang bernilai nol. Opsi terburuk pun masih bernilai 1. Karena itu, **jangan pernah mengosongkan soal TKP**. Jawaban asal tetap lebih baik daripada kosong.

Ambang batas 166 dari 225 berarti rata-rata Anda harus sekitar **3,7 per soal**. Artinya Anda tidak harus selalu mendapat 5, tetapi harus sering mendapat 4 atau 5 dan sangat jarang jatuh ke 1 atau 2.

## Nilai dasar ASN BerAKHLAK sebagai kompas

Pembuat soal TKP menilai sikap berdasarkan nilai dasar ASN **BerAKHLAK**. Gunakan ini sebagai kompas ketika ragu.

| Nilai | Wujud dalam jawaban bernilai tinggi |
| --- | --- |
| **Ber**orientasi Pelayanan | Memahami dan memenuhi kebutuhan masyarakat, ramah, solutif |
| **A**kuntabel | Jujur, bertanggung jawab, cermat, tidak menyalahgunakan wewenang |
| **K**ompeten | Terus belajar, meningkatkan kemampuan, mutu kerja terbaik |
| **H**armonis | Menghargai perbedaan, suka menolong, membangun suasana kondusif |
| **L**oyal | Setia pada Pancasila, UUD 1945, NKRI; menjaga nama baik instansi dan rahasia jabatan |
| **A**daptif | Cepat menyesuaikan diri, kreatif, proaktif menghadapi perubahan |
| **K**olaboratif | Membuka kesempatan bagi pihak lain berkontribusi, bersinergi |

## Membaca peran dalam skenario

Banyak peserta kehilangan poin karena **lupa siapa dirinya dalam soal**. Perhatikan frasa seperti "Anda sebagai staf baru", "Anda adalah kepala seksi", atau "Anda petugas loket".

- **Staf pelaksana**: jawaban terbaik menyelesaikan apa yang menjadi wewenangnya, lalu berkoordinasi untuk hal di luar wewenang. Staf tidak boleh "mengubah kebijakan" sendiri.
- **Ketua tim atau atasan**: jawaban terbaik mengambil keputusan, membagi tugas, membina anggota, dan bertanggung jawab atas hasil tim.
- **Pegawai baru**: jawaban terbaik menunjukkan kemauan belajar dan bertanya, bukan langsung mengkritik sistem lama.

> Opsi yang "terlalu berkuasa" untuk peran Anda (misalnya staf yang langsung membebaskan biaya retribusi) biasanya bukan nilai 5, walaupun terdengar baik hati.

## Tangga skor umum

| Skor | Pola sikap |
| --- | --- |
| 5 | Proaktif, solutif, tuntas, sesuai aturan, mengutamakan kepentingan umum |
| 4 | Baik dan sesuai aturan, tetapi kurang tuntas atau kurang inisiatif |
| 3 | Netral atau normatif; tidak salah, tetapi menunda atau sekadar prosedural |
| 2 | Pasif, menghindar, melempar tanggung jawab, atau mementingkan kenyamanan diri |
| 1 | Melanggar aturan, emosional, egois, merugikan orang lain atau instansi |

## Empat langkah menjawab satu soal

1. **Kenali peran dan masalah inti.** Siapa Anda, siapa yang dilayani, apa yang dipertaruhkan.
2. **Buang dua opsi terburuk.** Opsi yang melanggar aturan, marah, cuek, atau egois hampir pasti bernilai 1–2.
3. **Bandingkan tiga opsi sisanya.** Mana yang menyelesaikan masalah sampai tuntas dan tetap dalam koridor aturan?
4. **Pilih yang paling lengkap.** Opsi bernilai 5 sering memuat dua unsur sekaligus: *menyelesaikan masalah sekarang* dan *mencegah masalah berulang*.

## Contoh pembahasan

### Contoh 1

*Anda petugas pelayanan. Sistem antrean daring tiba-tiba mati, dan warga mulai menumpuk di ruang tunggu.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Beralih ke nomor antrean manual sementara, mengumumkan kendala kepada warga, dan melapor ke tim TI | 5 | Layanan tetap berjalan, warga mendapat informasi, akar masalah ditangani |
| Melapor ke tim TI lalu meminta warga menunggu sistem pulih | 4 | Benar, tetapi layanan berhenti |
| Mengumumkan bahwa sistem sedang gangguan | 3 | Informatif, tetapi tidak ada solusi |
| Menunggu atasan datang untuk memutuskan | 2 | Pasif, melempar keputusan |
| Menutup layanan hari itu | 1 | Merugikan warga tanpa upaya |

### Contoh 2

*Anda staf baru dan melihat cara pengarsipan di unit Anda kurang efisien.*

Nilai 5 jatuh pada opsi "mempelajari dulu alasan sistem lama, lalu menyampaikan usulan perbaikan secara santun kepada atasan dengan data pendukung". Opsi "langsung mengubah sistem arsip sendiri" terdengar inisiatif, tetapi melampaui peran sehingga bernilai rendah. Opsi "diam saja karena masih baru" bernilai 2.

### Contoh 3

*Rekan kerja meminta Anda menandatangani daftar hadir rapat atas namanya karena ia terlambat.*

Nilai 5: menolak dengan sopan, menjelaskan bahwa itu melanggar aturan, dan menyarankan ia melapor langsung kepada penyelenggara rapat. Nilai 1: menandatangani karena kasihan. Integritas selalu mengalahkan rasa sungkan.

## Manajemen waktu

SKD berlangsung **100 menit untuk 110 soal** (TWK 30, TIU 35, TKP 45). Soal TKP biasanya bisa dijawab lebih cepat daripada TIU.

- Targetkan **30–40 detik per soal TKP**, sekitar 25–30 menit untuk seluruh TKP.
- Banyak peserta mengerjakan TKP lebih dulu untuk "mengamankan" nilai dan membangun ketenangan, lalu masuk ke TWK dan TIU.
- Jangan terlalu lama terjebak pada satu soal TKP yang opsinya mirip. Pilih yang paling masuk akal, beri tanda, dan lanjutkan.
- Sisakan 2–3 menit terakhir untuk memastikan **tidak ada soal TKP yang kosong**.

## Jebakan umum

- **Jawaban terlalu ideal tapi melanggar prosedur**, misalnya menerima berkas tidak lengkap demi menyenangkan warga.
- **Melempar ke atasan** untuk hal yang sebenarnya masih menjadi wewenang Anda.
- **Reaksi emosional**: marah, membalas sindiran, atau memviralkan masalah di media sosial.
- **Mengorbankan tugas utama** demi urusan pribadi atau demi tugas yang kurang penting.
- **Solusi setengah jalan**: hanya meminta maaf tanpa memperbaiki.

## Kata kunci yang sering menandakan skor tinggi dan rendah

| Cenderung tinggi | Cenderung rendah |
| --- | --- |
| segera, membantu, menjelaskan, berkoordinasi, sesuai prosedur | menunggu, membiarkan, terserah, menolak tanpa alasan |
| mencari solusi, mengevaluasi, mempelajari, mengusulkan | marah, menegur di depan umum, menyindir |
| melaporkan ke kanal resmi, mendokumentasikan | memviralkan, menyebarkan, mengabaikan |
| bertanggung jawab, memperbaiki, mencegah terulang | menyalahkan, melempar, menghindar |

> Kata kunci hanya petunjuk awal. Tetap baca seluruh kalimat opsi, karena opsi bernilai rendah kadang dibungkus kata-kata manis.

## Ringkasan

- TKP terdiri dari 45 soal, setiap opsi bernilai 1–5, maksimal 225, ambang batas formasi umum 166.
- Soal kosong bernilai 0, jadi semua soal wajib diisi.
- Kompas utama: nilai dasar BerAKHLAK dan peran Anda dalam skenario.
- Skor 5 = proaktif, solutif, tuntas, sesuai aturan, berpihak pada kepentingan umum.

## Tips

1. Bacalah stem sampai habis, lalu tanyakan: "Apa yang paling bertanggung jawab untuk peran saya?"
2. Coret dulu opsi yang emosional, egois, atau melanggar aturan.
3. Jika dua opsi sama-sama baik, pilih yang **lebih tuntas** dan **lebih cepat menyelesaikan kebutuhan orang yang dilayani**.
4. Jawablah sebagai ASN ideal, bukan sebagai diri Anda yang sedang lelah.
5. Latih diri dengan banyak soal dan selalu baca pembahasan peringkat opsi, bukan hanya kunci nilai 5.
$md$,
   true, 2, 18),
  ('tkp-pelayanan', 'Indikator dan Tangga Skor Pelayanan Publik', 'tkp-pelayanan-indikator', 'Indikator pelayanan prima dan pola skor 5 sampai 1 beserta contoh.',
$md$## Apa yang diukur aspek pelayanan publik?

Soal pelayanan publik menilai apakah Anda menempatkan **kebutuhan masyarakat sebagai pusat pekerjaan**. ASN dibayar oleh rakyat untuk melayani rakyat, sehingga sikap yang dinilai tinggi adalah sikap yang membuat urusan warga selesai dengan cepat, jelas, adil, dan tetap sesuai aturan.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Ramah dan sopan | Menyapa, mendengarkan sampai selesai, tidak menghakimi |
| Responsif | Segera menanggapi keluhan, tidak membiarkan warga menunggu tanpa kepastian |
| Informatif | Menjelaskan syarat, alur, biaya, dan waktu layanan dengan jelas |
| Solutif dan tuntas | Mencari jalan keluar dalam batas aturan, memastikan urusan selesai |
| Adil dan tidak diskriminatif | Melayani sesuai urutan dan standar, tanpa memandang status atau kedekatan |
| Sesuai standar pelayanan | Mematuhi SOP, tidak memungut biaya di luar ketentuan |
| Inovatif | Mengusulkan perbaikan agar layanan berikutnya lebih mudah |

## Mengingat kembali cara penilaian

Setiap soal TKP memiliki lima opsi bernilai 1, 2, 3, 4, dan 5. Tidak ada opsi bernilai nol, sehingga **tidak ada jawaban salah**, hanya jawaban yang kurang tepat. Soal yang dikosongkan bernilai 0. Dari 45 soal, nilai maksimal 225 dan ambang batas formasi umum adalah 166.

## Tangga skor pelayanan publik

| Skor | Pola perilaku khas | Contoh frasa |
| --- | --- | --- |
| 5 | Menyelesaikan kebutuhan warga secara proaktif dan tetap sesuai SOP; menambah nilai (informasi, pendampingan, perbaikan sistem) | "menjelaskan kekurangan berkas dan membantu warga menyiapkannya" |
| 4 | Melayani dengan baik sesuai prosedur, tetapi tanpa langkah ekstra | "melayani sesuai prosedur yang berlaku" |
| 3 | Normatif, menunda, atau sekadar meneruskan informasi | "meminta warga membaca papan informasi" |
| 2 | Menghindar, mengalihkan ke petugas lain tanpa alasan, atau memprioritaskan kenyamanan diri | "meminta warga datang lagi besok" |
| 1 | Menolak tanpa solusi, kasar, diskriminatif, atau melanggar aturan (pungli, menerobos antrean) | "mendahulukan kenalan", "meminta uang pelicin" |

> **Catatan:** Opsi yang melanggar aturan demi "membantu" warga, misalnya menerima berkas palsu atau mengabaikan antrean, tetap bernilai rendah. Kebaikan tidak boleh menabrak keadilan bagi warga lain.

## Contoh pembahasan

### Contoh 1: Warga tidak paham layanan daring

*Anda petugas Dukcapil. Seorang warga paruh baya mengeluh tidak bisa mengunggah dokumen di aplikasi layanan daring.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mendampingi warga mengunggah dokumen di meja bantuan sambil menjelaskan langkahnya agar ia bisa mandiri lain kali | 5 | Masalah selesai dan warga diberdayakan |
| Memproses berkasnya secara manual di loket sesuai ketentuan | 4 | Kebutuhan terpenuhi, tetapi warga tidak belajar |
| Memberikan nomor layanan pengaduan aplikasi | 3 | Informatif, tetapi tidak menyelesaikan |
| Menyarankan ia meminta bantuan anaknya di rumah | 2 | Melempar urusan ke pihak lain |
| Mengatakan bahwa semua sudah dijelaskan di aplikasi | 1 | Tidak empatik dan tidak membantu |

### Contoh 2: Kenalan ingin didahulukan

*Saat antrean panjang di puskesmas, tetangga Anda meminta dipanggil lebih dulu.*

Nilai 5: menjelaskan dengan ramah bahwa semua pasien dilayani sesuai nomor antrean, sambil memastikan jika kondisinya darurat ia akan diarahkan ke penanganan prioritas sesuai prosedur. Nilai 1: memanggilnya lebih dulu diam-diam. Nilai 2: menyuruhnya menunggu tanpa menjelaskan. Perhatikan bahwa jawaban terbaik tetap memberi **solusi sesuai aturan** (jalur darurat), bukan sekadar menolak.

### Contoh 3: Informasi syarat tidak jelas

*Beberapa warga datang berulang kali karena persyaratan surat keterangan di kelurahan sering berubah dan tidak tertulis.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyusun daftar persyaratan tertulis bersama atasan, memasangnya di loket dan media sosial resmi kelurahan | 5 | Memperbaiki sistem, mencegah masalah berulang |
| Menjelaskan persyaratan secara lengkap setiap kali ada warga bertanya | 4 | Melayani baik, tetapi tidak menyentuh akar masalah |
| Meminta warga mencatat sendiri persyaratan saat datang | 3 | Netral |
| Menganggap itu wajar karena aturan memang sering berubah | 2 | Pasif |
| Meminta warga menanyakan langsung ke kecamatan | 1 | Melempar tanggung jawab |

### Contoh 4: Petugas lain tidak ada

*Rekan yang menangani legalisir sedang cuti, dan seorang warga sudah jauh-jauh datang.*

Nilai 5: memeriksa apakah Anda memiliki kewenangan atau pelimpahan untuk melayani; jika ada, melayani; jika tidak, segera menghubungi pejabat pengganti yang ditunjuk agar warga tetap terlayani hari itu. Nilai 4: mencatat kebutuhan warga dan menjanjikan kabar pada hari berikutnya. Nilai 1: meminta warga datang lagi minggu depan.

## Kata kunci yang sering muncul

| Sinyal skor tinggi | Sinyal skor rendah |
| --- | --- |
| mendampingi, menjelaskan, memastikan tuntas | menyuruh, mengalihkan, nanti saja |
| sesuai antrean, sesuai SOP, transparan | mendahulukan kenalan, uang terima kasih |
| mengusulkan perbaikan layanan | menganggap wajar, membiarkan |
| berkoordinasi dengan pejabat pengganti | meminta datang lain hari tanpa kepastian |

## Ringkasan

- Pelayanan publik menilai keberpihakan Anda pada kebutuhan masyarakat dengan tetap mematuhi standar layanan.
- Nilai 5 = proaktif, tuntas, sesuai SOP, dan bila mungkin memperbaiki sistem.
- Nilai 1 = menolak tanpa solusi, diskriminatif, atau melanggar aturan.
- Membantu warga tidak boleh merugikan warga lain atau menabrak prosedur.

## Tips

1. Bayangkan Anda adalah warga dalam soal. Opsi mana yang membuat Anda pulang dengan urusan selesai dan merasa dihargai?
2. Pilih opsi yang **tidak berhenti di penjelasan**, tetapi juga membantu langkah berikutnya.
3. Waspadai opsi "meminta datang lagi" kecuali disertai kepastian dan alasan yang jelas.
4. Perbaikan sistem (papan informasi, daftar syarat, usulan inovasi) sering menjadi pembeda antara nilai 4 dan 5.
$md$,
   false, 3, 15),
  ('tkp-pelayanan', 'Pelayanan Publik: Kasus Sulit dan Jebakan', 'tkp-pelayanan-kasus-sulit', 'Menyeimbangkan empati dan prosedur, menghadapi warga marah, menolak gratifikasi.',
$md$## Ketika melayani tidak semudah teorinya

Soal pelayanan publik tingkat sulit biasanya menghadirkan **dua kepentingan yang bertabrakan**: empati kepada warga versus kepatuhan pada prosedur, kecepatan versus ketelitian, atau kepentingan satu warga versus keadilan bagi warga lain. Semua opsi tampak masuk akal. Di sinilah peserta perlu ketajaman membedakan nilai 5 dan 4.

## Prinsip penentu nilai 5

1. **Aturan tetap dijaga.** Opsi yang melanggar SOP tidak akan menjadi nilai 5 walaupun niatnya baik.
2. **Warga tidak ditinggalkan tanpa solusi.** Jika aturan membatasi, jawaban terbaik mencari jalur alternatif yang sah.
3. **Emosi dikelola.** Petugas tetap tenang menghadapi warga yang marah.
4. **Masalah tidak berulang.** Ada langkah perbaikan atau pelaporan untuk evaluasi.

## Tangga skor pada situasi konflik

| Skor | Pola sikap saat menghadapi warga yang kecewa atau marah |
| --- | --- |
| 5 | Mendengarkan dengan tenang, meminta maaf atas ketidaknyamanan, menjelaskan duduk perkara, memberi solusi konkret dan mencatat keluhan untuk perbaikan |
| 4 | Tenang dan menjelaskan dengan baik, memberi solusi, tetapi tidak menindaklanjuti akar masalah |
| 3 | Meminta maaf dan meminta warga bersabar tanpa solusi jelas |
| 2 | Mengalihkan warga ke petugas lain atau atasan agar diri sendiri tidak repot |
| 1 | Membalas dengan nada tinggi, membela diri, atau meminta satpam mengusir tanpa upaya dialog |

## Contoh pembahasan mendalam

### Contoh 1: Warga marah di depan antrean

*Seorang warga membentak Anda karena e-KTP-nya belum jadi setelah tiga minggu. Warga lain mulai memperhatikan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mempersilakan warga duduk di meja layanan, mendengarkan keluhannya, mengecek status pencetakan di sistem, lalu menjelaskan penyebab dan perkiraan waktu jadi | 5 | Meredam emosi, mencari fakta, memberi kepastian |
| Meminta maaf dan menjelaskan bahwa blanko memang sedang terbatas | 4 | Jujur dan sopan, tetapi belum mengecek kasus spesifik warga |
| Meminta warga bersabar karena banyak yang mengalami hal sama | 3 | Normatif, tidak menyentuh kebutuhannya |
| Memanggil atasan agar warga berbicara langsung dengannya | 2 | Melempar, padahal pengecekan bisa dilakukan sendiri |
| Menegur warga agar tidak berteriak di kantor pemerintah | 1 | Defensif dan memperkeruh suasana |

**Pembeda 5 dan 4:** opsi 5 melakukan pengecekan data warga tersebut, bukan memberi alasan umum.

### Contoh 2: Berkas kurang satu dokumen, warga dari jauh

*Seorang warga dari desa terpencil mengurus akta kelahiran tetapi tidak membawa fotokopi kartu keluarga. Ia butuh dua jam perjalanan untuk pulang.*

- **Skor 5:** memeriksa apakah data kartu keluarga dapat diverifikasi langsung melalui sistem kependudukan sesuai ketentuan; jika bisa, berkas diproses; jika tidak, membantu menunjukkan tempat fotokopi terdekat dan menyimpan berkas lain agar ia tidak antre ulang.
- **Skor 4:** menjelaskan kekurangan dan menyarankan fotokopi di sekitar kantor.
- **Skor 3:** meminta ia melengkapi lalu kembali antre.
- **Skor 2:** meminta ia datang lagi lain hari.
- **Skor 1:** menerima berkas tanpa dokumen lalu mengisi data sendiri tanpa verifikasi.

Perhatikan bahwa opsi 1 tampak "paling membantu" tetapi melanggar prinsip verifikasi. Inilah jebakan **jawaban terlalu ideal**.

### Contoh 3: Tawaran imbalan

*Setelah dilayani, seorang warga memberikan amplop sebagai "ucapan terima kasih".*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menolak dengan sopan, menjelaskan bahwa layanan tidak dipungut biaya dan ASN dilarang menerima gratifikasi | 5 | Integritas plus edukasi |
| Menolak dengan sopan | 4 | Benar, tetapi tanpa edukasi |
| Menyarankan ia memasukkan uang ke kotak amal masjid kantor | 3 | Niat baik, tetapi mengaburkan prinsip |
| Menerima lalu menyerahkannya kepada bendahara | 2 | Tetap menerima dan berisiko |
| Menerima karena warga ikhlas | 1 | Gratifikasi |

### Contoh 4: Sistem lambat, antrean panjang

*Jam layanan hampir habis, masih ada belasan warga mengantre karena jaringan lambat sepanjang hari.*

Nilai 5: berkoordinasi dengan atasan untuk menambah waktu layanan atau mencatat data warga yang belum terlayani agar mendapat prioritas esok pagi, sambil mengumumkan dengan jelas. Nilai 4: tetap melayani melewati jam kerja sampai antrean habis tanpa koordinasi (baik, tetapi tidak sistematis dan bisa melanggar aturan jam layanan). Nilai 2: menutup layanan tepat waktu sesuai jadwal tanpa pengumuman. Nilai 1: menutup loket lebih awal karena lelah.

## Jebakan yang sering menjebak peserta

- **"Demi warga" tetapi melanggar prosedur**: menerima berkas tidak lengkap, membuat surat keterangan tanpa verifikasi, atau menerobos antrean.
- **Melempar ke atasan**: memanggil atasan untuk keluhan yang sebenarnya bisa Anda tangani.
- **Emosional dan defensif**: membela diri, menyalahkan warga, atau mengunggah keluhan warga ke media sosial.
- **Solusi kosmetik**: hanya meminta maaf atau meminta warga bersabar.
- **Berlebihan di luar wewenang**: menjanjikan hasil yang tidak bisa Anda pastikan, misalnya "besok pasti jadi".

## Kata kunci pembeda

| Menuju 5 | Menuju 1–2 |
| --- | --- |
| mengecek data, mendengarkan, memberi kepastian | membela diri, menegur balik |
| jalur alternatif yang sah, verifikasi sistem | menerima tanpa verifikasi, mengisi sendiri |
| mencatat keluhan untuk evaluasi | menganggap selesai setelah minta maaf |
| menolak gratifikasi sambil mengedukasi | menerima karena ikhlas |

## Ringkasan

- Soal sulit menguji keseimbangan empati dan kepatuhan.
- Nilai 5 menjaga aturan **dan** tetap memberi solusi nyata.
- Hadapi warga marah dengan mendengarkan, mengecek fakta, dan memberi kepastian.
- Gratifikasi dan pelanggaran prosedur selalu bernilai rendah, apa pun alasannya.

## Tips

1. Saat dua opsi sama baik, pilih yang **mengecek fakta kasus spesifik** daripada yang memberi penjelasan umum.
2. Cari opsi yang memadukan **solusi sekarang** dan **perbaikan ke depan**.
3. Curigai opsi yang terlalu murah hati: tanyakan, "Apakah ini sah dan adil bagi warga lain?"
4. Kontrol emosi adalah syarat minimal; opsi emosional hampir pasti bernilai 1.
$md$,
   false, 4, 15),
  ('tkp-jejaring', 'Membangun Jejaring Kerja yang Efektif', 'tkp-jejaring-konsep', 'Indikator jejaring kerja, tangga skor, dan contoh koordinasi lintas instansi.',
$md$## Apa yang diukur aspek jejaring kerja?

Jejaring kerja menilai kemampuan Anda **membangun, memelihara, dan memanfaatkan hubungan kerja** untuk mencapai tujuan organisasi. Pekerjaan pemerintahan jarang bisa diselesaikan sendirian: program puskesmas butuh dukungan kader, kelurahan, dan sekolah; program dinas butuh data dari instansi lain. ASN yang pandai berjejaring membuat pekerjaan lebih cepat dan hasilnya lebih baik.

Aspek ini terkait erat dengan nilai **Kolaboratif** dan **Harmonis** dalam BerAKHLAK.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Inisiatif membangun relasi | Memperkenalkan diri, menyapa pihak baru, hadir dalam forum koordinasi |
| Komunikasi efektif | Menyampaikan informasi dengan jelas, mendengarkan, memberi umpan balik |
| Kerja sama tim | Berbagi peran, mendukung anggota yang kesulitan, mengutamakan tujuan bersama |
| Memelihara hubungan | Menjaga komunikasi setelah proyek selesai, menepati janji |
| Memanfaatkan jejaring secara positif | Mencari narasumber, berbagi data sesuai aturan, bukan untuk kepentingan pribadi |
| Mengelola perbedaan | Menyelesaikan konflik antaranggota melalui dialog |

## Pengingat penilaian

Semua opsi bernilai 1 sampai 5, masing-masing dipakai sekali. Tidak ada jawaban bernilai nol, dan soal kosong bernilai 0. Nilai maksimal TKP 225 dengan ambang batas formasi umum 166.

## Tangga skor jejaring kerja

| Skor | Pola sikap |
| --- | --- |
| 5 | Proaktif membangun relasi dan kolaborasi demi tujuan bersama, komunikatif, tetap dalam koridor aturan |
| 4 | Mau bekerja sama dan berkomunikasi, tetapi menunggu momen atau kurang inisiatif |
| 3 | Bekerja sama sebatas diminta; relasi formal saja |
| 2 | Cenderung bekerja sendiri, menghindari interaksi, atau hanya dengan orang yang disukai |
| 1 | Merusak relasi: menolak bekerja sama, egois, memanfaatkan jejaring untuk kepentingan pribadi atau melanggar aturan |

## Contoh pembahasan

### Contoh 1: Data dari instansi lain terlambat

*Anda menyusun laporan program stunting dan membutuhkan data dari dinas lain yang belum juga dikirim padahal tenggat dua hari lagi.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menghubungi langsung penanggung jawab data, menjelaskan kebutuhan dan tenggat, serta menawarkan bantuan format agar pengiriman lebih mudah | 5 | Proaktif, komunikatif, memudahkan pihak lain |
| Mengirim surat pengingat resmi melalui atasan | 4 | Benar secara prosedur, tetapi lebih lambat |
| Menunggu sampai data dikirim | 3 | Pasif tetapi tidak merusak |
| Menyusun laporan tanpa data dari dinas tersebut | 2 | Mengorbankan kualitas |
| Mengeluhkan dinas tersebut dalam rapat pimpinan | 1 | Merusak hubungan antarinstansi |

### Contoh 2: Rekan dari unit lain sulit diajak bekerja sama

*Dalam tim lintas bidang, seorang anggota dari unit lain jarang merespons pesan.*

Nilai 5: mengajak bertemu secara langsung, menanyakan kendalanya, dan menyepakati cara komunikasi serta pembagian tugas yang realistis. Nilai 4: melaporkan kendala kepada ketua tim agar ada pengaturan ulang. Nilai 3: tetap mengirim pesan berulang. Nilai 2: mengambil alih tugasnya tanpa bicara. Nilai 1: menyindirnya di grup percakapan tim.

### Contoh 3: Bertemu pejabat instansi mitra di acara

*Pada sebuah seminar, Anda duduk bersebelahan dengan kepala bidang dari instansi yang sering bekerja sama dengan kantor Anda.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memperkenalkan diri, berbincang tentang peluang sinergi program, dan bertukar kontak resmi | 5 | Membangun jejaring untuk kepentingan organisasi |
| Memperkenalkan diri dan berbincang ringan | 4 | Relasi terbangun, tetapi belum diarahkan ke kerja |
| Menyapa sekadarnya | 3 | Sopan, minim inisiatif |
| Diam karena merasa tidak selevel | 2 | Menghindar |
| Meminta bantuan agar saudara Anda diterima bekerja di instansinya | 1 | Menyalahgunakan relasi, nepotisme |

### Contoh 4: Diminta berbagi bahan kerja

*Rekan dari kantor kecamatan lain meminta templat laporan yang Anda buat.*

Nilai 5: membagikan templat beserta penjelasan cara pengisian, dan menawarkan diri jika ada pertanyaan, selama dokumen tersebut bukan dokumen rahasia. Nilai 1: menolak karena khawatir ia tampak lebih unggul. Berbagi pengetahuan adalah bagian dari kolaborasi.

## Jebakan umum

- **Jejaring untuk kepentingan pribadi**: meminta "titipan", memanfaatkan kenalan untuk melompati prosedur.
- **Kerja sendiri demi kecepatan**: terdengar efisien, tetapi menunjukkan kurangnya kolaborasi.
- **Menunggu dikenalkan**: pasif dan kehilangan peluang.
- **Melempar konflik ke atasan** sebelum mencoba dialog langsung.
- **Membicarakan keburukan rekan** di belakang atau di forum umum.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| memperkenalkan diri, mengajak berdiskusi, bersinergi | menunggu, menghindar, bekerja sendiri |
| menyepakati pembagian tugas, berbagi informasi | menyimpan informasi, merasa tersaingi |
| berkomunikasi langsung, menawarkan bantuan | menyindir, mengeluhkan di depan umum |
| menjaga komunikasi pascaproyek | memanfaatkan relasi untuk titipan |

## Ringkasan

- Jejaring kerja menilai inisiatif membangun relasi dan kolaborasi demi tujuan organisasi.
- Nilai 5 = proaktif, komunikatif, memudahkan pihak lain, sesuai aturan.
- Nilai 1 = merusak relasi atau memanfaatkannya untuk kepentingan pribadi.

## Tips

1. Ketika ada pihak baru, opsi "memperkenalkan diri dan mengajak berdiskusi" hampir selalu bernilai tinggi.
2. Untuk hambatan koordinasi, pilih **komunikasi langsung yang solutif** sebelum eskalasi ke atasan.
3. Bedakan relasi profesional dan relasi untuk "titipan"; yang kedua selalu rendah.
4. Berbagi pengetahuan dan bahan kerja (yang bukan rahasia) menunjukkan jiwa kolaboratif.
$md$,
   true, 2, 14),
  ('tkp-jejaring', 'Kolaborasi Tim dan Mengelola Konflik', 'tkp-jejaring-tim', 'Menyelesaikan konflik tim, membagi peran, dan bermitra dengan masyarakat.',
$md$## Fokus pelajaran ini

Pelajaran sebelumnya membahas cara membangun relasi. Kali ini kita masuk ke situasi yang lebih sulit: **konflik dalam tim, pembagian peran, dan memimpin kolaborasi**. Soal TKP jejaring kerja tingkat sulit sering menempatkan Anda sebagai anggota atau ketua tim yang harus menyeimbangkan hubungan baik dengan target kerja.

## Tiga kemampuan kunci

### 1. Mengelola konflik secara dewasa

Konflik dalam tim wajar terjadi. Yang dinilai adalah **cara Anda merespons**. Urutan sikap terbaik:

1. Memahami duduk perkara dari semua pihak.
2. Mengajak dialog langsung secara tertutup dan santun.
3. Mencari kesepakatan yang berorientasi pada tujuan tim.
4. Melibatkan atasan atau ketua tim hanya bila dialog tidak berhasil atau menyangkut pelanggaran.

### 2. Membagi peran secara adil

Ketua tim yang baik membagi tugas berdasarkan kompetensi dan beban kerja, membuka ruang anggota menyampaikan pendapat, serta memantau kemajuan. Mengerjakan semuanya sendiri bukan tanda tanggung jawab, melainkan tanda gagal berkolaborasi.

### 3. Menghargai kontribusi orang lain

Menyebut kontribusi anggota tim, tidak mengklaim hasil kerja bersama sebagai milik sendiri, dan memberi apresiasi menjaga jejaring tetap sehat.

## Tangga skor dalam situasi tim

| Skor | Pola sikap |
| --- | --- |
| 5 | Mengajak dialog, mencari solusi bersama, membagi peran adil, mengutamakan tujuan tim, menghargai kontribusi |
| 4 | Menyelesaikan masalah lewat jalur formal (melapor ketua tim) dengan niat baik |
| 3 | Mengalah demi suasana, tetapi masalah tidak terselesaikan |
| 2 | Menghindar, mengambil alih diam-diam, atau hanya bekerja dengan rekan yang cocok |
| 1 | Konfrontatif, mengklaim hasil kerja orang lain, menjelekkan rekan, atau mengundurkan diri dari tim |

## Contoh pembahasan

### Contoh 1: Dua anggota tim berselisih

*Anda ketua tim penyusun aplikasi pengaduan warga. Dua anggota berdebat keras soal desain formulir hingga pekerjaan terhenti.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengajak keduanya berdiskusi, meminta masing-masing memaparkan alasan, lalu memilih desain berdasarkan kebutuhan pengguna dan uji coba singkat | 5 | Objektif, dialogis, fokus pada tujuan |
| Memutuskan sendiri desain yang menurut Anda paling baik | 4 | Tegas dan pekerjaan lanjut, tetapi kurang melibatkan |
| Meminta keduanya berdamai tanpa memutuskan apa pun | 3 | Meredakan sementara |
| Melaporkan keduanya kepada kepala dinas | 2 | Melempar wewenang ketua tim |
| Mengganti kedua anggota tersebut | 1 | Merusak hubungan dan mematikan kontribusi |

### Contoh 2: Rekan mengklaim ide Anda

*Dalam rapat, rekan satu tim mempresentasikan usulan inovasi yang sebenarnya Anda gagas, tanpa menyebut nama Anda.*

- **5:** Setelah rapat, berbicara empat mata dengannya secara santun, mengklarifikasi, dan menyepakati agar ke depan kontribusi dicatat bersama; tetap mendukung inovasi itu berjalan.
- **4:** Menambahkan penjelasan teknis dalam rapat sehingga peran Anda terlihat, tanpa menyerang.
- **3:** Membiarkan karena yang penting inovasinya diterima.
- **2:** Menceritakan kejadian itu kepada rekan lain.
- **1:** Memprotes keras di depan peserta rapat.

Nilai 3 terdengar mulia, tetapi tidak menyelesaikan masalah yang bisa berulang; karena itu berada di bawah opsi yang mengklarifikasi dengan santun.

### Contoh 3: Anggota tim sering terlambat menyetor bagian

*Anda anggota tim, dan satu rekan selalu terlambat sehingga laporan tim tertunda.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menanyakan kendalanya secara pribadi dan menawarkan bantuan atau pembagian ulang yang disepakati tim | 5 | Empatik, solutif |
| Menyampaikan kendala kepada ketua tim agar diatur ulang | 4 | Tepat jalur, kurang inisiatif |
| Mengingatkannya setiap mendekati tenggat | 3 | Membantu sebagian |
| Mengerjakan bagiannya tanpa memberi tahu | 2 | Menutupi masalah, beban tidak adil |
| Mengeluhkan dia di grup tim | 1 | Mempermalukan rekan |

### Contoh 4: Diajak kerja sama oleh organisasi masyarakat

*Sebuah komunitas pemuda menawarkan diri membantu sosialisasi program vaksinasi di kelurahan Anda.*

Nilai 5: menyambut baik, berkoordinasi dengan atasan dan puskesmas untuk menyusun peran yang jelas sesuai ketentuan, serta membekali mereka dengan materi resmi. Nilai 1: menolak karena khawatir merepotkan. Kolaborasi dengan masyarakat adalah bagian penting jejaring kerja ASN.

## Jebakan umum

- **Ketua tim yang mengerjakan semuanya sendiri** demi hasil sempurna.
- **Mengalah total** sehingga masalah dibiarkan.
- **Eskalasi terlalu dini** ke pimpinan tertinggi.
- **Mempermalukan rekan** di forum umum.
- **Menolak kolaborasi eksternal** tanpa menimbang manfaat bagi publik.

## Kata kunci pembeda

| Menuju 5 | Menuju 1–2 |
| --- | --- |
| berdiskusi, mendengarkan semua pihak, menyepakati | memutuskan sepihak, mengganti anggota |
| empat mata, santun, klarifikasi | protes di depan umum, menyindir |
| membagi ulang secara adil, menawarkan bantuan | mengambil alih diam-diam |
| menyambut kolaborasi dengan koordinasi | menolak karena merepotkan |

## Ringkasan

- Konflik tim diselesaikan dengan dialog langsung dan berorientasi pada tujuan bersama.
- Ketua tim yang baik membagi peran, melibatkan anggota, dan menghargai kontribusi.
- Kolaborasi dengan masyarakat atau instansi lain harus disambut dan dikoordinasikan.

## Tips

1. Saat konflik, cari opsi yang **mempertemukan para pihak** dan **memutuskan berdasarkan data atau tujuan**.
2. Perhatikan peran Anda: ketua tim wajib memutuskan, anggota tim sebaiknya berkoordinasi.
3. Opsi "membiarkan demi suasana damai" biasanya hanya bernilai 3.
4. Hindari opsi yang membuat seseorang malu di depan umum.
$md$,
   false, 3, 14),
  ('tkp-sosbud', 'Adaptasi dan Menghargai Keberagaman', 'tkp-sosbud-konsep', 'Indikator sosial budaya, tangga skor, dan contoh adaptasi di daerah baru.',
$md$## Apa yang diukur aspek sosial budaya?

Indonesia memiliki ratusan suku bangsa, beragam agama, bahasa daerah, dan adat istiadat. ASN dapat ditempatkan di mana saja dan melayani siapa saja. Aspek sosial budaya menilai kemampuan Anda **beradaptasi, menghargai keberagaman, dan bersikap empatik** dalam masyarakat majemuk, tanpa kehilangan profesionalisme.

Aspek ini berkaitan dengan nilai **Harmonis** dan **Adaptif** dalam BerAKHLAK.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Adaptasi lingkungan baru | Mempelajari bahasa dan kebiasaan setempat, berbaur dengan warga |
| Menghargai perbedaan | Tidak merendahkan suku, agama, atau budaya lain; tidak memaksakan kebiasaan sendiri |
| Toleransi | Menghormati ibadah dan hari besar pemeluk agama lain |
| Empati dan kepedulian sosial | Peka terhadap kesulitan orang lain, ikut membantu |
| Tidak diskriminatif | Memperlakukan semua orang setara dalam pekerjaan dan pelayanan |
| Menjadi perekat | Menengahi kesalahpahaman antarkelompok dengan bijak |

## Pengingat penilaian

Kelima opsi bernilai 1–5 dan masing-masing angka dipakai sekali. Tidak ada opsi bernilai nol; soal kosong bernilai 0. Nilai maksimal TKP 225, ambang batas formasi umum 166.

## Tangga skor sosial budaya

| Skor | Pola sikap |
| --- | --- |
| 5 | Aktif mempelajari dan menghormati budaya setempat, berbaur, tetap menjalankan tugas sesuai aturan, menjadi perekat |
| 4 | Menghormati dan menyesuaikan diri, tetapi kurang aktif berbaur |
| 3 | Bersikap netral: tidak menolak, tidak pula berupaya memahami |
| 2 | Menjaga jarak, hanya bergaul dengan kelompok sendiri, atau mengikuti adat hanya bila diawasi |
| 1 | Merendahkan, memaksakan kebiasaan sendiri, diskriminatif, atau meminta pindah karena tidak cocok |

## Contoh pembahasan

### Contoh 1: Bahasa daerah dalam pelayanan

*Anda bertugas di puskesmas di daerah yang sebagian besar warganya lansia dan lebih nyaman berbahasa daerah yang belum Anda kuasai.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Belajar ungkapan dasar bahasa setempat dan meminta bantuan rekan atau kader sebagai penerjemah saat dibutuhkan | 5 | Adaptif sekaligus menjamin pelayanan |
| Meminta bantuan rekan yang fasih setiap kali ada pasien lansia | 4 | Solusi berjalan, tetapi tidak berupaya belajar |
| Menggunakan bahasa Indonesia secara perlahan | 3 | Wajar, tetapi komunikasi mungkin tidak efektif |
| Meminta pasien membawa keluarga yang bisa berbahasa Indonesia | 2 | Membebani pasien |
| Mengusulkan pindah ke puskesmas yang warganya berbahasa sama dengan Anda | 1 | Menolak beradaptasi |

### Contoh 2: Acara adat bersamaan dengan jadwal kerja

*Warga desa tempat Anda bertugas mengadakan upacara adat dan mengundang seluruh pegawai kantor desa, padahal ada pekerjaan administrasi yang harus diselesaikan.*

Nilai 5: menghadiri acara sebagai bentuk penghormatan setelah mengatur waktu agar pekerjaan tetap selesai, misalnya menyelesaikan administrasi lebih awal atau berbagi giliran dengan rekan. Nilai 4: hadir sebentar lalu kembali bekerja. Nilai 3: menitipkan salam melalui rekan. Nilai 2: tidak hadir tanpa kabar. Nilai 1: menganggap acara adat membuang waktu.

### Contoh 3: Candaan bernada SARA

*Di ruang istirahat, beberapa rekan bercanda dengan meniru logat suku tertentu secara mengejek. Salah satu rekan dari suku tersebut tampak tidak nyaman.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengingatkan dengan santun bahwa candaan itu bisa menyakiti, lalu mengalihkan pembicaraan dan menyapa rekan yang tersinggung | 5 | Menjaga harmoni, empatik, tidak mempermalukan |
| Menegur mereka setelah suasana sepi | 4 | Tepat, tetapi rekan yang tersinggung belum disapa |
| Diam dan tidak ikut tertawa | 3 | Tidak ikut salah, tetapi pasif |
| Meninggalkan ruangan | 2 | Menghindar |
| Ikut tertawa agar tidak dianggap kaku | 1 | Ikut melanggengkan diskriminasi |

### Contoh 4: Warga dengan kebiasaan berbeda

*Seorang warga pendatang di kelurahan Anda sering dikucilkan warga lain karena kebiasaan berpakaiannya berbeda.*

Nilai 5: memastikan ia mendapat pelayanan setara, dan bila ada kesempatan (misalnya kegiatan RT) mendorong pengenalan dan dialog antarwarga. Nilai 1: menyarankan ia mengikuti cara berpakaian mayoritas agar diterima.

## Jebakan umum

- **Ikut-ikutan demi diterima**: tertawa pada candaan SARA, ikut mengucilkan.
- **Memaksakan kebiasaan sendiri** dengan dalih "lebih modern" atau "lebih benar".
- **Pindah atau menghindar** ketika tidak nyaman.
- **Mengikuti adat secara berlebihan sampai melanggar aturan kerja**, misalnya meninggalkan pelayanan seharian tanpa izin.
- **Menghakimi** budaya lain dari sudut pandang sendiri.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| mempelajari, menghormati, berbaur, menyesuaikan diri | meminta pindah, menghindari, menjaga jarak |
| mengingatkan dengan santun, menengahi | ikut tertawa, membiarkan, menyindir |
| menghadiri dengan mengatur waktu kerja | menganggap tidak penting |
| melayani setara tanpa memandang latar belakang | mendahulukan yang sesuku atau seagama |

## Ringkasan

- Sosial budaya menilai adaptasi, toleransi, empati, dan sikap tidak diskriminatif.
- Nilai 5 = aktif memahami budaya setempat sambil tetap profesional.
- Nilai 1 = merendahkan, diskriminatif, atau menolak beradaptasi.

## Tips

1. Ingat semboyan Bhinneka Tunggal Ika: perbedaan dihormati, persatuan dijaga.
2. Pilih opsi yang **aktif belajar** daripada sekadar "menerima".
3. Penghormatan pada adat tidak boleh mengorbankan tugas; cari opsi yang menyeimbangkan keduanya.
4. Pada candaan atau perlakuan diskriminatif, opsi terbaik mengingatkan dengan santun dan memulihkan perasaan korban.
$md$,
   true, 2, 14),
  ('tkp-sosbud', 'Empati, Kepedulian Sosial, dan Toleransi', 'tkp-sosbud-empati', 'Melayani kelompok rentan, empati yang adil, dan toleransi di tempat kerja.',
$md$## Fokus pelajaran ini

Selain adaptasi budaya, aspek sosial budaya juga menguji **kepedulian sosial dan empati**: bagaimana Anda bersikap terhadap kelompok rentan (lansia, penyandang disabilitas, ibu hamil, warga miskin), terhadap korban bencana, serta terhadap perbedaan pandangan dan keyakinan di lingkungan kerja. Soal-soal ini sering mengandung opsi yang semuanya baik, sehingga Anda perlu jeli memilih yang paling tepat sasaran.

## Konsep kunci

### Empati yang bertindak

Empati dalam TKP bukan sekadar merasa kasihan. Nilai tinggi diberikan pada **tindakan nyata** yang membantu, dilakukan dengan cara yang **menjaga martabat** orang yang dibantu, dan tetap **sesuai aturan**.

### Kesetaraan dan afirmasi

Melayani setara bukan berarti memperlakukan semua orang sama persis. Kelompok rentan berhak atas layanan prioritas atau pendampingan, misalnya kursi roda, loket khusus, atau jemput bola. Opsi yang menyediakan akomodasi wajar bagi kelompok rentan bernilai tinggi.

### Toleransi beragama di tempat kerja

Menghormati jadwal ibadah rekan, tidak memaksakan keyakinan, saling mengucapkan selamat atau membantu kelancaran perayaan sesuai keyakinan masing-masing, dan menjaga suasana kantor yang inklusif.

## Tangga skor kepedulian sosial

| Skor | Pola sikap |
| --- | --- |
| 5 | Bertindak nyata, tepat sasaran, menjaga martabat, mengajak pihak lain ikut peduli, sesuai aturan |
| 4 | Membantu secara pribadi dengan tulus, tetapi terbatas |
| 3 | Bersimpati atau menyarankan, tanpa tindakan langsung |
| 2 | Tidak peduli dengan alasan bukan urusannya |
| 1 | Merendahkan, memanfaatkan kesulitan orang lain, atau bertindak diskriminatif |

## Contoh pembahasan

### Contoh 1: Penyandang disabilitas di kantor layanan

*Seorang pengguna kursi roda datang ke kantor kecamatan yang loketnya berada di lantai dua tanpa lift.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Turun melayani di lantai satu dengan membawa perlengkapan yang dibutuhkan, lalu mengusulkan loket layanan prioritas permanen di lantai bawah | 5 | Melayani dengan bermartabat dan memperbaiki fasilitas |
| Turun melayani di lantai satu | 4 | Kebutuhan terpenuhi, tanpa perbaikan sistem |
| Meminta petugas keamanan membantu mengangkat kursi rodanya ke atas | 3 | Niat baik, tetapi berisiko dan kurang bermartabat |
| Meminta ia mengurus melalui keluarga | 2 | Membebani pihak lain |
| Menjelaskan bahwa loket hanya ada di lantai dua | 1 | Diskriminatif secara tidak langsung |

### Contoh 2: Rekan berduka dari agama berbeda

*Orang tua rekan kerja Anda yang berbeda agama meninggal dunia.*

Nilai 5: melayat dan menyampaikan duka cita sesuai kepatutan, ikut membantu yang diperlukan, dan berkoordinasi agar pekerjaannya di kantor tertangani selama ia berduka. Nilai 4: melayat dan menyampaikan belasungkawa. Nilai 3: mengirim pesan duka. Nilai 2: tidak melakukan apa-apa karena berbeda agama. Nilai 1: menolak menggantikan tugasnya karena bukan kewajiban Anda.

### Contoh 3: Bantuan bencana dan data penerima

*Desa tempat Anda bertugas terkena banjir. Ada warga yang meminta Anda memasukkan kerabatnya yang tidak terdampak ke daftar penerima bantuan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menolak dengan santun, menjelaskan kriteria penerima, dan memastikan pendataan dilakukan berdasarkan verifikasi lapangan | 5 | Adil, peduli pada korban sebenarnya |
| Menolak dan meminta ia memahami aturan | 4 | Benar, kurang edukatif |
| Meminta ia mengajukan ke ketua RT | 3 | Melempar sebagian |
| Mencatat namanya sebagai cadangan jika bantuan tersisa | 2 | Membuka celah ketidakadilan |
| Memasukkan nama kerabatnya agar tidak terjadi konflik | 1 | Melanggar aturan dan merugikan korban |

Soal ini menunjukkan bahwa **empati tanpa keadilan** justru bernilai rendah.

### Contoh 4: Perbedaan pendapat soal perayaan kantor

*Panitia acara akhir tahun kantor berencana mengadakan kegiatan yang membuat sebagian pegawai dengan keyakinan tertentu tidak nyaman ikut.*

Nilai 5: mengusulkan kepada panitia agar rangkaian acara dirancang inklusif sehingga semua pegawai dapat berpartisipasi, dengan berdiskusi terbuka. Nilai 3: tidak ikut serta tanpa memberi masukan. Nilai 1: memprotes di media sosial.

## Jebakan umum

- **Empati yang melanggar aturan**: memasukkan nama ke daftar bantuan, memberikan dispensasi tanpa dasar.
- **Bantuan yang merendahkan**: memotret penerima bantuan untuk diunggah tanpa izin, membantu sambil menceramahi.
- **"Bukan urusan saya"**: menolak terlibat karena di luar uraian tugas.
- **Mengukur orang lain dengan keyakinan sendiri**.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| mendampingi, menyediakan akses, layanan prioritas | menyuruh, menolak karena aturan fasilitas |
| sesuai kriteria, verifikasi, adil | memasukkan kerabat, cadangan tidak resmi |
| menghormati, melayat, inklusif | menjaga jarak karena beda agama |
| mengajak pihak lain peduli | mengunggah demi pencitraan |

## Ringkasan

- Empati bernilai tinggi bila diwujudkan dalam tindakan nyata yang bermartabat dan adil.
- Kelompok rentan berhak atas akomodasi wajar; opsi yang menyediakannya bernilai tinggi.
- Toleransi beragama di kantor diwujudkan dengan saling menghormati dan inklusif.

## Tips

1. Tanyakan: "Apakah bantuan ini tepat sasaran dan menjaga martabat orang tersebut?"
2. Pilih opsi yang menolong sekarang **dan** memperbaiki fasilitas atau sistem ke depan.
3. Jangan tergoda opsi yang terlihat dermawan tetapi tidak adil bagi pihak lain.
4. Ingat bahwa sikap peduli tidak berhenti di batas uraian tugas.
$md$,
   false, 3, 14),
  ('tkp-tik-dasar', 'Adaptasi Teknologi dan E-Government', 'tkp-tik-adaptasi', 'Sikap terhadap aplikasi baru, SPBE, dan kendala sistem dalam layanan.',
$md$## Apa yang diukur aspek TIK?

Pemerintah terus mendorong **Sistem Pemerintahan Berbasis Elektronik (SPBE)** atau e-government: persuratan elektronik, presensi daring, layanan administrasi kependudukan secara online, aplikasi pengaduan, hingga tanda tangan elektronik. Aspek TIK dalam TKP menilai **kemauan dan kemampuan Anda memanfaatkan teknologi** untuk meningkatkan kualitas kerja dan pelayanan, bukan seberapa mahir Anda memprogram.

Aspek ini terkait nilai **Adaptif** dan **Kompeten** dalam BerAKHLAK.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Antusias belajar teknologi baru | Mempelajari aplikasi baru tanpa menunggu dipaksa |
| Memanfaatkan TIK untuk efisiensi | Mengusulkan digitalisasi arsip, memakai formulir daring |
| Berbagi pengetahuan | Membantu rekan yang kesulitan menggunakan aplikasi |
| Menjangkau masyarakat lewat teknologi | Memakai kanal resmi digital untuk informasi layanan |
| Memahami e-government | Mendukung penerapan layanan daring dan integrasi data |
| Mengatasi kendala teknis secara solutif | Melapor ke tim TI, menyiapkan alternatif agar layanan tetap jalan |

## Pengingat penilaian

Setiap opsi bernilai 1–5, masing-masing sekali. Tidak ada jawaban salah bernilai nol, tetapi soal kosong bernilai 0. Nilai maksimal TKP 225 dengan ambang batas formasi umum 166.

## Tangga skor adaptasi teknologi

| Skor | Pola sikap |
| --- | --- |
| 5 | Antusias mempelajari, menerapkan untuk perbaikan layanan, membantu orang lain beradaptasi |
| 4 | Mau belajar dan menggunakan dengan baik untuk diri sendiri |
| 3 | Menggunakan bila sudah ada pelatihan atau diwajibkan |
| 2 | Enggan, tetap memakai cara lama, mengandalkan orang lain |
| 1 | Menolak teknologi, menyalahgunakan, atau menghambat penerapannya |

## Contoh pembahasan

### Contoh 1: Aplikasi presensi baru

*Kantor Anda menerapkan aplikasi presensi berbasis lokasi. Beberapa rekan senior mengeluh sulit menggunakannya.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mempelajari aplikasi lebih dulu, lalu menawarkan diri membantu rekan senior dan menyusun panduan singkat bergambar | 5 | Adaptif, kolaboratif, menyebarkan manfaat |
| Mempelajari dan menggunakannya dengan disiplin | 4 | Baik untuk diri sendiri |
| Menunggu sosialisasi dari bagian kepegawaian | 3 | Normatif dan pasif |
| Meminta rekan muda mengisikan presensi Anda | 2 | Bergantung pada orang lain dan berisiko |
| Mengusulkan kembali ke presensi manual | 1 | Menolak perubahan |

### Contoh 2: Warga belum mengenal layanan online

*Dinas Anda meluncurkan layanan izin usaha mikro secara daring, tetapi banyak pedagang pasar yang belum mengetahuinya.*

Nilai 5: mengusulkan dan ikut melaksanakan sosialisasi langsung di pasar sekaligus membuka pendampingan pendaftaran di lokasi. Nilai 4: menyebarkan informasi melalui media sosial resmi dinas. Nilai 3: memasang pengumuman di kantor dinas. Nilai 2: menunggu warga datang dan bertanya. Nilai 1: menganggap itu urusan bagian humas.

### Contoh 3: Kendala jaringan saat layanan

*Aplikasi layanan puskesmas tidak bisa diakses karena gangguan server, padahal pasien sudah banyak.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mencatat data pasien secara manual sesuai prosedur darurat, melaporkan gangguan ke pengelola sistem, dan memasukkan data ke aplikasi setelah pulih | 5 | Layanan tetap berjalan dan data tetap lengkap |
| Melaporkan gangguan dan meminta pasien menunggu | 4 | Tepat jalur, layanan terhenti |
| Mencoba memuat ulang aplikasi berkali-kali | 3 | Usaha minim |
| Menghentikan pendaftaran sementara tanpa kepastian | 2 | Merugikan pasien |
| Mengeluhkan sistem kepada pasien | 1 | Tidak profesional |

### Contoh 4: Usulan digitalisasi arsip

*Arsip surat di kantor kelurahan masih berupa tumpukan kertas sehingga sulit dicari.*

Nilai 5: mengusulkan kepada atasan digitalisasi bertahap memakai aplikasi resmi yang tersedia, lengkap dengan rencana kerja sederhana, dan bersedia terlibat. Nilai 4: merapikan arsip fisik dengan sistem penomoran yang jelas. Nilai 1: memindai arsip lalu menyimpannya di akun penyimpanan awan pribadi tanpa izin, karena berisiko kebocoran data.

## Jebakan umum

- **"Menunggu pelatihan resmi"**: aman, tetapi pasif; biasanya hanya 3.
- **Menggunakan aplikasi pribadi atau tidak resmi** untuk data kantor demi kepraktisan.
- **Bergantung pada rekan** untuk urusan teknis yang seharusnya bisa dipelajari.
- **Menyalahkan teknologi** di depan warga.
- **Menghentikan layanan** ketika sistem bermasalah tanpa menyiapkan alternatif.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| mempelajari, mencoba, menerapkan, membantu rekan | menunggu pelatihan, enggan, cara lama |
| mengusulkan digitalisasi, panduan, sosialisasi | menolak, kembali ke manual |
| aplikasi resmi, melapor ke pengelola sistem | aplikasi pribadi, akun pribadi |
| prosedur darurat, layanan tetap berjalan | menghentikan layanan |

## Ringkasan

- Aspek TIK menilai kemauan belajar dan memanfaatkan teknologi untuk pelayanan yang lebih baik.
- Nilai 5 = antusias, menerapkan, membantu orang lain, memakai kanal resmi.
- Nilai 1 = menolak teknologi atau menggunakannya secara tidak aman.

## Tips

1. Ketika ada teknologi baru, pilih opsi yang **belajar dulu lalu berbagi**.
2. Saat sistem bermasalah, cari opsi yang menjaga **layanan tetap berjalan** sambil melapor.
3. Pastikan solusi digital menggunakan **aplikasi dan kanal resmi**.
4. Ingat bahwa teknologi adalah alat untuk melayani; opsi yang menjangkau warga yang belum melek digital bernilai tinggi.
$md$,
   true, 2, 14),
  ('tkp-tik-dasar', 'Keamanan Data, Phishing, dan Etika Digital', 'tkp-tik-keamanan-etika', 'Melindungi data warga, menghadapi phishing, dan etika bermedia sosial ASN.',
$md$## Fokus pelajaran ini

Semakin banyak layanan pemerintah yang digital, semakin besar pula tanggung jawab ASN menjaga **keamanan data** dan **etika digital**. Soal TKP aspek TIK sering menguji: bagaimana menanggapi tautan mencurigakan, bagaimana memperlakukan data pribadi warga, bagaimana bersikap di media sosial, dan bagaimana menjaga kata sandi serta perangkat kantor.

## Konsep kunci

### Data pribadi warga adalah amanah

NIK, nomor KK, alamat, data kesehatan, dan data keuangan warga dilindungi undang-undang perlindungan data pribadi. ASN hanya boleh mengakses dan menggunakan data sesuai kewenangan dan keperluan tugas. Membagikan data warga kepada pihak tidak berwenang, walaupun teman sendiri, adalah pelanggaran serius.

### Waspada phishing dan rekayasa sosial

Phishing adalah upaya menipu agar korban menyerahkan kata sandi, kode OTP, atau data penting melalui pesan, surel, atau situs palsu. Ciri umum:

- Pengirim mengaku dari instansi atau atasan, tetapi alamat atau nomornya tidak resmi.
- Bernada mendesak: "akun Anda akan diblokir hari ini".
- Meminta kode OTP, kata sandi, atau mengunduh file berekstensi aneh.
- Tautan dengan alamat yang mirip tetapi berbeda dari situs resmi.

Sikap terbaik: **tidak mengklik**, **memverifikasi melalui kanal resmi**, **melaporkan ke pengelola TI**, dan **memperingatkan rekan**.

### Etika digital ASN

ASN tetap terikat kode etik saat bermedia sosial: tidak menyebarkan hoaks, tidak membocorkan dokumen internal, tidak menghina, tidak menunjukkan keberpihakan politik praktis, dan menjaga nama baik instansi.

## Tangga skor keamanan dan etika digital

| Skor | Pola sikap |
| --- | --- |
| 5 | Waspada, memverifikasi lewat kanal resmi, melindungi data, melapor, dan mengedukasi rekan |
| 4 | Waspada dan melindungi diri sendiri dengan benar |
| 3 | Mengabaikan ancaman tanpa melapor, atau berhati-hati sebagian |
| 2 | Ceroboh, misalnya meminjamkan akun atau menyimpan kata sandi sembarangan |
| 1 | Membocorkan data, menyebarkan konten tidak etis, atau menyerahkan OTP dan kata sandi |

## Contoh pembahasan

### Contoh 1: Surel mengatasnamakan BKN

*Anda menerima surel yang mengaku dari bagian kepegawaian pusat, meminta Anda memperbarui data melalui tautan dan memasukkan kata sandi akun ASN.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Tidak membuka tautan, memeriksa informasi lewat situs atau kanal resmi, melaporkan surel ke pengelola TI, dan mengingatkan rekan | 5 | Waspada, verifikasi, lapor, edukasi |
| Tidak membuka tautan dan menghapus surel | 4 | Aman bagi diri sendiri, rekan tetap berisiko |
| Menanyakan ke rekan apakah mereka menerima surel serupa | 3 | Ada kewaspadaan, belum ada tindakan |
| Membuka tautan untuk melihat isinya tanpa mengisi apa pun | 2 | Berisiko terkena malware |
| Mengisi data karena surel tampak resmi | 1 | Menyerahkan kredensial |

### Contoh 2: Teman meminta data warga

*Seorang teman yang bekerja di perusahaan pembiayaan meminta Anda mencarikan alamat seseorang dari database kependudukan.*

Nilai 5: menolak dengan tegas namun santun, menjelaskan bahwa data kependudukan dilindungi dan hanya bisa diakses sesuai prosedur resmi lembaga pengguna. Nilai 4: menolak karena bukan wewenang. Nilai 3: menyarankan ia mencari sendiri di media sosial. Nilai 2: berjanji akan melihat dulu. Nilai 1: memberikan data karena hanya alamat.

### Contoh 3: Kata sandi bersama

*Rekan meminta kata sandi akun aplikasi keuangan Anda agar ia bisa menginput data saat Anda cuti.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Tidak memberikan kata sandi, dan berkoordinasi dengan atasan serta admin sistem agar rekan mendapat akses resmi sesuai perannya | 5 | Aman, akuntabel, pekerjaan tetap berjalan |
| Menyelesaikan input sebelum cuti agar akun tidak dibutuhkan | 4 | Solutif tetapi belum mengatasi kebutuhan berikutnya |
| Menolak memberikan kata sandi | 3 | Aman tetapi pekerjaan bisa terhambat |
| Memberikan kata sandi lalu menggantinya setelah kembali | 2 | Melanggar prinsip akun pribadi |
| Menuliskan kata sandi di kertas dan menempelkannya di meja | 1 | Sangat ceroboh |

### Contoh 4: Video kericuhan di loket

*Seseorang merekam kericuhan warga dengan petugas di kantor Anda. Rekan menyarankan Anda mengunggah video versi kantor agar instansi tidak disalahkan.*

Nilai 5: tidak mengunggah secara pribadi; menyerahkan kronologi dan bukti kepada atasan dan pengelola humas agar klarifikasi dilakukan melalui kanal resmi. Nilai 1: mengunggah video dengan komentar menyudutkan warga.

### Contoh 5: Grup percakapan kantor

*Di grup percakapan kantor, beredar tangkapan layar dokumen internal yang belum boleh dipublikasikan, dan ada anggota yang ingin meneruskannya ke grup keluarga.*

Nilai 5: mengingatkan di grup bahwa dokumen itu bersifat internal dan tidak boleh disebarkan, lalu melapor kepada atasan agar ditertibkan. Nilai 3: tidak ikut menyebarkan. Nilai 1: ikut meneruskan karena informasinya bermanfaat.

## Jebakan umum

- **Membuka tautan "sekadar melihat"**: tetap berisiko.
- **Berbagi akun demi kelancaran kerja**: terdengar kolaboratif, padahal melanggar keamanan.
- **Membalas di media sosial** atas nama pribadi untuk membela instansi.
- **Menganggap data kecil tidak penting**, misalnya "hanya alamat" atau "hanya nomor telepon".

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| memverifikasi kanal resmi, melapor ke pengelola TI | mengklik, mengisi, mencoba |
| akses resmi sesuai peran, menjaga kerahasiaan | berbagi kata sandi, meminjamkan akun |
| klarifikasi melalui humas | membalas komentar, memviralkan |
| mengingatkan rekan | ikut meneruskan |

## Ringkasan

- Data warga dan akun kerja adalah amanah yang wajib dijaga.
- Hadapi phishing dengan tidak mengklik, memverifikasi, melapor, dan mengingatkan rekan.
- Etika digital ASN berlaku di semua platform, termasuk akun pribadi.

## Tips

1. Ingat urutan **berhenti – verifikasi – laporkan – edukasi**.
2. Opsi yang menjaga keamanan **dan** tetap membuat pekerjaan berjalan biasanya bernilai 5.
3. Kata sandi dan OTP tidak pernah boleh dibagikan, kepada siapa pun.
4. Klarifikasi isu instansi dilakukan lewat kanal resmi, bukan akun pribadi.
$md$,
   false, 3, 15),
  ('tkp-profesional', 'Profesionalisme dan Tanggung Jawab Kerja', 'tkp-profesional-konsep', 'Indikator profesionalisme, mengelola prioritas, dan mengakui kesalahan.',
$md$## Apa yang diukur aspek profesionalisme?

Profesionalisme menilai **kualitas kerja, tanggung jawab, integritas, dan disiplin** Anda sebagai ASN. Soal-soalnya menghadirkan situasi seperti tenggat yang bertumpuk, kesalahan dalam pekerjaan, tugas di luar keahlian, godaan menyalahgunakan wewenang, atau konflik antara urusan pribadi dan pekerjaan.

Aspek ini berkaitan dengan nilai **Akuntabel**, **Kompeten**, dan **Loyal** dalam BerAKHLAK.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Bertanggung jawab | Mengakui kesalahan, memperbaikinya, tidak melempar ke orang lain |
| Berorientasi kualitas | Teliti, memeriksa ulang, menyelesaikan tepat waktu |
| Mengelola prioritas | Menyusun skala prioritas, berkomunikasi soal tenggat |
| Integritas | Jujur, menolak gratifikasi, tidak memalsukan data |
| Disiplin | Tepat waktu, mematuhi aturan kerja, menjaga aset negara |
| Mengembangkan diri | Belajar hal baru, meminta umpan balik |
| Netral dan objektif | Tidak mencampuradukkan kepentingan pribadi, menjaga netralitas |

## Pengingat penilaian

Kelima opsi bernilai 1–5 masing-masing sekali; tidak ada opsi bernilai nol; soal kosong bernilai 0. Maksimal 225, ambang batas formasi umum 166.

## Tangga skor profesionalisme

| Skor | Pola sikap |
| --- | --- |
| 5 | Bertanggung jawab penuh, teliti, mengelola prioritas, berkomunikasi, jujur, dan berupaya memperbaiki sistem |
| 4 | Menyelesaikan tugas dengan baik dan jujur, tetapi kurang inisiatif atau kurang komunikasi |
| 3 | Menyelesaikan sekadarnya, menunda, atau menunggu arahan |
| 2 | Menghindar, mencari alasan, melempar tanggung jawab ke atasan atau rekan |
| 1 | Melanggar integritas: memalsukan, menutupi kesalahan, menerima suap, atau mengorbankan tugas untuk kepentingan pribadi |

## Contoh pembahasan

### Contoh 1: Menemukan kesalahan sendiri setelah laporan dikirim

*Anda menyadari ada angka yang salah dalam laporan anggaran yang sudah dikirim ke atasan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Segera memberi tahu atasan, mengirim laporan yang sudah dikoreksi, dan menambahkan langkah pemeriksaan ulang dalam proses kerja | 5 | Jujur, tuntas, mencegah berulang |
| Memberi tahu atasan dan mengirim koreksi | 4 | Bertanggung jawab tanpa perbaikan proses |
| Menunggu apakah atasan menyadarinya | 3 | Pasif dan berisiko |
| Menyalahkan data dari bagian lain jika ditanya | 2 | Melempar tanggung jawab |
| Diam-diam mengganti file di folder bersama tanpa memberi tahu | 1 | Tidak transparan |

### Contoh 2: Tugas di luar keahlian

*Atasan menugaskan Anda menyusun analisis data survei kepuasan masyarakat, padahal Anda belum pernah mengolah data statistik.*

Nilai 5: menerima tugas, segera mempelajari teknik dasar pengolahan data, berkonsultasi dengan rekan yang ahli, dan menyampaikan progres kepada atasan. Nilai 4: menerima dan mengerjakan sebisanya sambil belajar. Nilai 3: meminta atasan memberi pelatihan dulu. Nilai 2: menyarankan tugas diberikan kepada rekan lain. Nilai 1: menolak karena bukan bidang Anda.

### Contoh 3: Tenggat bertabrakan

*Dua atasan dari bidang berbeda meminta pekerjaan mendesak pada hari yang sama.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyusun prioritas berdasarkan urgensi, mengomunikasikan perkiraan waktu kepada kedua atasan, dan meminta keputusan bila tetap bentrok | 5 | Transparan dan terkelola |
| Mengerjakan berurutan sesuai waktu permintaan | 4 | Terstruktur, tanpa komunikasi |
| Mengerjakan keduanya sekaligus sampai lembur | 3 | Usaha keras, risiko kualitas |
| Mengerjakan permintaan atasan yang lebih senior saja | 2 | Mengabaikan tugas lain |
| Mengerjakan keduanya seadanya agar cepat selesai | 1 | Mengorbankan kualitas |

### Contoh 4: Fasilitas kantor untuk keperluan pribadi

*Kendaraan dinas di kantor sedang tidak dipakai, dan Anda perlu mengantar keluarga ke acara pernikahan.*

Nilai 5: tidak menggunakan kendaraan dinas dan memakai kendaraan pribadi atau transportasi umum, karena aset negara hanya untuk kepentingan dinas. Nilai 1: meminjamnya karena toh tidak dipakai. Aset negara bukan milik pribadi.

### Contoh 5: Netralitas

*Menjelang pilkada, kerabat Anda yang menjadi calon meminta Anda memasang fotonya di status media sosial.*

Nilai 5: menolak dengan santun dan menjelaskan bahwa ASN wajib netral dalam politik praktis. Nilai 1: memasang foto karena hanya di akun pribadi.

## Jebakan umum

- **Melempar ke atasan**: "menunggu arahan atasan" untuk hal yang jelas menjadi tugas Anda.
- **Kerja keras tanpa komunikasi**: lembur diam-diam tanpa memberi tahu kendala.
- **Menutupi kesalahan** demi menjaga citra.
- **Loyal yang keliru**: menuruti perintah atasan yang jelas melanggar aturan.
- **Pemanfaatan fasilitas negara** untuk urusan pribadi.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| mengakui, memperbaiki, memeriksa ulang | menutupi, menyalahkan, diam-diam |
| menyusun prioritas, mengomunikasikan tenggat | asal selesai, seadanya |
| mempelajari, berkonsultasi, meminta umpan balik | menolak karena bukan bidang |
| netral, menolak gratifikasi, aset untuk dinas | untuk keperluan pribadi, titipan |

## Ringkasan

- Profesionalisme = tanggung jawab, kualitas, integritas, disiplin, dan pengembangan diri.
- Nilai 5 tidak hanya menyelesaikan tugas, tetapi juga jujur, komunikatif, dan memperbaiki proses.
- Pelanggaran integritas selalu bernilai 1, apa pun alasannya.

## Tips

1. Jika ada kesalahan, opsi yang **mengakui dan memperbaiki segera** hampir selalu terbaik.
2. Dalam bentrok prioritas, cari opsi yang **berkomunikasi**, bukan sekadar bekerja lebih keras.
3. Tugas baru di luar keahlian adalah peluang belajar; menolak bernilai rendah.
4. Ketaatan pada atasan berhenti ketika perintahnya melanggar hukum.
$md$,
   true, 2, 14),
  ('tkp-profesional', 'Integritas di Bawah Tekanan', 'tkp-profesional-integritas', 'Menolak perintah keliru, konflik kepentingan, dan melapor lewat jalur resmi.',
$md$## Fokus pelajaran ini

Soal profesionalisme paling sulit biasanya menyentuh **integritas di bawah tekanan**: atasan yang meminta sesuatu yang janggal, rekan yang melanggar aturan, tekanan target, atau konflik kepentingan. Dalam situasi ini, sering ada opsi yang "aman secara hubungan" tetapi lemah secara integritas. Pelajaran ini membantu Anda membedakannya.

## Tiga prinsip integritas ASN

### 1. Akuntabel terhadap aturan, bukan terhadap orang

Loyalitas ASN ditujukan kepada negara, Pancasila, UUD 1945, dan pemerintahan yang sah, bukan loyalitas buta pada individu. Perintah atasan wajib dilaksanakan **selama sesuai aturan**. Jika tidak, ASN wajib menolak dengan santun dan menjelaskan dasar aturannya.

### 2. Menghindari konflik kepentingan

Konflik kepentingan muncul ketika keputusan kerja bisa dipengaruhi kepentingan pribadi: keluarga ikut lelang, kenalan mengajukan izin, atau Anda menilai kinerja saudara sendiri. Sikap terbaik adalah **mengungkapkan** konflik tersebut dan **mundur dari proses** pengambilan keputusan.

### 3. Melapor melalui jalur yang benar

Pelanggaran yang Anda ketahui sebaiknya disampaikan melalui jalur resmi: atasan langsung, inspektorat, atau sistem pelaporan pelanggaran (whistleblowing system) instansi. Bukan dengan menyebarkan di media sosial atau bergunjing.

## Tangga skor integritas

| Skor | Pola sikap |
| --- | --- |
| 5 | Menolak pelanggaran dengan santun, menjelaskan dasar aturan, menawarkan alternatif yang sah, melapor melalui jalur resmi bila perlu |
| 4 | Menolak pelanggaran dengan tegas, tanpa alternatif atau tanpa pelaporan |
| 3 | Menghindar dari keterlibatan tetapi membiarkan pelanggaran terjadi |
| 2 | Ikut sebagian karena sungkan, atau menunda keputusan |
| 1 | Ikut melanggar, menutupi, atau mengambil keuntungan |

## Contoh pembahasan

### Contoh 1: Atasan meminta menaikkan angka capaian

*Menjelang evaluasi, atasan meminta Anda menaikkan angka capaian program dalam laporan agar unit terlihat berhasil.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyampaikan secara santun bahwa data harus sesuai fakta, lalu mengusulkan menyajikan analisis kendala dan rencana perbaikan agar laporan tetap bernilai | 5 | Jujur, solutif, menjaga nama unit secara sah |
| Menolak dan tetap menyusun laporan sesuai data asli | 4 | Integritas terjaga, tanpa solusi |
| Meminta atasan menulis sendiri angka yang diinginkan | 3 | Menghindar, pelanggaran tetap terjadi |
| Menaikkan sedikit saja agar tidak mencolok | 2 | Ikut melanggar sebagian |
| Mengikuti permintaan karena perintah atasan | 1 | Pemalsuan data |

### Contoh 2: Kerabat ikut seleksi yang Anda nilai

*Anda menjadi anggota panitia seleksi tenaga pendukung, dan ternyata sepupu Anda termasuk pelamar.*

- **5:** Melaporkan hubungan keluarga kepada ketua panitia dan meminta tidak dilibatkan dalam penilaian pelamar tersebut.
- **4:** Menilai seobjektif mungkin sesuai rubrik tanpa memberi tahu siapa pun.
- **3:** Mengundurkan diri dari kepanitiaan tanpa menjelaskan alasan.
- **2:** Memberi tahu sepupu materi yang biasanya ditanyakan.
- **1:** Memberikan nilai tinggi kepada sepupu.

Opsi 4 terdengar profesional, tetapi konflik kepentingan **tetap ada** dan tidak terkelola secara transparan.

### Contoh 3: Rekan sering titip absen

*Anda mengetahui seorang rekan sering meminta rekan lain memindai presensi untuknya.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menegurnya secara pribadi, mengingatkan konsekuensinya, dan bila berlanjut melaporkannya kepada atasan | 5 | Bertahap, santun, akuntabel |
| Langsung melaporkannya kepada atasan | 4 | Tepat, tetapi tanpa pendekatan |
| Tidak ikut-ikutan dan membiarkan | 3 | Netral |
| Membicarakannya dengan rekan lain | 2 | Bergunjing |
| Bersedia memindai presensi untuknya bila diminta | 1 | Ikut melanggar |

### Contoh 4: Tekanan target layanan

*Unit Anda dituntut menyelesaikan 100 berkas per hari. Rekan menyarankan melewati tahap verifikasi agar target tercapai.*

Nilai 5: tetap melakukan verifikasi sesuai SOP, lalu mengusulkan kepada atasan perbaikan alur kerja (misalnya pemeriksaan awal kelengkapan di loket) agar target realistis tercapai. Nilai 1: melewatkan verifikasi demi angka.

## Jebakan umum

- **Kepatuhan buta**: "melaksanakan perintah atasan" walaupun melanggar aturan.
- **Diam demi harmoni**: membiarkan pelanggaran agar hubungan baik.
- **Menolak tanpa solusi**: benar, tetapi sering hanya bernilai 4.
- **Memviralkan pelanggaran** alih-alih melapor ke jalur resmi.
- **Objektivitas tanpa transparansi** dalam konflik kepentingan.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| sesuai fakta, sesuai SOP, transparan | menyesuaikan angka, sedikit saja |
| melaporkan hubungan keluarga, tidak terlibat menilai | menilai sendiri diam-diam |
| menegur secara pribadi lalu melapor bila berlanjut | bergunjing, membiarkan |
| inspektorat, whistleblowing system | mengunggah di media sosial |

## Ringkasan

- Integritas diuji saat ada tekanan dari atasan, rekan, target, atau keluarga.
- Nilai 5 menolak pelanggaran **dan** menawarkan jalan keluar yang sah.
- Konflik kepentingan harus diungkapkan, bukan sekadar "dikelola sendiri".
- Pelanggaran dilaporkan melalui jalur resmi secara bertahap.

## Tips

1. Bila opsi melibatkan perintah atasan yang janggal, cek dulu: apakah melanggar aturan? Jika ya, pilih penolakan yang santun dan solutif.
2. Bedakan opsi 4 (menolak) dan 5 (menolak + solusi atau perbaikan).
3. Untuk pelanggaran rekan, urutan ideal: ingatkan pribadi, lalu laporkan bila berlanjut.
4. Transparansi selalu lebih baik daripada keyakinan bahwa Anda "pasti objektif".
$md$,
   false, 3, 14),
  ('tkp-antiradikal', 'Mengenali Radikalisme dan Bersikap Moderat', 'tkp-antiradikal-konsep', 'Tanda intoleransi dan ekstremisme, tangga skor, dan sikap moderat ASN.',
$md$## Apa yang diukur aspek anti radikalisme?

Aspek anti radikalisme menilai **kesetiaan Anda pada Pancasila, UUD 1945, NKRI, dan Bhinneka Tunggal Ika**, serta kemampuan bersikap moderat dan menangkal paham yang ingin mengganti dasar negara atau memaksakan kehendak melalui kekerasan dan intoleransi. ASN dituntut bukan hanya tidak terpapar, tetapi juga **ikut menangkal** penyebaran paham tersebut di lingkungan kerja dan masyarakat.

Aspek ini berkaitan erat dengan nilai **Loyal** dan **Harmonis** dalam BerAKHLAK.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Setia pada ideologi negara | Menjunjung Pancasila dan menolak ajakan menggantinya |
| Sikap moderat | Beragama dan berpendapat secara seimbang, tidak ekstrem |
| Toleransi | Menghormati keyakinan dan pendapat yang berbeda |
| Menangkal hoaks dan ujaran kebencian | Memeriksa kebenaran informasi, tidak ikut menyebarkan |
| Melapor ke kanal resmi | Menyampaikan indikasi radikalisme kepada pihak berwenang |
| Menjaga persatuan | Menjadi perekat, mengedukasi, mendorong dialog |

## Mengenali tanda intoleransi dan ekstremisme

Waspadai tanda-tanda berikut di lingkungan kerja, media sosial, atau masyarakat:

- Menganggap kelompok sendiri paling benar dan kelompok lain musuh.
- Menolak Pancasila, menolak hormat bendera, atau menyebut pemerintah sah sebagai musuh.
- Menyebarkan ujaran kebencian berbasis suku, agama, ras, dan antargolongan.
- Membenarkan kekerasan atas nama keyakinan.
- Mengajak menjauhi keluarga atau masyarakat yang berbeda pandangan.
- Menyebarkan konten provokatif atau hoaks untuk memecah belah.

> **Penting:** Tidak semua orang yang taat beragama itu radikal. Kesalehan berbeda dengan ekstremisme. Sikap moderat justru menghormati ketaatan beragama sekaligus menolak kekerasan dan pemaksaan.

## Pengingat penilaian

Kelima opsi bernilai 1–5 masing-masing sekali; tidak ada opsi bernilai nol; soal kosong bernilai 0. Maksimal 225, ambang batas formasi umum 166.

## Tangga skor anti radikalisme

| Skor | Pola sikap |
| --- | --- |
| 5 | Menolak tegas namun santun, tidak menyebarkan, mengedukasi dengan data yang benar, melapor melalui kanal resmi, menjaga persatuan |
| 4 | Menolak dan tidak menyebarkan, serta mengingatkan secara pribadi |
| 3 | Tidak terlibat, tetapi diam dan tidak mencegah |
| 2 | Bersikap ragu, ikut menyimak tanpa sikap, atau menyimpan konten |
| 1 | Ikut menyebarkan, mendukung, membalas dengan kebencian, atau main hakim sendiri |

## Contoh pembahasan

### Contoh 1: Rekan membagikan ceramah provokatif

*Seorang rekan rutin membagikan video ceramah yang menyebut sistem pemerintahan Indonesia bertentangan dengan agama dan harus diganti.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengajaknya berdiskusi secara santun tentang Pancasila sebagai kesepakatan bangsa, lalu melaporkan kepada atasan bila ia tetap menyebarkan | 5 | Edukasi bertahap dan pelaporan resmi |
| Mengingatkannya secara pribadi agar tidak menyebarkan video tersebut | 4 | Tepat, tetapi tanpa tindak lanjut |
| Tidak menonton dan tidak menanggapi | 3 | Tidak terpapar, tetapi membiarkan |
| Keluar dari grup percakapan | 2 | Menghindar dan masalah tetap ada |
| Membalas dengan menghina keyakinannya | 1 | Memicu konflik baru |

### Contoh 2: Hoaks soal kebijakan pemerintah

*Di grup warga, beredar pesan bahwa vaksin yang dibagikan puskesmas mengandung bahan berbahaya dan merupakan agenda pihak asing.*

Nilai 5: memeriksa kebenaran melalui situs resmi Kementerian Kesehatan dan kanal cek fakta, lalu membagikan klarifikasi resmi di grup dengan bahasa yang santun, serta melaporkan konten ke kanal aduan konten. Nilai 4: membagikan klarifikasi resmi. Nilai 3: tidak ikut meneruskan. Nilai 2: bertanya ke grup apakah berita itu benar. Nilai 1: meneruskan pesan agar warga waspada.

### Contoh 3: Kegiatan tertutup di lingkungan kantor

*Anda mendengar ada pertemuan rutin tertutup di ruang kantor setelah jam kerja yang membahas penolakan terhadap NKRI.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengumpulkan informasi secukupnya tanpa menuduh, lalu melaporkannya kepada atasan atau unit pembina sesuai prosedur | 5 | Hati-hati, berbasis fakta, jalur resmi |
| Langsung melaporkan kepada atasan | 4 | Tepat, tetapi belum memastikan informasinya |
| Membiarkan karena dilakukan di luar jam kerja | 3 | Pasif |
| Membicarakannya dengan rekan-rekan lain | 2 | Memicu gosip |
| Menggerebek pertemuan bersama rekan | 1 | Main hakim sendiri |

### Contoh 4: Penolakan pendirian tempat ibadah

*Sebagian warga di kelurahan Anda menolak renovasi tempat ibadah kelompok minoritas yang izinnya sudah lengkap.*

Nilai 5: mendukung camat dan lurah memfasilitasi dialog bersama tokoh agama dan forum kerukunan umat beragama, sambil menegaskan bahwa izin sudah sesuai aturan. Nilai 1: mendukung penolakan agar tidak terjadi keributan.

## Jebakan umum

- **Membalas kebencian dengan kebencian**: menghina balik, mengolok-olok.
- **Main hakim sendiri**: menggerebek, mempermalukan di media sosial.
- **Diam karena takut**: membiarkan paham menyebar.
- **Menyamaratakan**: mencurigai seseorang hanya karena penampilan atau ketaatan beragamanya.
- **Ikut menyebarkan untuk "waspada"**: meneruskan konten berbahaya justru memperluas jangkauannya.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| berdiskusi santun, mengedukasi, klarifikasi resmi | membalas, menghina, mengolok |
| memeriksa kebenaran, kanal cek fakta | meneruskan, membagikan ulang |
| melapor ke atasan, aduan konten, aparat berwenang | menggerebek, memviralkan |
| dialog, forum kerukunan, persatuan | mendukung penolakan, mengucilkan |

## Ringkasan

- Anti radikalisme menilai loyalitas pada Pancasila dan NKRI serta sikap moderat.
- Kenali tanda intoleransi dan ekstremisme tanpa menyamaratakan orang yang taat beragama.
- Nilai 5 = menolak, mengedukasi, melapor melalui kanal resmi, menjaga persatuan.
- Nilai 1 = menyebarkan, mendukung, membalas dengan kebencian, atau main hakim sendiri.

## Tips

1. Ingat urutan **tolak – edukasi – laporkan – rekatkan**.
2. Pilih opsi berbasis **fakta dan kanal resmi**, bukan asumsi atau emosi.
3. Opsi "keluar dari grup" atau "diam saja" jarang lebih dari 2–3.
4. Dialog dan musyawarah adalah ciri utama sikap moderat.
$md$,
   true, 2, 15),
  ('tkp-antiradikal', 'Menangkal Hoaks dan Kanal Pelaporan Resmi', 'tkp-antiradikal-hoaks', 'Menyaring propaganda digital, kanal pelaporan, dan mendampingi yang terpapar.',
$md$## Fokus pelajaran ini

Radikalisme modern banyak menyebar melalui **ruang digital**: video pendek, pesan berantai, akun anonim, dan grup tertutup. Pelajaran ini membahas cara ASN menangkal hoaks dan propaganda, memilih kanal pelaporan yang tepat, serta bersikap moderat ketika berhadapan dengan orang terdekat yang mulai terpapar.

## Mengenali hoaks dan propaganda

### Ciri konten yang patut dicurigai

| Ciri | Contoh |
| --- | --- |
| Judul provokatif dan bernada marah | "Bangkitlah! Negara ini sudah dikuasai musuh!" |
| Sumber tidak jelas | "Dari grup sebelah", akun tanpa identitas |
| Meminta segera disebarkan | "Sebarkan sebelum dihapus!" |
| Menyudutkan kelompok tertentu | Menuduh satu suku atau agama sebagai biang masalah |
| Memotong konteks | Potongan video tanpa keterangan waktu dan tempat |
| Menolak dasar negara | Mengajak mengganti Pancasila atau tidak mengakui pemerintah sah |

### Langkah menyaring informasi

1. **Berhenti**: jangan langsung meneruskan.
2. **Periksa sumber**: situs resmi instansi, media kredibel, kanal cek fakta.
3. **Bandingkan**: cari pemberitaan serupa dari sumber lain yang tepercaya.
4. **Putuskan**: jika hoaks atau provokatif, jangan sebarkan; luruskan dengan santun dan laporkan.

## Kanal pelaporan resmi

| Jenis temuan | Kanal yang tepat |
| --- | --- |
| Konten negatif di internet | Kanal aduan konten milik pemerintah, fitur lapor di platform |
| Indikasi paham radikal di lingkungan ASN | Atasan langsung, unit kepegawaian, inspektorat, kanal pengaduan ASN |
| Ancaman kekerasan atau terorisme | Kepolisian setempat |
| Konflik antarwarga berlatar SARA | Lurah atau camat, forum kerukunan umat beragama, Babinsa dan Bhabinkamtibmas |

> Melapor ke kanal resmi bukan berarti "mengadu domba". Justru itulah cara mencegah konflik melebar tanpa main hakim sendiri.

## Tangga skor menangkal hoaks dan radikalisme digital

| Skor | Pola sikap |
| --- | --- |
| 5 | Tidak menyebarkan, memverifikasi, meluruskan dengan sumber resmi secara santun, melapor ke kanal resmi |
| 4 | Tidak menyebarkan dan meluruskan atau mengingatkan |
| 3 | Tidak menyebarkan, tetapi diam |
| 2 | Menyimpan, menanyakan tanpa sikap, atau keluar grup begitu saja |
| 1 | Meneruskan, menyetujui, atau membalas dengan ujaran kebencian |

## Contoh pembahasan

### Contoh 1: Adik mulai terpapar

*Adik Anda yang masih kuliah mulai sering mengatakan bahwa hormat bendera itu terlarang dan mengajak keluarga menjauhi tetangga yang berbeda keyakinan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengajaknya berbicara dari hati ke hati, mendengarkan sumber pemikirannya, mengenalkannya pada tokoh agama moderat, dan memantau pergaulannya | 5 | Empatik, edukatif, pendampingan berkelanjutan |
| Menasihatinya bahwa pandangan tersebut keliru | 4 | Benar, tetapi satu arah |
| Meminta orang tua yang menasihati | 3 | Melempar sebagian |
| Membiarkan karena ia sudah dewasa | 2 | Abai |
| Memarahinya dan melarangnya keluar rumah | 1 | Konfrontatif, dapat memperkuat keterpaparan |

### Contoh 2: Komentar intoleran di akun instansi

*Anda admin media sosial dinas. Di unggahan ucapan hari raya, muncul komentar yang menghina pemeluk agama tertentu.*

Nilai 5: menyembunyikan atau menghapus komentar sesuai pedoman moderasi instansi, mendokumentasikannya, melaporkannya melalui fitur platform, serta menyampaikan pesan bahwa akun instansi menjunjung toleransi. Nilai 4: menghapus komentar. Nilai 3: membiarkan karena kebebasan berpendapat. Nilai 2: membalas dengan meminta komentator diam. Nilai 1: membalas dengan menghina balik.

### Contoh 3: Ajakan donasi mencurigakan

*Seorang kenalan meminta Anda berdonasi melalui rekening pribadi untuk "perjuangan" kelompok yang ingin mengganti dasar negara.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menolak, menyimpan bukti pesan, dan melaporkannya kepada pihak berwenang | 5 | Tegas, berbasis bukti, jalur resmi |
| Menolak dan mengingatkan bahayanya | 4 | Tepat, tanpa pelaporan |
| Menolak tanpa penjelasan | 3 | Tidak terlibat |
| Mengabaikan pesannya | 2 | Pasif |
| Berdonasi sedikit agar hubungan tetap baik | 1 | Mendanai radikalisme |

### Contoh 4: Diskusi panas di kantor

*Saat rapat informal, dua rekan berdebat tentang isu agama dan politik hingga saling menuduh sesat dan antek asing.*

Nilai 5: menengahi dengan tenang, mengajak keduanya kembali menghormati perbedaan dan fokus pada pekerjaan, lalu bila perlu mengusulkan kegiatan wawasan kebangsaan di kantor. Nilai 3: diam agar tidak terseret. Nilai 1: memihak salah satu dan ikut menuduh.

## Sikap moderat dalam keseharian

- Beragama dengan taat sekaligus menghormati keyakinan orang lain.
- Mengkritik kebijakan melalui saluran yang sah, bukan dengan menolak dasar negara.
- Menyikapi perbedaan dengan dialog dan musyawarah.
- Mengutamakan persatuan dan kepentingan bangsa.

## Jebakan umum

- **Meneruskan untuk "berjaga-jaga"**: tetap ikut menyebarkan.
- **Keluar grup**: terlihat aman, tetapi melepaskan peran meluruskan.
- **Menghukum keras orang terdekat**: memutus komunikasi justru mendorong mereka lebih dalam.
- **Kebebasan berpendapat sebagai alasan membiarkan ujaran kebencian**.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| memverifikasi, meluruskan, sumber resmi | meneruskan, sebarkan |
| mendampingi, mendengarkan, tokoh moderat | memarahi, mengusir, memutus komunikasi |
| menyimpan bukti, melapor ke pihak berwenang | berdonasi, ikut mendukung |
| menengahi, wawasan kebangsaan | memihak, menuduh |

## Ringkasan

- Radikalisme banyak menyebar lewat konten digital; ASN harus menjadi penyaring informasi sekaligus penyebar informasi yang benar.
- Gunakan langkah **berhenti – periksa – bandingkan – putuskan**.
- Pilih kanal pelaporan sesuai jenis temuan.
- Hadapi orang terdekat yang terpapar dengan pendampingan, bukan kemarahan.

## Tips

1. Opsi yang memadukan **klarifikasi resmi** dan **pelaporan** biasanya bernilai 5.
2. Jangan tergoda opsi keras yang terlihat tegas tetapi memicu konflik.
3. Bedakan "menolak" (4) dengan "menolak + edukasi + lapor" (5).
4. Moderat bukan berarti netral terhadap kekerasan; ASN harus tegas menolak paham anti-Pancasila.
$md$,
   false, 3, 15)
) as v(sub, title, slug, summary, content, is_free, sort_order, est_minutes)
join public.subtopics s on s.slug = v.sub
on conflict (slug) do nothing;

insert into public.questions (test_code, subtopic_id, stem, options, explanation, difficulty, usage, status, source, year)
select 'TKP', s.id, v.stem,
       jsonb_build_array(
         jsonb_build_object('label','A','text',v.a,'points',v.pa),
         jsonb_build_object('label','B','text',v.b,'points',v.pb),
         jsonb_build_object('label','C','text',v.c,'points',v.pc),
         jsonb_build_object('label','D','text',v.d,'points',v.pd),
         jsonb_build_object('label','E','text',v.e,'points',v.pe)),
       v.expl, v.diff::public.difficulty, 'both', 'published', 'SiapASN original', 2026
from (values
  ('tkp-pelayanan', 'easy', 'Anda bertugas di loket kantor kecamatan. Seorang warga bertanya tentang syarat pembuatan surat pindah, padahal itu bukan layanan di loket Anda. Sikap Anda …', 'Menjelaskan syarat yang Anda ketahui, lalu mengantarnya ke loket surat pindah', 5, 'Menyampaikan bahwa loket Anda tidak melayani surat pindah, lalu memanggil antrean berikutnya', 1, 'Menunjukkan letak loket surat pindah dan menyebutkan nama petugas yang bisa ia temui di sana', 4, 'Meminta warga bertanya ke meja informasi di depan karena petugas di sana lebih paham semua layanan', 2, 'Memberikan lembar informasi syarat surat pindah yang tersedia di meja agar warga bisa mempelajarinya', 3, 'A (5): Melayani tuntas dan memastikan warga sampai di loket yang benar; C (4): Informatif dan membantu, tetapi tanpa pendampingan; E (3): Membantu sebagian, warga tetap harus mencari loket sendiri; D (2): Mengalihkan tanpa usaha membantu; B (1): Menolak tanpa solusi.'),
  ('tkp-pelayanan', 'easy', 'Seorang ibu menggendong bayi yang demam tinggi datang ke puskesmas saat antrean poli umum masih panjang. Tindakan Anda sebagai petugas pendaftaran …', 'Meminta ibu menunggu sesuai nomor antrean karena semua pasien berhak diperlakukan sama', 2, 'Segera mengarahkannya ke penilaian triase agar bayi didahulukan bila kondisinya darurat', 5, 'Memberikan nomor antrean poli umum dan mempersilakan ibu duduk di kursi terdekat dengan ruang periksa', 3, 'Menyarankan ibu langsung ke rumah sakit karena antrean puskesmas sedang penuh', 1, 'Menelepon perawat jaga untuk melaporkan kondisi bayi dan meminta perawat memeriksanya bila sempat', 4, 'B (5): Cepat, sesuai prosedur triase, mengutamakan keselamatan pasien; E (4): Tanggap, tetapi tidak langsung memakai alur triase dan masih bergantung waktu perawat; C (3): Tetap melayani, tetapi kondisi darurat belum diprioritaskan; A (2): Kaku dan mengabaikan kondisi gawat; D (1): Menolak melayani dan berisiko bagi bayi.'),
  ('tkp-pelayanan', 'medium', 'Anda petugas layanan perizinan. Seorang pemohon mengeluh karena izinnya belum terbit melewati waktu yang dijanjikan dalam standar pelayanan. Anda …', 'Menjelaskan bahwa volume permohonan bulan ini sedang tinggi sehingga hampir semua berkas mengalami keterlambatan', 3, 'Menyarankan pemohon menyampaikan keluhannya melalui kanal pengaduan resmi dinas agar tercatat', 2, 'Menjelaskan bahwa keterlambatan terjadi di bagian teknis, bukan di loket pelayanan', 1, 'Meminta maaf, mengecek posisi berkas di sistem, lalu menjelaskan penyebab dan perkiraan waktu terbit', 5, 'Meminta maaf, mencatat nomor permohonan, dan berjanji menelepon pemohon setelah bertanya ke bagian teknis', 4, 'D (5): Mengakui, mencari fakta, dan memberi kepastian; E (4): Responsif, tetapi kepastian belum diberikan saat itu; A (3): Jujur secara umum, tetapi tidak menangani kasus pemohon; B (2): Memberi jalur, tetapi melempar penyelesaian; C (1): Melempar tanggung jawab dan defensif.'),
  ('tkp-pelayanan', 'medium', 'Ketika melayani pembuatan KTP elektronik, Anda menyadari ada warga di antrean yang tampak kebingungan mengisi formulir karena tidak bisa membaca. Anda …', 'Membiarkannya karena formulir sudah dilengkapi contoh pengisian di papan', 1, 'Menghampirinya, membacakan dan mengisikan formulir sesuai keterangannya, lalu memeriksanya bersama', 5, 'Meminta rekan di meja informasi yang sedang senggang mendampingi warga mengisi formulir', 4, 'Mencatat nomor antreannya dan membantu mengisi formulir di loket begitu gilirannya tiba', 3, 'Meminta warga membawa pulang formulir agar diisikan oleh keluarganya dan kembali besok', 2, 'B (5): Empatik, menjaga martabat, dan tetap teliti; C (4): Warga terbantu, tetapi Anda tidak turun tangan langsung; D (3): Membantu, tetapi warga dibiarkan bingung selama menunggu; E (2): Membebani warga dan menunda layanan; A (1): Abai terhadap kebutuhan warga.'),
  ('tkp-pelayanan', 'hard', 'Seorang warga lansia datang ke kantor kelurahan untuk surat keterangan tidak mampu. Datanya belum tercatat di basis data warga miskin, tetapi kondisinya terlihat sangat kekurangan. Anda …', 'Membantu mengajukan verifikasi lapangan sesuai prosedur dan mengawal prosesnya sampai selesai', 5, 'Menjelaskan bahwa surat hanya dapat dibuat bagi warga yang tercatat dan menyarankan ia melapor ke ketua RT', 3, 'Langsung membuatkan surat tanpa verifikasi karena kondisinya jelas terlihat', 1, 'Melaporkan kondisi warga kepada lurah dan meminta arahan tentang kebijakan khusus sesuai kewenangan', 4, 'Meminta warga kembali setelah pendataan ulang tahunan dilakukan oleh kelurahan', 2, 'A (5): Empati diwujudkan melalui jalur resmi dan dikawal sampai tuntas; D (4): Peduli dan memakai jalur kewenangan, tetapi belum menempuh prosedur pendataan; B (3): Sesuai aturan, tetapi warga tidak didampingi; E (2): Menunda tanpa upaya; C (1): Niat baik tetapi melanggar prosedur verifikasi.'),
  ('tkp-pelayanan', 'medium', 'Anda pegawai Dukcapil. Seorang kenalan menelepon meminta akta kelahiran anaknya diproses lebih dulu dari pemohon lain karena ia sibuk. Anda …', 'Menyampaikan dengan sopan bahwa semua berkas akta diproses sesuai urutan masuk tanpa pengecualian', 4, 'Memprosesnya lebih dulu karena hanya satu berkas dan pemohon lain tidak akan mengetahuinya', 1, 'Mengatakan akan melihat dulu kondisi antrean berkas hari ini sebelum menjanjikan apa pun kepadanya', 3, 'Meminta ia menghubungi atasan Anda karena hanya atasan yang berwenang mempercepat berkas', 2, 'Menjelaskan bahwa berkas diproses berurutan, lalu menunjukkan cara memantau status secara daring', 5, 'E (5): Adil dan tetap memberi solusi; A (4): Adil, tetapi tanpa solusi tambahan; C (3): Mengambang dan memberi harapan keliru; D (2): Melempar keputusan dan membuka celah perlakuan khusus; B (1): Diskriminatif dan merugikan pemohon lain.'),
  ('tkp-pelayanan', 'easy', 'Papan informasi alur layanan di kantor Anda sudah pudar sehingga warga sering bertanya hal yang sama. Anda …', 'Meminta warga membaca papan yang ada dengan lebih teliti sebelum bertanya', 1, 'Mencetak alur layanan pada lembar informasi sementara dan menaruhnya di meja layanan', 4, 'Mengusulkan pembaruan papan kepada atasan sekaligus versi digitalnya di kanal resmi', 5, 'Menyampaikan ke rekan bahwa perbaikan papan informasi adalah tugas bagian umum', 2, 'Menjelaskan alur layanan secara lengkap dan sabar kepada setiap warga yang datang bertanya', 3, 'C (5): Memperbaiki sistem dan menjangkau lebih banyak warga; B (4): Solutif dalam jangka pendek, belum memperbaiki papan; E (3): Melayani baik, tetapi tidak menyelesaikan akar masalah; D (2): Pasif dan melempar; A (1): Menyalahkan warga.'),
  ('tkp-pelayanan', 'hard', 'Lima menit sebelum jam layanan berakhir, masih ada tiga warga yang belum terlayani, sedangkan Anda punya janji pribadi setelah jam kerja. Sikap Anda …', 'Melayani ketiganya, dan bila tak sempat, berkoordinasi agar rekan melanjutkan hari itu', 5, 'Melayani ketiga warga itu sampai selesai dan mengabari bahwa Anda akan terlambat datang ke janji pribadi', 4, 'Menutup loket tepat waktu karena jam layanan sudah habis dan janji pribadi tidak bisa ditunda', 1, 'Meminta ketiganya datang kembali besok pagi karena jam layanan hampir habis', 2, 'Melayani satu warga, lalu mencatat dua warga lainnya untuk dipanggil pertama kali besok pagi', 3, 'A (5): Mengutamakan warga dengan pengaturan yang jelas; B (4): Mengutamakan warga, tetapi tanpa koordinasi bila waktu tidak cukup; E (3): Ada kepastian, tetapi sebagian warga harus kembali; D (2): Menunda tanpa usaha; C (1): Mengutamakan kepentingan pribadi.'),
  ('tkp-pelayanan', 'medium', 'Seorang warga memberikan masukan bahwa formulir layanan daring kantor Anda terlalu panjang dan membingungkan. Anda …', 'Menyarankan warga datang langsung ke kantor saja bila formulir daring menyulitkan', 2, 'Mengabaikan masukan itu karena warga lain tidak pernah mengeluh', 1, 'Berterima kasih, lalu mendampingi warga mengisi formulir itu sampai berkasnya terkirim', 4, 'Berterima kasih, mencatat rinciannya, dan meneruskannya ke pengelola dengan usulan penyederhanaan', 5, 'Menjelaskan bahwa setiap isian formulir sudah disusun sesuai ketentuan dan memang diperlukan untuk verifikasi', 3, 'D (5): Menghargai masukan dan mendorong perbaikan; C (4): Memenuhi kebutuhan saat ini, tanpa perbaikan formulir; E (3): Normatif dan cenderung defensif; A (2): Mengalihkan dari masalah; B (1): Meremehkan masukan publik.'),
  ('tkp-pelayanan', 'hard', 'Sistem antrean puskesmas tempat Anda bertugas memisahkan pasien BPJS dan pasien umum. Seorang pasien BPJS memprotes karena merasa pasien umum lebih cepat dilayani. Anda …', 'Menjelaskan secara terbuka bahwa kedua jalur punya loket berbeda dan lama tunggu bergantung pada jumlah pasien hari itu', 4, 'Mengatakan bahwa pasien BPJS memang wajar menunggu lebih lama', 1, 'Menyarankan pasien mendaftar sebagai pasien umum jika ingin dilayani lebih cepat', 2, 'Meminta maaf atas ketidaknyamanannya dan mempersilakan pasien menunggu sebentar lagi di ruang tunggu', 3, 'Mendengarkan, menjelaskan alur, mengecek data waktu tunggu, dan melaporkannya untuk evaluasi', 5, 'E (5): Menanggapi keluhan dengan data dan perbaikan; A (4): Transparan, tetapi dugaan ketimpangan tidak ditindaklanjuti; D (3): Sopan, tetapi tidak menyelesaikan; C (2): Mengabaikan hak peserta BPJS; B (1): Diskriminatif.'),
  ('tkp-pelayanan', 'medium', 'Anda petugas pelayanan di kantor samsat. Seorang warga datang dengan nada tinggi karena merasa dipersulit petugas sebelumnya. Anda …', 'Membela rekan Anda dan menegaskan bahwa prosedurnya memang begitu', 1, 'Meminta maaf atas nama kantor dan mempersilakan warga mengisi formulir pengaduan resmi', 4, 'Meminta warga menurunkan suaranya terlebih dahulu sebelum Anda melayaninya', 2, 'Menenangkan dan mendengarkannya, memeriksa berkas, lalu menyelesaikan urusannya', 5, 'Memanggil petugas sebelumnya agar menjelaskan langsung kepada warga alasan berkasnya belum bisa diproses', 3, 'D (5): Meredam emosi dan menyelesaikan urusan; B (4): Sopan dan menyediakan jalur aduan, tetapi urusan belum selesai; E (3): Mencari klarifikasi, tetapi berpotensi memperpanjang konflik; C (2): Defensif; A (1): Tidak mendengarkan dan memperkeruh suasana.'),
  ('tkp-pelayanan', 'easy', 'Seorang warga tunarungu datang ke loket layanan dan kesulitan berkomunikasi dengan Anda. Anda …', 'Meminta rekan di loket sebelah yang menanganinya agar antrean Anda tidak tertahan', 2, 'Berkomunikasi lewat tulisan atau gambar dengan sabar, dan memanggil juru bahasa isyarat bila ada', 5, 'Menuliskan beberapa pertanyaan singkat di kertas tentang keperluannya lalu memprosesnya sesuai jawaban', 4, 'Melewatkan antreannya karena pelayanannya memakan waktu lama', 1, 'Meminta warga datang bersama pendamping lain kali agar komunikasi lebih lancar', 3, 'B (5): Adaptif dan menjaga hak layanan; C (4): Berupaya berkomunikasi, tetapi kurang menyeluruh; E (3): Menunda dan membebani warga; A (2): Mengalihkan tanpa alasan kuat; D (1): Diskriminatif.'),
  ('tkp-pelayanan', 'hard', 'Atasan menetapkan target agar layanan legalisir selesai dalam satu jam. Pada hari tertentu, petugas penandatangan sedang dinas luar sehingga target tidak mungkin tercapai. Anda …', 'Memindai tanda tangan pejabat dari dokumen lama agar target tercapai', 1, 'Menunda penerimaan berkas sampai pejabat penandatangan kembali', 2, 'Memberi tahu kendala sejak awal, menawarkan ambil esok atau dikirim, dan mengusulkan pejabat pengganti', 5, 'Memberi tahu kendala kepada setiap pemohon sejak awal dan menjadwalkan pengambilan dokumen esok pagi', 4, 'Menerima berkas seperti biasa dan menjelaskan kendalanya hanya kepada pemohon yang bertanya', 3, 'C (5): Transparan, memberi pilihan, dan memperbaiki sistem; D (4): Jujur, tetapi solusi terbatas; E (3): Menimbulkan harapan keliru; B (2): Menghentikan layanan; A (1): Pemalsuan dan melanggar aturan.'),
  ('tkp-pelayanan', 'medium', 'Seorang pengguna layanan meninggalkan ulasan buruk tentang kantor Anda di aplikasi peta daring dengan beberapa informasi yang tidak tepat. Anda …', 'Memilah bagian ulasan yang memang benar tentang kekurangan layanan dan membahasnya dalam rapat evaluasi unit', 4, 'Membiarkannya karena ulasan di aplikasi peta tidak bisa dihapus', 3, 'Meminta pengelola kanal resmi menanggapi dengan klarifikasi sopan dan ajakan ke layanan pengaduan', 5, 'Meminta beberapa rekan menulis ulasan positif agar nilai kantor kembali naik', 2, 'Membalas dari akun pribadi bahwa pengulas telah menyebarkan informasi bohong', 1, 'C (5): Klarifikasi lewat kanal resmi dan membuka ruang dialog; A (4): Reflektif, tetapi informasi keliru belum diluruskan; B (3): Pasif; D (2): Manipulatif; E (1): Emosional dan tidak etis.'),
  ('tkp-jejaring', 'easy', 'Anda baru dimutasi ke dinas lain dan belum mengenal pegawai di unit-unit yang akan sering berkoordinasi dengan Anda. Langkah pertama Anda …', 'Berkenalan dengan pegawai unit lain ketika ada urusan pekerjaan yang mengharuskan Anda menghubungi mereka', 3, 'Fokus menyelesaikan pekerjaan sendiri dulu sampai benar-benar memahami tugas baru', 2, 'Meminta atasan memperkenalkan Anda kepada para kepala unit dalam rapat koordinasi bulanan berikutnya', 4, 'Mendatangi unit-unit terkait untuk berkenalan dan memahami alur koordinasinya', 5, 'Menunggu pegawai unit lain yang memperkenalkan diri kepada Anda', 1, 'D (5): Proaktif membangun relasi kerja; C (4): Baik, tetapi menunggu momen; A (3): Relasi terbatas pada kebutuhan; B (2): Menunda membangun jejaring; E (1): Pasif.'),
  ('tkp-jejaring', 'medium', 'Program posyandu di wilayah kerja puskesmas Anda kekurangan kader aktif. Anda …', 'Menjalankan posyandu seadanya dengan jumlah kader yang tersedia', 2, 'Mengusulkan kepada kepala puskesmas agar menambah tenaga kesehatan untuk membantu pelaksanaan posyandu', 3, 'Meminta kader yang masih aktif mengajak tetangga dan kerabatnya bergabung, lalu Anda membekali mereka', 4, 'Mengurangi jadwal posyandu sampai jumlah kader mencukupi', 1, 'Menggandeng kelurahan, PKK, dan tokoh masyarakat untuk merekrut dan melatih kader baru', 5, 'E (5): Membangun kolaborasi multipihak; C (4): Memanfaatkan jejaring yang ada, cakupan terbatas; B (3): Tepat jalur, belum melibatkan masyarakat; A (2): Pasrah pada keadaan; D (1): Mengorbankan layanan.'),
  ('tkp-jejaring', 'medium', 'Dalam rapat koordinasi lintas instansi, usulan Anda ditolak oleh perwakilan instansi lain dengan nada meremehkan. Sikap Anda …', 'Menanggapinya dengan nada yang sama agar tidak diremehkan', 1, 'Menanyakan alasannya dengan tenang, menjelaskan dasar usulan dengan data, dan terbuka pada masukan', 5, 'Diam dan mengikuti hasil rapat tanpa menanggapi sikap perwakilan instansi tersebut', 3, 'Menceritakan sikap orang tersebut kepada rekan-rekan sekantor setelah rapat', 2, 'Menerima keputusan rapat lalu menyiapkan data pendukung yang lebih kuat untuk rapat berikutnya', 4, 'B (5): Dialogis, berbasis data, kolaboratif; E (4): Dewasa, tetapi belum berdialog saat itu; C (3): Netral dan pasif; D (2): Bergunjing; A (1): Emosional dan merusak relasi.'),
  ('tkp-jejaring', 'hard', 'Anda diminta menyusun profil desa wisata dan membutuhkan foto serta data dari dinas pariwisata, yang kebetulan kepala bidangnya adalah teman kuliah Anda. Anda …', 'Mengirim surat permintaan data resmi ke dinas pariwisata dan menunggu jawabannya', 4, 'Meminta teman Anda mengirim seluruh arsip dinas agar Anda bisa memilih sendiri', 1, 'Mengirim permintaan resmi, lalu menghubungi teman Anda untuk mempercepat teknis pengirimannya', 5, 'Mengumpulkan foto dan data desa wisata dari berbagai situs internet', 2, 'Meminta data langsung kepada teman Anda melalui pesan pribadi karena prosesnya jauh lebih cepat', 3, 'C (5): Memanfaatkan relasi secara sah dan tetap prosedural; A (4): Prosedural, tetapi kurang memanfaatkan jejaring; E (3): Cepat, tetapi melewati jalur resmi; D (2): Menghindari koordinasi, akurasi diragukan; B (1): Berlebihan dan berpotensi menyalahi aturan data.'),
  ('tkp-jejaring', 'easy', 'Rekan dari bidang lain meminta bantuan Anda memahami aplikasi pelaporan keuangan yang sudah Anda kuasai. Anda …', 'Memberikan nomor kontak bagian TI agar ia bisa bertanya langsung kepada pengelola aplikasi', 3, 'Menolak karena membantu bidang lain bukan tanggung jawab Anda', 1, 'Menjelaskan langkah-langkah pokok aplikasi itu secara singkat kepadanya saat jam istirahat siang', 4, 'Meluangkan waktu menjelaskan langkahnya dan membagikan catatan panduan Anda', 5, 'Menundanya sampai minggu depan karena pekerjaan Anda sendiri masih menumpuk', 2, 'D (5): Berbagi pengetahuan secara tuntas; C (4): Membantu, tetapi terbatas; A (3): Mengarahkan, tanpa membantu langsung; E (2): Menghindar; B (1): Tidak kolaboratif.'),
  ('tkp-jejaring', 'medium', 'Anda ketua tim kegiatan sosialisasi program. Seorang anggota tim jarang menyampaikan pendapat dalam rapat padahal Anda tahu ia memiliki ide bagus. Anda …', 'Menanyakan idenya secara pribadi setelah rapat, lalu menyampaikannya ke tim atas namanya', 4, 'Membiarkannya tetap diam di rapat karena ia selalu menyelesaikan tugas-tugasnya dengan baik dan tepat waktu', 3, 'Memakai idenya dan menyampaikannya sebagai ide tim tanpa menyebut namanya', 2, 'Menegurnya di depan tim agar lebih aktif berbicara', 1, 'Memberinya kesempatan bicara di rapat dan memintanya memimpin bagian sesuai keahliannya', 5, 'E (5): Membuka ruang kontribusi; A (4): Menghargai, tetapi tidak membangun keberaniannya di forum; B (3): Netral; C (2): Tidak menghargai kontribusi; D (1): Mempermalukan.'),
  ('tkp-jejaring', 'hard', 'Instansi Anda dan instansi mitra sama-sama mengumpulkan data penerima bantuan di wilayah yang sama, sehingga warga didata dua kali. Sebagai staf pelaksana Anda …', 'Menghubungi langsung rekan pelaksana di instansi mitra untuk menyamakan jadwal pendataan', 4, 'Menyarankan warga menolak didata oleh petugas instansi mitra', 2, 'Melaporkan temuan beserta datanya kepada atasan dan mengusulkan rapat koordinasi berbagi data', 5, 'Tetap melakukan pendataan sesuai rencana kerja instansi sendiri sambil mencatat warga yang sudah didata', 3, 'Meminta salinan data instansi mitra secara informal lalu menyalinnya', 1, 'C (5): Berbasis data, sesuai peran, mendorong sinergi; A (4): Proaktif, tetapi melampaui jalur koordinasi resmi; D (3): Patuh rencana, tetapi duplikasi berlanjut; B (2): Merusak relasi antarinstansi; E (1): Melanggar tata kelola data.'),
  ('tkp-jejaring', 'medium', 'Proyek bersama antara kantor Anda dan sebuah universitas telah selesai. Langkah Anda selanjutnya …', 'Mengirim surat ucapan terima kasih resmi kepada rektor dan tim peneliti universitas atas kontribusinya', 4, 'Menyerahkan laporan akhir kepada atasan dan menutup administrasi proyek sesuai ketentuan', 3, 'Tidak berkomunikasi lagi dengan pihak universitas karena proyek sudah selesai', 2, 'Mengklaim hasil proyek sebagai capaian kantor sendiri', 1, 'Menyusun laporan bersama, mengapresiasi mitra, dan menjaga komunikasi untuk kerja sama berikutnya', 5, 'E (5): Memelihara jejaring jangka panjang; A (4): Sopan dan formal, tanpa tindak lanjut; B (3): Tuntas secara administratif saja; C (2): Relasi diputus; D (1): Mengabaikan kontribusi mitra.'),
  ('tkp-jejaring', 'easy', 'Anda melihat dua rekan satu tim saling diam karena salah paham soal pembagian tugas. Anda …', 'Menyarankan masing-masing rekan berbicara langsung satu sama lain', 4, 'Menyampaikan kepada ketua tim bahwa ada salah paham soal pembagian tugas di antara keduanya', 3, 'Mengajak keduanya duduk bersama untuk meluruskan pembagian tugas secara terbuka', 5, 'Memihak rekan yang lebih dekat dengan Anda karena Anda lebih memahami sudut pandangnya', 1, 'Tidak ikut campur karena urusan mereka bukan urusan Anda', 2, 'C (5): Menjadi penengah yang solutif; A (4): Mendorong dialog, tanpa memfasilitasi; B (3): Tepat jalur, kurang inisiatif; E (2): Pasif; D (1): Memperuncing konflik.'),
  ('tkp-jejaring', 'hard', 'Anda diundang menjadi narasumber di forum komunitas warga tentang program dinas, tetapi waktunya bersamaan dengan tenggat laporan internal yang hampir selesai. Anda …', 'Menuntaskan laporan lebih awal atau meminta perpanjangan singkat, lalu hadir mewakili dinas', 5, 'Hadir di forum warga dan menyelesaikan laporan sesudahnya meskipun akan terlambat dari tenggat', 3, 'Menolak undangan karena laporan internal lebih mendesak', 2, 'Tidak menanggapi undangan forum tersebut karena waktunya bertabrakan dengan tenggat laporan', 1, 'Mengusulkan agar rekan yang juga menguasai materi hadir menggantikan Anda di forum', 4, 'A (5): Menyeimbangkan tugas internal dan relasi publik; E (4): Forum tetap terlayani, peluang berjejaring dilepas; B (3): Mengutamakan relasi, tenggat dilanggar tanpa komunikasi; C (2): Melewatkan kesempatan melayani publik; D (1): Tidak sopan dan merusak relasi.'),
  ('tkp-jejaring', 'medium', 'Anda bertugas di kantor desa dan sebuah perusahaan swasta menawarkan program tanggung jawab sosial untuk perbaikan sarana air bersih. Anda …', 'Menyambut tawaran itu dan meminta perusahaan mengajukan proposal resmi kepada kepala desa untuk dibahas', 4, 'Melapor ke kepala desa, menyiapkan data kebutuhan warga, dan memastikan kerja sama tertulis', 5, 'Meminta bantuan disalurkan ke rekening pribadi Anda agar cepat', 1, 'Menyerahkan sepenuhnya urusan tawaran itu kepada kepala desa tanpa terlibat lebih jauh', 3, 'Menolak tawaran karena khawatir ada kepentingan tersembunyi', 2, 'B (5): Kolaboratif, berbasis kebutuhan, dan akuntabel; A (4): Terbuka dan prosedural, tetapi kurang aktif; D (3): Pasif; E (2): Menutup peluang tanpa menimbang; C (1): Menyalahgunakan wewenang.'),
  ('tkp-jejaring', 'easy', 'Grup percakapan kerja lintas instansi yang Anda ikuti sering sepi, padahal banyak informasi penting yang perlu dibagikan. Anda …', 'Rutin membagikan informasi relevan dan mengajak anggota lain berbagi perkembangan', 5, 'Membisukan notifikasi grup karena jarang ada pesan penting', 2, 'Membagikan informasi kegiatan dari instansi Anda setiap kali ada yang penting bagi instansi lain', 4, 'Keluar dari grup karena dianggap tidak berguna', 1, 'Membaca setiap informasi yang masuk dengan saksama tanpa memberi tanggapan', 3, 'A (5): Menghidupkan jejaring komunikasi; C (4): Berkontribusi seperlunya; E (3): Pasif; B (2): Menjauh dari jejaring; D (1): Memutus jejaring.'),
  ('tkp-jejaring', 'hard', 'Anda dan rekan dari instansi lain ditugasi menyusun kajian bersama. Rekan tersebut ingin memakai metode yang menurut Anda kurang tepat, sementara tenggat semakin dekat. Anda …', 'Mengikuti metode rekan sambil menuliskan catatan keterbatasannya di akhir laporan', 4, 'Mengerjakan bagian Anda dengan metode sendiri tanpa diskusi', 2, 'Meminta atasan dari masing-masing instansi untuk memutuskan metode mana yang akan dipakai', 3, 'Membandingkan kedua metode dengan data, lalu menyepakati yang paling sesuai tujuan kajian', 5, 'Menolak melanjutkan kajian bersama rekan tersebut', 1, 'D (5): Dialog objektif berorientasi tujuan; A (4): Menjaga relasi dan transparan, tanpa mencari titik temu; C (3): Eskalasi terlalu dini; B (2): Tidak kolaboratif, hasil tidak padu; E (1): Merusak kerja sama.'),
  ('tkp-jejaring', 'medium', 'Kepala sekolah meminta Anda, guru baru, ikut serta dalam musyawarah guru mata pelajaran tingkat kabupaten. Anda …', 'Hadir tepat waktu dan mengikuti seluruh rangkaian kegiatan musyawarah sampai selesai', 3, 'Hadir aktif, berbagi pengalaman, dan menjalin komunikasi dengan guru sekolah lain', 5, 'Hadir, mencatat seluruh materi dengan rapi, lalu membagikan rangkumannya kepada rekan guru di sekolah', 4, 'Meminta guru senior menggantikan karena Anda masih baru dan merasa belum pantas berbicara di forum kabupaten', 1, 'Hadir pada sesi pembukaan lalu kembali ke sekolah karena khawatir kelas ditinggalkan terlalu lama', 2, 'B (5): Memanfaatkan forum untuk jejaring dan peningkatan mutu; C (4): Bermanfaat bagi sekolah, tetapi kurang membangun relasi; A (3): Memenuhi tugas saja; E (2): Setengah hati; D (1): Menghindar dari kesempatan.'),
  ('tkp-sosbud', 'easy', 'Anda ditempatkan sebagai bidan desa di daerah yang memiliki tradisi pantangan makanan tertentu bagi ibu hamil, padahal makanan itu bergizi. Sikap Anda …', 'Memahami alasan tradisi, lalu berdialog dengan tokoh adat untuk menawarkan alternatif bergizi', 5, 'Membiarkan tradisi itu berjalan dan memberikan vitamin tambahan kepada setiap ibu hamil saat pemeriksaan', 3, 'Meminta ibu hamil mengabaikan pantangan tersebut demi kesehatan bayinya', 2, 'Menyatakan di depan warga bahwa tradisi itu tidak masuk akal', 1, 'Memberikan penyuluhan gizi rutin kepada ibu hamil di posyandu dengan contoh menu lokal', 4, 'A (5): Menghormati budaya sambil menjaga kesehatan; E (4): Edukatif, tetapi belum melibatkan tokoh adat; B (3): Kompromi tanpa edukasi; C (2): Memaksakan tanpa memahami; D (1): Merendahkan budaya.'),
  ('tkp-sosbud', 'medium', 'Di kantor Anda ada rekan yang menjalankan ibadah puasa, sedangkan Anda tidak. Panitia berencana menggelar rapat makan siang. Anda …', 'Menganggap rekan yang berpuasa bisa memilih tidak hadir pada rapat tersebut', 2, 'Mengusulkan rapat di luar jam makan atau konsumsi dibagikan dalam kemasan untuk dibawa', 5, 'Menawari rekan yang berpuasa untuk ikut makan bersama', 1, 'Mengikuti rencana panitia dan makan dengan sopan tanpa mengomentari rekan yang berpuasa', 3, 'Mengingatkan panitia secara pribadi bahwa ada beberapa rekan yang sedang berpuasa pada hari rapat itu', 4, 'B (5): Menghormati dan inklusif; E (4): Peka, tetapi tanpa usulan solusi; D (3): Netral; A (2): Kurang empatik; C (1): Tidak menghormati keyakinan.'),
  ('tkp-sosbud', 'hard', 'Anda ASN asal kota yang ditempatkan di kantor distrik di daerah terpencil. Warga terbiasa datang tanpa janji dan berbincang lama sebelum menyampaikan urusan, sehingga pekerjaan Anda sering tertunda. Anda …', 'Memasang pengumuman di pintu kantor bahwa setiap tamu wajib membuat janji terlebih dahulu', 2, 'Menerima tamu dengan sopan, tetapi segera mengarahkan pembicaraan ke urusan pokok agar waktu tidak terbuang', 3, 'Menerima tamu dengan ramah, sambil menyosialisasikan jadwal layanan lewat tokoh masyarakat', 5, 'Tetap meladeni setiap tamu dengan ramah dan menyelesaikan pekerjaan dengan lembur setiap sore', 4, 'Meminta penjaga kantor membatasi tamu yang datang', 1, 'C (5): Adaptif sekaligus menata kerja; D (4): Menghormati budaya, tetapi tidak berkelanjutan; B (3): Efisien, tetapi kurang peka budaya; A (2): Kaku dan mengabaikan kebiasaan lokal; E (1): Menjauh dari masyarakat.'),
  ('tkp-sosbud', 'easy', 'Seorang siswa di kelas Anda sering diejek teman-temannya karena logat bahasanya berbeda. Sebagai guru Anda …', 'Memanggil siswa-siswa yang mengejek ke ruang guru untuk dinasihati tentang pentingnya saling menghargai', 4, 'Ikut tersenyum agar suasana kelas tetap santai', 1, 'Menyarankan siswa yang diejek pelan-pelan menyesuaikan logatnya supaya lebih mudah diterima teman', 3, 'Membiarkannya karena menganggap itu candaan wajar anak-anak', 2, 'Menegur pengejek dengan bijak, mengajak kelas menghargai keberagaman, dan menyemangati korban', 5, 'E (5): Menghentikan perundungan dan mendidik; A (4): Tepat, tetapi tanpa pemulihan korban; C (3): Menyalahkan korban; D (2): Abai; B (1): Melanggengkan ejekan.'),
  ('tkp-sosbud', 'medium', 'Warga kampung tempat Anda tinggal mengadakan kerja bakti setiap Minggu pagi, waktu yang biasanya Anda gunakan untuk beristirahat. Anda …', 'Tidak ikut karena hari Minggu adalah hak istirahat setelah sepekan bekerja', 2, 'Ikut kerja bakti secara rutin dan memindahkan waktu istirahat ke hari lain', 5, 'Ikut kerja bakti beberapa kali dalam sebulan sambil tetap menjaga waktu istirahat di minggu lainnya', 4, 'Mengeluhkan suara bising kerja bakti kepada ketua RT', 1, 'Menyumbang makanan dan minuman untuk warga yang kerja bakti sebagai pengganti tidak ikut', 3, 'B (5): Berbaur dan peduli lingkungan; C (4): Berpartisipasi, tetapi terbatas; E (3): Peduli, tetapi tidak berbaur; A (2): Mementingkan diri; D (1): Tidak menghargai kegiatan bersama.'),
  ('tkp-sosbud', 'hard', 'Anda petugas di kantor urusan kependudukan. Seorang warga dari komunitas adat meminta kolom agama di dokumennya diisi sesuai kepercayaannya. Anda …', 'Melayani sesuai ketentuan pencatatan penghayat kepercayaan dan menjelaskan prosedurnya dengan hormat', 5, 'Menyarankan warga memilih salah satu agama yang tercantum agar prosesnya lebih mudah dan cepat', 2, 'Meminta warga menunggu sementara Anda menanyakan ketentuan pencatatan penghayat kepada atasan', 4, 'Meminta warga melengkapi surat keterangan dari organisasi kepercayaannya tanpa menjelaskan dasar aturannya', 3, 'Menolak permintaan karena kepercayaan tersebut tidak umum', 1, 'A (5): Melayani hak warga sesuai aturan dan dengan hormat; C (4): Hati-hati, tetapi menunda layanan; D (3): Prosedural, tetapi kurang informatif; B (2): Mengabaikan hak warga; E (1): Diskriminatif.'),
  ('tkp-sosbud', 'medium', 'Tetangga Anda yang berbeda agama akan menggelar hajatan dan meminta bantuan menyiapkan tempat. Anda …', 'Menolak secara halus dengan alasan sedang banyak pekerjaan di rumah', 2, 'Menolak karena acara itu bukan dari agama Anda', 1, 'Datang membantu memasang tenda dan menata kursi pada pagi hari sebelum berangkat ke kantor', 4, 'Membantu menyiapkan tempat dan menjaga kelancaran acara sesuai batas keyakinan masing-masing', 5, 'Meminjamkan meja, kursi, dan peralatan lain yang dibutuhkan tanpa ikut terlibat dalam persiapan', 3, 'D (5): Bergotong royong dan toleran; C (4): Membantu, tetapi terbatas; E (3): Peduli, tanpa terlibat; A (2): Menjaga jarak; B (1): Intoleran.'),
  ('tkp-sosbud', 'easy', 'Anda baru pindah tugas ke daerah yang makanan khasnya sangat berbeda dari selera Anda. Saat dijamu warga, Anda …', 'Mengambil sedikit makanan ke piring tetapi tidak memakannya sampai acara selesai', 3, 'Menolak jamuan dengan alasan sudah makan sebelum berangkat', 2, 'Mencicipi sedikit setiap hidangan yang disajikan lalu berterima kasih kepada tuan rumah atas jamuannya', 4, 'Mencicipi dengan sopan dan menunjukkan minat mengenal kuliner setempat', 5, 'Mengatakan bahwa makanan itu tidak cocok dengan selera Anda', 1, 'D (5): Menghormati tuan rumah dan adaptif; C (4): Sopan, cukup baik; A (3): Kurang menghargai; B (2): Menjaga jarak; E (1): Merendahkan budaya.'),
  ('tkp-sosbud', 'hard', 'Di daerah tempat Anda bertugas terjadi perselisihan antara warga pendatang dan warga asli soal batas lahan. Kedua pihak meminta Anda, petugas kantor desa, memihak. Anda …', 'Mendukung warga asli karena mereka lebih lama tinggal di sana', 1, 'Menghindari kedua pihak agar tidak dianggap memihak salah satu', 2, 'Bersikap netral dan menyarankan kedua pihak menempuh jalur hukum atau pertanahan', 4, 'Bersikap netral, mencatat keterangan kedua pihak, dan bersama kepala desa memfasilitasi musyawarah', 5, 'Melaporkan perselisihan tersebut kepada kepala desa dan menunggu keputusan darinya', 3, 'D (5): Netral, berbasis data, mengutamakan musyawarah; C (4): Tepat secara aturan, tetapi kurang mendamaikan; E (3): Melapor, tetapi pasif; B (2): Menghindar; A (1): Memihak dan diskriminatif.'),
  ('tkp-sosbud', 'medium', 'Rekan kerja Anda adalah penyandang disabilitas netra dan kesulitan membaca dokumen cetak yang dibagikan dalam rapat. Anda …', 'Menyarankan ia tidak perlu mengikuti rapat yang banyak memakai dokumen cetak', 1, 'Menganggap ia bisa meminta bantuan pendamping atau keluarganya', 2, 'Duduk di sebelahnya selama rapat dan membacakan bagian-bagian penting dokumen yang sedang dibahas', 4, 'Menawarkan bantuan membacakan dokumen bila ia memintanya', 3, 'Mengusulkan materi rapat juga dibagikan dalam format digital yang terbaca pembaca layar', 5, 'E (5): Akomodasi wajar yang berkelanjutan; C (4): Membantu langsung, tetapi belum sistematis; D (3): Menunggu diminta; B (2): Abai; A (1): Diskriminatif.'),
  ('tkp-sosbud', 'easy', 'Sebuah keluarga di lingkungan Anda tertimpa musibah kebakaran rumah. Anda …', 'Membantu kebutuhan mendesak dan mengoordinasikan bantuan warga lewat RT agar tepat sasaran', 5, 'Mengunggah foto rumah yang terbakar ke media sosial agar banyak orang tahu', 1, 'Mengirim pesan simpati kepada keluarga tersebut', 2, 'Mengantarkan pakaian, selimut, dan makanan siap saji dari rumah Anda kepada keluarga tersebut pada hari itu juga', 4, 'Menyumbang bila nanti ada penggalangan dana dari pengurus RT', 3, 'A (5): Bertindak nyata dan terkoordinasi; D (4): Peduli secara pribadi; E (3): Pasif menunggu; C (2): Simpati tanpa tindakan; B (1): Tidak empatik.'),
  ('tkp-sosbud', 'hard', 'Anda menjadi ketua panitia peringatan Hari Kemerdekaan di kantor. Sebagian pegawai mengusulkan lomba yang menurut sebagian pegawai lain kurang pantas menurut nilai budaya mereka. Anda …', 'Tetap mengadakan lomba dan mempersilakan pegawai yang keberatan untuk tidak ikut', 2, 'Mengganti lomba itu dengan lomba tujuh belasan yang lebih umum tanpa diskusi panjang', 4, 'Menganggap keberatan itu berlebihan karena lomba tersebut sudah biasa diadakan setiap tahun', 1, 'Mengadakan pemungutan suara di antara pegawai dan mengikuti pilihan lomba dengan suara terbanyak', 3, 'Mendengarkan kedua pihak, lalu memodifikasi lomba agar semua pegawai nyaman mengikutinya', 5, 'E (5): Inklusif dan musyawarah; B (4): Menghindari konflik, tetapi kurang partisipatif; D (3): Demokratis, tetapi bisa mengabaikan kelompok kecil; A (2): Tidak inklusif; C (1): Meremehkan perbedaan.'),
  ('tkp-sosbud', 'medium', 'Anda ditugaskan mendata warga untuk program bantuan di permukiman yang sebagian warganya hanya bisa berbahasa daerah. Anda …', 'Meminta anak-anak warga yang bisa berbahasa Indonesia menerjemahkan pertanyaan kepada orang tuanya', 4, 'Mengisi data warga yang sulit diajak bicara berdasarkan pengamatan Anda dan keterangan tetangga di sekitarnya', 2, 'Mengajak kader setempat sebagai pendamping bahasa dan mempelajari ungkapan dasar agar data akurat', 5, 'Mendata warga yang bisa berbahasa Indonesia terlebih dahulu, lalu menjadwalkan sisanya belakangan', 3, 'Melewatkan warga yang sulit diajak berkomunikasi', 1, 'C (5): Adaptif dan menjamin akurasi; A (4): Kreatif, tetapi kurang tepat untuk data resmi; D (3): Parsial; B (2): Tidak akurat; E (1): Diskriminatif.'),
  ('tkp-sosbud', 'easy', 'Ketika berdiskusi di grup percakapan kantor, seorang anggota mengirimkan stiker yang merendahkan suku tertentu. Anda …', 'Ikut membalas dengan stiker lucu serupa agar suasana grup tetap cair dan tidak tegang', 1, 'Tidak menanggapi stiker tersebut dan melanjutkan diskusi pekerjaan seperti biasa', 3, 'Mengingatkan di grup dengan santun bahwa stiker itu bisa menyinggung rekan lain', 5, 'Keluar dari grup karena tidak nyaman dengan isinya', 2, 'Mengirim pesan pribadi kepada pengirim stiker agar ia tidak mengulanginya karena bisa menyinggung rekan', 4, 'C (5): Menjaga harmoni secara santun dan terbuka; E (4): Santun, tetapi grup tidak mendapat penegasan; B (3): Pasif; D (2): Menghindar; A (1): Ikut merendahkan.'),
  ('tkp-tik-dasar', 'easy', 'Instansi Anda mulai menerapkan tanda tangan elektronik untuk surat dinas. Anda belum pernah menggunakannya. Anda …', 'Tetap mencetak dan menandatangani surat secara manual', 1, 'Mempelajari panduan resmi, mencobanya, dan berbagi tips dengan rekan yang kesulitan', 5, 'Menggunakan tanda tangan elektronik hanya untuk surat yang memang diwajibkan memakai cara itu', 3, 'Mengikuti sosialisasi tanda tangan elektronik dengan saksama lalu langsung menerapkannya pada surat berikutnya', 4, 'Meminta rekan yang sudah mahir membantu setiap kali Anda harus menandatangani surat', 2, 'B (5): Adaptif dan berbagi; D (4): Mau belajar, tetapi kurang inisiatif berbagi; C (3): Sebatas kewajiban; E (2): Bergantung pada orang lain; A (1): Menolak perubahan.'),
  ('tkp-tik-dasar', 'medium', 'Anda menerima pesan WhatsApp dari nomor tak dikenal berisi file berekstensi .apk dengan judul "Surat Undangan Rapat Dinas". Anda …', 'Tidak membuka file, menghapus pesannya, lalu memblokir dan melaporkan nomor itu sebagai spam', 4, 'Membuka file karena judulnya terkait pekerjaan dan khawatir melewatkan undangan rapat penting', 1, 'Mengunduh file tersebut lalu memindainya dengan antivirus sebelum dibuka', 2, 'Tidak membuka file, mengecek undangan lewat kanal resmi, lalu melapor dan memperingatkan rekan', 5, 'Membalas pesan untuk menanyakan siapa pengirimnya dan dari instansi mana undangan itu berasal', 3, 'D (5): Waspada, verifikasi, lapor, dan edukasi; A (4): Melindungi diri sendiri, rekan belum diperingatkan; E (3): Berinteraksi dengan pelaku; C (2): Tetap berisiko; B (1): Berpotensi menyerahkan perangkat kepada peretas.'),
  ('tkp-tik-dasar', 'medium', 'Laptop kantor yang Anda gunakan menyimpan data kesehatan pasien. Anda sering membawanya pulang untuk menyelesaikan laporan. Langkah Anda …', 'Menyimpan laptop di lemari terkunci di rumah ketika tidak sedang digunakan untuk bekerja', 3, 'Menyalin data ke flashdisk pribadi agar lebih praktis dibawa', 1, 'Membiarkan anak memakai laptop untuk tugas sekolah asalkan folder data pasien tidak dibuka sama sekali', 2, 'Memastikan laptop berkata sandi, data terenkripsi sesuai kebijakan, dan tidak dipakai keluarga', 5, 'Selalu mengunci layar laptop dengan kata sandi kuat setiap kali meninggalkannya', 4, 'D (5): Menjaga kerahasiaan data sesuai aturan; E (4): Perlindungan dasar; A (3): Perlindungan fisik saja; C (2): Ceroboh terhadap data sensitif; B (1): Menyebarkan data tanpa kontrol.'),
  ('tkp-tik-dasar', 'easy', 'Kantor kelurahan Anda membuka layanan pengaduan melalui aplikasi, tetapi jumlah pengaduan yang masuk masih sangat sedikit. Anda …', 'Menunggu warga terbiasa dengan sendirinya seiring waktu', 3, 'Mengusulkan sosialisasi lewat RT/RW dan media resmi, serta mendampingi warga mencobanya', 5, 'Mencetak poster berisi kode QR dan cara memakai aplikasi pengaduan, lalu memasangnya di papan pengumuman kantor', 4, 'Menganggap warga memang lebih suka datang langsung ke kantor untuk mengadu', 2, 'Mengusulkan aplikasi dihentikan karena tidak efektif', 1, 'B (5): Mendorong pemanfaatan e-government; C (4): Informatif, tetapi jangkauan terbatas; A (3): Pasif; D (2): Menyerah pada keadaan; E (1): Menolak inovasi.'),
  ('tkp-tik-dasar', 'hard', 'Atasan meminta Anda segera membagikan rekap data penerima bantuan ke grup percakapan kecamatan agar cepat sampai, padahal rekap itu memuat NIK dan alamat warga. Anda …', 'Mengirim berkas lengkap itu lewat pesan pribadi kepada camat saja, bukan ke seluruh anggota grup kecamatan', 3, 'Menghapus kolom NIK dan alamat lalu langsung membagikan rekap ke grup tanpa berkonsultasi', 4, 'Menyampaikan risikonya ke atasan dan mengusulkan kanal resmi atau rekap tanpa data pribadi', 5, 'Membagikannya ke grup dengan pesan agar anggota tidak menyebarluaskan', 2, 'Langsung membagikan rekap sesuai perintah atasan', 1, 'C (5): Mendukung tujuan atasan sekaligus melindungi data; B (4): Melindungi data, tetapi belum berkoordinasi dengan atasan; A (3): Mempersempit penerima, tetapi tetap lewat kanal tidak resmi; D (2): Risiko kebocoran tetap tinggi; E (1): Mengabaikan perlindungan data pribadi.'),
  ('tkp-tik-dasar', 'medium', 'Rekan kerja Anda selalu kesulitan saat menggunakan aplikasi pengelolaan kepegawaian dan sering meminta Anda mengerjakannya. Anda …', 'Membuatkan catatan langkah-langkah bergambar yang bisa ia ikuti sendiri setiap kali memakai aplikasi tersebut', 4, 'Selalu mengerjakannya memakai akun rekan agar urusan cepat selesai', 2, 'Mendampinginya mengerjakan sendiri langkah demi langkah sampai ia mampu mandiri', 5, 'Menolak dan menyuruhnya mencari tahu sendiri agar ia terbiasa belajar tanpa bergantung pada Anda', 1, 'Mengerjakannya sekali ini, lalu mengirimkan tautan video panduan resmi agar ia belajar sendiri', 3, 'C (5): Memberdayakan rekan; A (4): Membantu belajar, tanpa pendampingan; E (3): Membantu sebagian; B (2): Menciptakan ketergantungan dan berisiko akses; D (1): Tidak kolaboratif.'),
  ('tkp-tik-dasar', 'hard', 'Anda menemukan celah keamanan pada formulir daring layanan dinas yang memungkinkan siapa pun melihat data pemohon lain. Anda …', 'Membuka beberapa data pemohon lain dulu untuk memastikan celah itu benar ada sebelum melapor', 3, 'Mengunggah temuan itu ke media sosial agar segera diperbaiki', 1, 'Membiarkannya karena keamanan sistem adalah tugas tim TI', 2, 'Melaporkan temuan itu kepada atasan langsung dan meminta beliau meneruskannya kepada tim pengelola sistem dinas', 4, 'Segera melaporkan rinciannya ke pengelola sistem dan atasan tanpa menyebarkan cara memanfaatkannya', 5, 'E (5): Bertanggung jawab dan menjaga kerahasiaan; D (4): Tepat, tetapi tidak langsung ke pihak teknis; A (3): Melanggar privasi meski berniat menguji; C (2): Abai terhadap risiko; B (1): Membuka celah bagi pihak jahat dan mencoreng instansi.'),
  ('tkp-tik-dasar', 'easy', 'Kantor Anda mewajibkan penggantian kata sandi akun email dinas setiap tiga bulan. Anda …', 'Mengganti kata sandi dengan menambahkan satu angka di belakang kata sandi yang lama', 3, 'Mengganti dengan kata sandi kuat yang unik dan mengaktifkan verifikasi dua langkah', 5, 'Mengganti kata sandi tepat sesuai jadwal dengan kombinasi huruf besar, huruf kecil, dan angka', 4, 'Memakai kata sandi yang sama dengan akun media sosial agar mudah diingat', 2, 'Menunda penggantian kata sandi sampai akun terkunci karena khawatir lupa kata sandi yang baru', 1, 'B (5): Melebihi standar keamanan minimal; C (4): Patuh; A (3): Patuh secara formal, tetapi keamanannya lemah; D (2): Berisiko; E (1): Tidak disiplin.'),
  ('tkp-tik-dasar', 'medium', 'Anda diminta membuat konten informasi layanan untuk akun media sosial resmi puskesmas. Anda …', 'Menyusun konten akurat dan mudah dipahami dari sumber resmi, lalu meminta persetujuan atasan', 5, 'Membuat konten berdesain menarik dan berbahasa kekinian lalu langsung mengunggahnya', 4, 'Memakai foto pasien tanpa izin agar konten terlihat lebih nyata', 1, 'Menyalin konten dari akun puskesmas daerah lain dan hanya mengganti logo serta nama puskesmasnya', 3, 'Menunda pembuatan konten sampai ada pelatihan desain grafis', 2, 'A (5): Informatif, akurat, dan prosedural; B (4): Kreatif, tetapi tanpa verifikasi; D (3): Kurang orisinal dan berisiko tidak sesuai konteks; E (2): Pasif; C (1): Melanggar privasi.'),
  ('tkp-tik-dasar', 'hard', 'Sekolah tempat Anda mengajar menerapkan pembelajaran daring sebagian, tetapi beberapa siswa tidak memiliki gawai dan kuota. Anda …', 'Menyiapkan materi cetak dan jadwal pemakaian perangkat sekolah, serta menggalang dukungan komite', 5, 'Tetap melaksanakan pembelajaran daring dan memberi tugas susulan bagi yang tertinggal', 2, 'Mencatat siswa tanpa gawai sebagai tidak hadir karena aturan kehadiran daring berlaku untuk semua', 1, 'Menyiapkan materi cetak dan lembar tugas mingguan untuk siswa yang tidak memiliki gawai', 4, 'Meminta siswa tanpa gawai belajar bersama teman sekelas yang rumahnya berdekatan dan memiliki gawai', 3, 'A (5): Memadukan teknologi dengan pemerataan akses; D (4): Adil, tetapi tanpa solusi jangka panjang; E (3): Kreatif, tetapi bergantung pada orang lain; B (2): Mengabaikan kesenjangan; C (1): Diskriminatif.'),
  ('tkp-tik-dasar', 'medium', 'Anda melihat rekan kerja meninggalkan komputer dalam kondisi masih masuk ke aplikasi keuangan saat istirahat. Anda …', 'Memberi tahu rekan lain bahwa ia sering ceroboh dengan akunnya', 2, 'Melihat-lihat data di komputernya karena sudah terbuka', 1, 'Membiarkannya karena ia hanya pergi sebentar dan ruangan cukup aman', 3, 'Menunggu ia kembali dari istirahat lalu mengingatkannya agar selalu keluar dari aplikasi sebelum meninggalkan meja', 4, 'Mengunci layar komputernya, lalu mengingatkannya dengan sopan soal keamanan akun', 5, 'E (5): Melindungi data dan mengedukasi; D (4): Mengedukasi, tetapi risiko sempat terbuka; C (3): Abai; A (2): Bergunjing; B (1): Melanggar privasi.'),
  ('tkp-tik-dasar', 'easy', 'Unit Anda masih mencatat buku tamu secara manual sehingga rekap kunjungan bulanan memakan waktu lama. Anda …', 'Mengerjakan rekap kunjungan seperti biasa di akhir bulan dengan lebih teliti dan memeriksa ulang setiap angka', 3, 'Meminta rekan lain yang mengerjakan rekap bulanan karena Anda sedang sibuk', 2, 'Menghentikan pencatatan tamu karena merepotkan', 1, 'Menyalin catatan buku tamu ke lembar kerja komputer setiap sore agar rekap akhir bulan lebih cepat', 4, 'Mengusulkan buku tamu digital berbasis formulir resmi, lengkap dengan contoh rekap otomatisnya', 5, 'E (5): Inovatif dan efisien; D (4): Efisien sebagian; A (3): Rutin tanpa perbaikan; B (2): Melempar tugas; C (1): Mengabaikan administrasi.'),
  ('tkp-tik-dasar', 'hard', 'Aplikasi layanan baru dari pemerintah pusat dinilai lebih lambat daripada sistem lama buatan dinas Anda, sehingga sebagian rekan diam-diam tetap memakai sistem lama. Anda …', 'Tetap memakai aplikasi baru dan mengajak rekan yang masih memakai sistem lama untuk beralih', 4, 'Memakai aplikasi baru dan sistem lama secara bersamaan agar layanan tetap cepat sambil menunggu perbaikan', 3, 'Mengikuti rekan memakai sistem lama sampai aplikasi baru diperbaiki pusat', 2, 'Tetap memakai aplikasi baru, mencatat kendalanya, dan mengirimkannya sebagai masukan resmi', 5, 'Mengeluhkan aplikasi baru di media sosial pribadi', 1, 'D (5): Patuh kebijakan dan berkontribusi pada perbaikan; A (4): Patuh dan mengajak, tanpa umpan balik; B (3): Kerja ganda dan data tidak konsisten; C (2): Tidak patuh kebijakan; E (1): Tidak etis.'),
  ('tkp-tik-dasar', 'medium', 'Seorang warga meminta Anda mengirimkan formulir layanan melalui email pribadi Anda karena email kantor sering penuh. Anda …', 'Mengirim lewat email kantor atau tautan situs resmi, dan melapor agar kapasitas email diperbaiki', 5, 'Meminta warga datang langsung ke kantor untuk mengambil formulir cetak di loket', 3, 'Mengosongkan kotak masuk email kantor terlebih dahulu, lalu mengirimkan formulir itu kepada warga dari email resmi', 4, 'Mengirim dari email pribadi karena isinya hanya formulir kosong', 2, 'Memberi nomor WhatsApp pribadi agar warga bisa mengirim berkas apa pun langsung kepada Anda', 1, 'A (5): Memakai kanal resmi dan memperbaiki sistem; C (4): Tetap resmi, tetapi tanpa perbaikan sistem; B (3): Mempersulit warga; D (2): Praktis, tetapi keluar dari kanal resmi; E (1): Membuka risiko kebocoran data dan pungli.'),
  ('tkp-profesional', 'easy', 'Anda ditugaskan mengikuti pelatihan teknis selama tiga hari, padahal ada pekerjaan rutin yang harus berjalan. Anda …', 'Mengikuti pelatihan sambil mengerjakan pekerjaan rutin selama sesi', 1, 'Mengikuti pelatihan dengan serius sambil memantau pekerjaan rutin lewat telepon saat istirahat', 4, 'Mengikuti pelatihan dan menyelesaikan seluruh pekerjaan rutin yang tertunda setelah kembali ke kantor', 3, 'Meminta atasan mengirim rekan lain ke pelatihan agar pekerjaan rutin tidak terganggu', 2, 'Menyiapkan serah terima ke rekan yang ditunjuk, lalu mengikuti pelatihan dan berbagi hasilnya', 5, 'E (5): Tugas rutin tertangani dan diri berkembang; B (4): Bertanggung jawab, tetapi fokus belajar terbagi; C (3): Pekerjaan tertunda; D (2): Menghindari pengembangan diri; A (1): Tidak serius pada keduanya.'),
  ('tkp-profesional', 'medium', 'Laporan kegiatan yang Anda susun dikembalikan atasan dengan banyak coretan. Anda …', 'Memperbaiki seluruh laporan persis sesuai coretan dan menyerahkannya kembali hari itu juga', 4, 'Mempelajari catatan, menanyakan yang belum jelas, memperbaiki, dan menjadikannya acuan berikutnya', 5, 'Menyampaikan bahwa laporan sebelumnya juga memakai format yang sama', 1, 'Meminta contoh laporan yang pernah disetujui dari rekan lalu menyesuaikan laporan Anda dengan formatnya', 3, 'Memperbaikinya sambil menganggap atasan terlalu perfeksionis', 2, 'B (5): Menerima umpan balik dan belajar; A (4): Responsif, tetapi tanpa refleksi; D (3): Mencari jalan pintas; E (2): Setengah hati; C (1): Defensif.'),
  ('tkp-profesional', 'hard', 'Anda menjadi bendahara kegiatan. Menjelang pertanggungjawaban, ada selisih kecil karena satu kuitansi hilang. Rekan menyarankan membuat kuitansi pengganti dengan tanggal mundur. Anda …', 'Menolak kuitansi palsu, menelusuri bukti sah lain, dan melaporkan selisihnya apa adanya ke atasan', 5, 'Meminta surat keterangan resmi dari penjual sebagai pengganti kuitansi yang hilang', 4, 'Menunda penyerahan pertanggungjawaban sampai kuitansi yang hilang ditemukan', 2, 'Menutup selisih itu dengan uang pribadi agar laporan pertanggungjawaban tetap seimbang dan tidak dipersoalkan', 3, 'Mengikuti saran rekan karena nilai selisihnya kecil', 1, 'A (5): Jujur dan akuntabel; B (4): Solusi sah, tetapi tanpa pelaporan terbuka ke atasan; D (3): Niat baik, tetapi menutupi masalah; C (2): Menunda kewajiban; E (1): Pemalsuan dokumen.'),
  ('tkp-profesional', 'medium', 'Anda sering datang tepat waktu, tetapi sebagian besar rekan di unit Anda terbiasa datang terlambat. Sikap Anda …', 'Sesekali ikut datang terlambat agar tidak dianggap berbeda dari rekan-rekan satu unit', 2, 'Tetap tepat waktu, menyiapkan layanan pagi, dan mengajak rekan memulai kerja bersama', 5, 'Tetap datang tepat waktu setiap hari dan langsung bekerja tanpa memedulikan kebiasaan rekan-rekan', 4, 'Datang tepat waktu pada hari-hari ketika atasan juga hadir lebih pagi', 3, 'Ikut datang terlambat karena tidak ada yang menegur', 1, 'B (5): Disiplin dan memberi teladan; C (4): Disiplin, tetapi hanya untuk diri sendiri; D (3): Disiplin bersyarat; A (2): Terpengaruh lingkungan; E (1): Tidak disiplin.'),
  ('tkp-profesional', 'easy', 'Atasan memberi Anda tugas yang instruksinya kurang jelas. Anda …', 'Menanyakan langsung hal yang belum jelas, merangkum pemahaman, lalu segera mengerjakannya', 5, 'Bertanya kepada rekan yang pernah mengerjakan tugas serupa tentang maksud instruksi atasan', 3, 'Mengerjakan tugas sesuai pemahaman Anda, lalu meminta masukan atasan setelah separuh pekerjaan selesai', 4, 'Mengerjakan seadanya karena instruksinya tidak jelas', 1, 'Menunggu atasan menjelaskan kembali tugas tersebut', 2, 'A (5): Proaktif memastikan arah kerja; C (4): Berinisiatif, tetapi berisiko salah arah; B (3): Mencari informasi, belum tentu tepat; E (2): Pasif; D (1): Mengorbankan kualitas.'),
  ('tkp-profesional', 'hard', 'Anda ketua tim. Hasil kerja tim mendapat kritik keras dari pimpinan karena ada kesalahan data yang dibuat salah satu anggota. Anda …', 'Menjelaskan kepada pimpinan bahwa kesalahan berasal dari bagian yang dikerjakan anggota tertentu', 3, 'Memperbaiki data sendiri pada malam itu juga tanpa melibatkan anggota yang membuat kesalahan', 2, 'Mengakui kesalahan di hadapan pimpinan sebagai tanggung jawab tim dan meminta anggota memperbaikinya', 4, 'Memarahi anggota tersebut di depan seluruh tim', 1, 'Mengakui kesalahan sebagai tanggung jawab tim, memperbaikinya bersama anggota, dan menambah validasi silang', 5, 'E (5): Bertanggung jawab sebagai pemimpin dan memperbaiki proses; C (4): Bertanggung jawab, tetapi tanpa perbaikan proses; A (3): Jujur, tetapi melempar tanggung jawab; B (2): Menyelesaikan, tetapi tidak membina; D (1): Emosional dan mempermalukan.'),
  ('tkp-profesional', 'medium', 'Pada jam kerja, Anda mendapat telepon dari keluarga yang meminta Anda segera menyelesaikan urusan pribadi di bank. Anda …', 'Meminta keluarga menyelesaikan urusan bank itu sendiri karena Anda sedang bekerja', 3, 'Pergi sebentar tanpa izin karena urusannya hanya sebentar dan pekerjaan sedang longgar', 2, 'Mengajukan izin kepada atasan sesuai ketentuan dan memastikan tugas mendesak tertangani', 5, 'Menjadwalkan urusan bank itu pada jam istirahat siang dan memastikan bisa kembali ke kantor tepat waktu', 4, 'Pergi dan menitipkan presensi pulang kepada rekan', 1, 'C (5): Disiplin dan bertanggung jawab; D (4): Tepat bila waktunya cukup; A (3): Mengutamakan kerja, tetapi kurang empatik; B (2): Melanggar disiplin; E (1): Melanggar integritas.'),
  ('tkp-profesional', 'hard', 'Kepala bidang Anda meminta Anda membantu menyiapkan bahan kampanye seorang calon kepala daerah di luar jam kerja. Anda …', 'Membantu menyusun bahan tanpa mencantumkan nama Anda di dalamnya', 2, 'Membantu karena dikerjakan di luar jam kerja dan tidak memakai fasilitas kantor sama sekali', 1, 'Meminta waktu beberapa hari untuk memikirkan permintaan kepala bidang tersebut', 3, 'Menolak dengan santun dan menjelaskan bahwa ASN wajib netral, juga di luar jam kerja', 5, 'Menolak secara halus dengan alasan sedang banyak pekerjaan kantor dan urusan keluarga pada akhir pekan', 4, 'D (5): Menjaga netralitas dengan santun; E (4): Tidak terlibat, tetapi tidak menegaskan prinsip; C (3): Mengambang; A (2): Tetap melanggar netralitas; B (1): Melanggar netralitas.'),
  ('tkp-profesional', 'easy', 'Anda menyelesaikan pekerjaan lebih cepat dari jadwal. Anda …', 'Memeriksa kelengkapan hasil kerja lalu langsung menyerahkan laporannya kepada atasan hari itu juga', 4, 'Pulang lebih awal karena pekerjaan sudah selesai', 1, 'Memeriksa ulang hasilnya, melapor ke atasan, dan menawarkan bantuan untuk pekerjaan lain', 5, 'Bersantai di meja sampai jam pulang karena target sudah tercapai', 2, 'Menyimpan hasil kerja dan baru menyerahkannya kepada atasan tepat pada tanggal tenggat', 3, 'C (5): Teliti dan proaktif; A (4): Tuntas; E (3): Tepat waktu, kurang inisiatif; D (2): Tidak produktif; B (1): Melanggar jam kerja.'),
  ('tkp-profesional', 'medium', 'Anda diminta menjadi panitia pengadaan barang, dan salah satu calon penyedia memberi Anda bingkisan menjelang Lebaran. Anda …', 'Menolak bingkisan, dan bila telanjur diterima, melaporkannya ke unit pengendali gratifikasi', 5, 'Menerima bingkisan lalu membagikan isinya kepada rekan kantor agar tidak dinikmati sendiri', 3, 'Mengembalikan bingkisan itu kepada penyedia disertai ucapan terima kasih dan penjelasan singkat bahwa Anda panitia', 4, 'Menerimanya karena bingkisan Lebaran sudah menjadi tradisi', 2, 'Menerima dan mempertimbangkan penyedia itu saat penilaian', 1, 'A (5): Menghindari konflik kepentingan sesuai aturan; C (4): Tepat, tetapi tanpa pelaporan; B (3): Tetap menerima gratifikasi; D (2): Mengaburkan gratifikasi; E (1): Konflik kepentingan nyata.'),
  ('tkp-profesional', 'hard', 'Anda menyadari bahwa SOP pelayanan di unit Anda memuat satu tahapan yang sudah tidak relevan dan memperlambat layanan. Anda …', 'Melewati tahapan itu sendiri karena sudah tidak relevan', 1, 'Mengajak rekan sepakat melewati tahapan itu bersama-sama agar layanan lebih cepat dirasakan warga yang mengantre', 2, 'Tetap menjalankan seluruh tahapan SOP apa adanya karena perubahan bukan wewenang Anda', 3, 'Mengusulkan revisi SOP berbasis data dampak, sambil tetap menjalankan SOP yang berlaku', 5, 'Menyampaikan secara lisan kepada atasan saat rapat mingguan bahwa tahapan itu sebaiknya dihapus dari SOP', 4, 'D (5): Inovatif namun tetap patuh; E (4): Berinisiatif, tetapi kurang berbasis data; C (3): Patuh, tanpa perbaikan; B (2): Mengajak melanggar; A (1): Melanggar prosedur.'),
  ('tkp-profesional', 'medium', 'Rekan senior di unit Anda sering menyerahkan pekerjaannya kepada Anda dengan alasan Anda lebih muda. Anda …', 'Mengerjakannya bila ada waktu luang dan menolak dengan sopan ketika pekerjaan Anda sendiri sedang menumpuk', 4, 'Mengerjakan semua yang diserahkan agar hubungan dengan rekan senior tetap baik', 3, 'Mengeluhkan rekan senior tersebut kepada rekan-rekan lain di unit', 2, 'Mengerjakan pekerjaannya dengan asal-asalan agar ia tidak lagi menyerahkan tugasnya kepada Anda', 1, 'Membicarakannya dengan santun, mengusulkan pembagian kerja jelas, dan melibatkan atasan bila perlu', 5, 'E (5): Asertif dan solutif; A (4): Menyesuaikan, tanpa menyelesaikan akar masalah; B (3): Beban tidak adil dan menutupi masalah; C (2): Bergunjing; D (1): Merusak kualitas kerja.'),
  ('tkp-profesional', 'easy', 'Anda mendapat kesempatan mengikuti seleksi beasiswa tugas belajar dari instansi. Anda …', 'Tidak mendaftar karena merasa pekerjaan saat ini sudah nyaman', 2, 'Mendaftar bila ada rekan satu unit yang juga ikut mendaftar', 3, 'Bersiap sungguh-sungguh dan menyusun rencana agar ilmunya bermanfaat bagi unit kerja', 5, 'Mendaftar hanya agar mendapat tunjangan tambahan', 1, 'Mendaftar dan mengikuti seluruh tahapan seleksi sesuai jadwal', 4, 'C (5): Mengembangkan diri untuk organisasi; E (4): Berminat mengembangkan diri; B (3): Ikut-ikutan; A (2): Enggan berkembang; D (1): Motivasi pribadi semata.'),
  ('tkp-profesional', 'hard', 'Anda petugas lapangan dinas pertanian. Data produksi yang Anda kumpulkan jauh di bawah target, dan rekan menyarankan memakai angka perkiraan tahun lalu agar laporan tidak jelek. Anda …', 'Melaporkan data produksi apa adanya sesuai hasil pengumpulan di lapangan tanpa menambahkan analisis apa pun', 4, 'Melaporkan data apa adanya beserta analisis penyebab penurunan dan usulan tindak lanjut', 5, 'Mengambil data ulang di beberapa titik untuk memastikan keakuratan, meski laporan jadi terlambat dari jadwal', 3, 'Memakai angka perkiraan tahun lalu sesuai saran rekan', 1, 'Melaporkan data asli tetapi menonjolkan angka tahun lalu agar hasilnya tampak tidak terlalu buruk', 2, 'B (5): Jujur dan memberi nilai tambah; A (4): Jujur, tetapi tanpa analisis; C (3): Teliti, tetapi menunda pelaporan; E (2): Mengaburkan fakta; D (1): Manipulasi data.'),
  ('tkp-antiradikal', 'easy', 'Di media sosial Anda melihat unggahan viral yang menuduh kelompok agama tertentu sebagai dalang kerusuhan, tanpa sumber yang jelas. Anda …', 'Menyimpan unggahan untuk dibahas bersama teman-teman saat berkumpul nanti', 2, 'Mengabaikan unggahan tersebut dan melanjutkan membaca konten lain', 3, 'Membagikannya ke grup keluarga dengan keterangan "benarkah?" agar ada yang membantu mengecek', 1, 'Tidak membagikannya, mengecek ke sumber resmi atau kanal cek fakta, lalu melaporkan unggahan itu', 5, 'Tidak membagikannya dan menulis komentar yang mengajak warganet menahan diri sampai ada informasi resmi dari aparat', 4, 'D (5): Menangkal hoaks dan ujaran kebencian; E (4): Meredam, tetapi tanpa verifikasi atau pelaporan; B (3): Tidak ikut menyebarkan, tetapi pasif; A (2): Berpotensi menyebarkan; C (1): Tetap menyebarkan hoaks.'),
  ('tkp-antiradikal', 'medium', 'Seorang rekan kerja menolak mengikuti upacara bendera karena menurutnya menghormat bendera bertentangan dengan keyakinannya. Anda …', 'Membiarkannya karena keyakinan adalah urusan pribadi masing-masing pegawai', 3, 'Mengajaknya berdialog santun tentang makna upacara, dan melapor ke atasan bila ia tetap menolak', 5, 'Memaksanya ikut upacara di depan rekan lain agar ia sadar bahwa itu kewajiban bersama', 1, 'Menceritakan sikapnya kepada rekan-rekan lain di kantor', 2, 'Mengingatkannya secara pribadi bahwa mengikuti upacara bendera adalah kewajiban setiap ASN', 4, 'B (5): Edukasi bertahap dan jalur resmi; E (4): Tepat, tetapi kurang dialog; A (3): Pasif terhadap pelanggaran kewajiban ASN; D (2): Bergunjing; C (1): Konfrontatif.'),
  ('tkp-antiradikal', 'medium', 'Di grup alumni, seorang teman mengajak bergabung dalam organisasi yang menurutnya akan "menegakkan sistem baru" menggantikan Pancasila. Anda …', 'Menolak tegas namun santun, menegaskan Pancasila sebagai kesepakatan bangsa, dan melaporkannya', 5, 'Menolak ajakan itu dengan tegas dan mengingatkan teman tersebut agar tidak mengajak anggota grup alumni lainnya', 4, 'Meminta waktu untuk mempelajari lebih jauh visi organisasi tersebut sebelum memutuskan', 2, 'Ikut bergabung untuk sekadar melihat-lihat kegiatannya tanpa berniat terlibat lebih jauh', 1, 'Menolak ajakan secara halus tanpa memberikan alasan apa pun kepadanya', 3, 'A (5): Tegas, edukatif, dan melapor; B (4): Tegas, tetapi tanpa pelaporan; E (3): Tidak terlibat, tanpa edukasi; C (2): Membuka diri terhadap paham radikal; D (1): Berisiko terpapar.'),
  ('tkp-antiradikal', 'hard', 'Anda guru di sebuah SMA. Seorang siswa menulis esai yang membenarkan aksi kekerasan terhadap kelompok yang dianggapnya berbeda. Anda …', 'Memanggil siswa itu dan menasihatinya tentang toleransi dan ajaran agama yang menolak kekerasan', 4, 'Membacakan esai di depan kelas untuk mempermalukannya', 1, 'Berdiskusi untuk memahami sumber pemikirannya, meluruskannya, dan berkoordinasi dengan guru BK serta orang tua', 5, 'Memberi nilai rendah pada esai tersebut tanpa memberi penjelasan kepada siswa', 2, 'Melaporkan esai itu kepada kepala sekolah dan menyerahkan sepenuhnya penanganan siswa kepada pihak sekolah', 3, 'C (5): Pendampingan menyeluruh dan bijak; A (4): Edukatif, tetapi tanpa tindak lanjut; E (3): Tepat jalur, tetapi kurang terlibat; D (2): Menghukum tanpa mendidik; B (1): Mempermalukan dan berisiko memperkuat paham.'),
  ('tkp-antiradikal', 'easy', 'Kantor Anda mengadakan kegiatan penguatan wawasan kebangsaan. Sikap Anda …', 'Hadir hanya untuk mengisi daftar hadir, lalu kembali ke meja kerja', 2, 'Mengikuti sebagian sesi kegiatan karena masih ada pekerjaan yang harus diselesaikan', 3, 'Tidak hadir karena materinya dianggap sudah diketahui', 1, 'Mengikuti seluruh sesi kegiatan dengan tertib dari pembukaan sampai penutupan tanpa meninggalkan ruangan', 4, 'Mengikuti dengan aktif, berdiskusi, dan menerapkan nilai-nilainya di lingkungan kerja', 5, 'E (5): Antusias dan menginternalisasi; D (4): Patuh; B (3): Setengah hati; A (2): Formalitas; C (1): Meremehkan.'),
  ('tkp-antiradikal', 'hard', 'Seorang warga melapor kepada Anda, petugas kelurahan, bahwa tetangganya sering menerima tamu asing pada malam hari dan bersikap tertutup. Ia menduga tetangga itu terlibat jaringan teror. Anda …', 'Menyarankan pelapor menanyakan langsung kepada tetangganya siapa tamu-tamu tersebut', 2, 'Meminta pelapor mengamati tetangganya beberapa minggu lagi sebelum melapor kembali dengan bukti yang lebih kuat', 3, 'Mencatat laporan rinci, meneruskannya ke lurah dan Bhabinkamtibmas, dan meminta pelapor tidak menyebarkannya', 5, 'Mengajak warga mendatangi rumah tetangga tersebut', 1, 'Mencatat pokok laporan warga tersebut dan meneruskannya kepada lurah agar ditindaklanjuti sesuai kewenangan', 4, 'C (5): Menindaklanjuti lewat jalur resmi tanpa menghakimi; E (4): Tepat jalur, tetapi kurang rinci; B (3): Menunda dan berisiko; A (2): Berisiko memicu konflik; D (1): Main hakim sendiri.'),
  ('tkp-antiradikal', 'medium', 'Menjelang hari raya keagamaan, beredar seruan di grup warga agar tidak membeli dagangan dari pedagang beragama lain. Anda …', 'Tetap berbelanja di pedagang mana pun seperti biasa tanpa menanggapi seruan yang beredar di grup warga', 3, 'Ikut menyebarkan seruan tersebut agar warga seagama tetap solid menjelang hari raya', 1, 'Keluar dari grup warga karena isinya semakin tidak nyaman', 2, 'Mengingatkan di grup dengan santun bahwa seruan itu memecah belah, dan menyampaikannya ke pengurus', 5, 'Mengirim pesan pribadi kepada penyebar seruan agar ia menghapusnya karena bisa memecah belah warga', 4, 'D (5): Menjaga persatuan dan menggerakkan pengurus; E (4): Santun, tetapi tanpa penegasan di grup; A (3): Tidak terpengaruh, tetapi pasif; C (2): Menghindar; B (1): Intoleran.'),
  ('tkp-antiradikal', 'easy', 'Teman Anda membagikan berita bahwa pemerintah akan melarang kegiatan ibadah tertentu. Setelah dicek, berita itu hoaks. Anda …', 'Mengirim pesan kepada teman Anda bahwa berita yang ia bagikan tidak benar dan sebaiknya tidak diteruskan', 4, 'Ikut membagikan agar orang lain berhati-hati', 1, 'Tidak membagikan ulang berita itu kepada siapa pun', 3, 'Memberi tahu teman dengan santun disertai tautan klarifikasi resmi dan memintanya menghapus unggahan', 5, 'Membiarkannya karena yang membagikan adalah teman Anda sendiri', 2, 'D (5): Meluruskan dengan sumber resmi; A (4): Meluruskan, tetapi tanpa bukti; C (3): Tidak ikut menyebarkan; E (2): Abai; B (1): Menyebarkan hoaks.'),
  ('tkp-antiradikal', 'hard', 'Rekan satu ruangan mulai menarik diri, menyebut pemerintah sebagai "thogut", dan mengajak Anda tidak lagi bergaul dengan rekan yang berbeda keyakinan. Anda …', 'Tetap merangkulnya, mengajaknya berdialog dengan tokoh agama moderat, dan melapor agar ada pembinaan', 5, 'Menjauhinya agar Anda tidak ikut terpengaruh pandangannya', 2, 'Menyetujui ajakannya agar hubungan tetap baik', 1, 'Menyampaikan perubahan sikap rekan tersebut kepada atasan agar ada pembinaan', 4, 'Menasihatinya bahwa pandangan tersebut keliru dan bertentangan dengan sumpah ASN', 3, 'A (5): Merangkul sekaligus menempuh jalur resmi; D (4): Tepat jalur, tetapi tanpa merangkul; E (3): Edukatif, tetapi satu arah; B (2): Menghindar dan membuatnya makin terisolasi; C (1): Ikut intoleran.'),
  ('tkp-antiradikal', 'medium', 'Sebuah akun anonim di media sosial mengunggah video yang menghina simbol negara dan mendapat banyak tanggapan. Anda …', 'Menulis komentar marah pada unggahan itu agar pembuatnya jera', 2, 'Tidak membagikan ulang, lalu melaporkan akun itu ke platform dan kanal aduan konten pemerintah', 5, 'Membagikan ulang dengan ajakan mengecam pembuatnya', 1, 'Tidak membagikan ulang video tersebut dan melaporkannya lewat fitur pelaporan platform', 4, 'Tidak menanggapi unggahan tersebut sama sekali', 3, 'B (5): Melapor tanpa memperluas sebaran; D (4): Melapor, tetapi kanalnya terbatas; E (3): Pasif; A (2): Emosional dan menaikkan jangkauan; C (1): Memperluas sebaran.'),
  ('tkp-antiradikal', 'easy', 'Anda diminta menjadi panitia kegiatan buka puasa bersama lintas agama di kantor. Anda …', 'Menerima, tetapi hanya membantu sebagian persiapan karena kesibukan kantor', 3, 'Menolak dan mempersoalkan keterlibatan agama lain', 1, 'Menerima dengan antusias dan merancang acara yang melibatkan pegawai dari semua agama', 5, 'Menerima penunjukan itu dan menjalankan tugas yang diberikan ketua panitia dengan sebaik-baiknya', 4, 'Menolak karena merasa acara semacam itu tidak terlalu perlu', 2, 'C (5): Menjaga persatuan dan inklusif; D (4): Mendukung; A (3): Setengah hati; E (2): Kurang peduli kerukunan; B (1): Intoleran.'),
  ('tkp-antiradikal', 'hard', 'Dalam diskusi daring, seseorang berpendapat bahwa kritik terhadap kebijakan pemerintah sama dengan sikap radikal. Sebagai ASN, Anda …', 'Tidak ikut berkomentar dalam diskusi agar tidak dianggap berpihak sebagai ASN', 3, 'Setuju bahwa kritik terhadap pemerintah sebaiknya dihindari', 2, 'Menuduh balik orang tersebut antidemokrasi agar ia berhenti menyampaikan pendapatnya', 1, 'Menanggapi dengan sopan bahwa tidak semua kritik terhadap kebijakan pemerintah itu radikal', 4, 'Menjelaskan santun bahwa kritik lewat saluran sah itu demokratis, sedangkan radikalisme menolak dasar negara', 5, 'E (5): Moderat dan meluruskan konsep; D (4): Benar, tetapi kurang menjelaskan perbedaannya; A (3): Pasif; B (2): Keliru memahami radikalisme; C (1): Memperkeruh diskusi.'),
  ('tkp-antiradikal', 'medium', 'Anda menemukan selebaran berisi ajakan jihad melawan pemerintah di mushala kantor. Anda …', 'Membuang selebaran itu dan meminta pengurus mushala lebih waspada terhadap pihak luar', 4, 'Mengamankan selebaran sebagai bukti tanpa menyebarkannya, lalu segera melapor ke atasan dan keamanan', 5, 'Membiarkan selebaran di tempatnya karena bukan milik Anda', 3, 'Membawa pulang selebaran untuk dibaca lebih lanjut', 1, 'Memotret dan membagikannya di grup kantor agar semua pegawai waspada', 2, 'B (5): Berbasis bukti dan jalur resmi; A (4): Mengurangi sebaran, tetapi bukti hilang; C (3): Abai; E (2): Menyebarkan konten radikal; D (1): Berisiko terpapar.'),
  ('tkp-antiradikal', 'hard', 'Sebuah ormas meminta izin menggunakan aula kantor kecamatan untuk pengajian, tetapi Anda mendengar penceramahnya pernah menyampaikan ujaran kebencian. Anda …', 'Memverifikasi informasinya, melapor ke camat, dan mengusulkan izin bersyarat bebas ujaran kebencian', 5, 'Menyebarkan kabar tentang penceramah itu di media sosial', 1, 'Menolak permohonan izin tanpa memberikan penjelasan kepada ormas', 2, 'Melaporkan kabar tentang penceramah itu kepada camat dan menyerahkan keputusan izin kepadanya', 4, 'Memproses izin seperti biasa karena kegiatan keagamaan tidak boleh dihalangi', 3, 'A (5): Berbasis fakta, prosedural, menjaga kebebasan beribadah; D (4): Tepat jalur, tetapi tanpa verifikasi; E (3): Mengabaikan potensi risiko; C (2): Menghakimi tanpa fakta; B (1): Memicu konflik.')
) as v(sub, diff, stem, a, pa, b, pb, c, pc, d, pd, e, pe, expl)
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
