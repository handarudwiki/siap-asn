-- SiapASN original TKP content, round 2: new TKP aspects (integritas, prestasi, inovasi,
-- orientasi perubahan, pengendalian diri), extra lessons and practice questions (generated, idempotent).
-- All lesson text and questions are original works written for SiapASN.
begin;

insert into public.topics (test_code, name, slug, description, sort_order)
values
  ('TKP', 'Integritas Diri', 'tkp-integritas-diri', 'Kejujuran, konsistensi, dan tanggung jawab pribadi dalam bekerja.', 7),
  ('TKP', 'Semangat Berprestasi', 'tkp-semangat-berprestasi', 'Dorongan mencapai standar mutu tinggi, menuntaskan target, dan terus berkembang.', 8),
  ('TKP', 'Kreativitas & Inovasi', 'tkp-kreativitas-inovasi', 'Menghasilkan dan menerapkan gagasan baru yang bermanfaat dan tetap taat aturan.', 9),
  ('TKP', 'Orientasi pada Perubahan', 'tkp-orientasi-perubahan', 'Kesiapan menerima, menyesuaikan diri, dan mendorong perubahan kebijakan maupun cara kerja.', 10),
  ('TKP', 'Pengendalian Diri', 'tkp-pengendalian-diri', 'Mengelola emosi, tekanan, kritik, dan provokasi secara tenang dan profesional.', 11)
on conflict (slug) do nothing;

insert into public.subtopics (topic_id, name, slug, sort_order)
select t.id, v.name, v.slug, 1
from (values
  ('tkp-integritas-diri', 'Integritas Diri', 'tkp-integritas'),
  ('tkp-semangat-berprestasi', 'Semangat Berprestasi', 'tkp-prestasi'),
  ('tkp-kreativitas-inovasi', 'Kreativitas & Inovasi', 'tkp-inovasi'),
  ('tkp-orientasi-perubahan', 'Orientasi pada Perubahan', 'tkp-perubahan'),
  ('tkp-pengendalian-diri', 'Pengendalian Diri', 'tkp-pengendalian')
) as v(topic, name, slug)
join public.topics t on t.slug = v.topic
on conflict (slug) do nothing;

insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values
  ('tkp-integritas', 'Integritas Diri: Jujur, Konsisten, dan Bertanggung Jawab', 'tkp-integritas-konsep', 'Indikator integritas diri, tangga skor, dan contoh kejujuran dalam presensi, fasilitas, dan data.',
$md$## Apa yang diukur aspek integritas diri?

Integritas diri adalah kesesuaian antara **nilai, ucapan, dan tindakan**, termasuk ketika tidak ada yang mengawasi. Dalam TKP, aspek ini tidak hanya menguji apakah Anda menolak suap besar, tetapi juga hal-hal kecil sehari-hari: jujur tentang kemampuan sendiri, memakai waktu dan fasilitas kantor sesuai peruntukannya, mengakui kesalahan, dan tidak "merapikan" data presensi atau laporan pertanggungjawaban demi kenyamanan.

Nilai dasar ASN **Akuntabel** (jujur, bertanggung jawab, cermat, disiplin, berintegritas tinggi) adalah payung utama aspek ini. Orang yang berintegritas bisa dipercaya karena perilakunya dapat ditebak: ia bertindak benar bukan karena takut ketahuan, melainkan karena itu memang standarnya.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Jujur tentang diri sendiri | Mengakui belum menguasai suatu tugas dan meminta waktu belajar, bukan berpura-pura bisa |
| Konsisten kata dan perbuatan | Menepati janji tindak lanjut kepada warga atau rekan |
| Memakai fasilitas sesuai peruntukan | Kendaraan dinas, printer, dan kuota internet kantor tidak dipakai untuk urusan pribadi |
| Disiplin waktu | Jam kerja dipakai untuk bekerja, presensi sesuai kehadiran nyata |
| Mengakui kesalahan | Melaporkan kekeliruan sendiri sebelum menimbulkan kerugian lebih besar |
| Tertib administrasi | SPJ, kuitansi, dan daftar hadir sesuai kejadian sebenarnya |

## Tangga skor integritas diri

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Bertindak jujur atas inisiatif sendiri, mengakui atau memperbaiki keadaan, dan mencegah terulang | "melaporkan kekeliruan saya kepada atasan dan memperbaikinya hari itu juga" |
| 4 | Jujur dan patuh aturan, tetapi pasif atau tanpa langkah perbaikan | "tidak ikut menitipkan presensi" |
| 3 | Ragu-ragu, menunggu ditanya, atau jujur sebagian | "akan menjelaskan bila atasan bertanya" |
| 2 | Membenarkan pelanggaran kecil atau menyembunyikan kesalahan agar aman | "toh jumlahnya kecil dan tidak merugikan" |
| 1 | Memanipulasi data, memalsukan dokumen, atau melempar kesalahan kepada orang lain | "meminta rekan mengisi daftar hadir untuk saya" |

> **Prinsip penting:** Dalam integritas tidak ada pelanggaran yang "terlalu kecil". Opsi yang beralasan "nominalnya kecil", "sudah kebiasaan", atau "tidak ada yang dirugikan" hampir selalu bernilai rendah.

## Contoh pembahasan

### Contoh 1: Lupa presensi pulang

*Anda pulang tepat waktu, tetapi lupa memindai presensi pulang. Keesokan harinya rekan menawarkan diri untuk "memperbaiki" catatan melalui akun operator yang ia pegang.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menolak tawaran itu dan mengajukan koreksi presensi melalui prosedur resmi beserta bukti pendukung | 5 | Jujur, memakai jalur sah, dan tetap memperjuangkan hak dengan benar |
| Menerima potongan tunjangan karena memang lalai | 4 | Jujur dan bertanggung jawab, tetapi tidak memakai mekanisme koreksi yang tersedia |
| Menanyakan dulu kepada atasan apakah boleh dibantu rekan | 3 | Ragu, membuka peluang pelanggaran disetujui |
| Membiarkan rekan memperbaikinya karena Anda memang hadir | 2 | Tujuan benar tetapi cara melanggar kewenangan sistem |
| Meminta rekan sekalian mengisi presensi Anda bila besok terlambat | 1 | Manipulasi data secara sadar |

### Contoh 2: Kendaraan dinas di akhir pekan

*Anda memegang kendaraan dinas operasional. Pada hari Minggu, keluarga meminta diantar ke acara pernikahan kerabat di luar kota.*

Nilai 5: memakai kendaraan pribadi atau transportasi umum dan menjelaskan kepada keluarga bahwa kendaraan dinas hanya untuk tugas. Nilai 4: tidak memakainya tanpa menjelaskan alasan. Nilai 3: memakainya hanya bila tidak ada alternatif lain. Nilai 2: memakainya dengan mengisi sendiri bahan bakar agar "adil". Nilai 1: memakainya dan mencatat perjalanan itu sebagai kegiatan dinas. Perhatikan bahwa mengganti bensin sendiri tetap tidak mengubah status penyalahgunaan aset.

### Contoh 3: Kesalahan input yang belum diketahui siapa pun

*Anda menyadari telah salah memasukkan nominal bantuan untuk dua penerima di aplikasi. Belum ada yang menyadarinya dan pencairan dijadwalkan pekan depan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Segera melapor kepada atasan, mengajukan perbaikan data, dan mengusulkan pengecekan ganda sebelum pencairan | 5 | Mengakui, memperbaiki, dan mencegah terulang |
| Mengoreksi data sesuai prosedur dan memberi tahu atasan | 4 | Bertanggung jawab tanpa perbaikan sistem |
| Mengoreksi data diam-diam bila masih bisa diubah | 3 | Masalah selesai, tetapi tidak transparan |
| Menunggu hingga ada yang menyadarinya | 2 | Menyembunyikan kesalahan |
| Menyebut data awal dari operator desa memang keliru | 1 | Melempar kesalahan kepada orang lain |

### Contoh 4: Mengaku menguasai aplikasi

*Atasan bertanya siapa yang bisa mengoperasikan aplikasi perencanaan anggaran. Anda pernah melihatnya sekali, tetapi belum pernah memakai.*

Nilai 5: menyampaikan apa adanya bahwa Anda belum menguasai, lalu menawarkan diri mempelajarinya dengan target waktu jelas. Nilai 4: mengatakan belum bisa. Nilai 3: diam dan menunggu rekan lain menjawab. Nilai 2: mengaku bisa sambil berharap belajar diam-diam. Nilai 1: mengaku ahli agar terlihat menonjol. Kejujuran tentang kemampuan diri juga bagian dari integritas.

## Jebakan umum

- **Integritas bersyarat**: opsi "jujur jika ditanya" terdengar aman, tetapi hanya bernilai sedang.
- **Niat baik, cara salah**: membantu warga atau diri sendiri dengan melanggar prosedur tetap rendah.
- **Rasionalisasi nominal**: "hanya sepuluh ribu", "cuma sekali" adalah sinyal skor 1–2.
- **Menyelesaikan diam-diam**: memperbaiki kesalahan tanpa memberi tahu pihak terkait kalah dari opsi yang transparan.
- **Hukuman diri berlebihan**: menerima sanksi tanpa memakai mekanisme koreksi resmi bukan jawaban terbaik.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| melapor, mengakui, mengajukan koreksi resmi | menitipkan presensi, merapikan data |
| sesuai peruntukan, sesuai bukti | toh kecil, sudah biasa |
| mencegah terulang, pengecekan ganda | menunggu ketahuan, menyalahkan pihak lain |

## Ringkasan

- Integritas diri terlihat pada hal kecil: waktu, fasilitas, presensi, dan laporan.
- Nilai 5 = jujur **atas inisiatif sendiri** + memperbaiki + mencegah terulang.
- Kesalahan sendiri diakui secara terbuka, bukan disembunyikan atau dilempar.
- Mekanisme resmi (koreksi presensi, revisi data) selalu lebih baik daripada jalan pintas.

## Tips

1. Bila sebuah opsi membutuhkan alasan pembenar ("karena saya memang hadir"), curigai skornya rendah.
2. Bedakan opsi 4 (jujur pasif) dan 5 (jujur aktif yang memperbaiki keadaan).
3. Pilih opsi yang tetap pantas dilakukan seandainya seluruh kantor melihatnya.
4. Waspadai opsi yang menyalahkan pihak lain; hampir selalu bernilai 1.
$md$,
   true, 1, 15),
  ('tkp-integritas', 'Dilema Integritas: Pertemanan, Loyalitas, dan Godaan Kecil', 'tkp-integritas-dilema', 'Kasus sulit saat teman, atasan yang baik, atau kebiasaan kelompok mendorong pelanggaran kecil.',
$md$## Mengapa dilema integritas terasa sulit?

Soal integritas yang mudah biasanya melibatkan pihak asing: penyedia barang menawarkan amplop, orang tak dikenal meminta data. Soal yang sulit justru melibatkan **orang yang kita sukai**: sahabat sejak CPNS, atasan yang selama ini baik hati, atau rekan senior yang sering membantu. Ada pula tekanan sosial "semua orang di sini melakukannya". Dalam situasi ini, pilihan benar terasa tidak enak karena berisiko merusak hubungan.

TKP menilai apakah Anda mampu **memisahkan hubungan pribadi dari kewajiban jabatan**, tanpa menjadi kasar atau mempermalukan orang. Jawaban terbaik hampir selalu tegas pada prinsip, tetapi santun dan bertahap pada cara.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Netral terhadap kedekatan | Memperlakukan sahabat sama dengan pemohon lain |
| Loyal pada aturan, bukan pada orang | Menolak perintah janggal atasan dengan santun |
| Tidak terbawa arus kebiasaan | Tetap tertib meski praktik keliru sudah umum |
| Transparan terhadap konflik kepentingan | Mengungkapkan hubungan keluarga atau pertemanan |
| Menegur secara bertahap | Mengingatkan secara pribadi sebelum melapor |
| Konsisten sebagai atasan maupun staf | Menerapkan standar yang sama pada diri sendiri dan tim |

## Tangga skor dilema integritas

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Tegas menolak pelanggaran, santun kepada orangnya, dan menawarkan jalan yang sah | "mengingatkan secara pribadi dan membantunya menempuh prosedur resmi" |
| 4 | Menolak terlibat dengan benar, tetapi tanpa solusi atau tanpa menegur | "menolak dengan sopan" |
| 3 | Menghindar atau mengalihkan keputusan kepada orang lain | "menyerahkan kepada atasan untuk memutuskan" |
| 2 | Kompromi kecil demi menjaga hubungan | "membantu sekali ini saja" |
| 1 | Ikut melanggar atau menutupi pelanggaran | "ikut menandatangani agar tidak dianggap berbeda" |

## Contoh pembahasan

### Contoh 1: Sahabat meminta nilai dinaikkan

*Anda anggota tim penilai uji kompetensi jabatan. Sahabat Anda sejak pendidikan dasar adalah salah satu peserta dan memohon agar nilainya "dibantu sedikit".*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menolak dengan baik, menyampaikan hubungan pertemanan kepada ketua tim, dan meminta tidak menilai sahabat tersebut | 5 | Menolak, transparan, dan mencegah konflik kepentingan |
| Menolak permintaan dan menilai sesuai rubrik | 4 | Benar, tetapi konflik kepentingan tidak diungkapkan |
| Menyarankan sahabat bertanya kepada penilai lain | 3 | Mengalihkan tanpa sikap jelas |
| Memberi tambahan kecil yang masih dalam rentang wajar | 2 | Kompromi demi pertemanan |
| Menaikkan nilai karena yakin ia sebenarnya mampu | 1 | Manipulasi hasil penilaian |

### Contoh 2: Atasan yang baik hati

*Kepala seksi Anda dikenal peduli dan sering membantu staf. Ia meminta Anda menandatangani daftar hadir rapat yang tidak pernah dilaksanakan agar honor bisa dibagikan untuk biaya berobat seorang staf.*

Nilai 5: menolak dengan hormat, menjelaskan risikonya bagi beliau dan tim, lalu mengusulkan cara sah membantu staf yang sakit, misalnya iuran sukarela atau pengajuan bantuan melalui koperasi atau Korpri. Nilai 4: menolak menandatangani dengan sopan. Nilai 3: meminta waktu berpikir dan berharap permintaan dilupakan. Nilai 2: menandatangani karena tujuannya mulia. Nilai 1: menandatangani dan mengajak rekan lain ikut. Tujuan yang baik tidak menghalalkan dokumen fiktif.

### Contoh 3: "Semua orang melakukannya"

*Di unit baru Anda, pegawai biasa pulang satu jam lebih awal setiap Jumat dan saling memindai presensi. Rekan menyebut Anda "kaku" karena tetap tinggal hingga jam pulang.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Tetap bekerja sesuai jam, tidak menitipkan presensi, dan memanfaatkan waktu Jumat sore untuk menyelesaikan pekerjaan | 5 | Konsisten dan produktif tanpa menghakimi |
| Tetap mengikuti jam kerja tanpa banyak bicara | 4 | Benar, tetapi kurang mengisi waktu dengan kontribusi |
| Pulang lebih awal sesekali agar diterima | 3 | Mulai goyah |
| Ikut pulang awal tetapi memindai presensi sendiri | 2 | Melanggar jam kerja meski tidak memalsukan |
| Ikut menitipkan presensi kepada rekan | 1 | Memalsukan data kehadiran |

Catatan: pada soal lain, bila Anda adalah **atasan** di unit itu, jawaban terbaik bergeser menjadi menertibkan kebiasaan melalui arahan, contoh, dan sistem, bukan sekadar menjaga diri sendiri.

### Contoh 4: Hadiah kecil setelah pelayanan

*Setelah urusannya selesai, seorang warga lansia memaksa memberikan sekantong buah dari kebunnya kepada Anda sebagai ucapan terima kasih.*

Nilai 5: menolak dengan halus sambil berterima kasih dan menjelaskan bahwa layanan memang tanpa imbalan; bila tetap dipaksa dan tidak dapat ditolak, melaporkannya sesuai ketentuan gratifikasi di instansi. Nilai 4: menolak dengan halus. Nilai 3: menerima lalu membagikannya ke seluruh kantor. Nilai 2: menerima karena nilainya kecil. Nilai 1: memberi isyarat bahwa layanan berikutnya akan dipercepat. Fokusnya bukan nilai barang, tetapi kaitannya dengan jabatan.

### Contoh 5: Sebagai atasan

*Anda ketua tim. Anggota terbaik Anda ketahuan menggelembungkan biaya perjalanan dinas sebesar dua ratus ribu rupiah.*

Nilai 5: memanggilnya secara pribadi, memintanya mengembalikan kelebihan, mencatat kejadian sesuai ketentuan, dan memperketat verifikasi bukti perjalanan. Nilai 4: memintanya mengembalikan kelebihan. Nilai 3: menegur tanpa tindak lanjut. Nilai 2: membiarkan karena kinerjanya bagus. Nilai 1: ikut menyetujui agar timnya tidak bermasalah.

## Jebakan umum

- **Loyalitas personal**: "membantu atasan karena beliau selama ini baik" bernilai rendah.
- **Menyerahkan keputusan**: menunggu atasan atau rekan memutuskan sering hanya bernilai 3.
- **Tegas tetapi kasar**: mempermalukan rekan di depan umum atau memviralkan tidak bernilai 5.
- **Kompromi "sekali saja"**: tetap pelanggaran.
- **Lupa peran**: sebagai atasan, Anda diharapkan memperbaiki sistem, bukan hanya menjaga diri.

## Ringkasan

- Dilema sulit melibatkan orang dekat; prinsipnya tetap sama: aturan di atas hubungan.
- Nilai 5 menggabungkan ketegasan, kesantunan, transparansi, dan solusi sah.
- Konflik kepentingan diungkapkan, bukan dikelola diam-diam.
- Peran atasan menuntut tindakan korektif dan perbaikan sistem.

## Tips

1. Ganti nama orang dalam soal dengan "orang asing"; jawaban benar tidak boleh berubah.
2. Cari opsi yang menolak **dan** menawarkan cara sah memenuhi kebutuhan di baliknya.
3. Perhatikan peran Anda dalam soal: staf, ketua tim, atau pejabat.
4. Teguran pribadi lebih dulu, laporan resmi bila berlanjut atau merugikan negara.
$md$,
   false, 2, 15),
  ('tkp-prestasi', 'Semangat Berprestasi: Target, Standar Mutu, dan Kerja Tuntas', 'tkp-prestasi-konsep', 'Membedakan kerja cukup dan kerja unggul, mengejar target, dan menjaga mutu.',
$md$## Apa yang diukur aspek semangat berprestasi?

Semangat berprestasi adalah dorongan untuk **bekerja melampaui standar minimal**: menetapkan target yang menantang, menjaga mutu, menyelesaikan pekerjaan sampai tuntas, dan terus mencari cara agar hasilnya lebih baik. Dalam TKP, aspek ini membedakan pegawai yang "asal selesai" dari pegawai yang bangga pada kualitas kerjanya.

Nilai BerAKHLAK yang paling dekat adalah **Kompeten** (meningkatkan kompetensi diri, membantu orang lain belajar, melaksanakan tugas dengan kualitas terbaik). Namun berprestasi bukan berarti ambisius secara egois. Prestasi yang dinilai tinggi tetap jujur, sesuai aturan, dan tidak mengorbankan rekan kerja.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Berorientasi target | Menetapkan sasaran terukur dan memantau kemajuannya |
| Menjaga standar mutu | Memeriksa ulang hasil kerja sebelum diserahkan |
| Tuntas | Menyelesaikan pekerjaan hingga hasil akhirnya benar-benar dipakai |
| Inisiatif | Mengerjakan hal yang bermanfaat tanpa menunggu disuruh |
| Tekun menghadapi kesulitan | Mencari cara lain ketika hambatan muncul |
| Evaluatif | Membandingkan hasil dengan target dan memperbaiki cara kerja |

## Tangga skor semangat berprestasi

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menetapkan standar tinggi, bekerja tuntas, mengevaluasi, dan memperbaiki | "menyusun target mingguan dan mengevaluasi capaian bersama tim" |
| 4 | Bekerja baik sesuai target yang ditetapkan, tanpa langkah ekstra | "menyelesaikan tugas tepat waktu sesuai arahan" |
| 3 | Bekerja sekadarnya, cukup memenuhi syarat minimal | "yang penting laporan sudah dikirim" |
| 2 | Menunda, menurunkan target, atau mudah menyerah | "menunggu tenggat diperpanjang" |
| 1 | Mengejar hasil dengan cara curang atau melempar pekerjaan | "menyalin laporan tahun lalu dan mengganti tanggal" |

> **Ingat:** Prestasi yang diraih dengan memanipulasi data selalu bernilai 1. Di soal TKP, kejujuran tidak pernah dikorbankan demi angka yang bagus.

## Contoh pembahasan

### Contoh 1: Target capaian imunisasi

*Anda petugas puskesmas. Capaian imunisasi dasar di wilayah Anda baru 60 persen menjelang triwulan ketiga, sementara target tahunan 95 persen.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memetakan desa dengan capaian terendah, menyusun jadwal kunjungan bersama kader, dan memantau kemajuan tiap pekan | 5 | Terarah, terukur, melibatkan pihak terkait |
| Menambah jadwal posyandu sesuai kemampuan | 4 | Upaya nyata, tetapi tanpa analisis prioritas |
| Mengingatkan kader agar lebih aktif mengajak warga | 3 | Sekadar imbauan |
| Melaporkan bahwa target terlalu tinggi untuk wilayah Anda | 2 | Menurunkan target tanpa usaha |
| Menyesuaikan angka laporan agar mendekati target | 1 | Manipulasi data |

### Contoh 2: Laporan yang "cukup"

*Atasan meminta laporan evaluasi program dalam tiga hari. Anda bisa menyelesaikannya dalam dua hari dengan format lama, tetapi Anda tahu data lapangan terbaru belum dimasukkan.*

Nilai 5: memasukkan data terbaru, memeriksa konsistensi angka, dan menyerahkan tepat waktu dengan ringkasan temuan utama. Nilai 4: menyelesaikan laporan dengan data terbaru tepat waktu. Nilai 3: menyerahkan format lama lebih cepat dan menjanjikan pembaruan nanti. Nilai 2: menunggu atasan menanyakan data terbaru. Nilai 1: menyalin isi laporan tahun lalu karena "isinya mirip". Perhatikan bahwa **cepat** tidak otomatis lebih baik daripada **bermutu dan tepat waktu**.

### Contoh 3: Pekerjaan sudah selesai, waktu masih ada

*Tugas pendataan aset ruangan sudah Anda selesaikan dua hari sebelum tenggat.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memeriksa ulang kecocokan data dengan fisik barang, lalu menawarkan bantuan pendataan ruangan lain | 5 | Menjaga mutu dan berkontribusi lebih |
| Menyerahkan hasil lebih awal kepada atasan | 4 | Baik, tetapi tanpa pengecekan mutu |
| Menyimpan hasil hingga hari tenggat | 3 | Netral |
| Memakai sisa waktu untuk urusan pribadi | 2 | Tidak produktif |
| Melambatkan diri agar tidak diberi tugas tambahan | 1 | Menghindari tanggung jawab |

### Contoh 4: Hambatan teknis

*Aplikasi pelaporan kinerja sering gagal menyimpan data sehingga input Anda harus diulang.*

Nilai 5: mencatat pola kegagalan, menyimpan cadangan di lembar kerja, dan melaporkannya ke pengelola aplikasi dengan bukti tangkapan layar. Nilai 4: tetap mengulang input sampai berhasil. Nilai 3: menginput hanya saat jaringan sepi. Nilai 2: menunda input hingga aplikasi diperbaiki. Nilai 1: meminta rekan menginputkan data Anda dengan akunnya.

## Jebakan umum

- **Cepat tetapi asal**: opsi yang mengorbankan mutu demi kecepatan biasanya bernilai 3.
- **Menurunkan target**: mengusulkan target diturunkan tanpa upaya terlihat realistis, tetapi bernilai rendah.
- **Prestasi individual yang merugikan tim**: mengambil kredit rekan atau menyembunyikan informasi bernilai rendah.
- **Lembur tanpa strategi**: bekerja lebih lama belum tentu lebih baik daripada bekerja lebih terarah.
- **Angka dipoles**: manipulasi data adalah skor 1, apa pun alasannya.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| target terukur, memantau, mengevaluasi | yang penting selesai |
| memeriksa ulang, standar mutu | menyalin, menyesuaikan angka |
| mencari cara lain, belajar | menunggu, menyerah, menunda |

## Ringkasan

- Semangat berprestasi = standar tinggi + kerja tuntas + evaluasi berkelanjutan.
- Nilai 5 menunjukkan perencanaan terukur dan perbaikan, bukan sekadar kerja keras.
- Mutu dan kejujuran tidak boleh dikorbankan demi kecepatan atau angka.
- Waktu luang dipakai untuk memeriksa mutu atau membantu, bukan bersantai.

## Tips

1. Pilih opsi yang menyebut langkah konkret dan terukur, bukan sekadar semangat.
2. Bedakan 4 (memenuhi target) dan 5 (memenuhi target + memperbaiki atau melampaui).
3. Opsi yang menyalahkan target atau keadaan biasanya bernilai 2.
4. Prestasi tim lebih bernilai daripada menonjolkan diri sendiri.
$md$,
   true, 1, 14),
  ('tkp-prestasi', 'Bangkit dari Kegagalan dan Terus Mengembangkan Diri', 'tkp-prestasi-kegagalan', 'Menyikapi gagal seleksi, kritik, dan target meleset; belajar mandiri dan kompetisi sehat.',
$md$## Kegagalan sebagai bahan soal TKP

Banyak soal semangat berprestasi justru dimulai dari **kegagalan**: tidak lolos seleksi jabatan, target tidak tercapai, presentasi dikritik, atau rekan seangkatan lebih dulu dipromosikan. Soal semacam ini menguji ketangguhan (*resilience*) dan orientasi belajar. Pegawai berprestasi bukan pegawai yang tidak pernah gagal, tetapi pegawai yang **cepat bangkit, belajar dari umpan balik, dan terus mengembangkan diri**.

Aspek ini juga menguji cara Anda bersaing. Kompetisi sehat mendorong semua orang menjadi lebih baik; kompetisi tidak sehat menjatuhkan rekan atau mencari jalan pintas. Nilai **Kompeten** dan **Harmonis** dalam BerAKHLAK sama-sama berlaku di sini.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Menerima kegagalan secara dewasa | Tidak menyalahkan panitia, atasan, atau keadaan |
| Mencari umpan balik | Menanyakan aspek mana yang perlu diperbaiki |
| Menyusun rencana pengembangan | Menetapkan langkah belajar dan target waktu |
| Belajar mandiri | Mengikuti pelatihan daring, membaca regulasi, berlatih |
| Kompetisi sehat | Mengakui keunggulan rekan dan belajar darinya |
| Gigih | Mencoba lagi dengan persiapan yang lebih baik |

## Tangga skor menghadapi kegagalan

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menganalisis penyebab, meminta umpan balik, menyusun rencana perbaikan, dan mencoba lagi | "meminta masukan penilai lalu menyusun rencana belajar enam bulan" |
| 4 | Menerima dengan lapang dada dan berniat lebih baik, tetapi rencana kurang konkret | "akan berusaha lebih keras pada kesempatan berikutnya" |
| 3 | Pasrah atau menunggu kesempatan datang sendiri | "menerima keputusan dan kembali bekerja seperti biasa" |
| 2 | Kecewa berlarut, menurunkan semangat kerja, atau menghindari tantangan | "tidak mau ikut seleksi lagi" |
| 1 | Menyalahkan pihak lain, menjatuhkan pesaing, atau mencari jalan pintas | "menyebarkan kabar bahwa pemenang dibantu orang dalam" |

## Contoh pembahasan

### Contoh 1: Tidak lolos seleksi jabatan

*Anda mengikuti seleksi terbuka jabatan administrator dan tidak lolos tahap presentasi makalah. Rekan seangkatan Anda justru terpilih.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memberi selamat kepada rekan, meminta umpan balik tertulis dari panitia, dan menyusun rencana latihan presentasi | 5 | Sportif, reflektif, dan berencana |
| Memberi selamat dan bertekad mencoba lagi tahun depan | 4 | Positif, tetapi belum ada langkah konkret |
| Kembali bekerja seperti biasa tanpa memikirkannya | 3 | Netral, tidak belajar |
| Memutuskan tidak lagi mengikuti seleksi apa pun | 2 | Menyerah |
| Menduga hasil seleksi sudah diatur dan menceritakannya kepada rekan lain | 1 | Menyalahkan tanpa dasar dan merusak suasana |

### Contoh 2: Kritik tajam setelah presentasi

*Dalam rapat, kepala dinas menyatakan paparan Anda terlalu panjang dan datanya tidak menjawab pertanyaan pimpinan.*

Nilai 5: mencatat masukan, meminta contoh paparan yang dianggap baik, lalu merevisi paparan dengan struktur masalah, data, dan rekomendasi sebelum rapat berikutnya. Nilai 4: menerima kritik dan memperbaiki paparan. Nilai 3: diam dan berharap rapat berikutnya dipresentasikan rekan lain. Nilai 2: merasa tersinggung dan menghindari tugas presentasi. Nilai 1: menyalahkan staf yang menyiapkan data di depan peserta rapat. Kritik adalah data gratis untuk perbaikan.

### Contoh 3: Target unit tidak tercapai

*Pada akhir tahun, realisasi pendapatan retribusi yang menjadi tanggung jawab tim Anda hanya mencapai 78 persen dari target.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menganalisis penyebab per jenis retribusi, menyusun strategi perbaikan, dan mengusulkan target realistis berbasis data untuk tahun depan | 5 | Evaluatif dan solutif |
| Melaporkan capaian apa adanya disertai penjelasan kendala | 4 | Jujur, perbaikan belum konkret |
| Berharap tahun depan kondisi ekonomi membaik | 3 | Pasif |
| Menyalahkan wajib retribusi yang tidak patuh | 2 | Eksternalisasi |
| Mencatat sebagian piutang sebagai pendapatan agar persentase naik | 1 | Manipulasi laporan |

### Contoh 4: Rekan lebih unggul

*Rekan satu tim lebih cepat menguasai aplikasi baru dan sering dipuji atasan. Anda masih tertinggal.*

Nilai 5: meminta rekan berbagi cara belajarnya, berlatih mandiri dengan modul resmi, dan menetapkan target kapan Anda menguasainya. Nilai 4: mengikuti pelatihan tambahan yang tersedia. Nilai 3: menunggu dilatih secara formal. Nilai 2: menghindari tugas yang memakai aplikasi itu. Nilai 1: menyampaikan kepada atasan bahwa rekan tersebut sering membuat kesalahan agar pujiannya berkurang.

### Contoh 5: Belajar tanpa disuruh

*Instansi tidak menganggarkan pelatihan analisis data tahun ini, padahal tugas Anda makin banyak berkaitan dengan data.*

Nilai 5: mengikuti kelas daring gratis atau platform pembelajaran ASN, mempraktikkannya pada data kantor, lalu membagikan hasilnya kepada tim. Nilai 4: belajar mandiri di luar jam kerja. Nilai 3: mengusulkan pelatihan untuk tahun depan dan menunggu. Nilai 2: bertahan dengan cara lama. Nilai 1: mengerjakan analisis secara asal karena "toh tidak ada pelatihan".

## Jebakan umum

- **Positif tanpa rencana**: "akan berusaha lebih keras" terdengar baik, tetapi biasanya hanya 4.
- **Pasrah dibungkus ikhlas**: menerima keadaan tanpa belajar hanya bernilai 3.
- **Kompetisi menjatuhkan**: menjelekkan pesaing atau menuduh kecurangan tanpa bukti bernilai 1.
- **Menunggu fasilitas**: pengembangan diri tidak harus menunggu anggaran pelatihan.
- **Menghindar dari tantangan**: menolak kesempatan berikutnya karena takut gagal bernilai 2.

## Ringkasan

- Kegagalan diuji dari reaksi: menyalahkan, menyerah, pasrah, atau belajar.
- Nilai 5 = sportif + meminta umpan balik + rencana konkret + mencoba lagi.
- Kompetisi sehat berarti belajar dari yang lebih unggul, bukan menjatuhkannya.
- Belajar mandiri adalah ciri utama pegawai berprestasi.

## Tips

1. Cari kata kunci "umpan balik", "rencana", "target waktu", dan "mencoba kembali".
2. Opsi yang menyebut pihak lain sebagai penyebab kegagalan biasanya bernilai rendah.
3. Bedakan semangat (skor 4) dengan semangat yang diikuti langkah terukur (skor 5).
4. Ingat bahwa berbagi hasil belajar kepada tim menambah nilai.
$md$,
   false, 2, 14),
  ('tkp-inovasi', 'Kreativitas dan Inovasi dalam Pekerjaan ASN', 'tkp-inovasi-konsep', 'Inovasi sederhana dengan sumber daya terbatas, berpihak pada pengguna, dan tetap taat aturan.',
$md$## Apa yang diukur aspek kreativitas dan inovasi?

Kreativitas adalah kemampuan menghasilkan gagasan baru atau cara pandang berbeda. Inovasi adalah **gagasan yang diterapkan dan memberi manfaat nyata**. Di sektor publik, inovasi tidak harus berupa aplikasi mahal. Mengubah tata letak loket agar antrean lebih lancar, membuat formulir bergambar untuk warga yang kesulitan membaca, atau memanfaatkan grup percakapan RT untuk pengingat jadwal posyandu juga termasuk inovasi.

Nilai BerAKHLAK **Adaptif** (cepat menyesuaikan diri, terus berinovasi, bertindak proaktif) menjadi rujukan utama. Namun TKP juga menilai batasnya: inovasi yang baik **tetap taat aturan**, menghitung keterbatasan anggaran, dan berpihak pada pengguna layanan.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Peka terhadap masalah | Menyadari pola keluhan warga yang berulang |
| Menghasilkan alternatif | Menawarkan lebih dari satu cara menyelesaikan masalah |
| Sederhana dan murah | Memanfaatkan sumber daya yang sudah ada |
| Berpihak pada pengguna | Merancang solusi dari sudut pandang warga |
| Taat aturan | Mengajukan ide melalui atasan, tidak mengubah prosedur sepihak |
| Terbuka pada ide orang lain | Menggabungkan masukan rekan dan warga |

## Tangga skor kreativitas dan inovasi

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Merumuskan ide baru yang sederhana, bermanfaat, dan diajukan melalui jalur yang benar | "mengusulkan formulir bergambar dan menguji cobanya di satu loket" |
| 4 | Memperbaiki cara kerja dengan baik, tetapi masih dalam pola yang sudah ada | "menambah petugas di jam sibuk" |
| 3 | Mengikuti cara lama sambil berharap ada perbaikan | "menunggu arahan dari pimpinan" |
| 2 | Menolak ide baru atau merasa itu bukan urusannya | "cara lama sudah terbukti aman" |
| 1 | Berinovasi dengan melanggar aturan atau merugikan pihak lain | "mengubah prosedur sendiri tanpa persetujuan" |

> **Catatan:** Ide yang "keren" tetapi mahal, rumit, atau mengubah SOP tanpa izin tidak otomatis bernilai 5. Inovasi terbaik dalam TKP biasanya **sederhana, dapat diuji, dan sah**.

## Contoh pembahasan

### Contoh 1: Warga sering salah mengisi formulir

*Di kantor kelurahan, banyak warga lansia salah mengisi formulir permohonan sehingga harus mengulang dari awal.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Membuat contoh pengisian berwarna dengan penanda bagian penting, menempelkannya di meja tulis, dan meminta masukan warga | 5 | Kreatif, murah, berpihak pada pengguna |
| Membantu mengisikan formulir setiap kali warga kesulitan | 4 | Menolong, tetapi tidak mengubah akar masalah |
| Menyediakan lebih banyak formulir cadangan | 3 | Menangani gejala |
| Meminta warga datang bersama keluarga yang lebih muda | 2 | Membebankan kepada warga |
| Mengisi formulir atas nama warga dan menandatanganinya sendiri | 1 | Melanggar prosedur |

### Contoh 2: Anggaran sosialisasi dipotong

*Anggaran cetak brosur program pencegahan stunting dipangkas separuh, padahal sasaran tersebar di banyak desa.*

Nilai 5: menyusun materi visual singkat untuk disebarkan melalui grup percakapan kader dan papan informasi desa, lalu memprioritaskan cetakan untuk wilayah yang sulit sinyal. Nilai 4: mencetak brosur sesuai sisa anggaran untuk desa prioritas. Nilai 3: tetap mencetak separuh dan membaginya merata tanpa pertimbangan. Nilai 2: menunda sosialisasi hingga anggaran tambahan turun. Nilai 1: meminta sumbangan percetakan dari pihak rekanan proyek dinas. Keterbatasan anggaran adalah pemicu kreativitas, bukan alasan berhenti.

### Contoh 3: Antrean menumpuk pada jam tertentu

*Pengamatan Anda menunjukkan antrean layanan kartu keluarga selalu menumpuk antara pukul sembilan dan sebelas.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengusulkan kepada atasan sistem pengambilan nomor antrean melalui pesan singkat dengan jadwal jam kedatangan, lalu menguji coba selama sebulan | 5 | Berbasis data, inovatif, dan sah |
| Mengusulkan penambahan petugas loket pada jam sibuk | 4 | Solutif, tetapi konvensional |
| Mengimbau warga datang lebih pagi | 3 | Sekadar imbauan |
| Menganggap antrean jam sibuk wajar terjadi di mana-mana | 2 | Pasif |
| Membatasi jumlah pemohon per hari tanpa pengumuman | 1 | Merugikan warga dan sepihak |

### Contoh 4: Ide yang melanggar prosedur

*Rekan mengusulkan agar berkas yang kurang satu dokumen tetap diproses dulu supaya waktu layanan terlihat cepat.*

Nilai 5: menghargai niatnya, lalu mengajak merancang daftar periksa kelengkapan yang dibagikan sebelum warga datang sehingga berkas lengkap sejak awal. Nilai 4: menolak usulan dan tetap memakai prosedur. Nilai 3: menyerahkan keputusan kepada atasan. Nilai 2: mencoba usulan itu sesekali. Nilai 1: menerapkan usulan itu untuk semua berkas. Inovasi yang menabrak aturan berubah menjadi pelanggaran.

## Jebakan umum

- **Inovasi mahal**: opsi "membangun aplikasi baru" tidak selalu terbaik bila masalahnya bisa diatasi dengan cara sederhana.
- **Inovasi sepihak**: mengubah SOP tanpa persetujuan bernilai rendah walaupun idenya bagus.
- **Menunggu instruksi**: "menunggu arahan pimpinan" untuk masalah yang jelas di depan mata biasanya bernilai 3.
- **Menolak perubahan**: "cara lama sudah aman" adalah sinyal skor 2.
- **Solusi yang membebani warga**: memindahkan masalah ke pengguna layanan bernilai rendah.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| mengusulkan, menguji coba, memanfaatkan yang ada | menunggu, cara lama, bukan urusan saya |
| sederhana, murah, berpihak pada warga | mengubah sendiri, tanpa izin |
| meminta masukan pengguna | membatasi layanan sepihak |

## Ringkasan

- Inovasi = ide baru yang diterapkan dan bermanfaat.
- Nilai 5 sederhana, berbasis masalah nyata, berpihak pada warga, dan melalui jalur resmi.
- Keterbatasan anggaran dijawab dengan kreativitas, bukan penundaan.
- Ide yang melanggar aturan tetap bernilai rendah.

## Tips

1. Pilih opsi yang menyelesaikan akar masalah, bukan gejalanya.
2. Bedakan 4 (perbaikan konvensional) dan 5 (cara baru yang diuji dan diusulkan).
3. Perhatikan kata "mengusulkan kepada atasan" sebagai penanda inovasi yang sah.
4. Hindari opsi yang memindahkan beban kepada warga atau rekan.
$md$,
   true, 1, 14),
  ('tkp-inovasi', 'Dari Ide ke Implementasi: Uji Coba, Data, dan Dukungan Pimpinan', 'tkp-inovasi-eksekusi', 'Uji coba terbatas, mengukur dampak, menyikapi ide ditolak, dan mereplikasi inovasi dengan adaptasi.',
$md$## Mengapa eksekusi menentukan nilai inovasi?

Banyak ide bagus berhenti di rapat. Soal TKP tingkat lanjut sering menguji tahap sesudah ide muncul: **bagaimana menguji, mengukur, meyakinkan pimpinan, dan menyikapi penolakan**. Pegawai inovatif tidak hanya pandai berpendapat, tetapi juga mampu mengubah gagasan menjadi praktik yang bertahan.

Tahapan sederhana yang bisa Anda pegang: **identifikasi masalah → rancang solusi → uji coba skala kecil → ukur dampak → perbaiki → usulkan perluasan**. Seluruh tahapan tetap dilakukan dengan persetujuan atasan dan dalam koridor aturan. Nilai **Adaptif** dan **Kolaboratif** berjalan bersamaan di sini.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Uji coba terbatas | Menerapkan ide di satu loket atau satu desa dahulu |
| Berbasis data | Mengukur waktu layanan, jumlah keluhan, atau kepuasan sebelum dan sesudah |
| Mengomunikasikan ide | Menyusun usulan singkat berisi masalah, solusi, biaya, dan manfaat |
| Tangguh menghadapi penolakan | Meminta masukan, memperbaiki, dan mengajukan kembali |
| Adaptasi, bukan menyalin | Menyesuaikan inovasi daerah lain dengan kondisi setempat |
| Menghargai ide orang lain | Menyebut kontribusi rekan dan melibatkan mereka |

## Tangga skor implementasi inovasi

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menguji ide secara terukur, melibatkan pihak terkait, dan memperbaikinya berdasarkan data | "mengusulkan uji coba satu bulan dan membandingkan waktu layanan sebelum dan sesudah" |
| 4 | Menjalankan ide dengan baik, tetapi tanpa pengukuran atau pelibatan yang memadai | "menerapkan ide setelah disetujui atasan" |
| 3 | Menyimpan ide atau menunggu momen yang tepat tanpa langkah | "akan mengusulkannya bila ada kesempatan" |
| 2 | Mudah menyerah saat ditolak atau menyalin mentah-mentah | "menghentikan ide karena atasan belum setuju" |
| 1 | Memaksakan ide tanpa izin, mengklaim ide orang lain, atau memalsukan hasil | "melaporkan keberhasilan uji coba yang belum dilaksanakan" |

## Contoh pembahasan

### Contoh 1: Ide ditolak pimpinan

*Anda mengusulkan layanan legalisir melalui janji temu daring. Kepala bidang menolak karena khawatir warga yang tidak memiliki ponsel tertinggal.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menerima masukan, merevisi usulan dengan tetap menyediakan jalur tatap muka, lalu mengajukan uji coba terbatas | 5 | Mendengar keberatan dan memperbaiki ide |
| Menghormati keputusan dan menunggu kesempatan lain | 4 | Santun, tetapi ide berhenti |
| Menyampaikan ide yang sama kembali bulan depan | 3 | Gigih tanpa perbaikan |
| Mengurungkan semua ide karena merasa tidak didukung | 2 | Mudah menyerah |
| Menerapkan janji temu daring secara diam-diam di loket Anda | 1 | Melanggar keputusan pimpinan |

### Contoh 2: Mengukur dampak uji coba

*Uji coba pojok baca anak di ruang tunggu puskesmas sudah berjalan sebulan. Atasan meminta laporan hasilnya.*

Nilai 5: menyajikan data jumlah pengguna, keluhan ruang tunggu sebelum dan sesudah, serta masukan orang tua, disertai rekomendasi perbaikan. Nilai 4: melaporkan bahwa pojok baca ramai dipakai berdasarkan pengamatan. Nilai 3: melaporkan kegiatan tanpa data karena "manfaatnya jelas". Nilai 2: meminta waktu tambahan karena belum mencatat apa pun. Nilai 1: mengarang angka pengunjung agar program dilanjutkan. Tanpa data, inovasi sulit dipertahankan.

### Contoh 3: Meniru inovasi daerah lain

*Kabupaten tetangga sukses dengan layanan adminduk keliling memakai mobil. Atasan meminta Anda menerapkannya di daerah kepulauan tempat Anda bertugas.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mempelajari model aslinya, menyesuaikan dengan moda perahu dan jadwal kapal, lalu menguji coba di dua pulau terdekat | 5 | Replikasi dengan adaptasi dan uji coba |
| Menghubungi kabupaten tetangga untuk meminta panduan teknis | 4 | Kolaboratif, belum menyesuaikan kondisi lokal |
| Menyalin konsep apa adanya dan menunggu mobil tersedia | 3 | Kurang adaptif |
| Menyampaikan bahwa inovasi itu tidak cocok untuk wilayah kepulauan | 2 | Menolak tanpa mencoba |
| Melaporkan inovasi tersebut sebagai gagasan asli unit Anda | 1 | Tidak jujur |

### Contoh 4: Ide dari staf junior

*Anda ketua tim. Staf paling muda mengusulkan pengingat jadwal kontrol pasien melalui pesan otomatis. Idenya menarik, tetapi belum matang.*

Nilai 5: mengapresiasi idenya, membantu melengkapi aspek biaya dan perlindungan data, lalu mengajukannya ke pimpinan dengan menyebut nama staf tersebut sebagai pengusul. Nilai 4: menyetujui staf menyusun usulan sendiri. Nilai 3: meminta staf menunda sampai program lain selesai. Nilai 2: menganggap idenya terlalu rumit. Nilai 1: mengajukan ide itu atas nama Anda sendiri.

## Jebakan umum

- **Langsung skala besar**: opsi yang menerapkan ide ke seluruh unit tanpa uji coba jarang bernilai 5.
- **Merasa ide sudah jelas manfaatnya**: tanpa data, keberhasilan tidak dapat dibuktikan.
- **Gigih tanpa mendengar**: mengulang usulan yang sama setelah ditolak hanya bernilai sedang.
- **Copy-paste inovasi**: meniru tanpa menyesuaikan konteks lokal kurang tepat.
- **Mengklaim ide**: mengambil kredit orang lain selalu bernilai 1.

## Ringkasan

- Inovasi diuji dari eksekusinya: uji coba, data, perbaikan, dan perluasan.
- Penolakan dijawab dengan mendengar keberatan dan memperbaiki usulan.
- Replikasi inovasi harus diadaptasi dengan kondisi setempat.
- Kontribusi orang lain diakui secara terbuka.

## Tips

1. Cari kata "uji coba", "membandingkan sebelum dan sesudah", dan "merevisi usulan".
2. Opsi yang menghormati keputusan atasan **dan** tetap memperbaiki ide biasanya lebih tinggi daripada sekadar patuh.
3. Ide yang dijalankan diam-diam tanpa izin bernilai rendah, sebaik apa pun hasilnya.
4. Sebagai atasan, nilai tertinggi diberikan pada sikap yang menumbuhkan ide bawahan.
$md$,
   false, 2, 14),
  ('tkp-perubahan', 'Orientasi pada Perubahan: Menyikapi Kebijakan dan Cara Kerja Baru', 'tkp-perubahan-konsep', 'Mutasi, penyetaraan jabatan, kebijakan baru, dan kerja hibrida: dari menerima hingga beradaptasi aktif.',
$md$## Apa yang diukur aspek orientasi pada perubahan?

Birokrasi Indonesia terus berubah: jabatan administrasi disetarakan menjadi jabatan fungsional, layanan dipindahkan ke aplikasi, unit digabung atau dipecah, dan pegawai dimutasi ke daerah yang belum pernah mereka kenal. Aspek **orientasi pada perubahan** menilai apakah Anda melihat perubahan sebagai bagian wajar dari pekerjaan, lalu **cepat menyesuaikan diri dan ikut menyukseskannya**, bukan sekadar menerima dengan terpaksa atau diam-diam menolaknya.

Nilai BerAKHLAK yang paling dekat dengan aspek ini adalah **Adaptif**: cepat menyesuaikan diri menghadapi perubahan, terus berinovasi, dan bertindak proaktif. Orang yang adaptif tidak harus setuju dengan semua perubahan, tetapi ia menyampaikan keberatannya lewat jalur yang benar sambil tetap menjalankan keputusan yang sudah ditetapkan.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Terbuka terhadap hal baru | Mau mencoba cara kerja baru sebelum menilainya |
| Cepat belajar ulang | Mengikuti pelatihan, membaca pedoman, bertanya kepada yang lebih paham |
| Tetap produktif di masa transisi | Tidak menjadikan masa peralihan sebagai alasan kinerja turun |
| Memberi masukan konstruktif | Mencatat kendala dan mengusulkan perbaikan melalui forum resmi |
| Membantu orang lain beradaptasi | Berbagi pengetahuan kepada rekan yang tertinggal |
| Tidak menghambat | Tidak menyebar keluhan, tidak memakai cara lama secara diam-diam |

## Tangga skor orientasi pada perubahan

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menerima, segera mempelajari, menjalankan, dan ikut membantu perubahan berhasil, termasuk memberi masukan berbasis pengalaman | "mempelajari pedoman baru, menerapkannya, lalu mencatat kendala untuk diusulkan perbaikannya" |
| 4 | Menerima dan menjalankan perubahan dengan baik, tetapi tanpa langkah ekstra | "mengikuti ketentuan baru sesuai arahan" |
| 3 | Menerima secara pasif, menunggu orang lain mencoba dulu, atau menjalankan setengah hati | "menunggu rekan lain terbiasa dulu" |
| 2 | Mengeluh, meminta pengecualian, atau mempertahankan cara lama tanpa alasan yang sah | "meminta tetap memakai cara lama sampai siap" |
| 1 | Menolak terang-terangan, menghasut rekan, atau memboikot perubahan | "mengajak rekan tidak memakai sistem baru" |

> **Catatan:** Menyampaikan keberatan bukan berarti nilai rendah. Yang membedakan adalah **cara dan saluran**. Keberatan yang disertai data dan disampaikan kepada pihak berwenang, sambil tetap menjalankan keputusan, bisa bernilai 5. Mengeluh di grup percakapan atau mogok bekerja bernilai rendah.

## Contoh pembahasan

### Contoh 1: Penyetaraan jabatan

*Jabatan Anda sebagai kepala subbagian disetarakan menjadi jabatan fungsional. Anda kini tidak lagi memiliki bawahan dan kinerja diukur dengan angka kredit.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mempelajari ketentuan jabatan fungsional, menyusun rencana kerja sesuai butir kegiatan, dan berdiskusi dengan pembina jabatan agar kinerja tetap terukur | 5 | Menerima, belajar aktif, dan menyiapkan diri untuk berprestasi di peran baru |
| Menjalankan tugas sesuai uraian jabatan baru yang diberikan atasan | 4 | Patuh dan menjalankan, tetapi tanpa inisiatif memahami sistem penilaiannya |
| Menunggu sosialisasi lanjutan sebelum mengubah cara kerja | 3 | Pasif, masa transisi terbuang |
| Merasa kehilangan status dan meminta dipindahkan ke unit yang masih memiliki jabatan struktural | 2 | Menghindari perubahan demi kepentingan pribadi |
| Mengajak rekan senasib menolak penyetaraan melalui petisi di grup percakapan | 1 | Menghasut dan menghambat kebijakan |

### Contoh 2: Mutasi ke daerah lain

*Anda dimutasi dari kantor provinsi ke kantor cabang di kabupaten yang jauh dari keluarga.*

Nilai 5: menerima keputusan, mencari tahu tugas dan karakter wilayah baru sebelum berangkat, menyiapkan serah terima pekerjaan dengan rapi, dan mengatur urusan keluarga secara bertahap. Nilai 4: berangkat sesuai jadwal dan bekerja sebagaimana mestinya. Nilai 3: berangkat tetapi menunda serah terima sehingga pekerjaan lama terbengkalai. Nilai 2: berulang kali mengajukan penundaan dengan alasan yang dibuat-buat. Nilai 1: menolak berangkat dan tidak masuk kerja sebagai bentuk protes.

Alasan yang benar-benar sah, misalnya keluarga sakit berat, tetap boleh diajukan secara resmi dengan bukti.

### Contoh 3: Kerja hibrida

*Instansi Anda menerapkan kerja hibrida: dua hari bekerja dari rumah, tiga hari di kantor. Beberapa rekan memakai hari kerja dari rumah untuk urusan pribadi.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyusun target harian, tetap mudah dihubungi pada jam kerja, dan melaporkan hasil sesuai ketentuan | 5 | Menjalankan kebijakan dengan disiplin dan akuntabel |
| Bekerja dari rumah sesuai jadwal dan menjawab pesan bila dibutuhkan | 4 | Patuh, tetapi kurang terencana |
| Memilih selalu datang ke kantor karena lebih nyaman | 3 | Tidak salah, tetapi tidak ikut menguji kebijakan |
| Ikut memakai hari kerja dari rumah untuk urusan pribadi karena rekan lain juga begitu | 2 | Menyalahgunakan fleksibilitas |
| Mengusulkan kepada atasan agar kerja hibrida dihapus karena dianggap tidak berguna, tanpa data | 1 | Menolak tanpa dasar dan mengabaikan tujuan kebijakan |

### Contoh 4: Unit digabung

*Dua bidang di dinas Anda digabung. Anda kini satu tim dengan pegawai yang selama ini punya cara kerja berbeda.*

Nilai 5: berinisiatif menyamakan alur kerja bersama anggota baru, memetakan tugas yang tumpang tindih, dan mengusulkan pembagian peran kepada ketua tim. Nilai 4: menyesuaikan diri dengan pembagian tugas dari atasan. Nilai 3: tetap memakai cara lama selama belum ada teguran. Nilai 2: hanya mau bekerja dengan rekan dari bidang lama. Nilai 1: menyebarkan cerita bahwa penggabungan ini merugikan pegawai.

## Jebakan umum

- **"Menunggu semua jelas dulu"**: terdengar hati-hati, tetapi biasanya hanya bernilai 3. Orang adaptif bertanya dan belajar sambil berjalan.
- **Patuh tanpa belajar**: menjalankan perubahan tanpa memahami tujuannya sering bernilai 4, bukan 5.
- **Kritik di saluran yang salah**: keluhan di media sosial atau grup informal bernilai rendah walaupun isinya benar.
- **Menolak demi kenyamanan pribadi**: alasan "sudah terbiasa" atau "sebentar lagi pensiun" bukan alasan sah.

## Ringkasan

- Orientasi pada perubahan sama dengan nilai **Adaptif** dalam BerAKHLAK.
- Nilai 5: menerima, belajar cepat, menjalankan, lalu membantu perubahan berhasil.
- Keberatan boleh, asalkan berbasis data, lewat jalur resmi, dan keputusan tetap dijalankan.
- Sikap menunggu, mengeluh, atau meminta pengecualian adalah penanda nilai menengah ke bawah.

## Tips

1. Cari opsi yang memuat dua unsur: **menjalankan** perubahan dan **berkontribusi** pada keberhasilannya.
2. Bedakan "mengikuti arahan" (4) dari "mempelajari, menerapkan, dan memberi masukan" (5).
3. Jika soal menyebut kendala nyata, opsi terbaik tetap menjalankan perubahan sambil melaporkan kendala.
4. Waspadai opsi yang terdengar loyal pada cara lama; dalam TKP, kesetiaan pada kebiasaan bukan nilai plus.
$md$,
   true, 1, 15),
  ('tkp-perubahan', 'Menjadi Agen Perubahan dan Mengelola Resistensi', 'tkp-perubahan-memimpin', 'Mengomunikasikan perubahan, menghadapi rekan yang menolak, dan peran atasan maupun staf.',
$md$## Dari menerima perubahan menjadi menggerakkannya

Pelajaran sebelumnya membahas cara **menyikapi** perubahan. Soal TKP yang lebih sulit sering menempatkan Anda sebagai **penggerak**: ketua tim yang harus menerapkan aplikasi baru, staf muda yang ditugasi melatih rekan senior, atau pejabat yang harus menjelaskan kebijakan yang tidak populer. Di sini yang dinilai bukan lagi sekadar kesediaan Anda, tetapi kemampuan **membawa orang lain ikut berubah** tanpa memaksa, mempermalukan, atau menyerah.

### Indikator agen perubahan

| Indikator | Contoh perilaku |
| --- | --- |
| Menjelaskan alasan perubahan | Menyampaikan tujuan dan manfaat, bukan hanya perintah |
| Mendengar keberatan | Memberi ruang bertanya dan mencatat kekhawatiran |
| Memberi teladan | Menjadi yang pertama memakai cara baru |
| Mendampingi secara bertahap | Pelatihan kecil, panduan singkat, pendamping sebaya |
| Mengelola ketidakpastian | Jujur tentang apa yang belum diketahui dan memberi kabar berkala |
| Tegas pada keputusan | Tetap menjalankan keputusan walaupun ada penolakan |

## Mengapa orang menolak perubahan?

Penolakan jarang muncul karena niat buruk. Biasanya karena **takut tidak mampu**, **khawatir kehilangan peran**, **tidak paham tujuannya**, atau **pernah melihat perubahan gagal**. Opsi bernilai 5 menyentuh penyebab ini. Memaksa dengan ancaman atau melapor ke atasan sejak awal biasanya bernilai menengah, karena tidak menyelesaikan akar masalah.

## Tangga skor agen perubahan

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menggali penyebab penolakan, menjelaskan manfaat, mendampingi, dan tetap memastikan perubahan berjalan | "mengajak berdiskusi, lalu mendampinginya mencoba langsung" |
| 4 | Menjelaskan aturan dan meminta perubahan dijalankan, tanpa pendekatan personal | "menyampaikan bahwa ini sudah keputusan pimpinan" |
| 3 | Menyerahkan kepada atasan atau pelatihan resmi; menunggu orang berubah sendiri | "melaporkan kepada atasan agar diberi arahan" |
| 2 | Membiarkan pengecualian atau mengerjakan sendiri bagian orang yang menolak | "mengerjakan input datanya agar tidak ribut" |
| 1 | Mempermalukan, mengancam, atau ikut membatalkan perubahan | "menegurnya di depan forum", "kembali ke cara lama" |

## Contoh pembahasan

### Contoh 1: Staf muda, rekan senior menolak

*Anda staf termuda yang ditunjuk sebagai admin aplikasi perencanaan anggaran yang baru. Seorang rekan senior menolak menggunakan aplikasi dan tetap menyetor usulan dalam bentuk kertas.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengajaknya berbincang secara pribadi, menanyakan kendalanya, lalu menawarkan pendampingan langsung di mejanya sampai ia bisa mandiri | 5 | Menghormati senioritas, menyentuh akar masalah, dan memastikan perubahan berjalan |
| Menjelaskan bahwa usulan kertas tidak bisa diproses karena aturan baru mewajibkan aplikasi | 4 | Tegas dan benar, tetapi kurang membantu |
| Melaporkan kepada kepala bidang agar beliau yang menegur | 3 | Melempar tanpa usaha |
| Menginput sendiri usulan kertasnya ke aplikasi agar urusan cepat beres | 2 | Menyelesaikan sesaat tetapi melanggengkan penolakan |
| Menyindirnya di rapat sebagai pegawai yang tidak mau maju | 1 | Mempermalukan dan merusak hubungan |

### Contoh 2: Atasan menyampaikan kebijakan tidak populer

*Anda kepala seksi. Pimpinan memutuskan jam layanan diperpanjang satu jam tanpa tambahan pegawai. Staf Anda keberatan.*

Nilai 5: menjelaskan alasan kebijakan (misalnya banyak warga bekerja sampai sore), mendengar keberatan, menyusun jadwal bergilir yang adil bersama staf, dan menyampaikan kebutuhan tambahan sumber daya kepada pimpinan dengan data. Nilai 4: menyusun jadwal sendiri dan meminta staf menjalankan. Nilai 3: meneruskan surat edaran tanpa penjelasan. Nilai 2: memberi kelonggaran diam-diam agar staf pulang lebih awal. Nilai 1: ikut mengeluhkan kebijakan di depan staf sehingga penolakan menguat.

Pelajaran penting: sebagai atasan, Anda **tidak boleh menjadi corong keluhan** sekaligus tidak boleh menutup telinga. Posisi Anda adalah jembatan antara pimpinan dan staf.

### Contoh 3: Ketidakpastian restrukturisasi

*Beredar kabar unit Anda akan dilebur. Staf cemas dan produktivitas menurun, padahal keputusan resmi belum ada.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyampaikan secara jujur apa yang sudah dan belum diketahui, berjanji memberi kabar resmi begitu ada, dan menjaga target kerja tetap berjalan | 5 | Mengelola ketidakpastian dengan transparan dan menjaga kinerja |
| Mengingatkan staf untuk tetap fokus bekerja | 4 | Benar, tetapi tidak meredakan kecemasan |
| Menunggu keputusan resmi tanpa membahasnya | 3 | Netral, membiarkan rumor berkembang |
| Menenangkan staf dengan memastikan unit tidak akan dilebur | 2 | Janji yang tidak bisa dipegang |
| Ikut berspekulasi tentang siapa yang akan dipindahkan | 1 | Memperkeruh suasana |

### Contoh 4: Usulan perubahan dari bawah

*Anda staf pelaksana dan melihat alur disposisi surat masih memakai buku agenda manual. Anda ingin mengusulkan pemakaian aplikasi persuratan yang sudah disediakan pemerintah provinsi tetapi belum dipakai di kantor Anda.*

Nilai 5: menyiapkan perbandingan singkat waktu proses manual dan elektronik, mengusulkannya kepada atasan, lalu menawarkan diri menjadi pendamping uji coba di satu bidang. Nilai 4: mengusulkan secara lisan kepada atasan. Nilai 3: menyampaikan ide di obrolan santai tanpa tindak lanjut. Nilai 2: memakai aplikasi sendiri tanpa izin sehingga alur menjadi ganda. Nilai 1: mengeluhkan kantor yang ketinggalan zaman kepada pihak luar.

## Jebakan umum

- **Langsung melapor atau mengancam**: terasa tegas, tetapi melewatkan pendekatan personal.
- **Mengalah demi harmoni**: membiarkan pengecualian membuat perubahan gagal pelan-pelan.
- **Mengambil alih pekerjaan orang yang menolak**: kelihatan menolong, padahal menghambat.
- **Janji palsu saat tidak pasti**: menenangkan dengan informasi yang belum pasti merusak kepercayaan.
- **Perubahan tanpa izin**: inisiatif baik tetap harus lewat persetujuan.

## Ringkasan

- Agen perubahan menjelaskan **mengapa**, mendengar **kekhawatiran**, dan mendampingi **bagaimana**.
- Sebagai staf, gerakkan perubahan lewat usulan berbasis data dan uji coba yang disetujui.
- Sebagai atasan, jadilah jembatan: jalankan keputusan pimpinan sambil memperjuangkan kebutuhan staf secara resmi.
- Ketegasan dan empati harus hadir bersamaan.

## Tips

1. Hadapi penolakan dengan urutan: tanya penyebab, jelaskan manfaat, dampingi, lalu tegaskan.
2. Opsi yang menghormati rekan senior tetapi tetap menjalankan perubahan hampir selalu bernilai tertinggi.
3. Dalam ketidakpastian, pilih kejujuran dan kabar berkala, bukan janji atau spekulasi.
4. Hindari opsi yang mempermalukan orang di depan umum, seefektif apa pun kedengarannya.
$md$,
   false, 2, 15),
  ('tkp-pengendalian', 'Pengendalian Diri: Emosi, Kritik, dan Tekanan Kerja', 'tkp-pengendalian-konsep', 'Indikator pengendalian diri, tangga skor, dan contoh menghadapi kemarahan, kritik, dan beban kerja.',
$md$## Apa yang diukur aspek pengendalian diri?

Pengendalian diri adalah kemampuan **mengelola emosi dan dorongan sesaat** agar keputusan dan perilaku tetap profesional. ASN bekerja dengan warga yang kadang kecewa, atasan yang menuntut, rekan yang berbeda pendapat, dan beban kerja yang tidak selalu masuk akal. Soal pengendalian diri tidak menilai apakah Anda pernah marah atau kecewa, karena itu manusiawi, tetapi **apa yang Anda lakukan dengan perasaan itu**.

Orang dengan pengendalian diri yang baik mengakui emosinya, menenangkan diri sejenak, memisahkan fakta dari perasaan, lalu memilih respons yang menyelesaikan masalah.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Tenang di bawah tekanan | Tidak panik saat tenggat menumpuk; menyusun prioritas |
| Menerima kritik dengan dewasa | Mendengar, memilah isi kritik, dan memperbaiki diri |
| Tidak reaktif | Tidak membalas kata kasar dengan kata kasar |
| Mengelola kekecewaan | Tetap bekerja baik walaupun usulan ditolak atau tidak dipromosikan |
| Menjaga batas | Menolak dengan santun saat beban sudah berlebihan |
| Memisahkan urusan pribadi | Masalah rumah tidak terbawa ke pelayanan |

## Tangga skor pengendalian diri

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menenangkan diri, menilai situasi secara objektif, lalu mengambil langkah yang memperbaiki keadaan | "menerima masukan, mengevaluasi, lalu memperbaiki dan melaporkannya" |
| 4 | Tetap tenang dan profesional, tetapi belum menindaklanjuti akar masalah | "menerima kritik dan berjanji lebih berhati-hati" |
| 3 | Menahan diri dengan cara memendam atau menghindar | "diam saja dan melanjutkan pekerjaan" |
| 2 | Menunjukkan emosi secara tidak langsung: menggerutu, menyindir, bekerja asal-asalan | "mengeluhkannya kepada rekan" |
| 1 | Meluapkan emosi secara terbuka, membalas, atau mengambil keputusan impulsif | "membalas dengan nada tinggi", "langsung mengundurkan diri" |

> **Catatan:** Diam tidak selalu berarti terkendali. Memendam tanpa tindak lanjut biasanya bernilai 3, karena masalahnya tetap ada dan bisa meledak di kemudian hari.

## Contoh pembahasan

### Contoh 1: Dikritik atasan di depan rapat

*Dalam rapat evaluasi, atasan menyebut presentasi Anda tidak siap dan datanya tidak mutakhir. Anda merasa malu karena sudah lembur menyiapkannya.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menerima masukan dengan tenang, mencatat bagian yang perlu diperbaiki, lalu menyerahkan versi perbaikan secepatnya | 5 | Emosi terkelola dan kritik diubah menjadi perbaikan |
| Meminta maaf dan berjanji memperbaiki pada kesempatan berikutnya | 4 | Tenang dan sopan, tetapi tindak lanjutnya kabur |
| Diam sampai rapat selesai lalu melanjutkan pekerjaan lain | 3 | Tidak reaktif, tetapi tidak belajar |
| Menceritakan kepada rekan bahwa atasan tidak menghargai kerja keras Anda | 2 | Emosi disalurkan dengan menggerutu |
| Membantah di depan peserta rapat bahwa data terlambat karena unit lain | 1 | Reaktif dan menyalahkan |

### Contoh 2: Usulan ditolak

*Usulan program yang Anda siapkan berbulan-bulan ditolak pimpinan tanpa banyak penjelasan, sementara usulan rekan lain diterima.*

Nilai 5: meminta waktu untuk memahami alasan penolakan, mempelajari kelebihan usulan yang diterima, lalu memperbaiki usulan untuk siklus berikutnya. Nilai 4: menerima keputusan dan kembali bekerja seperti biasa. Nilai 3: berhenti mengusulkan program agar tidak kecewa lagi. Nilai 2: bekerja setengah hati karena merasa tidak dihargai. Nilai 1: menuduh rekan memakai kedekatan dengan pimpinan.

### Contoh 3: Beban kerja menumpuk

*Dalam satu minggu Anda mendapat tiga tugas mendesak dari dua atasan berbeda, sementara laporan rutin juga jatuh tempo. Anda mulai merasa kewalahan.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyusun daftar prioritas, mengomunikasikan kepada kedua atasan tugas mana yang bisa selesai kapan, dan meminta keputusan bila ada yang bertabrakan | 5 | Tenang, terstruktur, dan transparan |
| Lembur setiap hari agar semua tugas selesai | 4 | Bertanggung jawab tetapi tidak berkelanjutan |
| Mengerjakan yang paling mudah dulu dan berharap sisanya diberi kelonggaran | 3 | Menghindar dari masalah utama |
| Mengerjakan semua secara terburu-buru tanpa memeriksa ulang | 2 | Panik menurunkan mutu |
| Menolak tugas baru dengan nada kesal karena merasa diperlakukan tidak adil | 1 | Emosi mengendalikan respons |

### Contoh 4: Masalah pribadi terbawa ke kantor

*Pagi ini Anda bertengkar dengan anggota keluarga dan suasana hati buruk. Anda bertugas di loket layanan sepanjang hari.*

Nilai 5: menenangkan diri sebelum membuka loket dan tetap melayani warga dengan ramah; bila benar-benar tidak sanggup, meminta izin kepada atasan untuk bertukar tugas sementara. Nilai 4: tetap melayani walaupun kurang bersemangat. Nilai 3: melayani seadanya tanpa menyapa. Nilai 2: menutup loket lebih lama saat istirahat. Nilai 1: berbicara ketus kepada warga yang banyak bertanya.

### Contoh 5: Tidak terpilih promosi

*Anda tidak lolos seleksi jabatan, padahal merasa lebih berpengalaman daripada pegawai yang terpilih.*

Nilai 5: menerima hasil, meminta umpan balik dari panitia untuk mengetahui kekurangan, dan menyusun rencana pengembangan diri. Nilai 4: mengucapkan selamat kepada yang terpilih dan bekerja seperti biasa. Nilai 3: menarik diri dari kegiatan tim untuk sementara. Nilai 2: mengurangi kontribusi karena merasa tidak dihargai. Nilai 1: menyebarkan dugaan bahwa seleksi tidak adil tanpa bukti.

## Jebakan umum

- **Diam yang dianggap matang**: memendam emosi tanpa tindakan sering hanya bernilai 3.
- **Pembelaan yang terdengar logis**: menjelaskan bahwa kesalahan berasal dari pihak lain di forum terbuka tetap reaktif.
- **Pengorbanan berlebihan**: lembur tanpa batas bukan jawaban terbaik bila komunikasi prioritas bisa dilakukan.
- **Keputusan impulsif**: mengundurkan diri, mengajukan mutasi, atau menolak tugas dalam keadaan emosi.

## Ringkasan

- Pengendalian diri menilai respons terhadap emosi, bukan ada atau tidaknya emosi.
- Nilai 5: tenang, objektif, lalu bertindak memperbaiki keadaan.
- Kritik adalah bahan perbaikan; kekecewaan adalah bahan evaluasi diri.
- Beban berlebihan dikelola dengan prioritas dan komunikasi, bukan dengan panik atau marah.

## Tips

1. Bayangkan urutan **tenang, pahami, perbaiki**. Opsi yang memuat ketiganya biasanya bernilai 5.
2. Bedakan opsi 4 (tenang saja) dan 5 (tenang lalu menindaklanjuti).
3. Jika ada opsi yang menyalahkan pihak lain di depan umum, nilainya hampir pasti rendah.
4. Waspadai opsi yang "terlalu rela" mengorbankan kesehatan; TKP menghargai cara kerja yang berkelanjutan.
$md$,
   true, 1, 15),
  ('tkp-pengendalian', 'Tetap Tenang dalam Provokasi, Fitnah, dan Media Sosial', 'tkp-pengendalian-konflik', 'Menghadapi warga yang memaki atau merekam, fitnah rekan, dan komentar di media sosial lewat jalur resmi.',
$md$## Ketika emosi dipancing dengan sengaja

Pelajaran sebelumnya membahas emosi akibat tekanan kerja. Pelajaran ini membahas situasi yang lebih berat: **provokasi**. Warga memaki sambil merekam dengan ponsel, rekan menyebar cerita tidak benar tentang Anda, atau akun anonim menyerang instansi Anda di media sosial. Dalam situasi seperti ini, respons yang terasa paling memuaskan, yaitu membalas, hampir selalu menjadi respons yang paling merugikan.

Prinsip dasarnya: **Anda mewakili instansi**. Setiap kata dan tindakan Anda, apalagi yang terekam, akan dibaca publik sebagai sikap pemerintah. Pengendalian diri di sini berarti tetap tenang, tidak membalas, dan menyelesaikan masalah lewat jalur resmi.

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Tidak terpancing | Tetap berbicara dengan nada rendah walaupun dimaki |
| Fokus pada substansi | Menanggapi keluhan, bukan cara penyampaiannya |
| Mendokumentasikan | Mencatat kejadian, menyimpan bukti, melapor kepada atasan |
| Klarifikasi secara tepat | Meluruskan fitnah langsung kepada pihak terkait atau lewat jalur resmi |
| Bijak di media sosial | Tidak membalas komentar dengan akun pribadi; menyerahkan kepada pengelola kanal resmi |
| Menjaga keselamatan | Meminta bantuan petugas keamanan bila situasi mengancam |

## Tangga skor pengendalian diri dalam provokasi

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Tenang, menanggapi substansi, mendokumentasikan, dan menyelesaikan lewat jalur resmi | "tetap melayani dengan tenang, lalu melaporkan kejadian kepada atasan" |
| 4 | Tenang dan tidak membalas, tetapi belum ada langkah penyelesaian | "membiarkan saja dan tetap bekerja" |
| 3 | Menghindar: meninggalkan situasi atau menyerahkan kepada orang lain tanpa koordinasi | "meminta rekan menggantikan" |
| 2 | Membela diri secara defensif atau menyindir | "menjelaskan bahwa ia tidak salah dengan nada kesal" |
| 1 | Membalas, mengancam, merebut ponsel, atau menyerang balik di media sosial | "membalas komentar dengan kata kasar" |

## Contoh pembahasan

### Contoh 1: Warga memaki sambil merekam

*Seorang warga kecewa karena bantuan sosialnya belum cair. Ia memaki Anda di kantor kelurahan sambil merekam dengan ponsel dan mengancam akan memviralkan videonya.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Tetap tenang, mempersilakannya duduk, mengecek status bantuannya di sistem, dan menjelaskan penyebab serta langkah selanjutnya | 5 | Fokus pada masalah warga; rekaman justru menunjukkan pelayanan yang baik |
| Mendengarkan tanpa membalas sampai warga reda | 4 | Terkendali, tetapi masalah belum ditangani |
| Meminta rekan lain melayani warga itu karena Anda tidak nyaman | 3 | Menghindar |
| Meminta warga berhenti merekam karena melanggar privasi pegawai | 2 | Fokus pada diri sendiri, memicu konflik |
| Merebut ponsel warga agar rekaman tidak tersebar | 1 | Tindakan fisik yang memperburuk keadaan |

> **Catatan:** Warga pada umumnya boleh mendokumentasikan pelayanan publik. Yang perlu dilindungi adalah data pribadi warga lain di sekitar loket; bila ada, mintalah dengan sopan agar layar atau berkas orang lain tidak ikut terekam.

### Contoh 2: Fitnah dari rekan

*Anda mendengar seorang rekan menceritakan kepada orang lain bahwa Anda sering pulang lebih awal dan menitipkan absen. Itu tidak benar.*

Nilai 5: menemui rekan tersebut secara pribadi, menanyakan dasar ceritanya dengan tenang, dan meluruskan dengan menunjukkan data presensi; bila fitnah berlanjut, melaporkannya kepada atasan. Nilai 4: mengabaikannya karena yakin kinerja akan berbicara sendiri. Nilai 3: menjauhi rekan itu. Nilai 2: mengklarifikasi di grup percakapan kantor dengan nada menyindir. Nilai 1: membalas dengan menyebarkan keburukan rekan itu.

### Contoh 3: Komentar pedas di akun instansi

*Akun resmi dinas Anda mendapat komentar kasar yang menuduh pegawai malas. Anda bukan admin media sosial, tetapi melihatnya lewat akun pribadi.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Meneruskan tangkapan layar kepada admin kanal resmi agar ditanggapi sesuai pedoman, dan bila keluhannya menyangkut unit Anda, menyiapkan informasi klarifikasi | 5 | Tidak reaktif, memakai jalur resmi, membantu penyelesaian |
| Tidak menanggapi karena bukan tugas Anda | 4 | Terkendali, tetapi pasif |
| Memberi tanda suka pada komentar warga lain yang membela instansi | 3 | Tidak membantu dan berpotensi memancing |
| Membalas dengan akun pribadi bahwa tuduhan itu tidak benar | 2 | Defensif dan bukan kewenangan Anda |
| Membalas dengan menyebut komentator tidak tahu diri | 1 | Menyerang balik dan mencoreng instansi |

### Contoh 4: Provokasi dalam rapat warga

*Saat sosialisasi program di balai desa, seorang peserta menuding Anda berbohong dan menyuruh peserta lain tidak percaya kepada pemerintah.*

Nilai 5: menanggapi dengan tenang, mengakui keraguan warga sebagai hal wajar, menyampaikan data dan dasar aturan, serta menawarkan diskusi lanjutan setelah acara. Nilai 4: melanjutkan paparan tanpa menanggapi tudingan. Nilai 3: meminta moderator mengambil alih. Nilai 2: meminta peserta itu keluar dari ruangan. Nilai 1: balik menuding peserta tersebut sebagai provokator.

## Jebakan umum

- **Membela diri berlebihan**: terasa wajar, tetapi menggeser fokus dari masalah warga ke harga diri pegawai.
- **Melarang merekam**: biasanya bernilai rendah karena terkesan menutupi.
- **Klarifikasi lewat akun pribadi**: niat baik, tetapi berisiko memperkeruh dan melampaui kewenangan.
- **Mengabaikan total**: lebih baik dari membalas, tetapi kurang dari menyelesaikan.
- **Membalas fitnah dengan fitnah**: selalu bernilai terendah.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| tetap tenang, mempersilakan duduk | membalas, menyindir, membentak |
| mengecek data, menjelaskan langkah | meminta berhenti merekam, merebut ponsel |
| meneruskan ke admin kanal resmi | membalas dengan akun pribadi |
| klarifikasi pribadi, lalu lapor atasan | menyebar balik, menjauhi |

## Ringkasan

- Dalam provokasi, Anda tetap mewakili instansi; tanggapi substansi, bukan cara penyampaian.
- Nilai 5: tenang, menyelesaikan masalah, dan memakai jalur resmi untuk hal di luar kewenangan.
- Fitnah diluruskan secara pribadi dengan bukti, lalu dilaporkan bila berlanjut.
- Media sosial instansi ditangani pengelola resminya, bukan akun pribadi pegawai.

## Tips

1. Ingat urutan **redam, tangani, laporkan**.
2. Jika ada kamera, bayangkan rekaman itu ditonton jutaan orang; pilih respons yang Anda banggakan.
3. Opsi "membiarkan saja" biasanya 4, bukan 5, karena tidak menyelesaikan masalah.
4. Setiap opsi yang melibatkan kontak fisik, ancaman, atau kata kasar adalah kandidat nilai 1.
$md$,
   false, 2, 15),
  ('tkp-pelayanan', 'Pelayanan Publik di Kanal Digital: Chat, Media Sosial, dan Aplikasi', 'tkp-pelayanan-digital', 'Merespons pesan dan komplain daring, mendampingi warga yang belum melek digital, dan menjaga data pribadi.',
$md$## Pelayanan tidak berhenti di loket

Banyak instansi kini melayani warga lewat WhatsApp resmi, pesan langsung di media sosial, kolom komentar, aplikasi pengaduan, dan surel. Prinsip pelayanan prima tetap sama, tetapi kanal digital membawa tantangan khas: **warga mengharapkan respons cepat**, **percakapan mudah tersebar**, **data pribadi rentan bocor**, dan **tidak semua warga cakap teknologi**. Soal TKP pelayanan publik semakin sering memakai latar seperti ini.

### Indikator pelayanan digital yang baik

| Indikator | Contoh perilaku |
| --- | --- |
| Responsif sesuai standar | Membalas dalam batas waktu yang ditetapkan, minimal memberi tanda pesan diterima |
| Jelas dan tuntas | Jawaban lengkap, menyertakan tautan atau langkah, tidak sekadar "silakan datang ke kantor" |
| Menjaga data pribadi | Tidak meminta atau membagikan NIK dan dokumen di kolom publik; memindahkan ke kanal privat resmi |
| Memakai kanal resmi | Melayani lewat akun instansi, bukan nomor pribadi |
| Inklusif | Menyediakan alternatif bagi warga yang tidak bisa memakai aplikasi |
| Belajar dari keluhan | Mencatat pertanyaan berulang dan mengusulkan perbaikan informasi |

## Tangga skor pelayanan digital

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Merespons cepat lewat kanal resmi, menyelesaikan atau memberi kepastian, melindungi data, dan menindaklanjuti akar masalah | "memindahkan percakapan ke pesan pribadi akun resmi, mengecek status, lalu mengabarkan hasilnya" |
| 4 | Menjawab dengan benar dan sopan, tetapi tanpa tindak lanjut atau langkah tambahan | "menjawab pertanyaan sesuai informasi yang tersedia" |
| 3 | Jawaban template yang tidak menjawab, atau mengarahkan ke kanal lain tanpa bantuan | "meminta warga membaca pengumuman di situs" |
| 2 | Menunda tanpa kabar, atau memakai cara tidak resmi yang berisiko | "meminta warga menghubungi nomor pribadi" |
| 1 | Mengabaikan, membalas ketus, menghapus keluhan, atau membocorkan data | "menghapus komentar agar tidak terlihat atasan" |

## Contoh pembahasan

### Contoh 1: Keluhan di kolom komentar menyertakan NIK

*Anda admin media sosial puskesmas. Seorang warga menulis keluhan di kolom komentar bahwa klaim layanannya ditolak, sambil mencantumkan NIK dan nomor kartunya.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Membalas dengan sopan, meminta warga menghapus NIK demi keamanan data, mengajak melanjutkan lewat pesan pribadi akun resmi, lalu mengecek dan mengabarkan penyelesaiannya | 5 | Responsif, melindungi data, dan menyelesaikan |
| Membalas di kolom komentar dengan penjelasan umum penyebab klaim ditolak | 4 | Menanggapi, tetapi data warga tetap terpampang dan kasusnya tidak dicek |
| Membalas dengan meminta warga datang langsung ke loket | 3 | Tidak menyelesaikan lewat kanal yang ia pilih |
| Membiarkan komentar sampai ada arahan atasan | 2 | Lambat dan membiarkan data terekspos |
| Menghapus komentar agar citra puskesmas terjaga | 1 | Menutupi keluhan dan tidak melayani |

### Contoh 2: Pesan masuk di luar jam kerja

*Kanal WhatsApp resmi kantor Anda mencantumkan jam layanan pukul 08.00–16.00. Pukul 21.00, seorang warga mengirim pesan menanyakan syarat pindah sekolah anaknya yang harus diurus besok pagi.*

Nilai 5: bila Anda petugas yang bertanggung jawab atas kanal itu dan informasinya tersedia, mengirim jawaban singkat berupa daftar syarat atau tautan resmi, lalu menindaklanjuti esok pagi; bila tidak, memastikan pesan otomatis di luar jam layanan aktif dan memprioritaskan pesan itu pagi harinya. Nilai 4: membalas pukul 08.00 dengan jawaban lengkap. Nilai 3: membalas siang hari dengan meminta warga datang ke kantor. Nilai 2: membalas dari nomor pribadi agar lebih cepat. Nilai 1: membiarkan pesan tidak terjawab karena di luar jam kerja.

Catatan: TKP tidak menuntut Anda bekerja tanpa batas. Yang dinilai adalah **sistem respons** yang membuat warga tidak terlantar.

### Contoh 3: Keluhan viral

*Video warga yang mengeluh antrean daring kantor Anda selalu penuh dalam hitungan menit viral di media sosial dan ditandai ke akun kepala daerah.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Melaporkan kepada atasan, membantu menyiapkan data penyebab (misalnya kuota harian dan pemakaian calo), dan mengusulkan perbaikan sistem kuota serta klarifikasi resmi | 5 | Fokus pada akar masalah dan memakai jalur resmi |
| Menyiapkan jawaban klarifikasi untuk diunggah admin setelah disetujui atasan | 4 | Tepat prosedur, tetapi belum menyentuh perbaikan |
| Menunggu tim humas menangani | 3 | Pasif |
| Mengirim pesan pribadi kepada pengunggah agar menghapus videonya | 2 | Menekan warga, bukan menyelesaikan |
| Membalas di kolom komentar bahwa warga itu tidak sabar | 1 | Reaktif dan merusak citra |

### Contoh 4: Warga tidak bisa memakai aplikasi

*Layanan izin keramaian kini wajib diajukan lewat aplikasi. Seorang ketua RT lanjut usia datang ke kantor karena tidak punya ponsel pintar.*

Nilai 5: mendampinginya mengajukan permohonan di gerai bantuan atau komputer layanan mandiri, menjelaskan cara memantau statusnya, dan mencatat kebutuhan pendampingan untuk diusulkan sebagai layanan tetap. Nilai 4: mengajukan permohonan atas namanya melalui akun petugas sesuai ketentuan. Nilai 3: memberinya panduan tercetak. Nilai 2: memintanya meminta tolong anak atau cucu. Nilai 1: menolak karena layanan kini hanya daring.

## Jebakan umum

- **Kecepatan tanpa kanal resmi**: membalas lewat nomor pribadi terdengar sigap, tetapi berisiko dan tidak terdokumentasi.
- **Menghapus keluhan**: hampir selalu bernilai 1.
- **Jawaban template**: sopan, tetapi bila tidak menjawab inti pertanyaan nilainya menengah.
- **Mengabaikan data pribadi**: opsi yang benar isinya tetapi membiarkan NIK terpampang tidak bernilai 5.
- **Digital-only**: menolak warga yang tidak bisa memakai aplikasi bertentangan dengan prinsip inklusif.

## Ringkasan

- Pelayanan digital tetap mengikuti standar: cepat, jelas, tuntas, adil, dan resmi.
- Pindahkan urusan yang memuat data pribadi ke kanal privat resmi.
- Keluhan viral diselesaikan dengan data dan perbaikan, bukan dengan membalas atau menekan.
- Sediakan jalur pendampingan bagi warga yang belum cakap teknologi.

## Tips

1. Cek empat hal pada setiap opsi: **cepat, resmi, aman data, tuntas**. Opsi yang memenuhi keempatnya bernilai 5.
2. Jawaban "silakan datang ke kantor" untuk pertanyaan yang bisa dijawab daring biasanya bernilai 3.
3. Opsi yang memakai akun atau nomor pribadi patut dicurigai bernilai rendah.
4. Keluhan berulang adalah sinyal untuk mengusulkan perbaikan sistem; opsi seperti itu sering bernilai tertinggi.
$md$,
   false, 5, 15),
  ('tkp-jejaring', 'Jejaring Kerja dari Kursi Atasan dan Staf', 'tkp-jejaring-peran-atasan', 'Membuka akses jejaring bagi staf, menjembatani tanpa melangkahi atasan, dan mengatasi ego sektoral.',
$md$## Fokus pelajaran ini

Soal jejaring kerja tidak selalu menempatkan Anda sebagai staf pelaksana. Cukup sering stem dibuka dengan kalimat "Anda ketua tim", "Anda kepala seksi", atau "Anda baru diangkat sebagai koordinator". Di sisi lain, ada soal yang menempatkan Anda sebagai staf yang kebetulan punya kenalan di instansi lain, sehingga tergoda untuk "jalan pintas". Pelajaran ini membahas bagaimana sikap ideal berubah sesuai **posisi** Anda, dan bagaimana menghadapi mitra yang tidak responsif serta ego sektoral.

Prinsip dasarnya tetap sama: jejaring kerja yang baik adalah jejaring yang **melembaga**, bukan milik pribadi. Hubungan dibangun untuk kepentingan layanan, dijalankan lewat jalur yang sah, dan bisa diteruskan kepada orang lain.

### Indikator menurut peran

| Peran | Perilaku bernilai tinggi |
| --- | --- |
| Atasan / ketua tim | Membuka akses jejaring bagi staf, memperkenalkan staf kepada mitra, membentuk forum koordinasi, membagi kredit kepada mitra |
| Staf pelaksana | Menjalin hubungan teknis dengan mitra, melaporkan perkembangan kepada atasan, tidak melangkahi kewenangan |
| Keduanya | Menindaklanjuti komitmen, mendokumentasikan kesepakatan, mencari titik temu ketika kepentingan berbeda |

## Tangga skor jejaring berdasarkan peran

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Membangun kerja sama yang melembaga dan sesuai kewenangan; melibatkan pihak yang tepat dan menindaklanjuti | "mengusulkan rapat koordinasi dan menyepakati narahubung tiap instansi" |
| 4 | Berkoordinasi dengan baik, tetapi masih bersifat sekali jalan atau bergantung pada diri sendiri | "menghubungi mitra untuk menanyakan perkembangan" |
| 3 | Menunggu, sekadar meneruskan pesan, atau mengikuti arus | "menunggu arahan berikutnya" |
| 2 | Bekerja sendiri, menyimpan kontak untuk diri sendiri, atau menyalahkan pihak lain | "mengerjakan sendiri tanpa melibatkan instansi terkait" |
| 1 | Melangkahi kewenangan, memakai kedekatan pribadi untuk kepentingan tertentu, atau memutus komunikasi | "langsung meminta pejabat kenalan agar berkas diloloskan" |

## Contoh pembahasan

### Contoh 1: Staf baru belum dikenal mitra

*Anda ketua tim penyusunan rencana aksi penurunan stunting. Dua staf baru di tim Anda akan menjadi narahubung dengan dinas kesehatan dan Bappeda, tetapi selama ini semua komunikasi melalui Anda.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memperkenalkan kedua staf dalam rapat koordinasi, membagikan kontak mitra, dan mendampingi mereka pada pertemuan awal | 5 | Jejaring dialihkan menjadi milik tim, staf diberdayakan |
| Mengirim surat pemberitahuan resmi kepada mitra tentang narahubung baru | 4 | Sah dan jelas, tetapi tanpa membangun hubungan kerja |
| Meminta staf menghubungi mitra sendiri karena nomor kantor tersedia di situs resmi | 3 | Memberi kesempatan, tetapi tanpa dukungan |
| Tetap menangani semua komunikasi sendiri agar tidak terjadi salah informasi | 2 | Menjadi penghambat dan membuat tim bergantung |
| Melarang staf berhubungan langsung dengan mitra | 1 | Menutup jejaring dan mematikan pengembangan staf |

Kunci: seorang atasan dinilai dari kemampuannya **menularkan** jejaring, bukan menguasainya.

### Contoh 2: Staf yang kenal pejabat instansi lain

*Anda staf di dinas perdagangan. Untuk sebuah kegiatan, dinas Anda membutuhkan rekomendasi dari dinas lingkungan hidup. Kepala bidang di dinas itu adalah kakak kelas Anda. Atasan Anda sedang menyiapkan surat permohonan resmi.*

Nilai 5: menyampaikan kepada atasan bahwa Anda mengenal kepala bidang tersebut dan menawarkan diri membantu komunikasi teknis, misalnya memastikan dokumen yang dibutuhkan sudah lengkap, sementara surat resmi tetap berjalan. Nilai 4: membantu menyiapkan surat resmi dan menunggu prosesnya. Nilai 3: tidak menyebut kedekatan itu sama sekali. Nilai 2: menelepon kakak kelas untuk menanyakan proses tanpa sepengetahuan atasan. Nilai 1: meminta kakak kelas menerbitkan rekomendasi lebih dulu tanpa menunggu surat. Perbedaan 5 dan 2 terletak pada **transparansi kepada atasan** dan tidak melangkahi alur.

### Contoh 3: Mitra yang tidak membalas

*Tim Anda menunggu data jumlah UMKM dari dinas koperasi untuk laporan bersama. Sudah dua kali surat dan pesan tidak dibalas, dan tenggat tinggal seminggu.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menghubungi narahubung lewat telepon, menanyakan kendalanya, dan bila perlu menawarkan format data yang lebih sederhana atau datang langsung | 5 | Mencari akar masalah dan memudahkan mitra |
| Meminta atasan mengirim surat pengingat resmi | 4 | Sah, tetapi belum mencari tahu penyebab |
| Menunggu sambil menyelesaikan bagian laporan yang lain | 3 | Tidak salah, tetapi pasif |
| Memakai data tahun lalu tanpa keterangan | 2 | Mengorbankan kualitas |
| Melaporkan dalam rapat pimpinan bahwa dinas koperasi tidak kooperatif | 1 | Menyalahkan dan merusak hubungan |

### Contoh 4: Ego sektoral dalam program bersama

*Anda kepala seksi di dinas sosial. Dalam program pengentasan kemiskinan terpadu, dinas pendidikan dan dinas kesehatan sama-sama ingin programnya ditonjolkan, sehingga pembagian anggaran rapat terus tertunda.*

Nilai 5: mengusulkan agar pembahasan berangkat dari data sasaran bersama (keluarga yang sama), menyusun matriks peran tiap OPD, dan menyepakati bahwa capaian dilaporkan sebagai capaian bersama. Nilai 4: meminta Bappeda sebagai koordinator memfasilitasi keputusan. Nilai 3: mengikuti hasil rapat apa pun. Nilai 2: memperjuangkan porsi dinas sendiri. Nilai 1: menarik dinas Anda dari program. Ego sektoral diredam dengan **tujuan dan data bersama**, bukan dengan menang-kalah.

## Jebakan umum

- **Jejaring pribadi**: kontak penting hanya dipegang satu orang, sehingga kerja sama runtuh saat ia mutasi.
- **Jalan pintas lewat kenalan**: terasa efektif, tetapi melangkahi atasan dan prosedur.
- **Menyalahkan mitra di forum**: memuaskan sesaat, merusak kerja sama jangka panjang.
- **Atasan yang mengerjakan semuanya**: terlihat bertanggung jawab, padahal menghambat tim.
- **Surat tanpa komunikasi**: formal itu perlu, tetapi sering hanya bernilai 4 bila tidak disertai upaya memahami mitra.

## Ringkasan

- Sebagai atasan, nilai tertinggi diberikan pada sikap yang membuka akses jejaring bagi staf dan membangun forum yang melembaga.
- Sebagai staf, kedekatan pribadi boleh dimanfaatkan untuk komunikasi teknis, asalkan transparan kepada atasan dan tidak melangkahi alur resmi.
- Mitra yang tidak responsif dihadapi dengan mencari tahu kendalanya, bukan dengan menyalahkan.
- Ego sektoral diatasi dengan data sasaran dan tujuan bersama.

## Tips

1. Baca stem dengan teliti: apakah Anda atasan atau staf? Batas kewenangan menentukan opsi terbaik.
2. Opsi yang membuat kerja sama tetap berjalan setelah Anda tidak ada biasanya bernilai 5.
3. Bila ada opsi "langsung ke pejabat kenalan", periksa apakah atasan dilibatkan; jika tidak, nilainya rendah.
4. Surat resmi saja umumnya bernilai 4; surat ditambah komunikasi yang memahami kendala mitra bernilai 5.
$md$,
   false, 4, 15),
  ('tkp-sosbud', 'Sosial Budaya: Kasus Ambigu antara Adat, Aturan, dan Kepentingan Umum', 'tkp-sosbud-kasus-ambigu', 'Menimbang adat, regulasi, dan kepentingan kelompok minoritas dalam kasus yang tidak hitam-putih.',
$md$## Fokus pelajaran ini

Soal sosial budaya yang paling menjebak bukanlah soal tentang menghormati adat secara umum, melainkan soal ketika **adat, aturan, dan kepentingan umum tampak bertabrakan**. Misalnya, tradisi setempat tidak memberi tempat bagi perempuan berbicara di forum, atau upacara adat berlangsung pada jam layanan. Di sini dua jawaban ekstrem sama-sama keliru: "ikuti adat apa pun yang terjadi" dan "terapkan aturan tanpa peduli adat".

Pelajaran ini melatih Anda menemukan jawaban yang **menghormati budaya sekaligus menjaga aturan dan hak setiap warga**.

### Tiga pertanyaan penuntun

| Pertanyaan | Mengapa penting |
| --- | --- |
| Apakah ada aturan atau hak warga yang dilanggar? | Hak dasar (layanan, keselamatan, kesetaraan) tidak boleh dikorbankan demi kebiasaan |
| Siapa tokoh atau lembaga adat yang dapat diajak bicara? | Perubahan di masyarakat adat paling efektif lewat dialog dengan tokohnya |
| Adakah cara yang memenuhi keduanya? | Jawaban bernilai 5 hampir selalu berupa jalan tengah yang sah |

## Tangga skor kasus ambigu

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menghormati adat, berdialog dengan tokoh adat/masyarakat, dan mencari solusi yang tetap memenuhi aturan serta hak semua pihak | "bermusyawarah dengan tetua adat untuk mengatur jadwal agar layanan tetap buka" |
| 4 | Menghormati adat dan aturan, tetapi solusinya parsial atau belum melibatkan masyarakat | "mengatur piket agar layanan tidak berhenti" |
| 3 | Mengikuti mayoritas atau menunggu tanpa sikap | "mengikuti kebiasaan yang berlaku" |
| 2 | Memaksakan aturan secara kaku atau menghindari persoalan | "melarang kegiatan adat di sekitar kantor" |
| 1 | Merendahkan budaya, mendiskriminasi kelompok, atau mengorbankan hak warga | "menganggap adat itu kuno dan tidak perlu dihormati" |

## Contoh pembahasan

### Contoh 1: Upacara adat pada hari kerja

*Anda kepala seksi pelayanan di kantor kecamatan. Masyarakat setempat menggelar upacara adat tahunan selama dua hari pada hari kerja, dan sebagian besar pegawai yang berasal dari daerah itu ingin ikut.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menyusun jadwal piket bergilir bersama pegawai agar setiap orang dapat mengikuti upacara pada waktu tertentu, mengumumkan jam layanan yang disesuaikan, dan melapor kepada camat | 5 | Adat dihormati, layanan tetap berjalan, transparan |
| Mengizinkan pegawai ikut dengan syarat mengajukan cuti sesuai ketentuan | 4 | Sesuai aturan, tetapi layanan berisiko kosong |
| Membiarkan pegawai mengatur diri sendiri | 3 | Tidak ada pengelolaan |
| Mewajibkan semua pegawai tetap di kantor penuh waktu | 2 | Kaku dan tidak peka |
| Menutup kantor dua hari agar semua bisa ikut | 1 | Mengorbankan hak layanan warga |

### Contoh 2: Perempuan dalam forum adat

*Anda pendamping desa. Dalam musyawarah perencanaan pembangunan di sebuah desa adat, kaum perempuan biasanya hanya menyiapkan konsumsi dan tidak ikut bersuara, padahal usulan posyandu dan air bersih sangat menyangkut mereka.*

Nilai 5: berdialog lebih dulu dengan tetua adat dan kepala desa tentang pentingnya masukan perempuan, lalu mengusulkan forum khusus perempuan sebelum musyawarah yang hasilnya dibawakan secara resmi. Nilai 4: mencatat usulan perempuan secara informal dan menyampaikannya sendiri di forum. Nilai 3: mengikuti tata cara adat apa adanya. Nilai 2: memprotes di tengah musyawarah. Nilai 1: menganggap hal itu bukan urusan pendamping.

### Contoh 3: Kelompok minoritas di desa

*Sebuah keluarga penganut kepercayaan lokal di desa tempat Anda bertugas tidak pernah diundang dalam kegiatan desa dan kesulitan mendapat surat pengantar karena ketua RT enggan melayani.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Memastikan keluarga itu mendapat layanan sesuai haknya, lalu berbicara dengan ketua RT secara baik tentang kewajiban melayani semua warga | 5 | Hak dipenuhi, pendekatan persuasif |
| Melayani surat pengantar langsung di kantor desa | 4 | Hak terpenuhi, tetapi akar masalah tidak disentuh |
| Menyarankan keluarga itu bersabar | 3 | Tidak menyelesaikan |
| Menganggap itu urusan pribadi antarwarga | 2 | Abai terhadap diskriminasi |
| Menyarankan keluarga itu mengikuti agama mayoritas agar lebih diterima | 1 | Diskriminatif dan melanggar kebebasan berkeyakinan |

### Contoh 4: Bahasa daerah dalam rapat resmi

*Dalam rapat koordinasi di kabupaten, sebagian peserta terus berbicara dalam bahasa daerah, sementara dua peserta dari provinsi tidak memahaminya.*

Nilai 5: dengan santun mengusulkan rapat menggunakan bahasa Indonesia agar semua peserta dapat berkontribusi, dan menawarkan menerjemahkan istilah lokal yang penting. Nilai 4: menerjemahkan secara berbisik kepada peserta dari provinsi. Nilai 3: diam saja. Nilai 2: menegur peserta di depan forum dengan nada keras. Nilai 1: menertawakan logat peserta. Bahasa daerah dihargai, tetapi forum resmi membutuhkan bahasa yang dipahami bersama.

### Contoh 5: Tradisi yang membahayakan

*Di daerah tugas Anda, ada tradisi membakar lahan sebelum musim tanam yang kini dilarang karena memicu kebakaran hutan.*

Nilai 5: bekerja sama dengan tokoh adat dan penyuluh pertanian untuk memperkenalkan cara membuka lahan tanpa bakar, sambil menyosialisasikan larangan dan risikonya. Nilai 1: membiarkan karena "sudah tradisi". Keselamatan publik adalah batas yang tidak bisa ditawar, tetapi cara menegakkannya tetap menghormati masyarakat.

## Jebakan umum

- **Relativisme penuh**: menganggap setiap adat harus diikuti, termasuk yang melanggar hak atau keselamatan.
- **Penegakan aturan tanpa dialog**: benar secara hukum, tetapi memicu penolakan.
- **Solusi diam-diam**: menolong satu warga tanpa membenahi sikap pihak yang mendiskriminasi.
- **Mengikuti mayoritas**: suara terbanyak tidak membenarkan pengabaian hak kelompok kecil.
- **Mempermalukan di forum**: niat benar, cara keliru.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| bermusyawarah dengan tokoh adat, jalan tengah | memaksakan, melarang tanpa dialog |
| memastikan hak setiap warga | mengikuti mayoritas, bukan urusan saya |
| jadwal piket, layanan tetap berjalan | menutup layanan |

## Ringkasan

- Kasus ambigu menuntut keseimbangan: adat dihormati, aturan ditegakkan, hak setiap warga dijamin.
- Dialog dengan tokoh adat adalah kunci perubahan yang diterima.
- Hak dasar dan keselamatan publik tidak boleh dikorbankan demi tradisi.
- Kelompok minoritas berhak atas layanan dan perlakuan yang sama.

## Tips

1. Saat ragu, cari opsi yang memenuhi **dua sisi** sekaligus; opsi yang hanya memenangkan satu pihak jarang bernilai 5.
2. Opsi berisi kata "memaksa", "melarang", atau "menegur keras di depan umum" umumnya bernilai 2.
3. Opsi yang merendahkan budaya atau menyuruh orang mengubah keyakinan selalu bernilai 1.
4. Bedakan opsi 4 (menolong langsung) dan 5 (menolong sekaligus membenahi akar masalah).
$md$,
   false, 4, 15),
  ('tkp-tik-dasar', 'Literasi Data, Kecerdasan Artifisial, dan Arsip Digital', 'tkp-tik-data-ai', 'Memakai AI generatif secara aman, menjaga kualitas data, dan mengelola arsip digital.',
$md$## Fokus pelajaran ini

Teknologi di kantor pemerintahan kini tidak hanya berupa aplikasi layanan. ASN mulai memakai **kecerdasan artifisial (AI) generatif** untuk merangkum dokumen, mengolah **data** untuk perencanaan, dan mengelola **arsip digital**. Soal TKP aspek TIK pun bergeser: bukan lagi sekadar "mau belajar aplikasi baru", tetapi juga "bagaimana memakai teknologi secara aman, akurat, dan bertanggung jawab".

### Indikator utama

| Indikator | Contoh perilaku |
| --- | --- |
| Memanfaatkan teknologi untuk produktivitas | Memakai alat bantu digital untuk menyusun draf, merangkum, atau menganalisis |
| Menjaga kerahasiaan data | Tidak mengunggah data pribadi warga atau dokumen rahasia ke layanan publik di luar sistem resmi |
| Memverifikasi | Memeriksa ulang angka, kutipan, dan dasar hukum hasil olahan AI |
| Menjaga kualitas data | Memakai definisi dan sumber resmi, mendokumentasikan perubahan |
| Mengelola arsip | Menyimpan di sistem resmi, membuat cadangan, memberi nama berkas yang tertib |
| Menghormati hak cipta | Menggunakan gambar dan materi berlisensi atau mencantumkan sumber |

## Tangga skor data dan AI

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Memanfaatkan teknologi secara produktif sekaligus aman: menyamarkan data, memakai platform resmi, memverifikasi, dan berbagi praktik baik | "memakai AI untuk kerangka draf tanpa data pribadi, lalu memeriksa ulang isinya" |
| 4 | Memakai teknologi dengan benar, tetapi belum memperbaiki atau berbagi | "memeriksa ulang hasilnya sebelum dipakai" |
| 3 | Ragu-ragu, menunggu aturan, atau menolak memakai tanpa alasan jelas | "tidak memakai sampai ada instruksi" |
| 2 | Memakai tanpa verifikasi atau mengabaikan tata kelola data | "langsung menyalin jawaban AI ke laporan" |
| 1 | Membocorkan data, memalsukan, atau melanggar hak cipta secara sadar | "mengunggah daftar NIK warga ke aplikasi publik" |

## Contoh pembahasan

### Contoh 1: AI untuk merangkum pengaduan

*Anda diminta merangkum 300 pengaduan warga dari kanal layanan untuk bahan rapat pimpinan. Pengaduan itu memuat nama, nomor telepon, dan alamat pelapor. Rekan menyarankan menempelkan semuanya ke aplikasi AI gratis di internet.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menghapus atau menyamarkan identitas pelapor terlebih dahulu (atau memakai platform resmi instansi), lalu memeriksa rangkuman terhadap data asli | 5 | Produktif, aman, terverifikasi |
| Merangkum secara manual dengan bantuan fitur filter di lembar kerja | 4 | Aman, tetapi kurang efisien |
| Menunda sampai ada pedoman resmi penggunaan AI | 3 | Hati-hati, tetapi pasif |
| Menempelkan semua data ke aplikasi AI agar cepat selesai | 2 | Mengabaikan perlindungan data pribadi |
| Mengunggah data lalu membagikan tautan hasilnya ke grup umum | 1 | Membocorkan data warga |

### Contoh 2: Kutipan aturan dari AI

*Saat menyusun telaah staf, aplikasi AI menyebutkan sebuah pasal peraturan yang mendukung usulan Anda. Anda belum pernah mendengar pasal itu.*

Nilai 5: mencari dan membaca naskah resmi peraturan di laman JDIH, memastikan nomor dan bunyi pasal benar, baru kemudian mengutipnya. Nilai 4: menanyakan kepada rekan bagian hukum. Nilai 3: tidak memakai pasal itu sama sekali tanpa mengeceknya. Nilai 2: mengutip apa adanya karena terlihat meyakinkan. Nilai 1: mengubah bunyi pasal agar lebih cocok dengan usulan. AI dapat "berhalusinasi"; tanggung jawab atas isi dokumen tetap pada Anda.

### Contoh 3: Angka yang berbeda antardinas

*Data jumlah penduduk miskin dari dinas sosial berbeda dengan angka dari BPS dan dari aplikasi desa. Pimpinan meminta satu angka untuk pidato besok.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Menjelaskan perbedaan definisi dan periode tiap sumber, merekomendasikan angka resmi yang tepat untuk konteks pidato, dan mengusulkan rapat penyelarasan data | 5 | Akurat, transparan, mendorong satu data |
| Memakai angka BPS sebagai statistik resmi dengan mencantumkan sumbernya | 4 | Tepat, tetapi belum menyelesaikan ketidaksinkronan |
| Menyerahkan ketiga angka kepada pimpinan tanpa penjelasan | 3 | Melempar pilihan |
| Memilih angka yang paling kecil agar terlihat berhasil | 2 | Bias dan menyesatkan |
| Mengarang angka tengah dari ketiganya | 1 | Memalsukan data |

### Contoh 4: Arsip hanya di laptop pribadi

*Anda menemukan bahwa dokumen kontrak lima tahun terakhir di unit Anda hanya tersimpan di laptop seorang pegawai yang akan pensiun.*

Nilai 5: berkoordinasi dengan atasan dan pengelola arsip untuk memindahkan dokumen ke sistem arsip resmi, menyusun struktur folder dan penamaan, serta membuat cadangan. Nilai 4: menyalin semua dokumen ke penyimpanan kantor. Nilai 3: mengingatkan pegawai itu agar berhati-hati. Nilai 2: menyalin ke penyimpanan awan pribadi Anda. Nilai 1: membiarkan saja karena bukan tugas Anda.

### Contoh 5: Gambar untuk materi sosialisasi

*Anda membuat poster layanan dan menemukan ilustrasi menarik di internet tanpa keterangan lisensi.*

Nilai 5: memakai ilustrasi berlisensi bebas atau membuat sendiri, mencantumkan sumber sesuai ketentuan. Nilai 1: memakai ilustrasi itu dan menghapus tanda air pembuatnya.

## Jebakan umum

- **Menolak AI sepenuhnya**: kehati-hatian berlebihan sering hanya bernilai 3; yang dinilai tinggi adalah pemakaian yang aman.
- **Percaya penuh pada AI**: kecepatan tanpa verifikasi bernilai rendah.
- **"Hanya sebentar diunggah"**: data pribadi yang sudah keluar dari sistem resmi tidak bisa ditarik kembali.
- **Mempercantik angka**: memilih data demi citra adalah pelanggaran integritas.
- **Arsip di perangkat pribadi**: rawan hilang dan bocor.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| menyamarkan data, platform resmi, memverifikasi | langsung menyalin, menempelkan semua data |
| sumber resmi, JDIH, definisi data | angka yang paling menguntungkan |
| sistem arsip, cadangan, penamaan berkas | laptop pribadi, awan pribadi |
| berlisensi, mencantumkan sumber | menghapus tanda air |

## Ringkasan

- AI dan alat data dipakai untuk produktivitas, tetapi tanggung jawab isi tetap pada ASN.
- Data pribadi dan dokumen rahasia tidak boleh diunggah ke layanan di luar sistem resmi.
- Perbedaan data diselesaikan dengan transparansi definisi dan semangat satu data.
- Arsip disimpan di sistem resmi dengan cadangan; materi publik menghormati hak cipta.

## Tips

1. Opsi bernilai 5 biasanya memadukan **pemanfaatan** dan **pengamanan** sekaligus.
2. Jika ada data pribadi dalam stem, cari opsi yang menyamarkan atau memakai sistem resmi.
3. Menolak teknologi baru tanpa alasan kuat umumnya bernilai 3, bukan 5.
4. Opsi yang mengubah, mengarang, atau memilih data demi kesan baik selalu bernilai rendah.
$md$,
   false, 4, 15),
  ('tkp-profesional', 'Profesionalisme sebagai Atasan: Delegasi, Umpan Balik, dan Akuntabilitas', 'tkp-profesional-kepemimpinan', 'Mendelegasikan dengan adil, menegur dan menilai secara objektif, serta bertanggung jawab atas tim.',
$md$## Fokus pelajaran ini

Banyak peserta terbiasa menjawab soal profesionalisme dari sudut pandang staf: menyelesaikan tugas, patuh pada atasan, mengakui kesalahan sendiri. Namun soal TKP juga sering menempatkan Anda sebagai **kepala seksi, ketua tim, atau koordinator**. Dari kursi atasan, profesionalisme berarti mendelegasikan dengan adil, memberi umpan balik yang membangun, menilai kinerja secara objektif, dan **bertanggung jawab atas hasil tim**.

### Indikator profesionalisme atasan

| Indikator | Contoh perilaku |
| --- | --- |
| Delegasi yang adil | Membagi tugas sesuai kompetensi dan beban kerja, bukan kedekatan |
| Arah yang jelas | Menjelaskan target, tenggat, dan standar hasil |
| Umpan balik membangun | Menegur secara pribadi, spesifik, dan disertai rencana perbaikan |
| Penilaian objektif | Menilai SKP berdasarkan bukti kinerja, bukan rasa suka |
| Akuntabilitas | Mengambil tanggung jawab atas kesalahan tim di hadapan pimpinan |
| Pengembangan staf | Memberi kesempatan belajar, mentoring, dan pengakuan |

## Tangga skor profesionalisme atasan

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menyelesaikan masalah kinerja sambil mengembangkan staf; objektif, tegas, dan bertanggung jawab | "berdiskusi empat mata, mencari penyebab, menyepakati target perbaikan dan memantau" |
| 4 | Bertindak tepat dan sesuai aturan, tetapi belum menyentuh pengembangan | "menegur dan meminta perbaikan sesuai tenggat" |
| 3 | Menunda, membiarkan, atau menyerahkan keputusan ke atasan yang lebih tinggi | "menunggu sampai penilaian akhir tahun" |
| 2 | Mengambil alih semua pekerjaan atau memindahkan beban ke staf yang rajin | "memberikan tugasnya kepada staf lain yang lebih cepat" |
| 1 | Mempermalukan, pilih kasih, menyalahkan staf demi menyelamatkan diri | "menyalahkan staf di depan pimpinan" |

## Contoh pembahasan

### Contoh 1: Staf yang kinerjanya menurun

*Anda kepala seksi. Salah satu staf yang biasanya rajin dalam dua bulan terakhir sering terlambat menyetor laporan dan tampak tidak bersemangat.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengajaknya berbicara empat mata untuk memahami penyebabnya, lalu menyepakati rencana perbaikan dan dukungan yang dibutuhkan | 5 | Empatik sekaligus berorientasi hasil |
| Menegur secara tertulis dan menetapkan tenggat baru | 4 | Tegas, tetapi tidak mencari akar masalah |
| Menunggu apakah kinerjanya membaik dengan sendirinya | 3 | Pasif |
| Mengalihkan tugasnya kepada staf lain | 2 | Membebani orang lain dan tidak menyelesaikan |
| Menyindirnya dalam rapat agar staf lain tidak meniru | 1 | Mempermalukan |

Perhatikan bahwa opsi 5 tidak berarti lunak: tetap ada **target perbaikan** yang dipantau.

### Contoh 2: Pembagian tugas yang tidak merata

*Anda ketua tim. Dua staf yang paling cakap selalu Anda beri pekerjaan penting, sementara staf lain mulai mengeluh tidak berkembang dan dua staf andalan itu kelelahan.*

Nilai 5: memetakan beban dan kompetensi setiap anggota, membagi ulang tugas secara proporsional, memasangkan staf yang kurang berpengalaman dengan staf andalan sebagai mentor. Nilai 4: membagi ulang tugas secara merata tanpa pendampingan. Nilai 3: mempertahankan pola karena hasilnya selama ini bagus. Nilai 2: meminta staf yang mengeluh untuk lebih proaktif mencari pekerjaan. Nilai 1: menganggap keluhan itu tanda kurang loyal.

### Contoh 3: Kesalahan tim di hadapan pimpinan

*Data dalam laporan triwulan tim Anda ternyata keliru dan pimpinan menegur Anda dalam rapat. Kesalahan itu berasal dari input seorang staf.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Mengakui kesalahan sebagai tanggung jawab tim, menyampaikan langkah koreksi dan waktu penyelesaiannya, lalu memperbaiki proses verifikasi bersama staf | 5 | Akuntabel dan memperbaiki sistem |
| Meminta maaf dan segera memperbaiki laporan | 4 | Bertanggung jawab, tetapi tanpa pencegahan |
| Menjelaskan bahwa kesalahan terjadi karena waktu penyusunan yang sempit | 3 | Beralasan |
| Diam dan memperbaikinya diam-diam setelah rapat | 2 | Tidak transparan |
| Menyebut nama staf yang salah input di depan forum | 1 | Melempar tanggung jawab |

### Contoh 4: Menilai SKP teman dekat

*Anda menilai SKP staf. Salah satunya adalah sahabat lama yang kinerjanya tahun ini di bawah target, sedangkan staf baru yang jarang bergaul justru melampaui target.*

Nilai 5: menilai berdasarkan bukti capaian masing-masing, memberikan umpan balik tertulis dan rencana pengembangan kepada sahabat itu, serta memberi apresiasi kepada staf baru. Nilai 4: menilai objektif tanpa umpan balik. Nilai 3: memberi nilai rata-rata yang sama untuk semua agar aman. Nilai 2: menaikkan sedikit nilai sahabat karena ia sedang ada masalah keluarga. Nilai 1: menurunkan nilai staf baru agar sahabat tidak terlihat tertinggal.

### Contoh 5: Delegasi tanpa arahan

*Anda menyerahkan tugas penyusunan kerangka acuan kepada staf baru. Hasilnya jauh dari harapan.*

Nilai 5: mengevaluasi diri apakah arahan sudah jelas, lalu memberi contoh, kriteria hasil, dan waktu konsultasi sebelum ia merevisi. Nilai 1: mengambil alih tugas dan mengatakan staf itu tidak mampu.

## Jebakan umum

- **Atasan pahlawan**: mengerjakan sendiri semua tugas sulit; tampak bertanggung jawab, tetapi tim tidak berkembang.
- **Lunak tanpa target**: empati tanpa rencana perbaikan hanya bernilai sedang.
- **Tegas tanpa empati**: teguran resmi saja biasanya bernilai 4.
- **Menghukum di depan umum**: menegur bukan berarti mempermalukan.
- **Penilaian "aman"**: memberi nilai sama untuk semua staf adalah bentuk ketidakobjektifan.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| empat mata, rencana perbaikan, memantau | menyindir, di depan forum |
| membagi sesuai kompetensi, mentoring | memberi ke yang itu-itu saja |
| tanggung jawab tim, memperbaiki proses | menyebut nama staf yang salah |
| berdasarkan bukti capaian | menaikkan nilai teman |

## Ringkasan

- Profesionalisme atasan diukur dari hasil tim dan perkembangan staf, bukan hanya dari kerja pribadi.
- Teguran efektif dilakukan secara pribadi, spesifik, dan disertai target perbaikan.
- Penilaian kinerja harus objektif dan berbasis bukti.
- Di hadapan pimpinan, atasan mengambil tanggung jawab atas kesalahan tim lalu memperbaiki prosesnya.

## Tips

1. Cek peran Anda di stem. Jika Anda atasan, opsi yang **mengembangkan staf** biasanya mengungguli opsi yang mengerjakan sendiri.
2. Bedakan 4 (tindakan tepat) dan 5 (tindakan tepat + pencegahan/pengembangan).
3. Opsi yang menyebut nama staf atau mempermalukan di forum hampir selalu bernilai 1.
4. Pilih kasih, sekecil apa pun, menurunkan skor drastis.
$md$,
   false, 4, 15),
  ('tkp-antiradikal', 'Moderasi di Ruang Kerja dan Layanan Publik: Kasus Abu-Abu', 'tkp-antiradikal-ruang-kerja', 'Membedakan kesalehan pribadi dan intoleransi, serta melayani tanpa diskriminasi dan tanpa stigma.',
$md$## Fokus pelajaran ini

Soal anti radikalisme yang mudah adalah soal yang jelas-jelas mengandung ajakan kekerasan atau penolakan Pancasila. Yang sulit adalah **kasus abu-abu**: rekan yang tiba-tiba lebih religius, pengajian rutin di kantor, permintaan warga yang berkaitan dengan keyakinan, atau penceramah yang belum jelas rekam jejaknya. Di sini peserta sering terjebak pada dua kesalahan: **membiarkan** tanda bahaya, atau justru **mencurigai dan menstigma** orang yang hanya taat beragama.

Sikap moderat berarti menghormati kesalehan pribadi, menolak intoleransi dan kekerasan, serta menilai berdasarkan **perilaku dan fakta**, bukan penampilan.

### Membedakan kesalehan dan intoleransi

| Kesalehan pribadi (dihormati) | Tanda intoleransi atau radikalisme (diwaspadai) |
| --- | --- |
| Rajin beribadah, berpakaian sesuai keyakinan | Mengafirkan atau merendahkan orang yang berbeda |
| Mengikuti kajian keagamaan | Menolak Pancasila, UUD 1945, atau simbol negara |
| Menolak ikut kegiatan yang bertentangan dengan keyakinannya secara santun | Mengajak memusuhi atau tidak melayani kelompok tertentu |
| Berhenti dari kebiasaan tertentu | Membenarkan kekerasan atau mengajak bergabung ke kelompok tertutup |

## Tangga skor kasus abu-abu

| Skor | Pola perilaku | Contoh frasa |
| --- | --- | --- |
| 5 | Menilai berdasarkan fakta, merangkul, meluruskan secara bijak, dan melibatkan jalur resmi bila ada tanda nyata | "mengajak berdialog, lalu berkonsultasi dengan atasan bila ia terus mengajak menolak Pancasila" |
| 4 | Bersikap tepat dan tidak diskriminatif, tetapi tanpa upaya merangkul atau mencegah | "tetap bekerja sama secara profesional" |
| 3 | Menghindar atau diam | "tidak menanggapi" |
| 2 | Mencurigai, bergunjing, atau bereaksi berlebihan tanpa dasar | "menceritakan kecurigaan kepada rekan lain" |
| 1 | Menstigma, mendiskriminasi, main hakim sendiri, atau malah ikut menyebarkan paham intoleran | "melaporkan ke polisi hanya karena penampilannya" |

## Contoh pembahasan

### Contoh 1: Rekan yang berubah penampilan

*Rekan satu seksi Anda mulai berpakaian lebih syar'i, rajin ke masjid, dan tidak lagi ikut makan siang di kafe. Beberapa rekan berbisik bahwa ia "terpapar".*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Tetap bergaul dan bekerja sama seperti biasa, mengingatkan rekan lain agar tidak menilai dari penampilan | 5 | Menghormati keyakinan dan mencegah stigma |
| Tetap bekerja sama secara profesional | 4 | Tepat, tetapi membiarkan gunjingan |
| Tidak ikut campur dalam pembicaraan rekan | 3 | Netral |
| Mulai menjaga jarak darinya | 2 | Ikut terpengaruh stigma |
| Melaporkannya kepada atasan sebagai pegawai radikal | 1 | Tuduhan tanpa dasar |

Kunci: perubahan cara beribadah **bukan** tanda radikalisme.

### Contoh 2: Pengajian kantor dengan materi menyimpang

*Anda panitia pengajian rutin kantor. Pada pertemuan terakhir, penceramah tamu menyebut demokrasi sebagai sistem kafir dan mengajak jemaah tidak mengikuti pemilu.*

Nilai 5: menyampaikan kepada pengurus dan atasan agar materi dievaluasi, mengusulkan penceramah yang memiliki rekam jejak moderat dan wawasan kebangsaan untuk pertemuan berikutnya, serta tetap menjaga agar kegiatan pengajian berjalan. Nilai 4: tidak mengundang penceramah itu lagi. Nilai 3: membiarkan karena hanya sekali. Nilai 2: membubarkan pengajian rutin. Nilai 1: menyebarkan rekaman ceramah itu ke media sosial dengan komentar menghujat. Perhatikan bahwa opsi terbaik tidak menghapus kegiatan keagamaan, tetapi **memperbaiki isinya**.

### Contoh 3: Warga dengan atribut kelompok tertentu

*Anda petugas loket. Datang seorang warga dengan pakaian dan atribut yang sering dikaitkan dengan kelompok keagamaan tertentu. Rekan Anda berbisik agar Anda melayaninya seadanya saja.*

| Opsi | Skor | Alasan |
| --- | --- | --- |
| Melayaninya dengan ramah dan sesuai standar seperti warga lain, lalu mengingatkan rekan bahwa layanan tidak boleh diskriminatif | 5 | Adil dan mengoreksi rekan |
| Melayaninya sesuai standar | 4 | Tepat, tetapi tidak menyikapi rekan |
| Meminta rekan lain yang melayaninya | 3 | Menghindar |
| Melayani dengan cepat agar ia segera pergi | 2 | Diskriminatif terselubung |
| Menanyakan afiliasi organisasinya sebelum melayani | 1 | Diskriminatif dan melanggar privasi |

### Contoh 4: Rekan menolak mengucapkan selamat hari raya

*Seorang rekan menolak ikut memberi ucapan hari raya kepada rekan beragama lain karena keyakinannya, tetapi ia tetap ramah dan membantu pekerjaan.*

Nilai 5: menghormati pilihannya karena tidak merugikan siapa pun, sambil tetap mengajak semua rekan menjaga suasana saling menghargai. Nilai 2: menyindirnya sebagai intoleran. Nilai 1: melaporkannya sebagai radikal. Lain halnya bila ia **melarang** orang lain mengucapkan atau mengajak memusuhi; itu sudah menjadi intoleransi yang perlu diluruskan.

### Contoh 5: Ajakan kajian tertutup

*Rekan mengajak Anda ikut kajian di rumahnya yang menurutnya "hanya untuk orang terpilih" dan meminta Anda tidak menceritakannya kepada siapa pun.*

Nilai 5: menolak dengan santun, menanyakan isi kajian, dan bila ada indikasi ajaran anti-Pancasila, berkonsultasi dengan atasan atau unit pembinaan pegawai. Nilai 1: ikut karena penasaran dan merahasiakannya.

## Jebakan umum

- **Stigma penampilan**: menilai radikal dari pakaian, janggut, atau cadar.
- **Membiarkan materi menyimpang** karena kegiatan bertema agama.
- **Reaksi berlebihan**: membubarkan kegiatan keagamaan atau melapor ke aparat tanpa fakta.
- **Viralkan dulu**: menyebarkan rekaman menambah perpecahan; gunakan jalur resmi.
- **Diskriminasi halus**: melayani "seadanya" tetap pelanggaran.

## Kata kunci

| Sinyal tinggi | Sinyal rendah |
| --- | --- |
| berdasarkan fakta, merangkul, berdialog | mencurigai dari penampilan |
| penceramah berwawasan kebangsaan | membubarkan, melarang semua kegiatan |
| melayani sesuai standar tanpa membedakan | menanyakan afiliasi, melayani seadanya |
| berkonsultasi dengan atasan atau unit pembinaan | memviralkan, main hakim sendiri |

## Ringkasan

- Kesalehan pribadi dihormati; yang diwaspadai adalah penolakan dasar negara, pengafiran, ajakan permusuhan, dan kekerasan.
- Penilaian harus didasarkan pada perilaku dan ucapan nyata, bukan penampilan.
- Kegiatan keagamaan di kantor diperbaiki isinya, bukan dihapus.
- Layanan publik diberikan setara kepada siapa pun.

## Tips

1. Tanyakan: apakah ada **ajakan** menolak Pancasila, memusuhi, atau kekerasan? Jika tidak, opsi yang mencurigai biasanya bernilai rendah.
2. Opsi bernilai 5 sering memadukan **penghormatan** dan **pencegahan**.
3. Melapor ke aparat tanpa dasar sama buruknya dengan membiarkan ajakan radikal.
4. Pilih jalur internal (atasan, unit pembinaan) sebelum jalur publik.
$md$,
   false, 4, 15)
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
  ('tkp-integritas', 'easy', 'Kantor Anda memakai presensi elektronik berbasis lokasi. Seorang rekan menitipkan ponselnya agar Anda melakukan presensi untuknya karena ia akan terlambat satu jam. Anda …', 'Menolak dan menyarankannya melapor terlambat kepada atasan', 5, 'Melakukan presensi untuknya sekali ini dengan pesan agar tidak diulang', 2, 'Menerima ponselnya tanpa melakukan presensi, lalu menyerahkannya kembali saat ia tiba agar ia sendiri yang memutuskan apa yang dilaporkan', 3, 'Melakukan presensi untuknya karena hal itu sudah biasa di kantor', 1, 'Menolak dengan sopan karena presensi harus dilakukan sendiri oleh pegawai yang bersangkutan', 4, 'A (5): Jujur, tidak memanipulasi kehadiran, dan memberi jalan yang sah; E (4): Tegas dan jujur, tetapi tanpa saran penyelesaian; C (3): Tidak ikut memanipulasi, tetapi sikapnya tidak tegas dan membingungkan; B (2): Tetap ikut memanipulasi meski disertai peringatan; D (1): Memanipulasi kehadiran dan menganggapnya lumrah.'),
  ('tkp-integritas', 'medium', 'Anda menyadari laporan kegiatan yang sudah Anda kirim ke atasan memuat jumlah peserta yang lebih besar dari jumlah sebenarnya. Belum ada yang menyadarinya. Anda …', 'Membiarkannya karena selisih angka itu justru membuat kegiatan terlihat lebih berhasil dan tidak merugikan siapa pun secara langsung', 1, 'Memperbaiki angka di arsip pribadi saja agar laporan berikutnya benar', 2, 'Memberi tahu atasan, mengirim laporan perbaikan, dan mengecek ulang data lainnya', 5, 'Mengirim laporan perbaikan kepada atasan dengan catatan singkat tentang angka yang dikoreksi', 4, 'Menunggu sampai ada yang bertanya, lalu menjelaskan kekeliruan itu dengan jujur', 3, 'C (5): Mengakui kesalahan, memperbaiki, dan mencegah kekeliruan lain; D (4): Transparan dan memperbaiki, tetapi tanpa pemeriksaan menyeluruh; E (3): Jujur bila ditanya, tetapi tidak proaktif; B (2): Menutupi kesalahan yang sudah terkirim; A (1): Membiarkan data tidak benar demi citra.'),
  ('tkp-integritas', 'medium', 'Anda memegang kendaraan dinas untuk kegiatan lapangan. Pada akhir pekan, keluarga meminta Anda memakainya untuk menghadiri pernikahan kerabat di luar kota. Anda …', 'Tidak memakainya untuk urusan pribadi dan membantu keluarga mencari transportasi lain', 5, 'Memakainya karena kendaraan itu memang dipegang oleh Anda', 1, 'Meminta izin lisan kepada atasan terlebih dahulu sebelum memakainya', 3, 'Memakainya, tetapi mengisi bahan bakar dengan uang pribadi', 2, 'Menjelaskan kepada keluarga bahwa kendaraan dinas hanya untuk keperluan kedinasan', 4, 'A (5): Taat aturan fasilitas negara sekaligus tetap mencari solusi; E (4): Jujur dan taat, tetapi tanpa solusi; C (3): Masih ingin memakai fasilitas untuk kepentingan pribadi; D (2): Merasa wajar karena menanggung biaya sendiri; B (1): Menyalahgunakan fasilitas negara.'),
  ('tkp-integritas', 'hard', 'Anda pulang sehari lebih cepat dari jadwal di surat tugas karena kegiatan selesai lebih awal. Saat menyusun SPJ, bendahara mengatakan uang harian tetap bisa dicairkan penuh sesuai surat tugas. Anda …', 'Mengajukan uang harian sesuai hari yang benar-benar dijalani', 5, 'Menerima pencairan penuh, lalu segera mengembalikan kelebihan uang harian ke kas negara', 4, 'Mengikuti saran bendahara karena ia lebih paham aturan keuangan, sambil mencatat tanggal kepulangan yang sebenarnya di catatan pribadi untuk berjaga-jaga', 2, 'Menerima pencairan penuh, tetapi memakai kelebihannya untuk keperluan kegiatan kantor', 3, 'Mencairkan penuh karena surat tugas memang mencantumkan jumlah hari tersebut', 1, 'A (5): Pertanggungjawaban sesuai fakta sejak awal; B (4): Jujur, tetapi prosesnya tidak sesuai fakta sejak awal; D (3): Niat baik, tetapi pertanggungjawaban tetap tidak sesuai fakta; C (2): Menyerahkan tanggung jawab moral kepada orang lain; E (1): Memanfaatkan celah administrasi.'),
  ('tkp-integritas', 'easy', 'Saat membeli alat tulis untuk kantor, penjual menawarkan nota kosong yang nominalnya bisa Anda isi sendiri. Anda …', 'Menolak nota kosong dan meminta nota yang diisi penjual sesuai harga pembelian', 5, 'Menerima nota kosong dan mengisinya sedikit di atas harga untuk mengganti ongkos transport', 2, 'Mengambil nota kosong itu, lalu mengisinya sesuai harga sebenarnya di depan penjual agar tidak ada salah tulis atau selisih', 4, 'Menerima nota kosong dan mengisinya sesuai pagu anggaran yang tersedia', 1, 'Menerima nota kosong dan menyimpannya, lalu bertanya kepada bendahara cara mengisinya', 3, 'A (5): Transparan dan menutup peluang penyimpangan; C (4): Nominal jujur, tetapi tetap menerima praktik yang tidak tertib; E (3): Ragu-ragu dan membuka peluang penyimpangan; B (2): Menggelembungkan biaya meski kecil; D (1): Penggelembungan anggaran secara sengaja.'),
  ('tkp-integritas', 'medium', 'Anda memiliki usaha daring sampingan. Pada jam kerja, pembeli sering menghubungi Anda untuk menanyakan pesanan. Anda …', 'Membalas setiap pesan pembeli yang masuk saat itu juga agar tidak kehilangan pelanggan yang sudah menunggu', 2, 'Membalas pesan pembeli sesekali di sela pekerjaan kantor, asalkan tugas utama tetap selesai sesuai target yang diberikan atasan', 3, 'Memasang balasan otomatis dan membalas pembeli hanya saat istirahat atau usai jam kerja', 5, 'Memakai komputer dan printer kantor untuk mencetak label pengiriman pesanan', 1, 'Meminta anggota keluarga membantu membalas pesan pembeli selama jam kerja', 4, 'C (5): Memisahkan urusan pribadi dari waktu kerja secara konsisten; E (4): Menjaga waktu kerja, tetapi masih bergantung pada orang lain; B (3): Mencampur urusan pribadi dengan jam kerja walau tugas selesai; A (2): Mengutamakan usaha pribadi di jam kerja; D (1): Menyalahgunakan waktu dan fasilitas kantor.'),
  ('tkp-integritas', 'medium', 'Dalam rapat evaluasi, atasan memuji Anda atas sebuah ide yang sebenarnya diusulkan oleh rekan satu tim. Anda …', 'Menerima pujian itu karena Anda yang mempresentasikan ide tersebut dan merasa ikut mengembangkannya hingga layak disampaikan kepada pimpinan', 2, 'Berterima kasih kepada atasan, lalu memberi tahu rekan bahwa atasan menyukai idenya', 3, 'Menyampaikan kepada atasan setelah rapat bahwa ide itu milik rekan Anda', 4, 'Meluruskan di forum itu bahwa ide tersebut berasal dari rekan Anda', 5, 'Menerima pujian itu dan meminta rekan tidak mempermasalahkannya', 1, 'D (5): Jujur, terbuka, dan menghargai karya orang lain; C (4): Jujur, tetapi tidak diluruskan secara terbuka; B (3): Tidak mengklaim, tetapi juga tidak meluruskan; A (2): Membenarkan klaim atas karya orang lain; E (1): Mengklaim karya orang lain dan menekan rekan.'),
  ('tkp-integritas', 'hard', 'Anda menjadi panitia seleksi pegawai non-ASN di dinas. Keponakan Anda ikut mendaftar dan meminta Anda memberitahukan materi wawancara. Anda …', 'Memberikan gambaran umum topik wawancara tanpa menyebutkan pertanyaannya', 2, 'Menyarankan keponakan mempelajari profil, program, dan berita dinas yang tersedia di situs resmi sebelum wawancara', 3, 'Memberikan materi wawancara karena keponakan memang kompeten, sehingga menurut Anda bocoran itu hanya membantunya tampil percaya diri di depan penguji', 1, 'Menolak memberikan materi dan menegaskan bahwa semua peserta harus bersaing secara adil', 4, 'Menolak, melaporkan hubungan keluarga kepada ketua panitia, dan mundur dari penilaiannya', 5, 'E (5): Menolak kecurangan dan mengungkap konflik kepentingan; D (4): Tegas, tetapi konflik kepentingan belum diungkap; B (3): Tidak membocorkan, tetapi tetap diam soal konflik kepentingan; A (2): Tetap membocorkan sebagian materi; C (1): Membocorkan materi dengan rasionalisasi.'),
  ('tkp-integritas', 'easy', 'Anda berjanji kepada seorang warga akan mengabari hasil verifikasi berkasnya pada hari Jumat. Ternyata pada hari itu verifikasi belum selesai. Anda …', 'Menghubungi warga pada hari Senin setelah verifikasi selesai sambil meminta maaf atas keterlambatan kabar', 4, 'Tetap mengabarinya Jumat itu soal kendala dan jadwal baru', 5, 'Menunggu warga yang menanyakan sendiri perkembangan berkasnya', 2, 'Menunggu sampai verifikasi selesai baru menghubungi warga, karena menurut Anda kabar yang belum pasti hanya membuat warga bingung dan terus bertanya', 3, 'Mengatakan kepada warga bahwa Anda tidak pernah menjanjikan hari tertentu', 1, 'B (5): Menepati janji komunikasi dan memberi kepastian; A (4): Bertanggung jawab, tetapi janji hari Jumat tidak ditepati; D (3): Merasionalisasi janji yang tidak ditepati; C (2): Pasif dan mengabaikan janji; E (1): Ingkar janji dan tidak jujur.'),
  ('tkp-integritas', 'medium', 'Anda menjadi penilai lomba kebersihan antarkelurahan. Lurah di kelurahan tempat Anda tinggal menghubungi Anda dan berharap kelurahannya diberi nilai tinggi. Anda …', 'Menjelaskan kepada lurah bahwa penilaian dilakukan objektif sesuai kriteria lomba', 4, 'Menjawab sopan bahwa penilaian mengikuti kriteria, lalu melaporkan kedekatan itu kepada ketua tim penilai', 5, 'Memberi sedikit tambahan nilai pada aspek yang penilaiannya memang subjektif', 2, 'Tidak menanggapi pesan lurah dan menilai seperti biasa', 3, 'Menjanjikan nilai tinggi karena kelurahan itu tempat tinggal Anda sendiri', 1, 'B (5): Objektif sekaligus transparan soal potensi konflik kepentingan; A (4): Tegas dan objektif, tetapi belum transparan kepada tim; D (3): Objektif, tetapi tidak komunikatif dan tidak transparan; C (2): Mulai berpihak secara terselubung; E (1): Berpihak dan menyalahgunakan peran penilai.'),
  ('tkp-integritas', 'medium', 'Pekerjaan yang biasanya dikerjakan lembur ternyata selesai pada jam kerja biasa. Rekan-rekan lain tetap mengajukan lembur penuh. Anda …', 'Mengajukan lembur penuh seperti rekan lain karena khawatir dianggap sok suci, tetapi berjanji dalam hati tidak akan mengulanginya bulan depan', 2, 'Menanyakan dulu kepada bagian kepegawaian apakah lembur untuk pekerjaan yang sudah selesai boleh tetap diajukan', 3, 'Mengajukan lembur sesuai jam yang dijalani dan mengingatkan rekan secara pribadi', 5, 'Mengajukan lembur penuh karena anggarannya memang sudah disediakan', 1, 'Mengajukan lembur hanya untuk jam yang benar-benar Anda jalani', 4, 'C (5): Jujur dan berani mengingatkan dengan santun; E (4): Jujur untuk diri sendiri; B (3): Ragu, padahal jelas tidak sesuai fakta; A (2): Ikut menyimpang karena tekanan kelompok; D (1): Memanfaatkan anggaran tanpa dasar.'),
  ('tkp-integritas', 'hard', 'Atasan Anda yang dikenal baik dan sering membantu staf meminta Anda menandatangani daftar hadir rapat atas nama dua pegawai yang tidak hadir agar kuorum terpenuhi. Anda …', 'Menandatanganinya karena atasan sudah banyak membantu Anda', 1, 'Menyarankan atasan meminta kedua pegawai itu menandatangani daftar hadir sendiri keesokan harinya agar tetap tercatat', 3, 'Menandatangani satu nama saja agar pelanggarannya tidak terlalu besar', 2, 'Menolak dengan santun dan mengusulkan rapat dijadwalkan ulang atau dilanjutkan secara daring', 5, 'Menolak menandatangani atas nama orang lain dan menjelaskan kepada atasan bahwa daftar hadir yang tidak sesuai fakta bisa menjadi temuan pemeriksa di kemudian hari', 4, 'D (5): Menolak pemalsuan dan memberi jalan keluar yang sah; E (4): Tegas dan jujur, tetapi tanpa solusi untuk kuorum; B (3): Tidak memalsukan tanda tangan, tetapi kehadiran tetap dimanipulasi; C (2): Tetap memalsukan meski dikurangi; A (1): Memalsukan dokumen karena balas budi.'),
  ('tkp-integritas', 'easy', 'Saat mengikuti uji kompetensi jabatan fungsional, peserta di sebelah Anda berbisik menawarkan untuk saling bertukar jawaban. Anda …', 'Menerima tawaran itu karena hasil uji menentukan tunjangan, dan menurut Anda bertukar sedikit jawaban tidak mengubah kemampuan Anda yang sebenarnya', 1, 'Menolak tawarannya dan berfokus pada soal Anda sendiri', 4, 'Pura-pura tidak mendengar dan melanjutkan mengerjakan soal', 3, 'Menolak, tetap mengerjakan sendiri, dan melapor kepada pengawas bila ia terus mengganggu', 5, 'Menerima jawabannya hanya untuk soal yang benar-benar Anda ragukan, tanpa memberikan jawaban Anda kepadanya', 2, 'D (5): Jujur dan menjaga ketertiban ujian; B (4): Jujur, tetapi membiarkan gangguan; C (3): Tidak curang, tetapi tidak tegas; E (2): Ikut curang secara sepihak; A (1): Curang dengan rasionalisasi.'),
  ('tkp-integritas', 'medium', 'Setelah mutasi, Anda menemukan amplop berisi uang di laci meja kerja baru Anda tanpa keterangan pemiliknya. Anda …', 'Mengambil uang itu karena tidak ada yang tahu pemiliknya', 1, 'Menyerahkannya kepada atasan dengan berita acara yang disaksikan rekan', 5, 'Menghubungi pejabat lama yang menempati meja itu dan menyerahkan amplop langsung kepadanya tanpa memastikan apakah uang itu miliknya atau milik kantor', 3, 'Menyerahkan amplop itu kepada atasan dan menjelaskan tempat Anda menemukannya', 4, 'Menyimpannya di laci dan menunggu sampai ada yang mencarinya', 2, 'B (5): Jujur, tertib, dan akuntabel; D (4): Jujur, tetapi tanpa pencatatan bersama saksi; C (3): Berniat baik, tetapi tidak tertib dan berisiko salah serah; E (2): Pasif dan tidak akuntabel; A (1): Mengambil hak orang lain.'),
  ('tkp-integritas', 'hard', 'Anda staf keuangan. Kepala kantor meminta honor narasumber tetap dicairkan meski narasumber membatalkan kehadiran, dengan alasan uangnya akan dipakai membeli konsumsi tambahan. Anda …', 'Menjelaskan bahwa honor hanya bisa dibayarkan kepada narasumber yang benar-benar hadir', 4, 'Meminta perintah tertulis dari kepala kantor sebelum mencairkannya agar Anda tidak disalahkan di kemudian hari', 3, 'Mencairkan honor sesuai perintah karena itu wewenang kepala kantor', 1, 'Mencairkan honor tersebut, tetapi menyimpan semua bukti penggunaan uang untuk konsumsi agar bisa dijelaskan bila suatu saat ada pemeriksaan inspektorat', 2, 'Menolak mencairkan honor fiktif dan membantu mencari mekanisme anggaran konsumsi yang sah', 5, 'E (5): Menolak penyimpangan dan menawarkan solusi sah; A (4): Tegas sesuai aturan, tetapi tanpa solusi; B (3): Berlindung pada dokumen, tetapi tetap ikut menyimpang; D (2): Tetap memalsukan pertanggungjawaban; C (1): Patuh buta pada perintah yang menyimpang.'),
  ('tkp-integritas', 'medium', 'Anda mengikuti pelatihan daring wajib yang mensyaratkan kamera menyala. Rekan menyarankan memasang foto diri sebagai latar agar Anda bisa mengerjakan hal lain. Anda …', 'Memasang foto diri hanya pada sesi yang menurut Anda tidak penting', 2, 'Menolak saran itu dan mengikuti pelatihan dengan sungguh-sungguh', 4, 'Mengikuti dengan kamera menyala dan menjadwalkan pekerjaan lain di luar sesi', 5, 'Menyalakan kamera, tetapi sesekali menyelesaikan pekerjaan lain di jendela berbeda', 3, 'Memasang foto diri sepanjang pelatihan karena yang dinilai hanya kehadiran', 1, 'C (5): Jujur, sungguh-sungguh, dan tetap bertanggung jawab atas pekerjaan; B (4): Jujur dan sungguh-sungguh; D (3): Hadir secara formal, tetapi tidak sepenuhnya mengikuti; A (2): Memanipulasi kehadiran sebagian; E (1): Memanipulasi kehadiran sepenuhnya.'),
  ('tkp-integritas', 'easy', 'Anda tidak sengaja merusak proyektor kantor saat menyiapkan rapat. Tidak ada orang lain di ruangan. Anda …', 'Mengembalikan proyektor dan diam saja karena barang itu sudah tua, sehingga menurut Anda wajar bila rusak sewaktu-waktu oleh siapa pun yang memakainya', 1, 'Melapor, mengakui kelalaian, dan mencarikan pengganti', 5, 'Mengembalikan proyektor ke lemari dan memakai televisi ruang rapat', 2, 'Melaporkan bahwa proyektor tidak berfungsi tanpa menjelaskan penyebabnya', 3, 'Melaporkan kepada pengelola barang bahwa proyektor rusak karena kelalaian Anda', 4, 'B (5): Jujur, bertanggung jawab, dan solutif; E (4): Jujur dan bertanggung jawab; D (3): Menyampaikan, tetapi tidak sepenuhnya jujur; C (2): Menghindari tanggung jawab; A (1): Menutupi kesalahan dengan rasionalisasi.'),
  ('tkp-integritas', 'hard', 'Anda ketua tim. Seorang anggota yang rajin ketahuan memalsukan tanda tangan atasan pada surat undangan karena atasan sulit dihubungi dan acaranya mendesak. Ia sangat menyesal. Anda …', 'Ikut menyembunyikan kejadian itu agar nama baik tim tidak rusak', 1, 'Membiarkan surat tetap beredar karena acaranya penting dan ia sudah menyesal', 2, 'Menarik surat itu dan melaporkan kejadiannya kepada atasan apa adanya, sambil menyampaikan bahwa anggota tersebut selama ini berkinerja baik dan sudah menyesal', 4, 'Menegurnya keras secara pribadi dan meminta surat itu ditarik tanpa melapor kepada atasan', 3, 'Menarik surat, melapor proporsional, dan membenahi alur', 5, 'E (5): Tegas, adil, dan memperbaiki sistem; C (4): Jujur dan proporsional, tetapi akar masalah belum dibenahi; D (3): Menindak, tetapi menutupi pelanggaran; B (2): Membiarkan dokumen palsu; A (1): Menutupi pelanggaran demi citra.'),
  ('tkp-prestasi', 'easy', 'Atasan menetapkan target penyelesaian 40 berkas per minggu. Anda sudah mencapainya pada hari Kamis. Anda …', 'Menahan sebagian berkas agar target minggu depan lebih mudah tercapai', 1, 'Melanjutkan memproses berkas yang masih ada dalam antrean', 4, 'Merapikan arsip berkas yang sudah selesai sambil menunggu tugas berikutnya dari atasan pada hari Jumat', 3, 'Memproses berkas antrean berikutnya dan mencatat cara kerja yang mempercepat', 5, 'Bersantai pada hari Jumat karena target sudah tercapai, dan menurut Anda bekerja melebihi target hanya membuat atasan menaikkan target berikutnya', 2, 'D (5): Melampaui target dan membagikan praktik baik; B (4): Terus produktif; C (3): Bermanfaat, tetapi pasif menunggu arahan; E (2): Puas dengan batas minimal; A (1): Memanipulasi capaian dan merugikan warga.'),
  ('tkp-prestasi', 'medium', 'Laporan yang Anda susun sudah memenuhi format standar. Namun, Anda merasa analisisnya masih dangkal, sementara tenggat masih dua hari lagi. Anda …', 'Memperdalam analisis dengan data pendukung dan meminta masukan rekan, lalu mengirim tepat waktu', 5, 'Menyalin analisis dari laporan tahun lalu agar terlihat lebih lengkap', 1, 'Mengirimkan laporan pada hari tenggat tanpa perubahan apa pun', 2, 'Mengirimkan laporan sekarang karena formatnya sudah sesuai standar', 3, 'Menambah analisis pada bagian yang paling penting, lalu mengirimkannya sebelum tenggat', 4, 'A (5): Mengejar mutu terbaik tanpa melewati tenggat; E (4): Meningkatkan mutu, tetapi belum maksimal; D (3): Puas pada standar minimal; C (2): Menunda tanpa menambah mutu; B (1): Mengejar kesan, bukan mutu.'),
  ('tkp-prestasi', 'medium', 'Anda tidak lolos seleksi jabatan administrator yang sangat Anda harapkan. Anda …', 'Mempelajari kembali kompetensi yang diujikan agar lebih siap pada seleksi berikutnya', 4, 'Menerima hasilnya dan kembali bekerja seperti biasa', 3, 'Menyampaikan kepada rekan-rekan bahwa seleksi itu sudah diatur sejak awal, karena peserta yang terpilih lebih dekat dengan pimpinan dibandingkan Anda', 1, 'Memutuskan tidak lagi mengikuti seleksi jabatan apa pun', 2, 'Meminta umpan balik panitia, menyusun rencana pengembangan, lalu mencoba lagi', 5, 'E (5): Belajar dari kegagalan secara terencana; A (4): Tetap berusaha, tetapi tanpa umpan balik; B (3): Menerima, tetapi tanpa upaya pengembangan; D (2): Menyerah; C (1): Menyalahkan pihak lain tanpa bukti.'),
  ('tkp-prestasi', 'hard', 'Unit Anda selalu mencapai target kinerja karena targetnya ditetapkan rendah. Saat penyusunan target tahun depan, rekan-rekan ingin mempertahankan angka yang sama. Anda …', 'Mengusulkan target lebih menantang berdasarkan tren capaian, disertai rencana kerjanya', 5, 'Mengusulkan kenaikan target secara bertahap agar tim tetap sanggup mencapainya', 4, 'Mengikuti kesepakatan karena target yang rendah membuat penilaian unit tetap baik di mata pimpinan', 2, 'Mengusulkan target diturunkan lagi agar unit lebih aman dari penilaian buruk', 1, 'Mengikuti kesepakatan untuk mempertahankan target, tetapi diam-diam menetapkan target lebih tinggi untuk pekerjaan Anda sendiri tanpa memberi tahu tim', 3, 'A (5): Menantang diri dan tim secara realistis; B (4): Mendorong peningkatan, tetapi kurang berbasis data; E (3): Berprestasi secara pribadi, tetapi tidak mendorong tim; C (2): Nyaman dengan capaian semu; D (1): Menghindari tantangan.'),
  ('tkp-prestasi', 'easy', 'Anda ditawari mengikuti kursus daring gratis tentang analisis data yang relevan dengan pekerjaan, tetapi jadwalnya di luar jam kerja. Anda …', 'Menolak karena pelatihan seharusnya menjadi tanggung jawab kantor', 1, 'Mendaftar dan mengikuti materi yang paling relevan dengan pekerjaan sehari-hari, sementara materi lain dipelajari bila ada waktu luang', 4, 'Mendaftar, tetapi hanya mengikuti bila tidak ada kegiatan lain', 3, 'Menunggu sampai kursus serupa diadakan pada jam kerja', 2, 'Mendaftar, mengatur waktu belajar secara rutin, dan menerapkan ilmunya dalam pekerjaan', 5, 'E (5): Berinisiatif mengembangkan diri dan menerapkannya; B (4): Mau belajar, tetapi tidak tuntas; C (3): Minat belajar rendah; D (2): Menunda pengembangan diri; A (1): Tidak berinisiatif.'),
  ('tkp-prestasi', 'medium', 'Pimpinan memberi Anda tugas yang belum pernah Anda kerjakan dan berada di luar keahlian Anda. Anda …', 'Menolak tugas itu karena tidak sesuai uraian jabatan, dan khawatir hasil yang kurang baik akan memengaruhi penilaian kinerja Anda di akhir tahun', 1, 'Menerima tugas, mempelajari aturan terkait, dan berkonsultasi dengan yang berpengalaman', 5, 'Meminta atasan menunjuk orang lain yang lebih menguasai', 2, 'Menerima tugas, tetapi meminta rekan senior mendampingi dan memeriksa setiap langkah pekerjaan Anda', 3, 'Menerima tugas dan mengerjakannya sebaik mungkin dengan kemampuan yang ada', 4, 'B (5): Menerima tantangan dan belajar secara aktif; E (4): Mau mencoba, tetapi kurang upaya belajar; D (3): Mau, tetapi bergantung pada orang lain; C (2): Menghindari tantangan; A (1): Menolak berkembang demi rasa aman.'),
  ('tkp-prestasi', 'hard', 'Anda dan seorang rekan bersaing untuk predikat pegawai teladan. Anda mengetahui rekan itu keliru memasukkan data capaian kinerjanya sehingga nilainya lebih rendah dari seharusnya. Anda …', 'Diam saja karena memeriksa data rekan bukan tanggung jawab Anda, dan menurut Anda setiap peserta seharusnya teliti terhadap data yang mereka kirim', 2, 'Melaporkan kekeliruan itu langsung kepada panitia penilai tanpa memberi tahu rekan yang bersangkutan', 3, 'Memberi tahu rekan tentang kekeliruan data yang ia masukkan', 4, 'Memberi tahu rekan agar datanya diperbaiki, lalu fokus pada kinerja sendiri', 5, 'Diam saja karena kekeliruan itu menguntungkan peluang Anda', 1, 'D (5): Kompetisi sehat dan sportif; C (4): Sportif dan peduli; B (3): Jujur, tetapi kurang kolegial; A (2): Membiarkan demi keuntungan sendiri dengan dalih; E (1): Kompetisi tidak sehat.'),
  ('tkp-prestasi', 'medium', 'Hasil survei kepuasan masyarakat terhadap layanan unit Anda menurun dibandingkan tahun lalu. Anda …', 'Menganalisis keluhan bersama tim dan menyusun perbaikan', 5, 'Menganggap penurunan itu wajar karena jumlah responden tahun ini berbeda', 2, 'Mengusulkan agar survei berikutnya hanya dibagikan kepada warga yang puas', 1, 'Mengusulkan kepada atasan perbaikan pada aspek layanan yang nilainya paling rendah', 4, 'Menunggu arahan atasan, karena hasil survei biasanya dibahas dalam rapat evaluasi dan keputusan perbaikan merupakan wewenang pimpinan unit', 3, 'A (5): Berorientasi perbaikan berbasis data; D (4): Responsif, tetapi kurang mendalam; E (3): Pasif menunggu; B (2): Mencari pembenaran; C (1): Memanipulasi ukuran kinerja.'),
  ('tkp-prestasi', 'easy', 'Atasan meminta Anda membuat ringkasan rapat. Format sederhana sudah cukup, tetapi Anda melihat peluang membuatnya lebih berguna bagi pimpinan. Anda …', 'Menyusun ringkasan yang rapi dan mengirimkannya lebih cepat dari permintaan', 4, 'Menyusun ringkasan sesuai format sederhana yang diminta', 3, 'Menyusun ringkasan berisi keputusan, penanggung jawab, dan tenggat tindak lanjut', 5, 'Menyalin seluruh catatan rapat apa adanya, termasuk diskusi yang tidak penting, lalu mengirimkannya', 2, 'Menunda membuat ringkasan karena masih banyak pekerjaan lain', 1, 'C (5): Memberi nilai tambah dan tetap tepat waktu; A (4): Cepat dan rapi; B (3): Memenuhi standar minimal; D (2): Kurang usaha; E (1): Menunda tugas.'),
  ('tkp-prestasi', 'medium', 'Tim Anda gagal mencapai target cakupan imunisasi di wilayah kerja puskesmas. Dalam rapat evaluasi, Anda …', 'Mengakui target tidak tercapai dan mengusulkan tambahan jadwal pelayanan di posyandu agar anak yang belum terjangkau bisa segera diimunisasi bulan depan', 4, 'Memaparkan data penyebab kegagalan, mengakui bagian tim, dan mengusulkan strategi baru', 5, 'Menjelaskan bahwa banyak orang tua menolak imunisasi karena kabar keliru sehingga target sulit dicapai', 3, 'Menyalahkan kader posyandu yang kurang aktif mengajak warga', 1, 'Menyarankan agar target tahun depan diturunkan', 2, 'B (5): Bertanggung jawab dan berorientasi solusi berbasis data; A (4): Bertanggung jawab dan solutif, tetapi kurang analisis penyebab; C (3): Mencari alasan eksternal; E (2): Menghindari tantangan; D (1): Melempar kesalahan.'),
  ('tkp-prestasi', 'hard', 'Anda mendapat penilaian kinerja dengan predikat baik, padahal merasa layak mendapat predikat sangat baik. Anda …', 'Menerima penilaian tanpa bertanya, meski merasa kurang puas', 3, 'Mengurangi usaha karena merasa kerja keras tidak dihargai', 2, 'Mendiskusikan dasar penilaian itu dengan atasan', 5, 'Mengajukan keberatan dan menyebarkan di grup kantor bahwa atasan menilai berdasarkan kedekatan pribadi, bukan berdasarkan capaian kerja sebenarnya', 1, 'Menerima penilaian itu dan bertekad meningkatkan kinerja pada periode berikutnya', 4, 'C (5): Mencari umpan balik untuk berkembang; E (4): Termotivasi, tetapi tanpa umpan balik; A (3): Pasif; B (2): Motivasi menurun; D (1): Emosional dan merusak suasana kerja.'),
  ('tkp-prestasi', 'medium', 'Rekan baru di unit Anda bekerja sangat cepat dan mulai sering dipuji pimpinan. Anda …', 'Menjadikannya pemacu untuk meningkatkan kecepatan kerja Anda sendiri', 4, 'Belajar dari cara kerjanya dan menjadikannya pemicu meningkatkan kinerja sendiri', 5, 'Menjaga jarak dengannya karena khawatir dibandingkan pimpinan, sambil tetap mengerjakan tugas seperti biasa tanpa menambah atau mengurangi usaha', 2, 'Bersikap biasa saja dan tetap bekerja dengan ritme Anda', 3, 'Mencari-cari kesalahan dalam pekerjaannya untuk disampaikan kepada pimpinan pada kesempatan berikutnya', 1, 'B (5): Kompetisi sehat dan saling belajar; A (4): Termotivasi; D (3): Netral; C (2): Defensif dan tidak berkembang; E (1): Menjatuhkan rekan.'),
  ('tkp-prestasi', 'easy', 'Anda ditugaskan menjadi pembawa acara dalam kegiatan resmi dinas untuk pertama kalinya. Anda …', 'Meminta rekan lain menggantikan Anda karena belum berpengalaman', 2, 'Mempelajari susunan acara dan berlatih beberapa kali sebelum hari pelaksanaan', 4, 'Menerima tugas dan mengandalkan kemampuan bicara spontan, karena menurut Anda terlalu banyak berlatih justru membuat penampilan menjadi kaku', 3, 'Menolak dengan alasan tidak pandai berbicara di depan umum', 1, 'Mempelajari susunan acara, berlatih, dan meminta masukan dari rekan yang berpengalaman', 5, 'E (5): Persiapan matang dan mau belajar; B (4): Persiapan baik; C (3): Menerima, tetapi persiapan kurang; A (2): Menghindari kesempatan belajar; D (1): Menolak tantangan.'),
  ('tkp-prestasi', 'hard', 'Anda mengusulkan perubahan alur kerja, tetapi setelah diterapkan hasilnya justru memperlambat layanan. Anda …', 'Menunggu beberapa minggu lagi untuk melihat apakah hasil alur baru itu membaik dengan sendirinya', 3, 'Mengusulkan agar alur lama dipakai kembali sementara perbaikan disusun ulang', 4, 'Mengakui, mengevaluasi bersama tim, dan memperbaikinya', 5, 'Menjelaskan kepada atasan bahwa alur baru gagal karena rekan-rekan tidak menjalankannya dengan benar, sehingga yang perlu dibenahi adalah disiplin mereka', 1, 'Diam saja dan berharap tidak ada yang ingat bahwa itu usulan Anda', 2, 'C (5): Bertanggung jawab atas hasil dan terus memperbaiki; B (4): Bertanggung jawab, tetapi kurang evaluasi; A (3): Pasif dan membiarkan layanan terganggu; E (2): Menghindari tanggung jawab; D (1): Melempar kesalahan.'),
  ('tkp-prestasi', 'medium', 'Anda ditempatkan di bagian arsip yang dianggap kurang bergengsi oleh sebagian rekan. Anda …', 'Menjalankan tugas seperlunya sambil terus menunggu kesempatan mutasi ke bagian yang lebih strategis', 3, 'Menjalankan tugas pengarsipan dengan rapi dan sesuai prosedur', 4, 'Bekerja asal-asalan karena merasa tugasnya tidak dihargai', 1, 'Berulang kali mengajukan permohonan pindah ke bagian lain', 2, 'Bekerja sungguh-sungguh, menata arsip agar mudah ditelusuri, dan belajar pengarsipan digital', 5, 'E (5): Berprestasi di posisi apa pun dan mengembangkan diri; B (4): Bertanggung jawab; A (3): Kurang bersemangat; D (2): Tidak menerima tugas; C (1): Tidak bertanggung jawab.'),
  ('tkp-prestasi', 'medium', 'Anda diminta memilih antara tetap mengerjakan tugas rutin yang sudah dikuasai atau bergabung dengan tim proyek baru yang menantang tetapi berisiko gagal. Anda …', 'Bergabung dengan proyek baru setelah tugas rutin diserahterimakan dengan baik', 5, 'Memilih tugas rutin dan menyarankan agar proyek itu tidak usah dijalankan', 1, 'Memilih tetap pada tugas rutin, tetapi menyatakan bersedia membantu tim proyek bila sewaktu-waktu diperlukan', 3, 'Bergabung dengan tim proyek baru karena ingin belajar hal baru', 4, 'Memilih tetap pada tugas rutin karena hasilnya lebih pasti dan menurut Anda risiko kegagalan proyek bisa berdampak buruk pada penilaian kinerja Anda', 2, 'A (5): Berani menantang diri dan tetap bertanggung jawab; D (4): Berani menantang diri; C (3): Aman, tetapi masih terbuka; E (2): Menghindari tantangan demi rasa aman; B (1): Menolak tantangan dan menghambat.'),
  ('tkp-prestasi', 'hard', 'Tugas besar Anda hampir selesai ketika Anda menyadari ada cara lain yang hasilnya jauh lebih baik, tetapi butuh tambahan tiga hari melewati tenggat. Anda …', 'Langsung beralih ke cara baru tanpa memberi tahu atasan meski melewati tenggat', 2, 'Berhenti mengerjakan karena merasa hasil cara lama tidak layak diserahkan', 1, 'Segera menyampaikan cara yang lebih baik itu kepada atasan dan meminta persetujuan perpanjangan tenggat tiga hari, sambil menjelaskan perbedaan hasil yang akan didapat', 4, 'Menyelesaikan tepat waktu, lalu mengusulkan versi yang lebih baik sebagai tindak lanjut', 5, 'Menyelesaikan dengan cara lama tepat waktu tanpa menyampaikan alternatif tersebut', 3, 'D (5): Menjaga tenggat sekaligus mengejar mutu; C (4): Mengejar mutu dengan komunikasi, tetapi mengorbankan tenggat; E (3): Tepat waktu, tetapi puas pada hasil cukup; A (2): Tidak komunikatif dan melanggar tenggat; B (1): Perfeksionis dan tidak tuntas.'),
  ('tkp-prestasi', 'easy', 'Anda mendapat penghargaan sebagai pegawai berkinerja terbaik bulan ini. Anda …', 'Bersyukur dan termotivasi mempertahankan kinerja yang baik', 4, 'Memamerkannya dan meremehkan rekan yang tidak mendapatkannya', 1, 'Mengurangi usaha karena sudah mendapatkan penghargaan', 2, 'Bersyukur, berterima kasih kepada tim yang mendukung, dan menjaga konsistensi kinerja', 5, 'Merasa puas dan menganggap penghargaan itu bukti cara kerja Anda sudah paling tepat, sehingga tidak perlu banyak perubahan pada bulan-bulan berikutnya', 3, 'D (5): Rendah hati dan konsisten; A (4): Termotivasi; E (3): Cepat puas; C (2): Kehilangan motivasi; B (1): Sombong dan merusak tim.'),
  ('tkp-inovasi', 'easy', 'Undangan rapat di kantor Anda hanya ditempel di papan pengumuman sehingga sering terlewat oleh pegawai. Anda …', 'Memastikan Anda sendiri selalu membaca papan pengumuman setiap pagi sebelum bekerja', 2, 'Menganggap pegawai yang terlewat rapat sebagai pihak yang kurang teliti membaca pengumuman di papan setiap hari', 1, 'Mengusulkan undangan dikirim lewat kalender daring', 5, 'Memotret setiap undangan di papan lalu mengirimkannya ke grup percakapan, walaupun foto sering buram dan tenggelam di antara pesan lain', 3, 'Mengingatkan rekan-rekan secara lisan setiap kali ada undangan rapat baru', 4, 'C (5): Solusi sederhana yang memanfaatkan sarana yang ada; E (4): Membantu, tetapi tidak memperbaiki sistem; D (3): Berinisiatif, tetapi caranya kurang efektif; A (2): Hanya memikirkan diri sendiri; B (1): Menyalahkan tanpa mencari solusi.'),
  ('tkp-inovasi', 'medium', 'Anda pendamping desa. Perajin anyaman di desa binaan memiliki produk bagus, tetapi penjualannya hanya ke tengkulak dengan harga rendah. Anda …', 'Melatih perajin memotret produk dan berjualan di lokapasar, sekaligus menghubungkan mereka dengan galeri UMKM daerah dan pengelola tempat wisata terdekat', 5, 'Mengusulkan agar produk mereka diikutkan dalam pameran UMKM kabupaten', 4, 'Menyarankan perajin mencari tengkulak lain di kota yang mau membayar lebih mahal', 2, 'Membiarkannya karena urusan pemasaran produk bukan bagian dari tugas pendampingan desa', 1, 'Membantu memasarkan produk melalui akun media sosial pribadi Anda', 3, 'A (5): Kreatif, memberdayakan, dan membuka jejaring pasar; B (4): Membuka peluang, tetapi sesekali saja; E (3): Membantu, tetapi bergantung pada Anda; C (2): Tidak mengubah pola lama; D (1): Pasif.'),
  ('tkp-inovasi', 'medium', 'Pimpinan ingin unit Anda mengurangi penggunaan kertas, tetapi tidak ada anggaran untuk membeli aplikasi baru. Anda …', 'Menunggu anggaran tahun depan agar unit bisa membeli aplikasi persuratan sendiri yang lebih lengkap fiturnya', 3, 'Menyampaikan kepada pimpinan bahwa target itu mustahil tanpa aplikasi khusus, karena tanpa sistem yang dibeli pegawai pasti kembali ke kebiasaan mencetak', 1, 'Mengusulkan pencetakan bolak-balik dan pembatasan jumlah salinan dokumen', 4, 'Memakai dokumen bersama dan tanda tangan elektronik instansi', 5, 'Mengurangi cetakan pada pekerjaan Anda sendiri tanpa mengajak rekan lain', 2, 'D (5): Kreatif memanfaatkan sumber daya yang tersedia; C (4): Hemat, tetapi perubahannya terbatas; A (3): Pasif menunggu sumber daya; E (2): Tidak berdampak bagi unit; B (1): Menyerah pada keterbatasan.'),
  ('tkp-inovasi', 'medium', 'Anda mengusulkan cara baru untuk merekap data kunjungan, tetapi rekan senior berkata "dari dulu juga begini dan tidak ada masalah". Anda …', 'Menjelaskan manfaat cara baru kepadanya dengan sopan dan sabar di sela pekerjaan', 4, 'Menerapkan cara baru pada bagian Anda sendiri tanpa melibatkannya', 3, 'Melaporkan kepada atasan bahwa senior tersebut menghambat kemajuan', 1, 'Menunjukkan perbandingan waktu kerja cara lama dan cara baru, lalu mengajaknya mencoba seminggu', 5, 'Mengurungkan usulan karena menghormati senior, meskipun Anda yakin cara baru lebih cepat dan sudah dipakai di unit lain dengan hasil yang baik', 2, 'D (5): Meyakinkan dengan data dan uji coba; A (4): Persuasif, tetapi tanpa bukti; B (3): Tetap berinovasi, tetapi tidak kolaboratif; E (2): Membiarkan ide baik hilang; C (1): Konfrontatif.'),
  ('tkp-inovasi', 'easy', 'Anda pustakawan di perpustakaan daerah yang sepi pengunjung remaja. Anda …', 'Membuat brosur tentang layanan perpustakaan dan menitipkannya ke sekolah-sekolah di sekitar kota', 3, 'Menambah koleksi buku populer remaja dan mengumumkannya lewat media sosial perpustakaan, sambil menyiapkan kartu anggota khusus pelajar', 4, 'Menganggap remaja zaman sekarang memang tidak suka membaca buku', 1, 'Menunggu program gerakan minat baca dari dinas pendidikan setempat', 2, 'Mengadakan kelas konten kreatif bersama komunitas pelajar', 5, 'E (5): Kreatif dan sesuai minat sasaran; B (4): Berusaha menarik minat, tetapi masih pendekatan biasa; A (3): Promosi konvensional; D (2): Pasif; C (1): Pesimis dan menyerah.'),
  ('tkp-inovasi', 'easy', 'Anda guru sejarah. Banyak siswa tampak bosan ketika materi disampaikan dengan ceramah. Anda …', 'Tetap berceramah, tetapi menambah kuis dadakan agar siswa terpaksa memperhatikan karena takut nilainya turun', 2, 'Membiarkan karena materi memang harus disampaikan sesuai buku', 1, 'Memberi tugas merangkum bab buku di rumah agar materi tetap tuntas', 3, 'Merancang kegiatan bermain peran dan kunjungan ke situs sejarah setempat', 5, 'Menambahkan video dokumenter singkat di sela penjelasan', 4, 'D (5): Kreatif dan melibatkan siswa; E (4): Variasi, tetapi siswa masih pasif; C (3): Tidak menyentuh masalah kebosanan; A (2): Menekan, bukan berinovasi; B (1): Kaku dan pasif.'),
  ('tkp-inovasi', 'medium', 'Laporan bulanan unit Anda disusun dengan menyalin data secara manual dari tiga aplikasi berbeda sehingga memakan waktu dua hari. Anda …', 'Membuat templat yang menarik data ketiga aplikasi otomatis', 5, 'Membagi pekerjaan menyalin data kepada lebih banyak rekan agar laporan bisa selesai dalam satu hari', 2, 'Tetap menyalin data secara manual karena sudah terbiasa melakukannya', 1, 'Mengusulkan kepada atasan agar dibuatkan aplikasi terintegrasi oleh pihak ketiga, lalu menunggu keputusan anggaran sambil tetap menyalin manual', 3, 'Membuat daftar periksa agar proses menyalin data menjadi lebih teliti', 4, 'A (5): Inovasi praktis yang memangkas waktu; E (4): Mengurangi kesalahan, tetapi tetap manual; D (3): Ide baik, tetapi bergantung dan pasif; B (2): Menambah beban orang lain; C (1): Tidak ada perbaikan.'),
  ('tkp-inovasi', 'medium', 'Cara kerja baru yang Anda rancang berhasil mempercepat layanan di unit Anda. Unit lain ingin menerapkannya. Anda …', 'Menyarankan mereka menunggu sampai cara itu diresmikan pimpinan', 2, 'Mempersilakan mereka mengamati sendiri cara kerja unit Anda', 3, 'Membagikan panduan tertulis tentang cara kerja tersebut kepada unit lain', 4, 'Enggan membagikannya karena khawatir unit Anda tidak lagi menonjol dalam penilaian kinerja dan kehilangan kesempatan mendapat penghargaan inovasi', 1, 'Menyusun panduan singkat dan mendampingi unit lain saat mencobanya', 5, 'E (5): Berbagi inovasi dan terus menyempurnakannya; C (4): Berbagi, tetapi tanpa pendampingan; B (3): Terbuka, tetapi pasif; A (2): Menunda penyebaran; D (1): Menyimpan inovasi demi kepentingan sendiri.'),
  ('tkp-inovasi', 'hard', 'Ide inovasi Anda mengharuskan perubahan satu tahapan dalam SOP yang ditetapkan dengan peraturan kepala dinas. Anda …', 'Membatalkan ide itu karena proses mengubah SOP terlalu rumit dan lama', 1, 'Mengusulkan uji coba terbatas kepada atasan sebelum SOP diubah, dengan catatan bahwa pelaksanaannya tetap mengikuti ketentuan yang berlaku sampai ada keputusan', 4, 'Menyusun kajian singkat dan mengajukan usulan perubahan SOP melalui atasan', 5, 'Langsung menerapkan tahapan baru karena hasilnya lebih baik', 2, 'Menyimpan ide itu sampai ada jadwal evaluasi SOP pada tahun berikutnya agar tidak merepotkan atasan', 3, 'C (5): Inovatif dan tetap menempuh jalur resmi; B (4): Hati-hati, tetapi belum menyiapkan dasar kajian; E (3): Menunda tanpa usaha; D (2): Inovatif tetapi melanggar aturan; A (1): Menyerah.'),
  ('tkp-inovasi', 'medium', 'Anda penyuluh pertanian. Petani enggan mencoba metode tanam baru yang lebih hemat air karena takut gagal panen. Anda …', 'Mengadakan pertemuan untuk menjelaskan keunggulan metode baru', 4, 'Menyerahkan keputusan sepenuhnya kepada petani tanpa pendampingan lebih lanjut', 2, 'Membuat petak percontohan bersama kelompok tani agar petani lain melihat hasilnya', 5, 'Membagikan brosur tentang metode tanam baru saat pertemuan kelompok tani', 3, 'Mewajibkan petani memakai metode baru sebagai syarat menerima bantuan', 1, 'C (5): Membuktikan manfaat secara nyata dan bertahap; A (4): Informatif, tetapi kurang meyakinkan; D (3): Pasif; B (2): Tidak berusaha; E (1): Memaksa.'),
  ('tkp-inovasi', 'easy', 'Kotak saran di kantor pelayanan Anda hampir tidak pernah diisi oleh warga. Anda …', 'Menyediakan pemindaian kode QR untuk survei singkat di loket', 5, 'Mengingatkan warga secara lisan untuk mengisi kotak saran', 3, 'Memindahkan kotak saran ke tempat yang lebih terlihat', 4, 'Mengosongkan kotak saran sebulan sekali dan melaporkan kepada atasan bahwa tidak ada keluhan, sehingga layanan dianggap sudah memuaskan', 2, 'Menyingkirkan kotak saran karena dianggap tidak ada gunanya', 1, 'A (5): Memudahkan warga memberi masukan; C (4): Perbaikan kecil; B (3): Usaha manual; D (2): Menyimpulkan keliru dari data kosong; E (1): Menghilangkan saluran masukan.'),
  ('tkp-inovasi', 'medium', 'Sosialisasi program kesehatan yang Anda adakan di balai desa hanya dihadiri sedikit warga. Anda …', 'Menjadwalkan ulang sosialisasi pada sore hari agar lebih banyak warga bisa hadir', 4, 'Mengulang sosialisasi dengan menambah konsumsi dan hadiah undian, karena menurut Anda warga lebih tertarik datang bila ada sesuatu yang dibawa pulang', 3, 'Menitipkan materi di pengajian, arisan, dan posyandu', 5, 'Mencatat dalam laporan bahwa sosialisasi sudah dilaksanakan sesuai rencana dan jadwal kegiatan', 2, 'Menyalahkan warga yang kurang peduli terhadap kesehatan keluarganya', 1, 'C (5): Kreatif menjangkau warga di tempat mereka berkumpul; A (4): Menyesuaikan waktu; B (3): Menarik sesaat, tetapi bukan solusi; D (2): Formalitas; E (1): Menyalahkan sasaran.'),
  ('tkp-inovasi', 'hard', 'Anda menemukan aplikasi gratis yang bisa mempermudah kerja tim, tetapi aplikasi itu menyimpan data di server luar negeri dan belum disetujui pengelola TIK instansi. Anda …', 'Mengajak seluruh tim langsung beralih ke aplikasi itu karena gratis dan mudah, lalu memindahkan semua dokumen kerja tim ke sana agar tidak tersebar', 1, 'Memakai aplikasi itu dulu dan baru melapor jika ada masalah', 2, 'Menunda pemakaiannya sampai ada persetujuan dari pengelola TIK', 4, 'Memakai aplikasi itu hanya untuk data yang tidak rahasia', 3, 'Mengusulkan aplikasi itu untuk dikaji pengelola TIK sambil memakai fitur serupa di aplikasi resmi', 5, 'E (5): Inovatif dan tetap menjaga keamanan data; C (4): Patuh, tetapi kurang proaktif; D (3): Kompromi yang tetap berisiko; B (2): Mengabaikan tata kelola TIK; A (1): Berisiko tinggi terhadap data.'),
  ('tkp-inovasi', 'medium', 'Anda ketua tim. Dalam setiap sesi curah gagasan, ide yang muncul selalu itu-itu saja. Anda …', 'Menetapkan sendiri ide yang akan dijalankan agar cepat', 2, 'Menganggap anggota tim memang kurang kreatif dan menerima keadaan', 1, 'Meminta setiap anggota tim membawa satu contoh praktik baik dari instansi lain pada pertemuan berikutnya, lalu membahasnya bersama dalam diskusi', 4, 'Mengundang pengguna layanan berbagi pengalaman dan memakai teknik curah gagasan tertulis', 5, 'Mengganti waktu dan tempat rapat curah gagasan agar suasana diskusi tim terasa lebih segar dan santai', 3, 'D (5): Memperkaya sudut pandang dan mendorong ide baru; C (4): Menambah masukan, tetapi belum menyentuh pengguna; E (3): Perubahan kecil; A (2): Mematikan partisipasi; B (1): Pesimis.'),
  ('tkp-inovasi', 'easy', 'Tagihan listrik kantor Anda tinggi karena lampu dan pendingin ruangan sering menyala saat ruangan kosong. Anda …', 'Mematikan lampu dan pendingin di ruangan kosong setiap kali Anda lewat', 4, 'Mengusulkan jadwal piket pemeriksaan ruangan, stiker pengingat di sakelar, dan pengaturan suhu pendingin standar yang disepakati bersama rekan-rekan', 5, 'Menunggu kebijakan hemat energi yang dikeluarkan oleh bagian umum', 2, 'Mengirim imbauan hemat energi secara berkala ke grup percakapan kantor', 3, 'Membiarkannya karena tagihan dibayar dari anggaran kantor', 1, 'B (5): Kreatif, murah, dan melibatkan semua; A (4): Baik, tetapi bergantung pada Anda; D (3): Imbauan tanpa sistem; C (2): Pasif; E (1): Tidak peduli.'),
  ('tkp-inovasi', 'hard', 'Atasan meminta inovasi unit Anda diikutkan lomba inovasi pelayanan publik, tetapi data dampaknya belum pernah dikumpulkan. Anda …', 'Menyarankan unit tidak ikut lomba agar pekerjaan tidak bertambah', 1, 'Mengumpulkan data sebelum dan sesudah inovasi dari arsip layanan dan survei pengguna', 5, 'Mengisi data dampak dengan perkiraan yang masuk akal berdasarkan pengamatan Anda selama ini, karena menurut Anda angkanya tidak akan jauh berbeda', 2, 'Mengisi formulir lomba dengan uraian kualitatif saja', 3, 'Meminta perpanjangan waktu agar data dampak bisa dikumpulkan dengan benar', 4, 'B (5): Membuktikan dampak secara objektif; E (4): Jujur, tetapi berisiko kehilangan kesempatan; D (3): Apa adanya, tetapi lemah; C (2): Mengarang data; A (1): Menghindari.'),
  ('tkp-inovasi', 'medium', 'Warga di desa terpencil wilayah kerja Anda sulit mendapatkan informasi pelatihan kerja dari dinas. Anda …', 'Mengunggah semua informasi pelatihan di situs web dinas dan media sosial resmi, dengan harapan warga yang punya ponsel bisa meneruskannya kepada tetangga', 3, 'Menyiarkannya lewat radio komunitas dan perangkat desa', 5, 'Menunggu warga yang berminat datang sendiri ke kantor dinas untuk menanyakan jadwal dan syarat pelatihan', 2, 'Mengirimkan informasi pelatihan ke kantor desa setiap bulan', 4, 'Menganggap warga desa terpencil memang sulit dijangkau informasi', 1, 'B (5): Kreatif memakai saluran lokal yang efektif; D (4): Baik, tetapi jangkauan terbatas; A (3): Kurang sesuai kondisi sasaran; C (2): Pasif; E (1): Menyerah.'),
  ('tkp-inovasi', 'hard', 'Atasan menantang unit Anda memangkas waktu proses izin dari sepuluh hari menjadi lima hari tanpa menambah pegawai. Anda …', 'Menyampaikan kepada atasan bahwa target itu tidak realistis', 2, 'Memetakan setiap tahapan untuk menemukan langkah yang bisa digabung atau dijalankan paralel', 5, 'Memotong tahapan verifikasi berkas yang memakan waktu paling lama, karena menurut Anda risiko kesalahan kecil masih bisa diperbaiki setelah izin terbit', 1, 'Mengusulkan pembagian ulang tugas agar tahapan verifikasi lebih cepat', 4, 'Meminta seluruh pegawai lembur setiap hari sampai target tercapai', 3, 'B (5): Inovasi berbasis analisis proses; D (4): Perbaikan sebagian; E (3): Solusi sementara yang membebani; A (2): Menolak tantangan; C (1): Mengorbankan mutu dan aturan.'),
  ('tkp-perubahan', 'easy', 'Anda dimutasi ke unit dengan bidang tugas yang sama sekali berbeda dari pekerjaan sebelumnya. Anda …', 'Menjalankan tugas baru sambil sesekali membandingkannya dengan cara kerja di unit lama yang lebih Anda sukai', 3, 'Mengajukan keberatan agar segera dikembalikan ke unit lama', 1, 'Mempelajari tugas baru dengan cepat dan aktif bertanya kepada rekan di unit itu', 5, 'Menerima mutasi, tetapi meminta atasan baru memberi tugas yang mirip dengan pekerjaan lama agar Anda tidak perlu banyak belajar dari awal', 2, 'Menerima mutasi dan mengikuti semua arahan dari atasan baru', 4, 'C (5): Adaptif dan proaktif; E (4): Menerima, tetapi belum proaktif; A (3): Menerima dengan setengah hati; D (2): Menghindari perubahan; B (1): Menolak perubahan.'),
  ('tkp-perubahan', 'medium', 'Jabatan Anda disetarakan menjadi jabatan fungsional sehingga cara penilaian kinerja ikut berubah. Anda …', 'Menjalankan pekerjaan seperti biasa dan berharap aturannya akan dijelaskan nanti', 3, 'Mengikuti sosialisasi penyetaraan jabatan dan mencatat hal-hal yang perlu disiapkan, lalu menunggu arahan rinci dari bagian kepegawaian sebelum memulai', 4, 'Meminta kepada pimpinan agar dikembalikan ke jabatan struktural', 1, 'Mengeluh kepada rekan-rekan karena merasa dirugikan oleh penyetaraan', 2, 'Mempelajari ketentuan jabatan fungsional dan menyusun rencana pengumpulan angka kredit', 5, 'E (5): Adaptif dan terencana; B (4): Mau beradaptasi, tetapi menunggu; A (3): Pasif; D (2): Menolak secara emosional; C (1): Menolak perubahan.'),
  ('tkp-perubahan', 'easy', 'Pimpinan baru mengubah format laporan mingguan yang selama ini sudah Anda kuasai. Anda …', 'Tetap memakai format lama sampai ada teguran dari pimpinan', 2, 'Mengkritik pimpinan baru di belakang karena suka mengubah-ubah', 1, 'Memakai format baru sesuai contoh yang diberikan pimpinan', 4, 'Mempelajari format baru dan menanyakan bagian yang belum jelas kepada pimpinan', 5, 'Memakai format baru, tetapi tetap menyiapkan laporan dengan format lama sebagai cadangan karena menurut Anda format lama lebih lengkap dan sudah terbukti', 3, 'D (5): Adaptif dan komunikatif; C (4): Patuh; E (3): Setengah hati dan membuang waktu; A (2): Menolak secara pasif; B (1): Negatif.'),
  ('tkp-perubahan', 'medium', 'Dua dinas digabung menjadi satu. Rekan-rekan cemas tentang posisi masing-masing dan pekerjaan mulai terbengkalai. Anda …', 'Tetap bekerja, mencari informasi resmi soal struktur baru, dan mengajak rekan fokus', 5, 'Ikut menunda pekerjaan sampai struktur organisasi baru dan pembagian tugasnya benar-benar jelas', 3, 'Mendekati pejabat tertentu agar mendapat posisi aman', 2, 'Tetap bekerja seperti biasa sambil menunggu informasi resmi', 4, 'Ikut menyebarkan kabar tentang siapa saja yang akan kehilangan jabatan setelah penggabungan, karena menurut Anda rekan-rekan berhak tahu lebih awal', 1, 'A (5): Tenang, adaptif, dan menjaga kinerja tim; D (4): Stabil, tetapi pasif; B (3): Terpengaruh ketidakpastian; C (2): Oportunis; E (1): Menyebarkan kabar yang belum pasti.'),
  ('tkp-perubahan', 'hard', 'Pengadaan barang di instansi Anda wajib beralih ke katalog elektronik. Penyedia langganan lama memprotes dan meminta Anda tetap membeli secara langsung. Anda …', 'Membeli langsung khusus untuk barang bernilai kecil saja', 2, 'Meminta penyedia menunggu sampai ada pengecualian dari pimpinan', 3, 'Menolak permintaan penyedia karena aturan sudah berubah', 4, 'Menjelaskan kebijakan baru dengan sopan dan menyarankan penyedia mendaftar ke katalog elektronik agar tetap bisa bersaing', 5, 'Tetap membeli langsung karena penyedia sudah lama bekerja sama', 1, 'D (5): Taat perubahan dan tetap menjaga hubungan baik; C (4): Patuh, tetapi kaku; B (3): Memberi harapan tanpa dasar; A (2): Melanggar ketentuan baru; E (1): Menolak perubahan.'),
  ('tkp-perubahan', 'medium', 'Anda pegawai senior. Pimpinan meminta Anda belajar aplikasi baru dari pegawai muda yang baru setahun bekerja. Anda …', 'Menolak karena merasa jauh lebih berpengalaman daripada pegawai muda', 1, 'Belajar dengan terbuka darinya dan berbagi pengalaman kerja Anda sebagai gantinya', 5, 'Meminta pegawai muda itu saja yang mengoperasikan aplikasi untuk unit, sementara Anda menangani pekerjaan lain yang lebih sesuai dengan pengalaman Anda', 2, 'Mengikuti sesi belajar sesuai jadwal yang ditentukan pimpinan', 4, 'Belajar sendiri dari buku panduan dan video tutorial agar tidak perlu diajari oleh pegawai yang lebih junior', 3, 'B (5): Rendah hati dan saling belajar; D (4): Patuh; E (3): Gengsi; C (2): Menghindari belajar hal baru; A (1): Menolak perubahan.'),
  ('tkp-perubahan', 'easy', 'Kantor Anda menerapkan kebijakan bebas plastik sekali pakai. Beberapa rekan menggerutu karena merasa repot. Anda …', 'Mematuhi kebijakan itu tanpa banyak berkomentar kepada rekan', 4, 'Tetap memakai plastik sekali pakai bila tidak ada yang melihat', 2, 'Mematuhi kebijakan di kantor, tetapi ikut menggerutu bersama rekan karena menurut Anda kebijakan itu dibuat tanpa memikirkan kepraktisan pegawai', 3, 'Membawa botol minum sendiri dan mengajak rekan memakai wadah isi ulang', 5, 'Mengajak rekan-rekan menolak kebijakan tersebut secara bersama', 1, 'D (5): Menjalankan dan menularkan perubahan; A (4): Patuh; C (3): Patuh setengah hati; B (2): Tidak konsisten; E (1): Melawan perubahan.'),
  ('tkp-perubahan', 'hard', 'Kebijakan layanan baru sudah diumumkan pemerintah pusat, tetapi petunjuk teknisnya belum terbit. Warga mulai menanyakannya di loket Anda. Anda …', 'Menjelaskan informasi resmi yang ada, mencatat pertanyaan warga, dan meminta kejelasan atasan', 5, 'Menjelaskan tata cara versi Anda sendiri berdasarkan kebijakan lama ditambah dugaan Anda, agar warga tidak kecewa dan tidak perlu datang berulang kali', 1, 'Menjanjikan kepada warga bahwa layanan akan segera tersedia', 2, 'Meminta warga memantau sendiri pengumuman resmi di situs web dan media sosial instansi secara berkala', 3, 'Menyampaikan bahwa kebijakan itu belum bisa dilayani sampai ada petunjuk teknis', 4, 'A (5): Tanggap dan jujur di tengah ketidakpastian; E (4): Jujur, tetapi kurang membantu; D (3): Melempar; C (2): Memberi harapan tanpa dasar; B (1): Informasi menyesatkan.'),
  ('tkp-perubahan', 'medium', 'Dalam rangka pemerataan, Anda ditempatkan di kantor wilayah kepulauan yang jauh dari keluarga. Anda …', 'Menerima penempatan, menyiapkan kepindahan, dan mempelajari kondisi wilayah tugas', 5, 'Menerima penempatan itu sebagai konsekuensi ASN yang siap ditempatkan di mana saja, sambil mengatur komunikasi rutin dengan keluarga dan menyiapkan diri seadanya', 4, 'Meminta penundaan keberangkatan tanpa alasan yang kuat', 2, 'Menerima penempatan, tetapi segera mengajukan mutasi kembali', 3, 'Mencari bantuan kenalan agar penempatan dibatalkan', 1, 'A (5): Menerima dan beradaptasi secara aktif; B (4): Menerima dengan baik, tetapi persiapan kurang; D (3): Menerima sementara; C (2): Menghindar; E (1): Menolak dengan cara tidak patut.'),
  ('tkp-perubahan', 'medium', 'Anda guru. Sekolah Anda mulai menerapkan kurikulum baru yang menuntut pembelajaran berbasis proyek. Anda …', 'Menerapkan kurikulum baru sebatas dokumen administrasi', 3, 'Mengikuti pelatihan, berdiskusi dengan komunitas guru, dan mencoba merancang proyek sederhana yang sesuai dengan kondisi siswa dan lingkungan sekolah', 5, 'Mengikuti pelatihan kurikulum baru yang diadakan dinas', 4, 'Menganggap kurikulum baru hanya akan berganti lagi', 1, 'Tetap mengajar dengan cara lama karena lebih terbiasa', 2, 'B (5): Adaptif, belajar, dan menerapkan; C (4): Mau belajar; A (3): Formalitas; E (2): Menolak secara pasif; D (1): Sinis.'),
  ('tkp-perubahan', 'hard', 'Anda tidak sepenuhnya setuju dengan kebijakan baru pimpinan karena menurut Anda ada dampak yang belum dipertimbangkan. Anda …', 'Menjalankan kebijakan itu sebaik mungkin tanpa menyampaikan pendapat', 4, 'Menjalankan kebijakan seadanya sambil menunggu kebijakan itu terbukti gagal, agar pimpinan menyadari sendiri bahwa pertimbangan Anda sebelumnya benar', 2, 'Menjalankannya sambil memberi masukan tertulis', 5, 'Mengajak rekan-rekan untuk tidak menjalankan kebijakan itu', 1, 'Menyampaikan keberatan secara terbuka dalam rapat dan meminta agar pelaksanaan kebijakan itu ditunda', 3, 'C (5): Patuh sekaligus konstruktif; A (4): Patuh tanpa masukan; E (3): Kritis, tetapi menghambat; B (2): Pasif-agresif; D (1): Melawan.'),
  ('tkp-perubahan', 'medium', 'Instansi Anda mengubah pola kerja dari per bidang menjadi tim lintas bidang berbasis proyek. Anda …', 'Menjalankan tugas di tim proyek sesuai pembagian peran yang ada', 4, 'Menunggu pola kerja itu dievaluasi sebelum terlibat penuh', 2, 'Menolak bergabung karena lebih nyaman bekerja per bidang', 1, 'Menjalankan tugas di tim proyek, tetapi tetap mendahulukan pekerjaan dari bidang lama karena menurut Anda tugas itu lebih jelas pertanggungjawabannya', 3, 'Menyesuaikan diri dengan peran baru dan aktif berkoordinasi dengan anggota dari bidang lain', 5, 'E (5): Adaptif dan kolaboratif; A (4): Menerima; D (3): Setengah hati; B (2): Pasif; C (1): Menolak.'),
  ('tkp-perubahan', 'easy', 'Kantor pelayanan Anda mulai buka pada hari Sabtu dengan sistem jadwal bergilir bagi pegawai. Anda …', 'Menerima jadwal, tetapi meminta giliran Sabtu sesedikit mungkin', 4, 'Menerima jadwal dan menyesuaikan urusan pribadi', 5, 'Sering menukar giliran dengan rekan agar terhindar dari Sabtu', 2, 'Menolak jadwal tersebut karena hari Sabtu adalah waktu keluarga dan menurut Anda pelayanan cukup dibuka pada hari kerja biasa seperti sebelumnya', 1, 'Menerima jadwal bergilir sambil menunggu hasil evaluasi layanan Sabtu setelah berjalan tiga bulan', 3, 'B (5): Mendukung perubahan demi layanan; A (4): Menerima dengan syarat; E (3): Menerima sementara; C (2): Menghindar; D (1): Menolak perubahan.'),
  ('tkp-perubahan', 'hard', 'Anda ketua tim. Anggaran kegiatan dipotong sehingga rencana yang sudah disusun bersama harus diubah. Anggota tim kecewa. Anda …', 'Menunda penyampaian sampai rencana baru selesai disusun', 3, 'Tetap menjalankan rencana awal dan berharap anggaran ditambah', 1, 'Menyampaikan informasi pemotongan apa adanya kepada tim dan menyusun sendiri rencana baru berdasarkan prioritas yang menurut Anda paling penting, lalu membagikannya', 4, 'Ikut mengeluh bersama tim tentang keputusan pimpinan', 2, 'Menjelaskan alasan pemotongan dan mengajak tim menyusun ulang prioritas kegiatan bersama', 5, 'E (5): Transparan dan melibatkan tim; C (4): Jelas, tetapi kurang melibatkan; A (3): Kurang transparan; D (2): Memperkeruh suasana; B (1): Menolak kenyataan.'),
  ('tkp-perubahan', 'medium', 'Layanan cetak dokumen di kantor Anda kini dilakukan warga sendiri melalui anjungan mandiri sehingga tugas Anda di loket berkurang. Anda …', 'Membantu warga memakai anjungan dan menawarkan diri mengambil tugas baru', 5, 'Tetap berjaga di loket seperti biasa dan melayani warga yang datang tanpa memakai anjungan', 3, 'Mengusulkan anjungan ditiadakan agar loket tetap ramai', 1, 'Membantu warga yang kesulitan memakai anjungan mandiri', 4, 'Memanfaatkan waktu luang untuk istirahat lebih lama karena pekerjaan di loket memang sudah berkurang dan atasan belum memberikan tugas pengganti', 2, 'A (5): Adaptif dan tetap produktif; D (4): Menyesuaikan peran; B (3): Belum menyesuaikan; E (2): Tidak memanfaatkan perubahan; C (1): Menolak perubahan.'),
  ('tkp-perubahan', 'medium', 'Beredar kabar di kantor bahwa digitalisasi layanan akan membuat banyak pegawai dirumahkan. Rekan-rekan mulai resah. Anda …', 'Mengingatkan rekan agar tidak mudah percaya kabar yang belum jelas', 4, 'Meneruskan kabar itu ke grup lain agar orang bersiap', 1, 'Mencari informasi resmi, meluruskan kabar itu, dan mengajak rekan menambah keterampilan', 5, 'Ikut membicarakan kabar itu bersama rekan saat istirahat', 2, 'Tidak menanggapi kabar itu dan tetap bekerja, meski diam-diam Anda juga mulai khawatir dan menunda mengikuti pelatihan digital yang ditawarkan kantor', 3, 'C (5): Tenang, berbasis fakta, dan adaptif; A (4): Meredam, tetapi belum solutif; E (3): Pasif; D (2): Memperluas keresahan; B (1): Menyebarkan hoaks.'),
  ('tkp-perubahan', 'hard', 'Tahun ini kebijakan pelaporan kegiatan sudah berubah tiga kali. Rekan-rekan lelah dan mulai mengabaikan perubahan terbaru. Anda …', 'Menyesuaikan laporan Anda sendiri dengan ketentuan terbaru', 4, 'Memakai format laporan yang menurut Anda paling mudah', 2, 'Ikut mengabaikan perubahan terbaru seperti rekan-rekan lain', 1, 'Menunggu dulu apakah kebijakan pelaporan akan berubah lagi', 3, 'Merangkum perubahan terbaru menjadi panduan singkat untuk tim dan menyampaikan kendala lapangan kepada pengelola kebijakan', 5, 'E (5): Membantu tim beradaptasi dan memberi masukan; A (4): Adaptif secara pribadi; D (3): Menunda; B (2): Mengabaikan ketentuan; C (1): Menolak perubahan.'),
  ('tkp-perubahan', 'easy', 'Atasan menunjuk Anda sebagai agen perubahan untuk program reformasi birokrasi di unit kerja. Anda …', 'Menerima dan menyebarkan informasi program kepada rekan', 4, 'Menerima, memahami program, dan memberi contoh perilaku yang diharapkan', 5, 'Menerima penunjukan itu, tetapi menjalankan peran agen perubahan sebatas kewajiban administratif', 3, 'Menerima penunjukan itu, tetapi menganggap program reformasi birokrasi hanya slogan karena menurut pengalaman Anda program serupa tidak pernah benar-benar berjalan', 1, 'Meminta orang lain ditunjuk karena Anda sedang sibuk', 2, 'B (5): Menjadi teladan perubahan; A (4): Menjalankan peran; C (3): Formalitas; E (2): Menghindar; D (1): Sinis.'),
  ('tkp-pengendalian', 'medium', 'Atasan menegur Anda dengan keras di depan rekan-rekan atas kesalahan laporan yang sebenarnya juga melibatkan bagian lain. Anda …', 'Diam saja selama teguran, lalu mengirim pesan panjang kepada atasan pada malam harinya untuk menjelaskan bahwa kesalahan itu bukan sepenuhnya dari Anda', 3, 'Langsung membela diri di depan rekan-rekan bahwa kesalahan itu dari bagian lain', 2, 'Membalas teguran atasan dengan nada tinggi karena merasa dipermalukan', 1, 'Menerima teguran dan segera memperbaiki bagian laporan yang menjadi tanggung jawab Anda', 4, 'Menerima teguran dengan tenang, lalu menjelaskan duduk perkaranya kepada atasan secara pribadi', 5, 'E (5): Tenang, tidak defensif, dan meluruskan di waktu yang tepat; D (4): Tenang dan bertanggung jawab, tetapi tidak meluruskan; A (3): Menahan diri, tetapi caranya kurang tepat; B (2): Defensif di forum terbuka; C (1): Tidak mampu mengendalikan emosi.'),
  ('tkp-pengendalian', 'easy', 'Sistem antrean sedang gangguan. Seorang warga menggebrak meja loket karena sudah menunggu dua jam. Anda …', 'Tetap tenang, meminta maaf, dan menjelaskan langkahnya', 5, 'Membalas dengan suara keras dan mengatakan bahwa gangguan sistem bukan kesalahan Anda, sehingga warga tidak berhak marah kepada petugas loket', 1, 'Tetap tenang dan meminta warga duduk sambil menunggu sistem kembali normal', 4, 'Memanggil petugas keamanan agar warga itu segera ditenangkan dan dijauhkan dari loket', 3, 'Menegur warga agar menjaga sikap dan sopan santun karena sedang berada di kantor pemerintahan', 2, 'A (5): Tenang, empatik, dan memberi kepastian; C (4): Tenang, tetapi kurang informatif; D (3): Menghindari interaksi langsung; E (2): Membalas dengan teguran; B (1): Terpancing emosi.'),
  ('tkp-pengendalian', 'easy', 'Anda sangat lelah setelah lembur, lalu seorang rekan meminta bantuan mendadak untuk menyelesaikan bahan rapat besok pagi. Anda …', 'Membantu menyelesaikan bahan rapat sambil terus menggerutu di depannya', 2, 'Menjawab ketus bahwa bahan rapat itu bukan urusan Anda sama sekali', 1, 'Menyampaikan kondisi Anda dengan jujur dan menawarkan bantuan yang masih sanggup diberikan', 5, 'Menolak permintaan itu dengan alasan Anda sudah lembur sejak kemarin', 3, 'Membantu sampai bahan rapat selesai meskipun Anda sangat lelah, karena menurut Anda menolak permintaan rekan bisa merusak hubungan kerja di tim', 4, 'C (5): Mengenali batas diri dan tetap membantu; E (4): Membantu, tetapi mengabaikan batas diri; D (3): Jujur, tetapi kurang solutif; A (2): Tidak mampu mengelola emosi; B (1): Emosional dan merusak hubungan.'),
  ('tkp-pengendalian', 'medium', 'Di kolom komentar akun media sosial resmi kantor, seorang warganet menghina Anda secara pribadi karena foto Anda tampil di unggahan layanan. Anda …', 'Tidak membalas dan mengabaikan komentar tersebut sepenuhnya', 4, 'Meminta pengelola akun resmi menghapus komentar itu secepatnya dan memblokir akun warganet tersebut', 3, 'Membalas komentar itu memakai akun pribadi Anda dengan bahasa yang sopan, tetapi menjelaskan panjang lebar bahwa tuduhan warganet tersebut keliru', 2, 'Membalas dengan hinaan serupa memakai akun media sosial pribadi Anda', 1, 'Tidak membalas dan melaporkannya ke pengelola akun', 5, 'E (5): Tidak terpancing dan memakai jalur yang tepat; A (4): Menahan diri, tetapi tidak melaporkan; B (3): Reaktif, tetapi masih lewat jalur kantor; C (2): Terpancing berdebat di ruang publik; D (1): Terpancing emosi.'),
  ('tkp-pengendalian', 'medium', 'Anda tidak sengaja mendengar dua rekan membicarakan sisi negatif Anda di pantri kantor. Anda …', 'Pura-pura tidak mendengar dan menjaga jarak dari keduanya', 3, 'Menceritakan kejadian itu kepada rekan lain agar mereka tahu sikap kedua orang tersebut', 2, 'Langsung masuk ke pantri dan memarahi mereka di depan rekan lain', 1, 'Menenangkan diri dulu, lalu mengajak keduanya bicara baik-baik untuk memahami penilaian mereka', 5, 'Menahan diri dan merenungkan apakah ada perilaku Anda yang perlu diperbaiki', 4, 'D (5): Tenang, dewasa, dan terbuka terhadap masukan; E (4): Tenang dan introspektif; A (3): Menahan emosi, tetapi menghindar; B (2): Menyebarkan masalah; C (1): Reaktif dan emosional.'),
  ('tkp-pengendalian', 'easy', 'Saat rapat, usulan Anda ditertawakan oleh beberapa peserta. Anda …', 'Tetap tenang dan menerima dengan lapang dada bila usulan Anda tidak disetujui', 4, 'Membalas dengan menyindir usulan yang disampaikan peserta lain', 2, 'Meninggalkan ruang rapat lebih dulu karena merasa tersinggung', 1, 'Diam sepanjang sisa rapat karena merasa usulan Anda tidak dihargai, lalu memutuskan tidak akan menyampaikan ide lagi pada rapat-rapat berikutnya', 3, 'Tetap tenang dan menjelaskan alasan serta datanya', 5, 'E (5): Percaya diri dan terkendali; A (4): Terkendali, tetapi kurang memperjuangkan ide; D (3): Menarik diri karena kecewa; B (2): Membalas dengan sindiran; C (1): Tidak mampu mengendalikan diri.'),
  ('tkp-pengendalian', 'hard', 'Satu jam sebelum Anda memandu acara resmi, Anda menerima kabar bahwa orang tua Anda dirawat di rumah sakit, tetapi kondisinya tidak kritis. Anda …', 'Mengabari keluarga, memastikan pendamping, lalu memandu acara', 5, 'Menyampaikan kepada panitia dan meminta cadangan bersiap bila Anda harus pergi', 4, 'Meminta rekan menggantikan Anda secara mendadak tanpa menjelaskan susunan acara dan kebutuhan panitia', 2, 'Langsung meninggalkan tempat acara tanpa memberi tahu panitia, karena merasa tidak sanggup berkonsentrasi dan yakin panitia akan memahami keadaan Anda', 1, 'Tetap memandu acara, tetapi terus memeriksa ponsel di sela-sela susunan acara', 3, 'A (5): Mengelola emosi dan tetap bertanggung jawab; B (4): Jujur dan antisipatif; E (3): Emosi memengaruhi kinerja; C (2): Menghindar tanpa persiapan; D (1): Impulsif dan tidak bertanggung jawab.'),
  ('tkp-pengendalian', 'medium', 'Mobil dinas yang Anda kemudikan diserempet pengendara motor. Pengendara itu justru marah-marah dan menyalahkan Anda di depan orang banyak. Anda …', 'Menunjukkan identitas ASN Anda agar pengendara itu mundur dan berhenti menyalahkan', 2, 'Ikut berteriak membela diri di depan orang banyak yang berkerumun', 1, 'Tetap tenang, memastikan tidak ada yang terluka, dan menyelesaikan masalah secara baik-baik', 5, 'Diam saja dan segera pergi dari lokasi agar keributan tidak berlanjut', 3, 'Menahan diri, mendokumentasikan kejadian dengan foto, dan mengajak pengendara menyelesaikannya di pos polisi terdekat agar ada pihak yang menengahi', 4, 'C (5): Tenang dan mengutamakan keselamatan; E (4): Terkendali, tetapi belum mengutamakan keselamatan; D (3): Menghindar; A (2): Memakai status untuk menekan; B (1): Terpancing emosi.'),
  ('tkp-pengendalian', 'medium', 'Tiga tenggat pekerjaan jatuh pada minggu yang sama, lalu atasan menambahkan satu tugas mendesak. Anda …', 'Menerima tugas itu, tetapi mengeluh panjang di grup kantor tentang pembagian kerja yang menurut Anda tidak adil dan selalu memberatkan pegawai tertentu', 2, 'Menerima semua tugas dan lembur setiap hari untuk menyelesaikannya', 4, 'Menyusun prioritas dan menyepakatinya dengan atasan', 5, 'Mengerjakan tugas yang paling mudah lebih dulu agar terasa ada kemajuan, lalu melihat sisa waktu yang ada', 3, 'Menolak tugas tambahan itu dengan nada kesal di depan atasan', 1, 'C (5): Tenang mengelola tekanan dengan komunikasi; B (4): Tahan tekanan, tetapi tidak dikelola; D (3): Kurang terarah; A (2): Melampiaskan tekanan secara tidak tepat; E (1): Emosional.'),
  ('tkp-pengendalian', 'medium', 'Saat Anda presentasi, seorang rekan berkali-kali menyela dan mengoreksi hal-hal kecil. Anda …', 'Menjawab setiap selaannya dengan sabar satu per satu, lalu melanjutkan presentasi', 4, 'Menanggapi dengan tenang dan mengusulkan diskusi lebih lanjut setelah presentasi selesai', 5, 'Meminta rekan itu berhenti menyela dengan nada tinggi', 1, 'Menyindirnya balik agar peserta lain ikut menertawakannya', 2, 'Mengabaikan selaannya dan terus berbicara lebih cepat agar presentasi segera selesai, sambil berharap pimpinan rapat akan menegurnya', 3, 'B (5): Terkendali dan menjaga alur presentasi; A (4): Sabar, tetapi alur terganggu; E (3): Menahan diri, tetapi tidak menyelesaikan; D (2): Membalas secara tidak sopan; C (1): Emosional.'),
  ('tkp-pengendalian', 'hard', 'Saat kegiatan lapangan, seorang wartawan mengajukan pertanyaan memancing tentang isu sensitif yang bukan kewenangan Anda. Anda …', 'Memarahi wartawan karena pertanyaannya dianggap memancing keributan', 1, 'Menjawab tenang bahwa itu bukan kewenangan Anda dan mengarahkannya ke juru bicara resmi', 5, 'Menyampaikan dengan sopan bahwa pertanyaan itu bukan kewenangan Anda', 4, 'Menolak diwawancarai dan segera meninggalkan lokasi kegiatan tanpa penjelasan', 3, 'Memberikan pendapat pribadi tentang isu itu agar wartawan merasa puas', 2, 'B (5): Tenang, sesuai kewenangan, dan tetap informatif; C (4): Terkendali, tetapi tanpa arahan; D (3): Menghindar; E (2): Terpancing di luar kewenangan; A (1): Emosional dan merusak citra instansi.'),
  ('tkp-pengendalian', 'medium', 'Rekan yang lebih junior ditunjuk menjadi ketua tim, padahal Anda merasa lebih berpengalaman. Anda …', 'Menerima keputusan, tetapi hanya mengerjakan bagian Anda tanpa mau membantu lebih', 3, 'Menerima dan mendukung ketua tim dengan pengalaman Anda', 5, 'Menunjukkan ketidaksenangan dengan sering mempertanyakan keputusan ketua tim di depan anggota lain, agar pimpinan sadar bahwa penunjukan itu kurang tepat', 1, 'Menerima keputusan itu dan bekerja sesuai pembagian tugas yang diberikan', 4, 'Menanyakan alasan penunjukan itu kepada pimpinan dengan nada kecewa', 2, 'B (5): Dewasa dan mengutamakan tim; D (4): Menerima dengan profesional; A (3): Menerima setengah hati; E (2): Emosi tampak; C (1): Tidak mampu menerima dan merusak tim.'),
  ('tkp-pengendalian', 'easy', 'Di grup percakapan keluarga, seorang kerabat menyindir Anda sebagai ASN yang "makan gaji buta" setiap kali ada berita buruk tentang pemerintah. Anda …', 'Keluar dari grup keluarga agar tidak perlu membaca sindirannya', 3, 'Membalas dengan menjelaskan panjang lebar bahwa semua berita itu tidak benar dan meminta kerabat berhenti menyebarkan pendapat yang menurut Anda menyudutkan ASN', 2, 'Membalas dengan menyindir pekerjaan kerabat tersebut di dalam grup', 1, 'Menanggapi santai dan bila perlu menjelaskan pekerjaan Anda dengan sopan', 5, 'Tidak menanggapi sindiran itu dan tetap menjaga hubungan baik dengan kerabat', 4, 'D (5): Tenang dan tidak terpancing; E (4): Menahan diri; A (3): Menghindar; B (2): Reaktif dan berpotensi memperpanjang konflik; C (1): Membalas sindiran.'),
  ('tkp-pengendalian', 'hard', 'Anda perawat IGD. Keluarga pasien berteriak dan memaki karena pasiennya belum ditangani, padahal tim sedang menangani pasien yang lebih gawat. Anda …', 'Membalas dengan meminta keluarga pasien keluar dari IGD saat itu juga', 1, 'Menjelaskan dengan tenang bahwa pasien ditangani berdasarkan tingkat kegawatan', 4, 'Mengabaikan teriakannya dan melanjutkan pekerjaan tanpa menjelaskan apa pun, karena menurut Anda menjelaskan hanya membuang waktu yang lebih berharga bagi pasien gawat', 2, 'Tenang, menjelaskan triase, dan memeriksa ulang pasiennya', 5, 'Meminta petugas keamanan mendampingi keluarga pasien menunggu di luar ruang tindakan sampai tenang', 3, 'D (5): Tenang, informatif, dan tetap memantau pasien; B (4): Tenang dan informatif; E (3): Menghindari konfrontasi; C (2): Menahan diri, tetapi tidak komunikatif; A (1): Emosional.'),
  ('tkp-pengendalian', 'medium', 'Kesalahan perhitungan dari rekan membuat Anda harus mengulang pekerjaan dan lembur dua hari. Anda …', 'Menyelesaikan perbaikan, tetapi kemudian menolak bekerja sama dengan rekan itu pada tugas berikutnya karena khawatir kejadian serupa terulang lagi', 3, 'Memarahinya di ruang kerja karena Anda harus lembur dua hari', 1, 'Menyindir kesalahannya di depan rekan-rekan lain saat rapat tim', 2, 'Menyelesaikan perbaikan, lalu membicarakan kesalahan itu dengan rekan secara baik-baik', 5, 'Menyelesaikan perbaikan tanpa mempermasalahkan kesalahan itu kepada siapa pun', 4, 'D (5): Tenang, menyelesaikan, dan mencegah terulang; E (4): Sabar, tetapi tidak mencegah terulang; A (3): Menyimpan kekesalan; C (2): Melampiaskan kekesalan; B (1): Tidak terkendali.'),
  ('tkp-pengendalian', 'medium', 'Pukul 22.00 atasan mengirim pesan bernada keras karena data yang Anda kirim sore tadi tidak lengkap. Anda …', 'Membaca pesan itu dan baru menanggapinya keesokan pagi', 3, 'Membalas dengan permintaan maaf dan segera melengkapi data malam itu juga', 4, 'Membalas singkat dan sopan, mengakui kekurangannya, dan menyampaikan kapan data lengkap dikirim', 5, 'Membalas pesan atasan dengan nada yang sama kerasnya', 1, 'Membalas bahwa pesan pada malam hari mengganggu waktu istirahat', 2, 'C (5): Tenang, bertanggung jawab, dan memberi kepastian; B (4): Bertanggung jawab, tetapi reaktif; A (3): Menahan diri, tetapi tanpa kabar; E (2): Defensif; D (1): Terpancing emosi.'),
  ('tkp-pengendalian', 'easy', 'Anda menjadi fasilitator pelatihan. Beberapa peserta asyik bermain ponsel saat Anda menyampaikan materi. Anda …', 'Tetap tenang dan mengajak mereka terlibat lewat diskusi kelompok atau pertanyaan', 5, 'Menyindir peserta yang bermain ponsel di depan forum', 2, 'Membiarkan mereka bermain ponsel dan terus melanjutkan materi sesuai jadwal yang sudah disusun', 3, 'Mengingatkan dengan sopan agar seluruh peserta menyimak materi', 4, 'Menegur keras dan meminta mereka keluar ruangan, karena menurut Anda peserta yang tidak menghargai fasilitator tidak layak mengikuti pelatihan lagi', 1, 'A (5): Terkendali dan kreatif; D (4): Tenang, tetapi kurang menarik minat; C (3): Menahan diri, tetapi pasif; B (2): Kurang terkendali; E (1): Emosional dan berlebihan.'),
  ('tkp-pengendalian', 'hard', 'Seorang warga yang permohonannya Anda tolak karena tidak memenuhi syarat mengancam akan memviralkan Anda sebagai petugas yang mempersulit. Anda …', 'Diam saja dan membiarkan warga pergi sambil terus mengancam', 3, 'Balik mengancam akan melaporkan warga tersebut ke polisi', 1, 'Akhirnya memproses permohonan itu agar tidak diviralkan', 2, 'Menjelaskan kembali syarat yang belum dipenuhi dan mempersilakan warga menempuh jalur pengaduan resmi bila keberatan, sambil memberi tahu atasan tentang ancaman tersebut', 4, 'Menjelaskan dasar penolakan dengan tenang, menunjukkan syarat yang belum terpenuhi, dan mencatat kejadiannya', 5, 'E (5): Tenang, transparan, dan sesuai prosedur; D (4): Tenang dan terbuka, tetapi kurang membantu memenuhi syarat; A (3): Menahan diri, tetapi pasif; C (2): Goyah karena tekanan; B (1): Terpancing emosi.'),
  ('tkp-pelayanan', 'easy', 'Anda admin akun WhatsApp layanan Dukcapil kabupaten yang beroperasi pukul 08.00-16.00. Pukul 21.00 masuk pesan warga yang menanyakan status akta kematian ayahnya yang diajukan dua minggu lalu. Anda …', 'Membalas singkat malam itu bahwa pesan akan diteruskan, lalu menyerahkannya ke petugas shift pagi tanpa mencatat nomor berkas maupun nama pemohon dengan jelas', 3, 'Meminta warga datang langsung ke kantor karena layanan WhatsApp hanya untuk informasi umum', 1, 'Membiarkan pesan itu karena di luar jam layanan; warga bisa bertanya lagi besok bila memang masih membutuhkan informasi tersebut', 2, 'Membalas esok pagi dengan status berkas yang sudah dicek, lalu mengusulkan pesan otomatis berisi jam layanan', 5, 'Membalas esok pagi pada jam layanan dengan informasi status berkas setelah mengeceknya di sistem kependudukan', 4, 'D (5): Tetap dalam jam layanan, memberi kepastian, dan memperbaiki sistem; E (4): Melayani tuntas tetapi tanpa perbaikan kanal; A (3): Tanggap di awal tetapi tindak lanjut tidak tertata; C (2): Pasif dan tidak memberi kepastian; B (1): Menolak memanfaatkan kanal layanan yang tersedia.'),
  ('tkp-pelayanan', 'easy', 'Seorang lansia datang ke kantor cabang BPJS Kesehatan dan kebingungan karena nomor antrean kini hanya dapat diambil melalui aplikasi. Anda petugas di meja depan. Anda …', 'Memberinya brosur berisi langkah-langkah mengambil antrean melalui aplikasi dan memintanya mencoba sendiri di ruang tunggu', 3, 'Menyarankan ia meminta bantuan keluarga yang lebih paham ponsel lalu kembali besok', 2, 'Menjelaskan bahwa antrean daring berlaku untuk semua peserta tanpa kecuali demi ketertiban, sehingga ia tetap perlu mengambil antrean sendiri dari ponselnya seperti yang lain', 1, 'Mengambilkan nomor antrean memakai perangkat kantor lalu mempersilakannya menunggu panggilan di kursi prioritas', 4, 'Mengambilkan antrean lewat perangkat kantor, sambil menawarkan cara memakai aplikasi bila ia ingin belajar', 5, 'E (5): Kebutuhan terpenuhi dan warga diberdayakan; D (4): Melayani dengan baik tanpa langkah tambahan; A (3): Informatif tetapi tidak menyelesaikan kebutuhan saat itu; B (2): Melempar urusan ke pihak lain; C (1): Kaku dan tidak empatik terhadap kelompok rentan.'),
  ('tkp-pelayanan', 'medium', 'Seorang warga menulis keluhan di kolom komentar akun Instagram resmi dinas tempat Anda bertugas tentang jalan rusak yang ternyata kewenangan pemerintah provinsi. Anda admin media sosial dinas. Anda …', 'Menyembunyikan komentar tersebut agar tidak memancing komentar serupa, lalu menyampaikan kepada atasan bahwa keluhan itu bukan urusan dinas kabupaten sehingga tidak perlu dijawab', 2, 'Membalas bahwa dinas tidak bertanggung jawab atas jalan itu dan meminta warga tidak salah alamat', 1, 'Membalas sopan, meneruskannya ke dinas provinsi, dan mengabarkan tindak lanjutnya', 5, 'Menyukai komentar itu sebagai tanda sudah dibaca tanpa memberikan tanggapan apa pun', 3, 'Membalas dengan menjelaskan kewenangan provinsi serta mencantumkan kanal pengaduan dinas provinsi agar warga melapor ke sana', 4, 'C (5): Menjelaskan dan menjembatani sampai tuntas; E (4): Informatif tetapi warga tetap harus melapor ulang; D (3): Sekadar formalitas tanpa solusi; A (2): Menutupi keluhan publik; B (1): Ketus dan menolak tanpa solusi.'),
  ('tkp-pelayanan', 'medium', 'Anda petugas pendaftaran puskesmas. Pagi itu sistem pendaftaran daring mengalami gangguan, padahal pasien sudah menumpuk di ruang tunggu. Anda …', 'Beralih ke pendaftaran manual sesuai prosedur darurat, mencatat data untuk diinput ulang, dan melaporkan gangguan ke pengelola sistem', 5, 'Menutup loket pendaftaran sementara sampai sistem pulih tanpa pengumuman', 1, 'Beralih ke pendaftaran manual dan mencatat data pasien agar tetap terlayani sampai sistem pulih', 4, 'Meminta pasien yang tidak darurat pulang dan datang lagi besok', 2, 'Melaporkan gangguan ke pengelola sistem lalu meminta pasien menunggu sampai sistem normal', 3, 'A (5): Layanan tetap berjalan, data terjaga, masalah dilaporkan; C (4): Layanan berjalan tetapi gangguan tidak dilaporkan; E (3): Melapor tetapi layanan terhenti; D (2): Menunda layanan dan merugikan pasien; B (1): Menghentikan layanan tanpa informasi.'),
  ('tkp-pelayanan', 'medium', 'Seorang pemohon izin usaha mengirim pesan ke nomor pribadi Anda, petugas DPMPTSP, meminta dibantu mempercepat proses sambil menawarkan "uang bensin". Anda …', 'Menerima uang tersebut karena nilainya kecil dan dianggap ucapan terima kasih', 1, 'Mengatakan akan membantu bila sempat, tanpa menyinggung tawaran uang tersebut', 2, 'Menolak dengan sopan, menegaskan izin diproses gratis sesuai antrean, dan menunjukkan cara memantau statusnya', 5, 'Menolak tawaran tersebut dengan tegas dan meminta pemohon menunggu prosesnya sesuai standar waktu layanan', 4, 'Tidak menanggapi pesan itu sama sekali dan memblokir nomornya, karena berkomunikasi lewat nomor pribadi dengan pemohon berisiko menimbulkan kecurigaan rekan kerja dan atasan', 3, 'C (5): Menolak gratifikasi dan tetap memberi solusi resmi; D (4): Berintegritas tetapi kurang informatif; E (3): Menghindari gratifikasi tetapi tanpa pelayanan; B (2): Membuka peluang gratifikasi; A (1): Menerima gratifikasi.'),
  ('tkp-pelayanan', 'hard', 'Anda kepala seksi pelayanan di kantor kecamatan. Hasil survei kepuasan masyarakat triwulan ini turun, dengan keluhan terbanyak tentang petugas yang sering meninggalkan loket. Anda …', 'Mengabaikan hasil survei karena menurut Anda survei semacam itu hanya formalitas dan tidak berpengaruh pada tunjangan kinerja', 1, 'Menganalisis data kehadiran bersama staf, lalu menyusun piket pengganti dan memantau hasilnya', 5, 'Menilai bahwa responden survei biasanya hanya warga yang kecewa sehingga hasilnya belum mencerminkan kondisi sebenarnya, lalu mengusulkan responden pilihan untuk survei berikutnya', 2, 'Melaporkan hasil survei itu kepada camat dan menunggu arahan tindak lanjut sebelum mengambil langkah apa pun di seksi Anda', 3, 'Menegur staf secara umum dalam rapat dan menegaskan bahwa loket tidak boleh kosong sedetik pun selama jam layanan', 4, 'B (5): Berbasis data, partisipatif, dan ada evaluasi; E (4): Tegas tetapi belum menyentuh akar masalah; D (3): Pasif sebagai atasan langsung; C (2): Menyangkal masukan dan berniat memanipulasi survei; A (1): Tidak peduli kualitas layanan.'),
  ('tkp-pelayanan', 'hard', 'Seorang warga negara asing yang tinggal di wilayah kerja puskesmas datang untuk vaksinasi anaknya. Ia tidak lancar berbahasa Indonesia, dan Anda belum yakin ketentuan layanan bagi warga asing. Anda …', 'Melayani dengan bahasa sederhana atau aplikasi penerjemah, sambil memastikan ketentuan bagi warga asing kepada koordinator', 5, 'Menyampaikan bahwa layanan puskesmas diprioritaskan bagi warga pemegang KTP setempat, sehingga ia sebaiknya mencari fasilitas lain yang terbiasa menangani pasien asing', 1, 'Menanyakan ketentuan kepada koordinator terlebih dahulu, lalu melayaninya sesuai jawaban yang diperoleh', 4, 'Memintanya kembali bersama penerjemah atau kenalan yang bisa berbahasa Indonesia', 3, 'Mengarahkannya ke rumah sakit swasta yang biasa melayani warga asing, karena di sana tersedia petugas yang lebih fasih berbahasa Inggris', 2, 'A (5): Melayani tanpa diskriminasi dan tetap sesuai aturan; C (4): Sesuai aturan tetapi warga menunggu lebih lama; D (3): Menunda layanan karena kendala bahasa; E (2): Mengalihkan tanpa dasar; B (1): Diskriminatif dan menolak layanan.'),
  ('tkp-pelayanan', 'medium', 'Seorang warga mengaku sudah tiga kali mengajukan perbaikan data melalui aplikasi kependudukan, tetapi selalu ditolak tanpa alasan yang jelas. Anda petugas Dukcapil. Anda …', 'Menjelaskan alasan penolakan, membantu perbaikannya, dan mengusulkan perbaikan aplikasi', 5, 'Membuka riwayat pengajuannya di sistem, menjelaskan alasan setiap penolakan secara rinci, dan membantunya melengkapi dokumen agar pengajuan berikutnya diterima', 4, 'Mengatakan bahwa penolakan merupakan keputusan sistem sehingga petugas tidak bisa membantu dalam bentuk apa pun terkait pengajuan daring tersebut', 1, 'Menyarankan warga membaca kembali panduan persyaratan di aplikasi sebelum mengajukan ulang, supaya ia memahami sendiri letak kesalahan pengajuannya', 3, 'Meminta warga mengajukan ulang saja karena mungkin penolakan terjadi akibat kesalahan sistem', 2, 'A (5): Tuntas dan memperbaiki sistem layanan; B (4): Tuntas untuk kasus ini tetapi akar masalah tidak disentuh; D (3): Normatif dan tidak membantu langsung; E (2): Menebak tanpa memeriksa; C (1): Lepas tangan.'),
  ('tkp-pelayanan', 'easy', 'Printer struk di loket samsat tempat Anda bertugas rusak saat seorang wajib pajak selesai membayar dan meminta bukti pembayaran. Anda …', 'Meminta wajib pajak kembali besok setelah printer diperbaiki untuk mengambil bukti, sambil mencatat nomor teleponnya agar dapat dikabari', 2, 'Mengarahkan wajib pajak ke loket sebelah yang printernya berfungsi untuk mencetak bukti pembayarannya', 4, 'Memfoto bukti dari layar komputer dengan ponsel pribadi lalu mengirimkannya ke WhatsApp wajib pajak, karena paling cepat walaupun bukan kanal resmi dan memuat data kendaraan', 3, 'Mencetak bukti di loket lain atau mengirim bukti elektronik lewat kanal resmi, lalu melaporkan kerusakan printer', 5, 'Mengatakan bukti pembayaran tidak penting karena data sudah tersimpan di sistem dan dapat dicek kapan saja oleh petugas', 1, 'D (5): Kebutuhan terpenuhi dan masalah dilaporkan; B (4): Solutif tetapi tanpa tindak lanjut kerusakan; C (3): Cepat tetapi mengabaikan kanal resmi dan keamanan data; A (2): Membebani warga; E (1): Mengabaikan hak warga atas bukti.'),
  ('tkp-pelayanan', 'medium', 'Kantor Anda menjalankan layanan jemput bola perekaman KTP-el ke desa-desa. Di satu desa, warga yang datang sangat banyak, sementara waktu yang dijadwalkan hampir habis. Anda …', 'Melayani sampai waktu habis lalu mengumumkan bahwa jadwal susulan akan diinformasikan lewat kepala desa', 4, 'Meminta ketua tim menambah waktu bila memungkinkan, dan mencatat warga yang belum terlayani untuk jadwal susulan yang pasti', 5, 'Mendahulukan perangkat desa dan keluarganya yang sudah menunggu, karena dukungan mereka penting bagi kelancaran jemput bola di desa berikutnya, sedangkan warga lain bisa ke kantor', 1, 'Melayani sesuai jadwal dan meminta warga yang belum terlayani datang ke kantor Dukcapil', 3, 'Mengakhiri layanan tepat waktu tanpa pengumuman agar jadwal desa berikutnya tidak terganggu', 2, 'B (5): Berupaya maksimal dan memberi kepastian; A (4): Tertib tetapi kepastian masih umum; D (3): Normatif dan memindahkan beban ke warga; E (2): Tidak memberi informasi kepada warga; C (1): Diskriminatif dan tidak adil.'),
  ('tkp-pelayanan', 'hard', 'Anda petugas layanan informasi publik. Seorang wartawan meminta salinan dokumen anggaran kegiatan dinas yang tercantum sebagai informasi terbuka, tetapi atasan sedang dinas luar dan Anda khawatir dokumen itu sensitif. Anda …', 'Menjelaskan bahwa permohonan diterima, tetapi dokumen baru diberikan setelah ada persetujuan tertulis kepala dinas sepulang dari tugas luar, berapa pun lamanya', 3, 'Menolak permohonan karena wartawan dianggap berpotensi memberitakan hal negatif tentang dinas', 1, 'Mencatat permohonan sesuai prosedur, lalu menunggu atasan kembali untuk memastikan dokumen itu boleh diberikan', 4, 'Menyarankan wartawan mencari data anggaran dari media lain atau situs pihak ketiga, karena menurut Anda data serupa biasanya sudah pernah dimuat media', 2, 'Memproses permohonan sesuai prosedur PPID dan memberikannya tepat waktu', 5, 'E (5): Patuh aturan keterbukaan informasi dan tepat waktu; C (4): Hati-hati tetapi berisiko melewati batas waktu; A (3): Menunda tanpa kepastian; D (2): Mengalihkan kewajiban instansi; B (1): Menutup informasi publik.'),
  ('tkp-jejaring', 'easy', 'Anda staf baru di dinas kesehatan dan diminta menghadiri rapat koordinasi dengan dinas sosial menggantikan atasan yang berhalangan. Anda …', 'Hadir tepat waktu, mencatat seluruh hasil rapat dengan lengkap, dan melaporkannya kepada atasan keesokan harinya', 4, 'Tidak hadir karena undangan itu ditujukan kepada atasan, bukan kepada Anda, sehingga kehadiran pengganti dianggap tidak diperlukan', 1, 'Hadir dan mengikuti rapat tanpa banyak berbicara karena Anda hanya pengganti', 3, 'Mempelajari bahan rapat sebelumnya, aktif mencatat dan berkenalan dengan peserta, lalu melapor kepada atasan', 5, 'Meminta rekan yang lebih senior saja yang berangkat, karena Anda belum mengenal pejabat dinas sosial dan khawatir salah menyampaikan sikap instansi dalam forum resmi tersebut', 2, 'D (5): Siap, membangun relasi, dan akuntabel; A (4): Bertanggung jawab tetapi kurang membangun jejaring; C (3): Pasif; E (2): Menghindari kesempatan berjejaring; B (1): Mengabaikan penugasan.'),
  ('tkp-jejaring', 'medium', 'Anda kepala subbagian. Dua staf Anda saling bersaing dan enggan berbagi data untuk laporan yang harus mereka susun bersama. Anda …', 'Mengajak keduanya berdiskusi, menegaskan tujuan bersama, dan membagi peran disertai folder data bersama', 5, 'Membiarkan persaingan itu karena menurut Anda kompetisi justru membuat masing-masing bekerja lebih keras, lalu menilai siapa yang lebih unggul pada akhir tahun', 1, 'Menetapkan pembagian tugas yang jelas dan meminta keduanya menyetor data kepada Anda untuk digabungkan', 4, 'Mengerjakan sendiri penggabungan laporan agar tidak terjadi keributan', 2, 'Menegur keduanya dalam rapat staf agar segera bekerja sama, dan mengingatkan bahwa laporan itu dinilai sebagai kinerja tim', 3, 'A (5): Membangun kolaborasi dan sistem kerja bersama; C (4): Pekerjaan selesai tetapi kerja sama tidak tumbuh; E (3): Tegas tetapi tanpa fasilitasi; D (2): Menghindari masalah; B (1): Memelihara konflik tim.'),
  ('tkp-jejaring', 'medium', 'Instansi mitra meminta data pegawai unit Anda, termasuk nomor telepon pribadi, untuk kegiatan bersama melalui pesan WhatsApp tanpa surat resmi. Anda …', 'Mengirimkan daftar nama dan jabatan tetapi menahan nomor telepon, sambil berjanji mengirimkan nomornya nanti setelah meminta izin satu per satu kepada pegawai lewat pesan', 3, 'Menanyakan keperluannya, meminta surat resmi, lalu menyiapkan data yang relevan saja setelah disetujui atasan', 5, 'Mengirimkan seluruh data termasuk nomor pribadi karena mitra sudah sering bekerja sama', 1, 'Meminta mitra mengirimkan surat permintaan resmi lebih dulu sebelum data pegawai apa pun diberikan', 4, 'Membalas bahwa Anda tidak berwenang tanpa memberi tahu siapa yang berwenang', 2, 'B (5): Kooperatif sekaligus melindungi data; D (4): Sesuai prosedur tetapi kurang proaktif; A (3): Berhati-hati sebagian tetapi tanpa dasar resmi; E (2): Menutup komunikasi; C (1): Melanggar perlindungan data pribadi.'),
  ('tkp-jejaring', 'easy', 'Anda tergabung dalam tim lintas bidang, dan rapat daring rutin tim sering molor karena tidak ada agenda yang jelas. Anda …', 'Mengusulkan dalam rapat agar setiap pertemuan dibuka dengan agenda yang disepakati bersama', 4, 'Mengikuti rapat seperti biasa sambil mengerjakan tugas lain karena rapat memang selalu lama', 3, 'Mengusulkan kepada ketua tim agar agenda dibagikan sehari sebelumnya, dan menawarkan diri menyusun notula serta tindak lanjut', 5, 'Sering mematikan kamera dan keluar rapat lebih awal', 1, 'Mengeluhkan rapat yang selalu molor kepada rekan satu bidang saat makan siang', 2, 'C (5): Proaktif memperbaiki kerja tim; A (4): Memberi usulan tanpa ikut mengambil peran; B (3): Tidak berkontribusi; E (2): Mengeluh tanpa solusi; D (1): Tidak menghargai tim.'),
  ('tkp-jejaring', 'hard', 'Anda koordinator program gizi di puskesmas. Para kader posyandu mengeluh bahwa data yang mereka kumpulkan setiap bulan tidak pernah kembali dalam bentuk informasi yang berguna bagi mereka. Anda …', 'Meminta kader tetap mengumpulkan data karena itu kewajiban program', 3, 'Berterima kasih atas kerja kader, menjelaskan bahwa data dipakai untuk laporan ke dinas kesehatan, dan berjanji mempertimbangkan keluhan mereka pada rapat berikutnya', 4, 'Menganggap keluhan itu tidak penting karena kader hanya relawan yang memang tidak memerlukan laporan balik dari pihak puskesmas', 1, 'Menyerahkan urusan keluhan kader kepada bidan desa masing-masing, karena bidan desalah yang setiap bulan bertemu langsung dengan para kader', 2, 'Menyajikan ringkasan data per posyandu secara berkala kepada kader dan meminta masukan mereka untuk tindak lanjut', 5, 'E (5): Kemitraan dua arah dengan kader; B (4): Menghargai tetapi belum memberi umpan balik nyata; A (3): Normatif dan satu arah; D (2): Melempar tanggung jawab; C (1): Meremehkan mitra.'),
  ('tkp-jejaring', 'medium', 'Anda guru di SMP negeri. Sekolah ingin mengadakan pemeriksaan kesehatan siswa, tetapi tidak memiliki tenaga medis. Anda …', 'Menghubungi puskesmas terdekat untuk menanyakan kemungkinan pemeriksaan kesehatan siswa di sekolah, lalu menyampaikan jawabannya kepada kepala sekolah', 4, 'Meminta orang tua memeriksakan anak masing-masing ke fasilitas kesehatan', 3, 'Mengusulkan kerja sama dengan puskesmas setempat melalui program UKS, lalu membantu menyiapkan jadwal dan data siswa', 5, 'Mengusulkan klinik swasta milik kenalan yang bersedia datang dengan biaya ringan yang dibebankan kepada orang tua siswa, supaya kegiatan cepat terlaksana', 2, 'Menganggap pemeriksaan kesehatan bukan urusan guru', 1, 'C (5): Memanfaatkan jejaring resmi dan ikut bekerja; A (4): Inisiatif berjejaring tetapi belum tuntas; B (3): Mengalihkan tanggung jawab; D (2): Berpotensi konflik kepentingan dan membebani orang tua; E (1): Tidak peduli.'),
  ('tkp-jejaring', 'hard', 'Anda ketua tim program di dinas sosial. Seorang mitra dari LSM mengkritik program dinas di forum publik dengan data yang sebagian benar dan sebagian keliru. Anda …', 'Membalas di forum yang sama dengan menunjukkan kelemahan program LSM tersebut, agar publik tahu mereka juga tidak lebih baik dan tidak berhak menilai kinerja dinas', 1, 'Menyampaikan klarifikasi resmi atas data yang keliru sambil terbuka mengakui bagian yang memang benar', 4, 'Melaporkan kritik itu kepada atasan dan menunggu arahan', 3, 'Tidak lagi mengundang LSM itu dalam kegiatan dinas berikutnya', 2, 'Menemui mitra itu untuk mengklarifikasi data, mengakui yang benar, dan mengajaknya ikut memperbaiki program', 5, 'E (5): Mengubah kritik menjadi kolaborasi; B (4): Terbuka tetapi hubungan kemitraan belum dibangun; C (3): Pasif; D (2): Memutus jejaring; A (1): Konfrontatif dan merusak hubungan.'),
  ('tkp-jejaring', 'medium', 'Kantor Anda dan BPS sama-sama membutuhkan data jumlah UMKM di kecamatan, dan masing-masing berencana melakukan survei sendiri. Anda staf perencana. Anda …', 'Melanjutkan survei sendiri sesuai anggaran yang sudah disetujui, lalu kelak membandingkan hasilnya dengan data BPS untuk melihat mana yang lebih akurat bagi perencanaan', 3, 'Mengusulkan kepada atasan survei bersama BPS atau memakai data yang sudah ada', 5, 'Menghubungi BPS untuk menanyakan apakah mereka sudah memiliki data UMKM yang bisa dipakai bersama', 4, 'Mengabaikan rencana BPS karena setiap instansi bekerja sendiri-sendiri sesuai tugas dan anggarannya masing-masing', 1, 'Menunggu hasil survei BPS lalu menyalin datanya tanpa koordinasi, karena hasilnya toh sama dan anggaran survei kantor bisa dialihkan ke kegiatan lain', 2, 'B (5): Efisien dan bersinergi; C (4): Berinisiatif tetapi belum melibatkan atasan; A (3): Bekerja sendiri dan boros sumber daya; E (2): Memanfaatkan tanpa etika kemitraan; D (1): Ego sektoral.'),
  ('tkp-jejaring', 'easy', 'Unit Anda ditunjuk sebagai lokasi uji coba aplikasi baru dari kementerian, dan Anda diminta menjadi penghubung dengan tim pengembang di pusat. Anda …', 'Meminta rekan lain yang lebih paham teknologi menjadi penghubung', 2, 'Menjadi penghubung yang responsif dan meneruskan setiap kendala pengguna kepada tim pusat', 4, 'Menerima penunjukan itu bila atasan mengizinkan, tetapi meminta tim pusat sendiri yang menghubungi para pengguna di unit', 3, 'Mempelajari aplikasinya, menghimpun masukan pengguna di unit, dan menyampaikannya rutin kepada tim pusat', 5, 'Menolak dengan alasan pekerjaan Anda banyak dan uji coba aplikasi pusat biasanya hanya formalitas, sehingga koordinasi dengan tim pengembang dianggap membuang waktu kerja unit', 1, 'D (5): Menjadi jembatan aktif dua arah; B (4): Kooperatif tetapi masih reaktif; C (3): Menerima setengah hati dan melempar koordinasi; A (2): Menghindari peran berjejaring; E (1): Menolak kerja sama dan meremehkan program.'),
  ('tkp-jejaring', 'hard', 'Anda staf dinas lingkungan hidup. Sebuah komunitas peduli sampah mengajak dinas berkolaborasi, padahal beberapa anggotanya pernah mengkritik dinas dengan keras di media sosial. Anda …', 'Menyambut ajakan itu, mengusulkan pertemuan untuk menyepakati tujuan dan peran, lalu melapor kepada atasan', 5, 'Menyarankan atasan menunda kerja sama sampai komunitas itu berhenti mengkritik dinas di media sosial, supaya kolaborasi tidak dimanfaatkan untuk mencari panggung', 2, 'Menolak ajakan karena komunitas itu dianggap lawan dinas yang selama ini hanya bisa mengkritik tanpa memberi solusi', 1, 'Meminta komunitas mengirim proposal resmi lalu menunggu tanggapan pimpinan', 3, 'Menyampaikan ajakan itu kepada atasan disertai catatan positif tentang manfaat kolaborasi bagi program dinas', 4, 'A (5): Terbuka terhadap mitra kritis dan terarah; E (4): Mendukung tetapi belum bergerak; D (3): Prosedural dan pasif; B (2): Mensyaratkan kerja sama pada berhentinya kritik; C (1): Menutup diri.'),
  ('tkp-jejaring', 'medium', 'Rekan dari kantor kelurahan sering meminta bantuan Anda, staf kecamatan, melalui pesan pribadi di luar jam kerja. Anda …', 'Membaca pesan tetapi baru membalas beberapa hari kemudian', 2, 'Membantu yang mendesak, lalu mengajaknya menyepakati kanal dan jam koordinasi kerja yang jelas', 5, 'Membantu bila memang mendesak dan meminta pertanyaan rutin dikirim pada jam kerja saja', 4, 'Memblokir nomor rekan tersebut agar tidak mengganggu', 1, 'Selalu membalas kapan pun pesan masuk walaupun sedang bersama keluarga, karena menurut Anda hubungan kerja harus dijaga dengan siapa saja meski mengorbankan waktu istirahat', 3, 'B (5): Menjaga hubungan dan menata koordinasi; C (4): Baik tetapi belum menjadi kesepakatan bersama; E (3): Kooperatif tetapi tidak sehat dan tidak berkelanjutan; A (2): Menghambat koordinasi; D (1): Memutus hubungan kerja.'),
  ('tkp-sosbud', 'easy', 'Kantor tempat Anda bertugas menetapkan bahwa setiap Kamis pegawai memakai pakaian adat daerah setempat. Anda berasal dari provinsi lain. Anda …', 'Tetap memakai seragam biasa dan menyampaikan kepada atasan bahwa aturan itu kurang adil bagi pegawai pendatang yang tidak memiliki ikatan budaya dengan daerah tempat bertugas', 1, 'Memakai pakaian adat daerah asal Anda karena sama-sama pakaian adat, sekaligus memperkenalkan budaya asal Anda kepada rekan-rekan', 3, 'Ikut memakai pakaian adat setempat dan mempelajari makna motifnya agar dapat menjelaskannya bila ditanya', 5, 'Memakai pakaian adat setempat setiap Kamis sesuai ketentuan yang ditetapkan kantor', 4, 'Memakai batik biasa karena pakaian adat setempat sulit didapat', 2, 'C (5): Menghargai dan mempelajari budaya setempat; D (4): Patuh tanpa usaha memahami; B (3): Kurang menyesuaikan diri; E (2): Mencari alasan; A (1): Menolak beradaptasi.'),
  ('tkp-sosbud', 'medium', 'Anda petugas imunisasi. Jadwal imunisasi di sebuah desa ternyata bertepatan dengan upacara adat besar sehingga hampir semua warga tidak bisa datang. Anda …', 'Tetap membuka layanan sesuai jadwal karena sudah ditetapkan dinas, sambil mencatat warga yang tidak datang agar dilaporkan sebagai cakupan yang belum tercapai bulan ini', 3, 'Membatalkan layanan bulan itu tanpa jadwal pengganti', 2, 'Mengusulkan jadwal pengganti kepada koordinator dan mengumumkannya melalui kantor desa', 4, 'Berkoordinasi dengan tokoh adat dan kepala desa untuk memindahkan jadwal ke hari lain dan mengumumkannya bersama', 5, 'Meminta warga mendahulukan imunisasi daripada upacara adat yang dianggap tidak penting, karena kesehatan anak jauh lebih utama dibanding kegiatan seremonial', 1, 'D (5): Menghormati adat sekaligus menjaga cakupan layanan; C (4): Solutif tetapi kurang melibatkan tokoh setempat; A (3): Kaku terhadap konteks budaya; B (2): Mengorbankan layanan; E (1): Merendahkan adat.'),
  ('tkp-sosbud', 'medium', 'Di kantor baru Anda, para pegawai biasa makan siang bersama dari wadah besar yang sama, kebiasaan yang belum biasa bagi Anda. Anda …', 'Ikut bergabung dan menyesuaikan diri sambil tetap menjaga kebersihan, karena itu cara mengenal rekan', 5, 'Menertawakan kebiasaan itu dan menceritakannya di media sosial pribadi sebagai kisah lucu dari kantor baru Anda', 1, 'Makan sendiri di ruangan sambil bekerja, lalu menjelaskan kepada rekan bahwa makan dari satu wadah kurang higienis dan sebaiknya ditinggalkan oleh kantor modern', 2, 'Ikut bergabung sesekali saat diajak dan berbincang akrab dengan rekan-rekan baru', 4, 'Bergabung di meja yang sama tetapi membawa bekal dan piring sendiri, sambil tetap mengobrol dan menjelaskan bahwa Anda belum terbiasa', 3, 'A (5): Beradaptasi dan membangun keakraban; D (4): Beradaptasi sebagian; E (3): Hadir tetapi menjaga jarak; C (2): Menilai budaya lain dari sudut pandang sendiri; B (1): Merendahkan budaya rekan.'),
  ('tkp-sosbud', 'hard', 'Anda kepala SD negeri di daerah yang memiliki tradisi anak ikut membantu orang tua saat panen, sehingga kehadiran siswa anjlok setiap musim panen. Anda …', 'Mencatat ketidakhadiran siswa dan melaporkannya ke dinas pendidikan', 3, 'Mengundang orang tua untuk sosialisasi pentingnya kehadiran di sekolah, sambil memberikan tugas rumah yang dapat dikerjakan anak di sela kegiatan membantu panen keluarga', 4, 'Berdialog dengan orang tua dan tokoh masyarakat, lalu menyesuaikan kalender kegiatan dan tugas susulan saat panen', 5, 'Memberikan sanksi pengurangan nilai bagi siswa yang tidak hadir, supaya orang tua jera dan anak-anak kembali hadir walaupun musim panen tiba', 2, 'Membiarkan karena tradisi itu sudah berlangsung lama dan sekolah tidak berhak mencampuri urusan keluarga siswa', 1, 'C (5): Menghargai tradisi sambil menjaga hak belajar anak; B (4): Peduli tetapi masih satu arah; A (3): Administratif tanpa solusi; D (2): Menghukum tanpa memahami konteks; E (1): Abai terhadap pendidikan anak.'),
  ('tkp-sosbud', 'easy', 'Seorang rekan kerja sering dipanggil dengan julukan berdasarkan suku asalnya oleh pegawai lain, dan ia tampak tidak nyaman. Anda …', 'Mengingatkan rekan-rekan yang menjuluki secara pribadi agar berhenti melakukannya, tanpa perlu menyinggungnya di depan banyak orang', 4, 'Ikut tertawa saat julukan disebut agar suasana tetap cair', 2, 'Memanggilnya dengan nama, lalu mengingatkan rekan-rekan secara santun bahwa julukan itu membuatnya tidak nyaman', 5, 'Ikut memanggilnya dengan julukan tersebut agar terlihat akrab', 1, 'Tidak ikut menjuluki, tetapi juga tidak menegur siapa pun karena menurut Anda julukan semacam itu sudah biasa di kantor dan lama-lama ia akan terbiasa sendiri', 3, 'C (5): Memberi teladan dan menghentikan perundungan; A (4): Menegur tetapi belum menjadi teladan terbuka; E (3): Netral tetapi membiarkan; B (2): Mendukung perundungan secara tidak langsung; D (1): Melakukan perundungan.'),
  ('tkp-sosbud', 'medium', 'Anda pendamping desa. Sebagian warga ingin menggelar sedekah laut tahunan dengan bantuan dana desa, sementara sebagian lain menolak karena alasan keyakinan. Anda …', 'Menjelaskan aturan penggunaan dana desa kepada kedua kelompok secara terbuka dan setara', 4, 'Menyarankan tradisi itu dihentikan diam-diam karena berpotensi memecah warga, tanpa membahasnya dalam musyawarah supaya tidak memicu perdebatan yang lebih panjang', 1, 'Menyerahkan keputusan sepenuhnya kepada kepala desa', 3, 'Mendukung kelompok yang jumlahnya lebih banyak agar keputusan cepat diambil', 2, 'Memfasilitasi musyawarah desa agar keputusan diambil bersama sesuai aturan dana desa dan menghormati semua pihak', 5, 'E (5): Inklusif, adil, dan sesuai aturan; A (4): Informatif tetapi belum memfasilitasi kesepakatan; C (3): Pasif; D (2): Memihak mayoritas; B (1): Mengabaikan aspirasi dan dialog.'),
  ('tkp-sosbud', 'hard', 'Anda petugas Dukcapil. Sepasang warga penghayat kepercayaan datang untuk mencatatkan perkawinan mereka, tetapi Anda belum pernah menangani kasus serupa. Anda …', 'Meminta mereka bertanya ke kantor urusan agama terlebih dahulu', 3, 'Menyambut mereka dengan hormat, menanyakan ketentuan pencatatannya kepada atasan, lalu menjelaskan persyaratannya secara lengkap', 5, 'Menyarankan mereka menikah menurut salah satu agama agar mudah dicatat', 2, 'Mencatat data dan kontak mereka, lalu berjanji menghubungi setelah mengecek ketentuannya', 4, 'Menolak karena perkawinan semacam itu dianggap tidak dikenal sistem', 1, 'B (5): Menghormati hak warga dan memastikan prosedur; D (4): Baik tetapi warga belum terlayani hari itu; A (3): Salah arah dan menunda; C (2): Tidak menghormati keyakinan warga; E (1): Diskriminatif.'),
  ('tkp-sosbud', 'medium', 'Anda guru kelas IV. Seorang siswa berkebutuhan khusus baru masuk ke kelas Anda, dan beberapa orang tua siswa lain menyatakan keberatan. Anda …', 'Menyerahkan penanganan keberatan orang tua kepada kepala sekolah, sementara Anda fokus mengajar seluruh siswa seperti biasa', 3, 'Menempatkan siswa itu di bangku paling belakang dengan tugas terpisah, supaya proses belajar siswa lain tidak terganggu dan keberatan orang tua mereda dengan sendirinya', 2, 'Menerima siswa itu dan menjelaskan kepada orang tua bahwa sekolah menyelenggarakan pendidikan inklusif', 4, 'Menyarankan orang tuanya memindahkan anak itu ke sekolah luar biasa agar orang tua siswa lain tidak lagi mengajukan keberatan', 1, 'Menerima siswa itu, menyesuaikan metode belajar, dan mengajak orang tua berdialog tentang pendidikan inklusif', 5, 'E (5): Inklusif dan membangun pemahaman; C (4): Inklusif tetapi belum menyesuaikan pembelajaran; A (3): Menghindar; B (2): Mengucilkan siswa; D (1): Menolak hak pendidikan inklusif.'),
  ('tkp-sosbud', 'easy', 'Di daerah tugas baru, Anda diundang menghadiri syukuran adat yang seluruh rangkaiannya memakai bahasa daerah yang tidak Anda pahami. Anda …', 'Hadir, mengikuti tata cara yang diperbolehkan, dan bertanya makna acara kepada warga dengan sopan', 5, 'Hadir dan duduk dengan sopan mengikuti acara sampai selesai', 4, 'Tidak hadir dengan alasan sedang banyak pekerjaan kantor', 2, 'Tidak hadir karena khawatir salah bersikap, lalu mengirim pesan kepada tuan rumah bahwa acara adat sebaiknya disertai terjemahan bahasa Indonesia agar pendatang dapat memahaminya', 1, 'Hadir sebentar untuk memenuhi undangan lalu pamit lebih awal', 3, 'A (5): Menghormati dan belajar budaya; B (4): Menghormati tanpa usaha memahami; E (3): Kurang menghargai undangan; C (2): Menghindar; D (1): Menuntut budaya setempat menyesuaikan diri.'),
  ('tkp-sosbud', 'hard', 'Rekan Anda yang lebih tua masih bekerja serba manual dan sering diejek staf muda sebagai "ketinggalan zaman" di grup percakapan kantor. Anda …', 'Tidak menanggapi ejekan di grup, tetapi secara pribadi menyarankan rekan senior mengikuti kursus komputer di luar jam kerja agar tidak lagi menjadi bahan ejekan staf muda', 3, 'Menegur ejekan itu secara santun dan menawarkan diri mendampingi rekan senior sambil belajar dari pengalamannya', 5, 'Ikut menambahkan stiker lucu pada ejekan tersebut', 1, 'Mengingatkan staf muda di grup agar menjaga sopan santun terhadap rekan senior, dan meminta admin grup mengingatkan aturan berkomunikasi', 4, 'Membiarkan saja karena menurut Anda itu hanya candaan antarrekan', 2, 'B (5): Menghargai lintas generasi dan saling belajar; D (4): Menegur tetapi tanpa dukungan nyata; A (3): Membebankan masalah kepada korban; E (2): Membiarkan perundungan; C (1): Ikut merendahkan.'),
  ('tkp-sosbud', 'medium', 'Anda penyuluh keluarga berencana. Warga di salah satu desa menolak program KB karena meyakini banyak anak membawa banyak rezeki. Anda …', 'Membagikan brosur program KB ke rumah-rumah warga desa tersebut', 3, 'Menyampaikan manfaat program KB dalam penyuluhan rutin dengan bahasa sederhana, disertai contoh kasus kesehatan ibu dan anak di desa itu', 4, 'Melaporkan kepada dinas bahwa warga desa itu sulit diajak maju karena pola pikir tradisional, dan mengusulkan target program dialihkan ke desa lain yang lebih terbuka', 2, 'Melibatkan tokoh masyarakat dan agama untuk menyampaikan manfaat kesehatan ibu dan anak secara santun', 5, 'Mengejek pandangan warga sebagai kuno dan tidak rasional di hadapan peserta penyuluhan supaya mereka segera sadar', 1, 'D (5): Pendekatan budaya yang empatik; B (4): Informatif tetapi belum peka konteks; A (3): Satu arah; C (2): Menyerah dan berprasangka; E (1): Merendahkan keyakinan warga.'),
  ('tkp-tik-dasar', 'easy', 'Anda memakai aplikasi kecerdasan artifisial untuk membantu menyusun draf surat edaran dinas. Anda …', 'Memasukkan data anggaran internal ke aplikasi agar drafnya lebih lengkap', 1, 'Menghindari aplikasi itu karena menganggap teknologi baru hanya merepotkan', 2, 'Memakainya sebatas draf tanpa memasukkan data rahasia, lalu memeriksa isi, dasar hukum, dan bahasanya', 5, 'Memakai draf dari aplikasi apa adanya karena hasilnya sudah rapi, dan hanya mengganti nama instansi serta tanggal sebelum menyerahkannya kepada atasan untuk ditandatangani', 3, 'Memeriksa ulang draf hasil aplikasi dengan teliti, termasuk ejaannya, sebelum diajukan ke atasan', 4, 'C (5): Memanfaatkan teknologi secara aman dan bertanggung jawab; E (4): Teliti tetapi belum memperhatikan keamanan data; D (3): Memanfaatkan teknologi tanpa verifikasi; B (2): Menolak adaptasi teknologi; A (1): Membocorkan data internal.'),
  ('tkp-tik-dasar', 'medium', 'Akun media sosial resmi kelurahan yang Anda kelola tiba-tiba mengunggah tautan judi daring. Kemungkinan besar akun tersebut diretas. Anda …', 'Menghapus unggahan tersebut, tetapi tidak mengganti kata sandi akun', 3, 'Menunggu tim TI dinas menangani karena Anda tidak paham keamanan siber, sambil memantau komentar warga yang mulai bertanya-tanya', 2, 'Segera mengamankan akun, menghapus unggahan, melapor ke atasan dan tim TI, lalu mengumumkan klarifikasi kepada warga', 5, 'Segera mengganti kata sandi akun, menghapus unggahan tersebut, dan melaporkannya kepada atasan', 4, 'Membiarkan unggahan dulu sambil mencari pelakunya karena menghapusnya bisa menghilangkan bukti, dan tidak memberi tahu atasan agar tidak dianggap lalai mengelola akun', 1, 'C (5): Cepat, tuntas, dan transparan; D (4): Tanggap tetapi tanpa klarifikasi publik; A (3): Menangani gejala saja; B (2): Pasif; E (1): Membiarkan kerugian publik dan menutupi insiden.'),
  ('tkp-tik-dasar', 'medium', 'Di meja layanan kantor Anda tertempel stiker kode QR untuk pembayaran retribusi yang tidak diketahui siapa pemasangnya. Anda …', 'Mengabaikannya karena urusan pembayaran bukan tugas Anda, melainkan tugas bagian keuangan yang sudah memiliki petugas sendiri', 1, 'Menempelkan kertas peringatan agar warga tidak memakai kode QR itu, tetapi membiarkan stikernya sebagai bukti sampai ada yang bertanggung jawab', 3, 'Melaporkan keberadaan stiker itu kepada atasan agar segera ditindaklanjuti oleh bagian keuangan', 4, 'Mencabut stiker itu, melapor kepada atasan dan pengelola keuangan, serta mengarahkan warga ke kanal pembayaran resmi', 5, 'Membiarkan stiker itu karena mungkin dipasang bagian keuangan sebagai uji coba pembayaran baru, lalu menanyakannya pada rapat bulanan berikutnya bila sempat', 2, 'D (5): Melindungi warga dan menindaklanjuti; C (4): Melapor tetapi risiko masih berjalan; B (3): Mencegah sebagian tanpa pelaporan; E (2): Lalai terhadap potensi penipuan; A (1): Tidak peduli.'),
  ('tkp-tik-dasar', 'hard', 'Atasan meminta Anda segera membuat formulir pendataan warga memakai layanan formulir gratis dari internet tanpa melalui unit TI. Data yang dikumpulkan berupa NIK dan nomor KK. Anda …', 'Membuat formulir dan membagikan tautan hasilnya ke grup warga agar transparan', 1, 'Membuat formulir seperti perintah atasan tanpa pengaturan tambahan', 3, 'Membuat formulir sesuai perintah dengan pengaturan akses terbatas, sambil menyampaikan secara lisan bahwa ke depan pendataan seperti ini sebaiknya dikoordinasikan dengan unit TI', 4, 'Menolak membuat formulir tanpa memberi penjelasan kepada atasan', 2, 'Menyampaikan risiko perlindungan data kepada atasan dan mengusulkan formulir dibuat bersama unit TI di platform resmi', 5, 'E (5): Mengamankan data dengan cara yang santun; C (4): Mengurangi risiko tetapi tetap memakai platform tidak resmi; B (3): Patuh tanpa mempertimbangkan risiko; D (2): Menolak tanpa komunikasi; A (1): Membocorkan data pribadi.'),
  ('tkp-tik-dasar', 'easy', 'Saat dinas luar, Anda perlu mengakses aplikasi keuangan instansi, sedangkan yang tersedia hanya Wi-Fi publik hotel. Anda …', 'Memakai data seluler pribadi atau VPN resmi kantor, lalu keluar dari aplikasi setelah pekerjaan selesai', 5, 'Meminta rekan di kantor masuk memakai akun Anda', 1, 'Memakai Wi-Fi hotel karena jaringannya sudah dilindungi kata sandi', 2, 'Memakai Wi-Fi hotel, lalu mengganti kata sandi aplikasi setelah kembali ke kantor', 3, 'Memakai koneksi data seluler pribadi untuk mengakses aplikasi keuangan', 4, 'A (5): Aman dan tetap produktif; E (4): Aman tetapi tanpa kebiasaan pengamanan lain; D (3): Berisiko walau ada upaya pemulihan; C (2): Mengabaikan risiko; B (1): Berbagi akun.'),
  ('tkp-tik-dasar', 'medium', 'Unit Anda menyimpan seluruh arsip surat dinas hanya di satu komputer tanpa cadangan. Anda …', 'Mencetak surat-surat penting dan menyimpannya di lemari arsip, karena menurut Anda dokumen kertas lebih aman dibanding file digital yang sewaktu-waktu bisa rusak atau hilang', 3, 'Membiarkannya karena selama ini komputer tersebut tidak pernah rusak', 2, 'Menyalin arsip ke akun penyimpanan pribadi agar bisa dibuka dari rumah', 1, 'Mengusulkan kepada atasan pencadangan di server atau penyimpanan awan resmi instansi, lalu membantu pemindahannya', 5, 'Membuat cadangan seluruh arsip secara berkala di diska eksternal milik kantor', 4, 'D (5): Solusi sistemis dan aman; E (4): Mengurangi risiko secara mandiri; A (3): Berupaya tetapi mundur dari digitalisasi; B (2): Abai terhadap risiko; C (1): Membawa arsip dinas ke ruang pribadi.'),
  ('tkp-tik-dasar', 'hard', 'Di grup warga beredar video kepala dinas Anda yang tampak mengucapkan pernyataan kontroversial, dan Anda menduga video itu hasil rekayasa digital. Anda staf humas dinas. Anda …', 'Menunggu instruksi resmi dari pimpinan sambil memantau seberapa luas video itu menyebar di berbagai grup warga', 3, 'Melapor ke atasan dan tim humas, memverifikasi keaslian video, lalu menyiapkan klarifikasi resmi berbasis bukti', 5, 'Membagikan ulang video itu ke beberapa grup lain sambil bertanya apakah benar atau palsu, supaya lebih banyak orang ikut menilai dan informasi sebenarnya cepat terungkap', 1, 'Melaporkan temuan itu kepada atasan agar klarifikasi resmi segera disiapkan oleh dinas', 4, 'Membalas di grup bahwa video itu pasti palsu tanpa bukti', 2, 'B (5): Cepat, terverifikasi, dan resmi; D (4): Tanggap tetapi belum membantu verifikasi; A (3): Pasif; E (2): Reaktif tanpa dasar; C (1): Memperluas penyebaran konten bermasalah.'),
  ('tkp-tik-dasar', 'medium', 'Dasbor kasus demam berdarah yang dikelola unit Anda menampilkan angka yang keliru akibat salah input, dan angka itu sudah dikutip media lokal. Anda …', 'Memperbaiki angka di dasbor diam-diam tanpa memberi tahu siapa pun, karena kesalahannya kecil dan media mungkin tidak memperhatikannya lagi', 3, 'Melapor ke atasan, memperbaiki data, mencatat kronologi, dan mendukung ralat resmi kepada publik', 5, 'Menyalahkan petugas input di depan rekan-rekan dan meminta ia sendiri yang menjelaskan kesalahan itu kepada wartawan', 1, 'Segera memperbaiki angka di dasbor, lalu melaporkan perbaikan itu kepada atasan', 4, 'Membiarkan angka itu sampai pembaruan bulan depan, karena perubahan mendadak bisa memancing pertanyaan wartawan dan membuat dinas terlihat tidak cermat mengelola data', 2, 'B (5): Akuntabel dan transparan; D (4): Bertanggung jawab tetapi tanpa ralat publik; A (3): Memperbaiki tetapi tidak transparan; E (2): Membiarkan informasi keliru beredar; C (1): Tidak etis dan tidak menyelesaikan.'),
  ('tkp-tik-dasar', 'easy', 'Anda melihat rekan kerja menempelkan kertas berisi kata sandi aplikasi kepegawaian di bingkai monitornya. Anda …', 'Menyampaikan hal itu kepada atasan tanpa menegurnya lebih dulu', 3, 'Mencatat kata sandi itu diam-diam untuk berjaga-jaga bila suatu saat Anda perlu membuka aplikasi tersebut ketika rekan tidak masuk kerja', 1, 'Mengingatkannya secara pribadi agar segera melepas kertas tersebut dari monitor', 4, 'Mengingatkannya secara pribadi tentang risikonya dan menunjukkan cara menyimpan kata sandi dengan aman', 5, 'Membiarkannya karena itu tanggung jawab masing-masing', 2, 'D (5): Peduli dan memberi solusi; C (4): Peduli tanpa solusi lanjutan; A (3): Melapor tanpa komunikasi langsung; E (2): Abai; B (1): Menyalahgunakan akses.'),
  ('tkp-tik-dasar', 'hard', 'Anda kepala seksi. Seorang staf merancang otomasi lembar kerja yang memangkas waktu rekap dari dua hari menjadi dua jam, tetapi belum diuji untuk semua kondisi data. Anda …', 'Mengapresiasi dan meminta staf menguji otomasi itu pada berbagai data sebelum dipakai', 4, 'Meminta staf tetap memakai cara lama karena sudah terbukti aman, dan menyimpan file otomasi itu sebagai cadangan bila suatu saat dibutuhkan', 2, 'Langsung menetapkan otomasi itu sebagai cara kerja baru seluruh unit mulai minggu depan, karena penghematan waktunya sangat besar dan kesalahan kecil bisa diperbaiki belakangan', 3, 'Mengklaim otomasi itu sebagai hasil kerja Anda di depan pimpinan, karena Andalah yang dulu meminta staf mempercepat proses rekap', 1, 'Mengapresiasi, meminta uji coba paralel dengan cara lama selama satu periode, lalu menetapkannya bila hasilnya cocok', 5, 'E (5): Mendukung inovasi dengan uji yang bertanggung jawab; A (4): Mendukung tetapi tanpa rencana penerapan; C (3): Antusias tetapi mengabaikan risiko; B (2): Menolak perbaikan; D (1): Tidak etis.'),
  ('tkp-tik-dasar', 'medium', 'Seorang warga meminta Anda mengirimkan salinan data pribadinya yang tersimpan di sistem kelurahan melalui surel. Anda …', 'Memverifikasi identitas pemohon, lalu mengirimkan data hanya ke alamat surel terdaftar atau melalui kanal resmi', 5, 'Mengirimkan data melalui grup WhatsApp kelurahan agar cepat', 1, 'Menolak permintaan karena menurut Anda data pribadi sama sekali tidak boleh dikirim lewat surel dalam kondisi apa pun, tanpa menjelaskan cara lain yang bisa ditempuh warga', 2, 'Mengirimkan data ke alamat surel yang disebutkan pemohon melalui telepon', 3, 'Meminta pemohon datang langsung dengan membawa KTP untuk mengambil salinan data', 4, 'A (5): Melayani sekaligus melindungi data; E (4): Aman tetapi kurang memanfaatkan layanan digital; D (3): Melayani tetapi tanpa verifikasi; C (2): Menolak tanpa solusi; B (1): Membocorkan data pribadi.'),
  ('tkp-profesional', 'easy', 'Anda menyusun laporan, tetapi data dari unit lain terlambat dikirim sehingga tenggat terancam. Anda …', 'Menunggu data datang lalu bekerja lembur untuk mengejar tenggat, tanpa memberi tahu siapa pun bahwa laporan berisiko terlambat', 3, 'Mengingatkan unit tersebut dan mengerjakan bagian laporan yang datanya sudah tersedia', 4, 'Menyerahkan laporan tepat waktu dengan bagian kosong dan catatan bahwa unit lain terlambat, sehingga atasan dapat menilai sendiri pihak mana yang perlu ditegur', 2, 'Menghubungi unit itu untuk memastikan waktu kirim, mengerjakan bagian lain dulu, dan melapor ke atasan bila berisiko', 5, 'Mengisi bagian yang kosong dengan perkiraan sendiri agar laporan tampak lengkap dan terkirim tepat waktu kepada atasan Anda', 1, 'D (5): Proaktif dan transparan; B (4): Proaktif tetapi tanpa komunikasi risiko; A (3): Reaktif; C (2): Menyalahkan pihak lain tanpa solusi; E (1): Memalsukan data.'),
  ('tkp-profesional', 'medium', 'Anda kepala seksi. Seorang staf berulang kali terlambat menyelesaikan tugas, dan rekan-rekannya mulai mengeluh. Anda …', 'Mengalihkan sebagian tugasnya kepada rekan lain agar pekerjaan selesai', 3, 'Membiarkannya karena menegur bisa merusak suasana, lalu memberi nilai kinerja yang sama dengan staf lain supaya tidak ada yang merasa diperlakukan berbeda di akhir tahun', 1, 'Menegurnya secara pribadi dan menetapkan tenggat yang lebih ketat untuk tugas berikutnya', 4, 'Menegurnya di depan rapat agar menjadi pelajaran bagi yang lain', 2, 'Berbicara empat mata untuk memahami penyebabnya, menyepakati target dan pendampingan, lalu memantau kemajuannya', 5, 'E (5): Membina secara adil dan terukur; C (4): Tegas tetapi belum mencari akar masalah; A (3): Menyelesaikan pekerjaan tetapi membebani yang lain; D (2): Mempermalukan staf; B (1): Tidak menjalankan peran atasan dan tidak objektif.'),
  ('tkp-profesional', 'medium', 'Anda menemukan bahwa laporan kajian yang Anda tulis tahun lalu memuat kesalahan perhitungan, padahal kini dipakai sebagai rujukan unit lain. Anda …', 'Melapor kepada atasan, menyiapkan ralat beserta perhitungan yang benar, dan memberi tahu unit yang memakainya', 5, 'Memperbaiki perhitungan di arsip tanpa pemberitahuan, karena kesalahannya tidak terlalu besar dan mengumumkannya hanya akan membuat unit lain meragukan seluruh kajian Anda', 3, 'Menyalahkan rekan yang dulu membantu mengolah data', 1, 'Melaporkan kesalahan itu kepada atasan dan memperbaiki laporannya hari itu juga', 4, 'Menunggu sampai ada pihak yang menanyakannya', 2, 'A (5): Jujur, bertanggung jawab, dan tuntas; D (4): Bertanggung jawab tetapi dampak belum ditangani; B (3): Memperbaiki tetapi tidak transparan; E (2): Menghindar; C (1): Melempar kesalahan.'),
  ('tkp-profesional', 'hard', 'Atasan menunjuk Anda memimpin tim proyek, dan salah satu anggotanya adalah senior yang tampak tidak senang dipimpin oleh pegawai yang lebih muda. Anda …', 'Meminta atasan memindahkan senior itu ke tim lain, supaya tim dapat bekerja tanpa gesekan dan target proyek tetap tercapai tepat waktu', 3, 'Menolak penugasan karena merasa tidak enak kepada senior yang lebih berpengalaman dan lebih lama bekerja di unit tersebut daripada Anda', 1, 'Menemui senior itu, meminta masukan berdasarkan pengalamannya, lalu menyepakati peran yang sesuai dengan keahliannya', 5, 'Tetap memimpin secara profesional, membagi tugas adil kepada seluruh anggota termasuk senior tersebut, dan menyelesaikan masalah hubungan kerja bila memang nanti muncul', 4, 'Membiarkan senior itu bekerja semaunya agar tidak terjadi gesekan', 2, 'C (5): Menghargai dan memimpin secara efektif; D (4): Profesional tetapi reaktif terhadap potensi konflik; A (3): Menghindari tantangan; E (2): Tidak menjalankan peran pemimpin; B (1): Menolak tanggung jawab.'),
  ('tkp-profesional', 'easy', 'Anda mendapat tugas yang sama sekali baru dan belum pernah Anda kerjakan sebelumnya. Anda …', 'Meminta atasan memberikan tugas itu kepada orang lain', 2, 'Mempelajari aturan dan contoh terkait, berkonsultasi dengan rekan berpengalaman, lalu menyusun rencana kerja', 5, 'Menunda tugas sampai atasan menyediakan pelatihan khusus, karena menurut Anda pegawai tidak seharusnya diberi tugas di luar kompetensi yang tercantum dalam uraian jabatannya', 1, 'Bertanya kepada rekan yang pernah mengerjakan tugas serupa, lalu segera mulai mengerjakan', 4, 'Mengerjakan sebisanya sesuai pemahaman sendiri lalu menyerahkan hasilnya, karena atasan pasti akan mengoreksi bila ada yang kurang', 3, 'B (5): Siap belajar dan terencana; D (4): Mau belajar tetapi kurang terencana; E (3): Seadanya; A (2): Menghindar; C (1): Menolak berkembang.'),
  ('tkp-profesional', 'medium', 'Kantor Anda menerapkan kerja dari rumah dua hari dalam seminggu. Pada hari tersebut, keluarga sering meminta bantuan urusan rumah tangga di jam kerja. Anda …', 'Mematikan ponsel kerja agar bisa fokus pada urusan keluarga selama jam kerja, lalu membalas semua pesan rekan pada sore hari', 1, 'Menyusun jadwal dan target harian, menjelaskan jam kerja kepada keluarga, serta tetap mudah dihubungi rekan', 5, 'Membantu keluarga sebentar-sebentar asalkan target harian tercapai, meskipun beberapa kali terlambat membalas pesan rekan kerja', 3, 'Membantu keluarga pada jam kerja lalu mengerjakan tugas kantor malam hari, karena yang penting hasilnya ada walaupun rekan sulit menghubungi Anda saat jam kerja', 2, 'Bekerja sesuai jam kantor dan menyelesaikan urusan rumah setelah jam kerja', 4, 'B (5): Disiplin dan komunikatif; E (4): Disiplin tetapi kurang mengomunikasikan; C (3): Longgar terhadap jam kerja; D (2): Mengabaikan koordinasi tim; A (1): Melalaikan tugas.'),
  ('tkp-profesional', 'hard', 'Anda bendahara pengeluaran. Kepala dinas meminta uang muka kegiatan segera dicairkan meskipun dokumennya belum lengkap, karena acaranya besok. Anda …', 'Mencairkan dana lalu menyusun dokumen pendukung sendiri belakangan', 1, 'Menunda tanpa penjelasan sampai kepala dinas lupa', 2, 'Menjelaskan dengan sopan bahwa pencairan hanya bisa dilakukan setelah dokumen lengkap', 4, 'Mencairkan dana dengan catatan tertulis bahwa dokumen akan dilengkapi setelah kegiatan, karena acaranya penting dan perintah datang langsung dari kepala dinas yang bertanggung jawab', 3, 'Menjelaskan syarat yang kurang, membantu panitia melengkapinya hari itu, lalu mencairkan setelah lengkap', 5, 'E (5): Patuh aturan dan solutif; C (4): Patuh tetapi kurang membantu; D (3): Tunduk pada tekanan dan melanggar prosedur; B (2): Tidak komunikatif; A (1): Melanggar aturan dan berisiko pemalsuan.'),
  ('tkp-profesional', 'medium', 'Anda menerima undangan rapat dari dua atasan berbeda pada jam yang sama. Anda …', 'Tidak menghadiri keduanya agar tidak dianggap memihak', 1, 'Menghadiri rapat yang undangannya lebih dulu diterima, lalu meminta notula rapat lainnya', 3, 'Menghadiri rapat atasan paling senior tanpa kabar ke yang lain', 2, 'Menghadiri rapat yang lebih penting dan memberi kabar kepada penyelenggara rapat lainnya', 4, 'Menyampaikan bentrok jadwal kepada kedua atasan dan mengusulkan prioritas, termasuk rekan yang dapat mewakili', 5, 'E (5): Komunikatif dan solutif; D (4): Tepat tetapi diputuskan sepihak; B (3): Mekanis; C (2): Tidak komunikatif; A (1): Menghindari tanggung jawab.'),
  ('tkp-profesional', 'easy', 'Anda diminta lembur untuk menyelesaikan laporan akhir tahun, padahal malam itu ada acara keluarga. Anda …', 'Menyelesaikan laporan sesuai kebutuhan, lalu menyesuaikan acara keluarga atau mengatur giliran lembur dengan tim', 5, 'Menolak lembur dan meninggalkan pekerjaan begitu saja', 1, 'Bersedia lembur tetapi meminta pulang lebih awal untuk acara keluarga, dan berjanji melanjutkan pekerjaan di rumah malam itu meskipun data yang diperlukan hanya tersedia di kantor', 3, 'Bersedia lembur dan memberi kabar kepada keluarga bahwa Anda tidak bisa hadir', 4, 'Mengatakan kepada atasan sedang sakit agar tidak perlu lembur', 2, 'A (5): Mengutamakan tugas dengan komunikasi; D (4): Bertanggung jawab; C (3): Kompromi yang tidak realistis; E (2): Tidak jujur; B (1): Tidak bertanggung jawab.'),
  ('tkp-profesional', 'hard', 'Anda auditor di inspektorat daerah. Hasil pemeriksaan menunjukkan kesalahan administrasi di unit yang dipimpin teman dekat Anda. Anda …', 'Meminta auditor lain di tim yang menuliskan temuan tersebut, tanpa menjelaskan kepada ketua tim alasan Anda menghindarinya', 3, 'Memberi tahu teman Anda lebih dulu agar ia sempat memperbaiki dokumen sebelum laporan diserahkan, sehingga temuan bisa dicatat sebagai temuan ringan yang sudah ditindaklanjuti', 2, 'Melaporkan temuan sesuai standar audit, dan sejak awal mengungkapkan kedekatan Anda kepada ketua tim', 5, 'Melaporkan temuan apa adanya sesuai standar audit tanpa mengubah apa pun', 4, 'Menghapus temuan itu dari laporan demi menjaga pertemanan', 1, 'C (5): Objektif dan transparan soal konflik kepentingan; D (4): Objektif tetapi konflik kepentingan tidak diungkap; A (3): Menghindar; B (2): Membocorkan hasil audit; E (1): Memanipulasi hasil audit.'),
  ('tkp-profesional', 'medium', 'Anda baru selesai mengikuti pelatihan kepemimpinan dan mendapat ilmu yang relevan untuk unit kerja. Setelah kembali, Anda …', 'Menyampaikan kepada rekan bahwa pelatihan itu hanya formalitas syarat kenaikan jabatan, sehingga materinya tidak perlu terlalu dipikirkan atau diterapkan dalam pekerjaan sehari-hari', 1, 'Menyimpan materi untuk dipakai sendiri bila diperlukan, karena rekan-rekan belum tentu tertarik pada materi kepemimpinan', 3, 'Kembali bekerja seperti biasa tanpa menerapkan apa pun', 2, 'Membagikan materi kepada rekan dan menerapkan rencana aksi perubahan yang disepakati bersama atasan', 5, 'Membagikan materi pelatihan kepada rekan di unit melalui forum internal', 4, 'D (5): Berbagi dan menerapkan; E (4): Berbagi tanpa penerapan; B (3): Tidak berbagi; C (2): Tidak ada perubahan; A (1): Sinis dan merusak semangat belajar.'),
  ('tkp-antiradikal', 'easy', 'Anda melihat rekan kerja memasang foto profil dengan simbol organisasi yang telah dinyatakan terlarang oleh pemerintah. Anda …', 'Mengingatkannya secara pribadi tentang status organisasi itu dan kewajiban ASN, lalu melapor bila ia tetap memakainya', 5, 'Mengingatkannya secara pribadi agar segera mengganti foto profil tersebut', 4, 'Membiarkannya dulu sambil memperhatikan unggahan-unggahannya yang lain selama beberapa minggu, untuk memastikan apakah ia memang mendukung organisasi itu atau sekadar ikut-ikutan', 3, 'Ikut memakai simbol itu karena dianggap sekadar tren', 1, 'Menyebarkan tangkapan layar foto itu ke grup kantor, agar rekan-rekan lain ikut menekannya untuk mengganti foto tersebut', 2, 'A (5): Mengingatkan dan menindaklanjuti lewat jalur resmi; B (4): Peduli tetapi tanpa tindak lanjut; C (3): Menunda sikap; E (2): Menggunjing, bukan melapor; D (1): Mendukung simbol terlarang.'),
  ('tkp-antiradikal', 'medium', 'Seorang warga bercadar datang ke loket kelurahan, lalu rekan Anda berbisik agar Anda waspada karena ia "pasti radikal". Anda …', 'Melayaninya, tetapi memeriksa berkasnya lebih teliti dari biasanya', 3, 'Melayaninya dengan ramah sesuai prosedur dan urutan antrean seperti warga lainnya', 4, 'Menolak melayani sebelum ia membuka cadarnya di depan semua petugas, lalu mencatat namanya untuk dilaporkan kepada aparat sebagai warga yang patut dicurigai', 1, 'Meminta rekan lain yang melayaninya agar Anda tidak repot', 2, 'Melayaninya dengan ramah sesuai prosedur seperti warga lain, lalu mengingatkan rekan agar tidak berprasangka', 5, 'E (5): Adil dan meluruskan prasangka; B (4): Adil tetapi prasangka rekan dibiarkan; A (3): Terpengaruh prasangka; D (2): Menghindar; C (1): Diskriminatif dan melanggar hak warga.'),
  ('tkp-antiradikal', 'medium', 'Anda guru BK di SMP negeri. Seorang siswa bercerita bahwa kenalan di gim daring sering mengajaknya bergabung ke grup yang menyebarkan kebencian terhadap kelompok tertentu. Anda …', 'Melarang siswa bermain gim daring sama sekali dan meminta orang tuanya menyita ponsel anak itu sampai akhir semester', 3, 'Memarahi siswa di depan kelas sebagai peringatan bagi teman-temannya', 1, 'Menganggap hal itu biasa di dunia gim daring dan menyarankan siswa tidak terlalu memikirkannya, asalkan ia tidak ikut menyebarkan pesan kebencian itu ke teman sekolah', 2, 'Mendengarkan tanpa menghakimi, menjelaskan bahaya ajakan itu, melibatkan orang tua, dan melaporkan akunnya', 5, 'Menasihati siswa agar keluar dari grup tersebut dan memblokir akun yang mengajaknya, lalu memantau perkembangannya dalam sesi konseling berikutnya', 4, 'D (5): Mendampingi dan mencegah secara menyeluruh; E (4): Mencegah tetapi belum melibatkan pihak lain; A (3): Reaktif dan tidak menyentuh akar masalah; C (2): Meremehkan bahaya; B (1): Mempermalukan siswa.'),
  ('tkp-antiradikal', 'hard', 'Anda pengurus kajian keagamaan rutin di kantor. Belakangan seorang penceramah menyampaikan bahwa ASN tidak wajib taat pada aturan negara karena aturan itu "buatan manusia". Anda …', 'Membiarkannya karena itu wilayah keyakinan pribadi peserta', 2, 'Membahasnya bersama pengurus dan pimpinan, mengganti penceramah dengan yang moderat, dan menjaga kajian tetap berjalan', 5, 'Berhenti menghadiri kajian tanpa menyampaikan apa pun, karena Anda merasa tidak berwenang menegur penceramah yang lebih paham agama', 3, 'Menyampaikan keberatan langsung kepada penceramah dan meminta materinya tidak lagi menyinggung soal ketaatan pada aturan negara, sambil tetap menjadwalkannya sebagai pengisi kajian', 4, 'Ikut menyebarkan rekaman ceramah itu kepada rekan-rekan', 1, 'B (5): Tegas, kolektif, dan tetap menghormati kegiatan keagamaan; D (4): Menegur tetapi risiko penyebaran tetap ada; C (3): Menghindar; A (2): Membiarkan paham anti-negara; E (1): Menyebarkan paham radikal.'),
  ('tkp-antiradikal', 'easy', 'Sebuah akun di grup kantor mengajak berdonasi untuk "perjuangan" tanpa kejelasan lembaga pengelola maupun penggunaan dananya. Anda …', 'Tidak berdonasi dan mengingatkan anggota grup agar berhati-hati terhadap ajakan itu, sambil menunggu apakah ada anggota lain yang bisa memastikan pengelolanya', 4, 'Tidak berdonasi tanpa memberi tanggapan di grup', 3, 'Berdonasi sedikit saja karena tujuannya terdengar mulia', 2, 'Berdonasi dan meneruskan ajakan itu ke grup keluarga, karena menurut Anda setiap ajakan berbuat baik layak didukung tanpa perlu banyak bertanya siapa pengelola dananya', 1, 'Tidak berdonasi, mengingatkan grup agar berdonasi lewat lembaga resmi, dan melapor ke admin bila mencurigakan', 5, 'E (5): Waspada dan melindungi rekan; A (4): Waspada tanpa tindak lanjut; B (3): Pasif; C (2): Berisiko mendanai kegiatan tidak jelas; D (1): Ikut menyebarkan dan mendanai.'),
  ('tkp-antiradikal', 'medium', 'Dalam rapat RT, seorang warga mengusulkan agar pendatang yang berbeda agama tidak boleh mengontrak rumah di lingkungan tersebut. Anda warga setempat sekaligus ASN. Anda …', 'Menolak usulan itu secara santun dan terbuka di dalam forum rapat', 4, 'Menyampaikan dengan santun bahwa usulan itu diskriminatif, lalu mengusulkan aturan lingkungan yang berlaku sama bagi semua', 5, 'Diam selama rapat agar tidak terjadi perdebatan, lalu setelahnya menyampaikan kepada ketua RT secara pribadi bahwa Anda kurang setuju tetapi tetap mengikuti keputusan bersama', 3, 'Mendukung usulan itu dan menambahkan larangan bagi suku tertentu', 1, 'Menyetujui usulan itu agar lingkungan tetap kompak', 2, 'B (5): Menolak diskriminasi dengan solusi; A (4): Tegas tetapi tanpa alternatif; C (3): Tidak bersikap di forum; E (2): Mendukung diskriminasi; D (1): Memperluas diskriminasi.'),
  ('tkp-antiradikal', 'hard', 'Anda staf kesbangpol kabupaten. Ada laporan bahwa sekelompok pemuda di sebuah desa mulai menutup diri dan mengkafirkan warga lain, walaupun belum ada tindakan kekerasan. Anda …', 'Melaporkan informasi itu kepada atasan dan meminta arahan untuk verifikasi lapangan', 4, 'Mencatat laporan dan menunggu bila ada kejadian lanjutan', 3, 'Berkoordinasi dengan tokoh agama, aparat desa, dan instansi terkait untuk dialog dan pemantauan setelah laporan diverifikasi', 5, 'Mengabaikan laporan karena belum ada kekerasan', 1, 'Meminta warga desa mengusir kelompok pemuda tersebut dari kampung', 2, 'C (5): Preventif, terverifikasi, dan dialogis; A (4): Tanggap tetapi belum bertindak; B (3): Reaktif; E (2): Memicu konflik; D (1): Abai terhadap tanda awal.'),
  ('tkp-antiradikal', 'medium', 'Seorang rekan sering membagikan video ceramah yang menyebut pemilu sebagai sistem haram ke grup percakapan kantor. Anda …', 'Ikut membagikan video itu karena banyak yang menyukainya dan menurut Anda setiap orang bebas menilai isi ceramah sendiri', 1, 'Keluar dari grup kantor supaya tidak terpapar konten serupa', 3, 'Menegurnya secara pribadi, mengajak berdiskusi dengan rujukan moderat, dan melapor ke atasan bila terus berulang', 5, 'Membalas setiap unggahannya dengan video tandingan dari tokoh lain di grup yang sama, supaya anggota grup bisa membandingkan sendiri pendapat mana yang menurut mereka paling benar', 2, 'Mengingatkannya secara pribadi agar tidak menyebarkan konten itu di grup kantor, dan menyarankan ia menyimpan pendapat pribadinya di luar urusan kerja', 4, 'C (5): Persuasif dan bertahap; E (4): Peduli tanpa tindak lanjut; B (3): Menghindar; D (2): Memperpanjang polemik di ruang kerja; A (1): Ikut menyebarkan.'),
  ('tkp-antiradikal', 'easy', 'Sekolah tempat Anda mengajar mendapat tawaran buku bacaan gratis dari lembaga yang tidak jelas, dan sebagian isinya merendahkan kelompok lain. Anda …', 'Menolak menerima buku-buku tersebut untuk koleksi perpustakaan sekolah', 4, 'Membagikan semua buku itu kepada siswa karena gratis', 1, 'Menerima buku itu tetapi menyimpannya di gudang tanpa dibagikan, supaya hubungan dengan lembaga pemberi tetap baik dan sekolah tidak dianggap menolak bantuan masyarakat', 3, 'Menyampaikannya kepada kepala sekolah, menolak buku itu, dan mengusulkan bacaan dari sumber resmi', 5, 'Menerima dan membagikan sebagian buku yang isinya tampak aman', 2, 'D (5): Mencegah dan memberi alternatif; A (4): Mencegah tanpa alternatif; C (3): Tidak tegas; E (2): Berisiko; B (1): Menyebarkan intoleransi.'),
  ('tkp-antiradikal', 'hard', 'Seorang mantan narapidana terorisme yang sudah bebas datang ke kelurahan untuk mengurus dokumen dan izin usaha, sementara sebagian warga menolak keberadaannya. Anda petugas kelurahan. Anda …', 'Melayani haknya sesuai prosedur, berkoordinasi dengan pembimbing kemasyarakatan, dan membuka dialog dengan warga', 5, 'Menunda pelayanannya sampai warga sekitar setuju', 2, 'Melayaninya tetapi menyarankan ia pindah ke daerah lain agar tidak ditolak warga, karena menurut Anda itu jalan terbaik bagi semua pihak', 3, 'Menolak melayaninya karena khawatir ia kembali ke jaringan lamanya, lalu mengumumkan statusnya di grup warga agar semua orang waspada terhadap keberadaannya di lingkungan itu', 1, 'Melayani pengurusan dokumennya sesuai prosedur dan antrean seperti warga lain', 4, 'A (5): Adil dan mendukung reintegrasi; E (4): Adil tetapi tanpa dukungan reintegrasi; C (3): Menyingkirkan secara halus; B (2): Mengabaikan hak warga; D (1): Diskriminatif dan memicu pengucilan.'),
  ('tkp-antiradikal', 'medium', 'Akun media sosial pribadi Anda diserang komentar kasar setelah Anda membagikan informasi resmi tentang kegiatan lintas agama di kantor. Anda …', 'Tetap tenang, tidak membalas dengan emosi, menjelaskan secara santun bila perlu, dan melaporkan komentar berisi ancaman', 5, 'Tidak membalas komentar negatif dan menyembunyikan komentar-komentar yang kasar', 4, 'Membalas setiap komentar dengan keras dan menantang penyerang berdebat terbuka, agar mereka tahu bahwa Anda tidak takut dan bangga membela kegiatan lintas agama tersebut', 2, 'Menghapus unggahan tersebut agar serangan berhenti, lalu menonaktifkan kolom komentar untuk sementara sampai suasana kembali tenang', 3, 'Ikut menyerang balik dengan menyindir keyakinan para penyerang', 1, 'A (5): Tenang, santun, dan tegas pada ancaman; B (4): Tenang tetapi ancaman tidak dilaporkan; D (3): Mundur dari sikap moderat; C (2): Emosional dan memperkeruh suasana; E (1): Membalas intoleransi dengan intoleransi.')
) as v(sub, diff, stem, a, pa, b, pb, c, pc, d, pd, e, pe, expl)
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
