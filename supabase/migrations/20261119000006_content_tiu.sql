-- SiapASN original TIU content: lessons and practice questions for all ten TIU sub-topics.
-- Written from scratch for SiapASN (not copied from any external source). Idempotent: safe to run repeatedly.
begin;

insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values
  ('tiu-analogi', 'Jenis-Jenis Hubungan dalam Analogi', 'tiu-analogi-jenis-hubungan', 'Mengenali tujuh pola hubungan kata yang paling sering keluar di soal analogi TIU.',
$md$
## Apa itu analogi verbal?

Soal analogi meminta Anda menemukan **pasangan kata yang hubungannya sama** dengan pasangan kata pada soal. Bentuk umumnya:

$$A : B = C : \ldots$$

Dibaca: "A berhubungan dengan B **sebagaimana** C berhubungan dengan …". Kuncinya bukan arti kata satu per satu, melainkan **jenis hubungan** antara dua kata pertama. Begitu jenis hubungannya tepat, jawaban biasanya langsung terlihat.

> **Tips ujian:** Jangan langsung melihat pilihan jawaban. Rumuskan dulu hubungan A dan B dalam kepala, baru cari pilihan yang cocok dengan rumusan itu.

## Tujuh jenis hubungan yang wajib dikuasai

| No | Jenis hubungan | Contoh | Rumusan hubungan |
| --- | --- | --- | --- |
| 1 | Sinonim (persamaan makna) | CERDAS : PANDAI | A bermakna sama dengan B |
| 2 | Antonim (lawan makna) | BOROS : HEMAT | A berlawanan dengan B |
| 3 | Fungsi / kegunaan | PISAU : MEMOTONG | A digunakan untuk B |
| 4 | Bagian – keseluruhan | LAYAR : TELEVISI | A adalah bagian dari B |
| 5 | Sebab – akibat | GEMPA : RETAK | A menyebabkan B |
| 6 | Pelaku – alat / tempat | NELAYAN : JALA | A menggunakan B dalam bekerja |
| 7 | Tingkatan / urutan | KUNCUP : MEKAR | A adalah tahap sebelum B |

Selain tujuh jenis itu, ada beberapa hubungan tambahan yang juga sering muncul:

- **Jenis – kelompok**: MELATI : BUNGA (melati termasuk jenis bunga).
- **Hasil – pembuat**: ROTI : TUKANG ROTI (roti dihasilkan oleh tukang roti).
- **Alat ukur – besaran**: TERMOMETER : SUHU.
- **Ciri khas**: GAJAH : BELALAI.

### 1. Sinonim

Dua kata memiliki arti yang sama atau sangat mirip. Kata-kata baku dan serapan sering diuji di sini.

- MAHIR : CAKAP
- SAHIH : VALID
- NIRLABA : TIDAK MENCARI UNTUNG

### 2. Antonim

Dua kata saling berlawanan. Perhatikan **antonim mutlak** (HIDUP : MATI) dan **antonim bertingkat** (PANAS : DINGIN, ada "hangat" di antaranya).

### 3. Fungsi

Pola "A dipakai untuk B". Kata kedua biasanya kata kerja: SAPU : MEMBERSIHKAN, KUNCI : MEMBUKA.

### 4. Bagian – keseluruhan

Pola "A adalah bagian dari B". Hati-hati dengan arah: RODA : SEPEDA (bagian : keseluruhan) **tidak sama** dengan SEPEDA : RODA (keseluruhan : bagian).

### 5. Sebab – akibat

Pola "A menyebabkan B": VIRUS : SAKIT, KEMARAU : KEKERINGAN. Arahnya juga penting: ASAP : API adalah akibat : sebab, terbalik dari API : ASAP.

### 6. Pelaku – alat / pelaku – tempat

- Pelaku – alat: PELUKIS : KUAS, PENJAHIT : JARUM.
- Pelaku – tempat kerja: HAKIM : PENGADILAN, PETANI : SAWAH.

### 7. Tingkatan

Hubungan berjenjang atau berurutan: DESA : KECAMATAN, DETIK : MENIT, SD : SMP.

## Contoh soal dan pembahasan

**Contoh 1.** NELAYAN : PERAHU = PILOT : …

1. Rumuskan hubungan: *nelayan bekerja dengan mengendarai perahu*.
2. Terapkan ke pilot: *pilot bekerja dengan mengendarai …* → **pesawat**.
3. Pilihan seperti "bandara" salah, karena bandara adalah *tempat*, bukan *kendaraan*.

**Contoh 2.** BIBIT : POHON = ANAK AYAM : …

1. Hubungan: *bibit adalah tahap muda yang tumbuh menjadi pohon* (tingkatan/perkembangan).
2. Terapkan: *anak ayam tumbuh menjadi …* → **ayam dewasa**.
3. Pilihan "telur" salah karena telur adalah tahap *sebelum* anak ayam — arahnya terbalik. Pilih tahap yang **searah** dengan soal.

**Contoh 3.** MELATI : BUNGA = KAKAKTUA : …

1. Hubungan: *melati adalah salah satu jenis bunga*.
2. Kakaktua adalah salah satu jenis → **burung**.

**Contoh 4.** GELAP : TERANG = SEMPIT : …

1. Hubungan antonim.
2. Lawan sempit adalah **luas** (atau lebar). Pilihan "kecil" bukan lawan, melainkan sinonim dekat.

## Jebakan yang sering muncul

- **Arah terbalik.** Soal API : ASAP tetapi pilihan berpola akibat : sebab.
- **Kategori kata berbeda.** Jika A dan B kata benda, jawaban yang ideal juga kata benda.
- **Hubungan terlalu umum.** "Sama-sama ada di rumah" bukan hubungan yang kuat. Cari hubungan paling spesifik.

## Ringkasan

- Analogi menguji **jenis hubungan**, bukan arti kata semata.
- Kuasai tujuh pola: sinonim, antonim, fungsi, bagian–keseluruhan, sebab–akibat, pelaku–alat/tempat, tingkatan.
- Perhatikan **arah hubungan** dan **kelas kata**.

## Tips cepat

1. Ucapkan hubungan A–B dalam satu kalimat pendek.
2. Ganti A dengan C dalam kalimat yang sama, lalu cari B yang pas.
3. Jika dua pilihan sama-sama cocok, buat kalimat penghubung yang **lebih spesifik**.
4. Coret pilihan yang hanya "berkaitan" tetapi tidak sama jenis hubungannya.
$md$,
   true, 2, 15),
  ('tiu-analogi', 'Teknik Kalimat Penghubung dan Analogi Pasangan Kata', 'tiu-analogi-kalimat-penghubung', 'Teknik menyusun kalimat penghubung untuk menjawab analogi satu kata maupun pasangan kata.',
$md$
## Mengapa kalimat penghubung ampuh?

Otak kita lebih mudah membandingkan **kalimat** daripada kata yang berdiri sendiri. Teknik kalimat penghubung (*bridge sentence*) mengubah pasangan kata menjadi kalimat, lalu kalimat itu dipakai sebagai "cetakan" untuk menguji setiap pilihan jawaban.

> **Tips ujian:** Kalimat penghubung yang baik memuat **kata kerja yang spesifik**. "Pisau berhubungan dengan memotong" terlalu lemah; "pisau **digunakan untuk** memotong" jauh lebih tajam.

## Langkah-langkah

1. **Baca pasangan soal**, misalnya PENA : MENULIS.
2. **Buat kalimat**: "Pena digunakan untuk menulis."
3. **Uji setiap pilihan** dengan mengganti kata dalam kalimat.
4. Jika lebih dari satu pilihan lolos, **pertajam kalimat** (tambahkan keterangan).
5. Pilih jawaban yang lolos kalimat paling tajam.

## Contoh pertajaman kalimat

Soal: PENJAHIT : JARUM = … : …

| Pilihan | Uji kalimat "X menggunakan Y" | Uji kalimat tajam "X menggunakan Y sebagai alat utama pekerjaannya" |
| --- | --- | --- |
| A. Petani : Sawah | lolos lemah (menggunakan sawah) | gagal — sawah adalah tempat |
| B. Pelukis : Kuas | lolos | **lolos** |
| C. Guru : Murid | gagal | gagal |
| D. Sopir : Penumpang | gagal | gagal |
| E. Dokter : Pasien | gagal | gagal |

Jawaban: **B**. Kalimat yang dipertajam langsung menyingkirkan pilihan A.

## Analogi pasangan kata

Bentuk kedua yang sering keluar: "Pasangan kata yang memiliki hubungan sama dengan X : Y adalah …". Kelima pilihan berupa pasangan kata. Tekniknya sama, hanya saja sekarang **kedua kata** dalam pilihan harus cocok.

**Contoh 1.** TERMOMETER : SUHU

- Kalimat: "Termometer adalah alat untuk **mengukur** suhu."
- BAROMETER : TEKANAN UDARA → "Barometer adalah alat untuk mengukur tekanan udara." ✔
- SPEEDOMETER : JARAK → speedometer mengukur kecepatan, bukan jarak. ✘
- PENGGARIS : KERTAS → penggaris tidak mengukur kertas sebagai besaran. ✘

**Contoh 2.** API : KEBAKARAN

- Kalimat: "Api **dapat menyebabkan** kebakaran." (sebab – akibat)
- ASAP : API → asap *disebabkan* api. Arah terbalik ✘.
- HUJAN DERAS : BANJIR → "Hujan deras dapat menyebabkan banjir." ✔

**Contoh 3 (dua rumpang).** … : HAUS = MAKAN : …

Bentuk ini menuntut kita mencari pasangan yang **sejajar**. Uji tiap pilihan:

- MINUM : LAPAR → "Minum menghilangkan haus, makan menghilangkan lapar." ✔
- AIR : NASI → "Air ... haus" masuk akal, tetapi "makan : nasi" bukan pola yang sama dengan "air : haus". ✘

## Pola hubungan dengan arah

Banyak soal menjebak lewat arah. Tabel berikut membantu:

| Pasangan | Arah | Pasangan yang setara | Pasangan yang terbalik |
| --- | --- | --- | --- |
| RODA : MOBIL | bagian → keseluruhan | DAUN : POHON | POHON : DAUN |
| GURU : SEKOLAH | pelaku → tempat | HAKIM : PENGADILAN | PENGADILAN : HAKIM |
| GEMPA : RETAK | sebab → akibat | VIRUS : DEMAM | DEMAM : VIRUS |
| DESA : KECAMATAN | kecil → besar | KABUPATEN : PROVINSI | PROVINSI : KABUPATEN |

## Latihan terbimbing

**Soal.** DOKTER : DIAGNOSIS = HAKIM : …

1. Kalimat: "Dokter **memberikan** diagnosis **sebagai keputusan profesionalnya**."
2. Hakim memberikan … sebagai keputusan profesionalnya → **vonis/putusan**.
3. Pilihan "pengadilan" adalah tempat; "terdakwa" adalah orang yang diadili; "palu" adalah alat. Semuanya gagal di kalimat yang tajam.

**Soal.** KEPOMPONG : KUPU-KUPU = BERUDU : …

1. Kalimat: "Kepompong adalah tahap muda yang **berkembang menjadi** kupu-kupu."
2. Berudu berkembang menjadi → **katak**.
3. "Kecebong" adalah sinonim berudu, bukan tahap berikutnya.

## Ringkasan

- Ubah pasangan kata menjadi **kalimat penghubung** dengan kata kerja spesifik.
- Uji setiap pilihan; jika lebih dari satu lolos, pertajam kalimatnya.
- Untuk pasangan kata, kedua kata pada pilihan harus memenuhi kalimat dengan **arah yang sama**.

## Tips cepat

- Kata kerja kunci: *digunakan untuk*, *bagian dari*, *menyebabkan*, *bekerja di*, *mengukur*, *berkembang menjadi*, *jenis dari*.
- Waspadai sinonim yang menyamar sebagai jawaban (berudu–kecebong).
- Batasi waktu ±45 detik per soal analogi; jangan terpaku pada satu soal.
$md$,
   false, 3, 14),
  ('tiu-silogisme', 'Silogisme Kategoris dan Diagram Venn', 'tiu-silogisme-kategoris-venn', 'Menarik kesimpulan dari premis ''semua'', ''sebagian'', dan ''tidak ada'' dengan bantuan diagram Venn.',
$md$
## Silogisme kategoris

Silogisme kategoris terdiri atas dua premis dan satu kesimpulan yang memakai **kuantor**:

| Kuantor | Bentuk | Arti |
| --- | --- | --- |
| Universal afirmatif | Semua A adalah B | Seluruh anggota A berada di dalam B |
| Universal negatif | Tidak ada A yang B | A dan B tidak beririsan sama sekali |
| Partikular afirmatif | Sebagian A adalah B | Paling sedikit ada satu A yang juga B |
| Partikular negatif | Sebagian A bukan B | Paling sedikit ada satu A yang tidak B |

Kata yang muncul di kedua premis disebut **term tengah** (*middle term*). Term tengah ini menghilang di kesimpulan.

## Pola-pola kesimpulan yang sah

| Premis 1 | Premis 2 | Kesimpulan sah |
| --- | --- | --- |
| Semua A adalah B | Semua C adalah A | Semua C adalah B |
| Semua A adalah B | Sebagian C adalah A | Sebagian C adalah B |
| Tidak ada A yang B | Semua C adalah A | Tidak ada C yang B |
| Tidak ada A yang B | Sebagian C adalah A | Sebagian C bukan B |
| Semua A adalah B | Tidak ada B yang C | Tidak ada A yang C |

> **Tips ujian:** Jika **kedua premis** memakai "sebagian", **tidak ada kesimpulan pasti**. Jika kedua premis negatif ("tidak ada"), juga tidak ada kesimpulan pasti.

## Menggambar diagram Venn

Gambarkan setiap himpunan sebagai lingkaran:

- "Semua A adalah B" → lingkaran A **di dalam** lingkaran B.
- "Tidak ada A yang B" → lingkaran A dan B **terpisah**.
- "Sebagian A adalah B" → lingkaran A dan B **beririsan**, dan irisannya pasti berisi anggota.

Contoh sketsa teks untuk "Semua kucing adalah mamalia":

```
+---------------------------+
|  MAMALIA                  |
|     +-----------+         |
|     |  KUCING   |         |
|     +-----------+         |
+---------------------------+
```

## Contoh 1 — Semua + semua

Premis 1: Semua mamalia bernapas dengan paru-paru.
Premis 2: Semua lumba-lumba adalah mamalia.

Langkah:

1. Term tengah: *mamalia*.
2. Lumba-lumba ⊂ mamalia ⊂ bernapas dengan paru-paru.
3. Kesimpulan: **Semua lumba-lumba bernapas dengan paru-paru.**

## Contoh 2 — Semua + sebagian

Premis 1: Semua pegawai teladan menerima piagam.
Premis 2: Sebagian pegawai bagian umum adalah pegawai teladan.

1. Ada anggota bagian umum yang masuk lingkaran "teladan".
2. Lingkaran "teladan" seluruhnya di dalam "menerima piagam".
3. Kesimpulan: **Sebagian pegawai bagian umum menerima piagam.**

Kesimpulan "Semua pegawai bagian umum menerima piagam" **tidak sah**, karena hanya sebagian yang teladan.

## Contoh 3 — Tidak ada + sebagian

Premis 1: Tidak ada peserta yang curang dinyatakan lulus.
Premis 2: Sebagian peserta gelombang II curang.

1. Lingkaran "curang" terpisah dari "lulus".
2. Sebagian gelombang II berada di lingkaran "curang", sehingga bagian itu **pasti di luar** "lulus".
3. Kesimpulan: **Sebagian peserta gelombang II tidak lulus.**

## Contoh 4 — Kesalahan term tengah tidak tersebar

Premis 1: Semua dokter berseragam putih.
Premis 2: Pak Arif berseragam putih.

Banyak orang menyimpulkan "Pak Arif dokter". Ini **salah**. Lingkaran "berseragam putih" lebih besar dari "dokter"; Pak Arif bisa berada di bagian "berseragam putih" yang bukan dokter (misalnya perawat atau koki). Kesimpulan yang benar: **tidak dapat dipastikan** Pak Arif dokter.

## Kesalahan logika yang sering dijadikan pengecoh

| Nama kesalahan | Contoh | Mengapa salah |
| --- | --- | --- |
| Konversi "semua" | Semua A adalah B ⇒ semua B adalah A | B bisa lebih luas dari A |
| Term tengah tidak tersebar | Semua A adalah B, X adalah B ⇒ X adalah A | X bisa B tanpa A |
| Generalisasi "sebagian" | Sebagian A adalah B ⇒ semua A adalah B | "Sebagian" tidak menjamin seluruhnya |
| Dua premis partikular | Sebagian A B, sebagian B C ⇒ sebagian A C | Irisan bisa berbeda |

## Ringkasan

- Kenali kuantor dan **term tengah**.
- Gunakan tabel pola sah atau diagram Venn.
- "Sebagian + sebagian" dan "negatif + negatif" tidak menghasilkan kesimpulan pasti.
- Kesimpulan selalu ikut premis **terlemah**: jika ada premis "sebagian", kesimpulan juga "sebagian"; jika ada premis negatif, kesimpulan juga negatif.

## Tips cepat

1. Tulis singkat: A ⊂ B, C ∩ A ≠ ∅, dan seterusnya.
2. Coret pilihan yang membalik arah "semua" (konversi).
3. Jika ragu, gambar dua-tiga lingkaran dalam 10 detik; diagram jarang berbohong.
$md$,
   true, 2, 16),
  ('tiu-silogisme', 'Implikasi, Negasi, dan Kontraposisi', 'tiu-silogisme-implikasi-negasi', 'Modus ponens, modus tollens, silogisme hipotetis, negasi kuantor dan pernyataan majemuk.',
$md$
## Implikasi "jika … maka …"

Implikasi ditulis $p \Rightarrow q$: "jika $p$, maka $q$". Implikasi hanya **salah** pada satu keadaan, yaitu ketika $p$ benar tetapi $q$ salah.

| $p$ | $q$ | $p \Rightarrow q$ |
| --- | --- | --- |
| B | B | B |
| B | S | **S** |
| S | B | B |
| S | S | B |

## Tiga pola penarikan kesimpulan yang sah

| Nama | Premis 1 | Premis 2 | Kesimpulan |
| --- | --- | --- | --- |
| Modus ponens | $p \Rightarrow q$ | $p$ | $q$ |
| Modus tollens | $p \Rightarrow q$ | $\neg q$ | $\neg p$ |
| Silogisme hipotetis | $p \Rightarrow q$ | $q \Rightarrow r$ | $p \Rightarrow r$ |

Dan dua pola **tidak sah** yang sering menjadi pengecoh:

- *Menegaskan konsekuen*: $p \Rightarrow q$, $q$, maka $p$. ✘
- *Menyangkal anteseden*: $p \Rightarrow q$, $\neg p$, maka $\neg q$. ✘

> **Tips ujian:** Hanya dua jalan aman: **maju** dari $p$ (ponens) atau **mundur** dari $\neg q$ (tollens). Selain itu, curigai.

## Konvers, invers, kontraposisi

Dari $p \Rightarrow q$:

| Nama | Bentuk | Setara dengan $p \Rightarrow q$? |
| --- | --- | --- |
| Konvers | $q \Rightarrow p$ | Tidak |
| Invers | $\neg p \Rightarrow \neg q$ | Tidak |
| Kontraposisi | $\neg q \Rightarrow \neg p$ | **Ya** |

Selain kontraposisi, $p \Rightarrow q$ juga setara dengan $\neg p \lor q$ ("tidak $p$ atau $q$").

## Negasi pernyataan majemuk

$$\neg(p \land q) \equiv \neg p \lor \neg q \qquad \neg(p \lor q) \equiv \neg p \land \neg q$$

$$\neg(p \Rightarrow q) \equiv p \land \neg q$$

| Pernyataan | Negasinya |
| --- | --- |
| Toko buka **dan** pembeli ramai | Toko tidak buka **atau** pembeli tidak ramai |
| Ia membawa payung **atau** jas hujan | Ia tidak membawa payung **dan** tidak membawa jas hujan |
| **Jika** hujan, **maka** jalan licin | Hujan **dan** jalan tidak licin |

## Negasi kuantor

| Pernyataan | Negasi |
| --- | --- |
| Semua A adalah B | **Ada/sebagian** A yang bukan B |
| Ada A yang B | **Tidak ada** A yang B (semua A bukan B) |
| Tidak ada A yang B | Ada A yang B |

Pengecoh paling populer: negasi "Semua peserta lulus" **bukan** "Semua peserta tidak lulus", melainkan "**Ada** peserta yang tidak lulus".

## Contoh soal bertahap

**Contoh 1 (modus tollens).**
Jika mesin dirawat, mesin awet. Mesin tidak awet.

- $p$: mesin dirawat, $q$: mesin awet. Diketahui $\neg q$.
- Kesimpulan: $\neg p$ → **mesin tidak dirawat**.

**Contoh 2 (rantai + tollens).**
Jika anggaran cair, proyek dimulai. Jika proyek dimulai, warga direkrut. Warga tidak direkrut.

1. Rantai: anggaran cair ⇒ warga direkrut.
2. Diketahui warga tidak direkrut ($\neg r$).
3. Modus tollens: **anggaran tidak cair**.

**Contoh 3 (disjungsi).**
Rapat diadakan di aula atau di ruang rapat. Rapat tidak diadakan di aula.

- Silogisme disjungtif: $p \lor q$, $\neg p$ ⇒ $q$.
- Kesimpulan: **rapat diadakan di ruang rapat**.

**Contoh 4 (ekuivalensi).**
Pernyataan yang setara dengan "Jika Tono lulus, ia mentraktir temannya":

- Kontraposisi: "Jika Tono tidak mentraktir temannya, ia tidak lulus."
- Bentuk disjungsi: "Tono tidak lulus atau ia mentraktir temannya."

Keduanya benar; "Jika Tono mentraktir, ia lulus" (konvers) salah.

## Ringkasan

- Pola sah: ponens, tollens, silogisme hipotetis, disjungtif.
- $p \Rightarrow q \equiv \neg q \Rightarrow \neg p \equiv \neg p \lor q$.
- Negasi: "dan" ↔ "atau" (De Morgan); negasi implikasi adalah "$p$ dan tidak $q$".
- Negasi "semua" adalah "ada yang tidak".

## Tips cepat

1. Tandai setiap kalimat dengan huruf $p$, $q$, $r$ agar tidak terjebak kata-kata panjang.
2. Untuk soal negasi, cari pilihan yang **mengubah kuantor/penghubung**, bukan sekadar menambah "tidak".
3. Jika pilihan berupa konvers atau invers, hampir pasti itu pengecoh.
$md$,
   false, 3, 16),
  ('tiu-analitis', 'Penalaran Urutan dan Posisi', 'tiu-analitis-urutan-posisi', 'Teknik tabel dan diagram untuk soal urutan antrean, tinggi badan, posisi duduk berjajar maupun melingkar.',
$md$
## Ciri soal analitis

Soal analitis memberi **sekumpulan syarat** lalu bertanya posisi, urutan, atau pernyataan yang *pasti benar*. Tidak ada rumus; yang dibutuhkan adalah **pencatatan yang rapi**.

> **Tips ujian:** Mulailah dari syarat yang **paling pasti** (misalnya "C duduk di kursi nomor 3"), baru syarat relatif ("A di sebelah kiri B"), lalu syarat negatif ("E tidak di ujung").

## Teknik 1 — Garis urutan

Untuk perbandingan seperti tinggi, umur, nilai, ubah setiap kalimat menjadi simbol "$>$".

**Contoh.** Ani lebih tinggi dari Budi. Citra lebih pendek dari Budi. Dedi lebih tinggi dari Ani. Eka lebih pendek dari Ani tetapi lebih tinggi dari Budi.

1. Ani > Budi
2. Budi > Citra
3. Dedi > Ani
4. Ani > Eka > Budi

Gabungkan: $\text{Dedi} > \text{Ani} > \text{Eka} > \text{Budi} > \text{Citra}$.

- Tertinggi: Dedi. Terpendek: Citra. Urutan ketiga tertinggi: **Eka**.

## Teknik 2 — Tabel kursi berjajar

**Contoh.** Lima orang A, B, C, D, E duduk berjajar di kursi 1–5 (dari kiri).

- C duduk di kursi 3.
- A tepat di sebelah kiri C.
- E tidak duduk di ujung.
- D tepat di sebelah kanan E.

| Langkah | 1 | 2 | 3 | 4 | 5 |
| --- | --- | --- | --- | --- | --- |
| C di kursi 3 | | | C | | |
| A tepat di kiri C | | A | C | | |
| E bukan ujung → sisa 4 | | A | C | E | |
| D kanan E | | A | C | E | D |
| Sisa | **B** | A | C | E | D |

## Teknik 3 — Duduk melingkar

Pada meja bundar, "kanan" dan "kiri" dilihat **dari orang yang duduk menghadap ke tengah meja**. Tetapkan satu orang sebagai patokan agar rotasi tidak membingungkan.

Untuk meja persegi dengan empat orang (satu di tiap sisi), pasangan yang **berhadapan** hanya ada dua. Jika A berhadapan dengan C, otomatis B berhadapan dengan D.

```
        A
   D         B
        C
```

## Teknik 4 — Bangunan bertingkat / antrean

Antrean dan lantai gedung pada dasarnya garis urutan vertikal. Tuliskan nomor lantai sebagai kolom tabel.

**Contoh.** Kantor A, B, C, D, E menempati lantai 1–5. B di lantai teratas, D tepat di bawah B, E di lantai 1, A lebih rendah dari C.

- Lantai 5 = B, lantai 4 = D, lantai 1 = E.
- Sisa lantai 2 dan 3 untuk A dan C, dengan A < C → **A = 2, C = 3**.

## Soal "pasti benar" vs "mungkin benar"

Kadang syarat tidak cukup untuk menentukan posisi seluruhnya. Maka pertanyaannya menjadi "pernyataan yang **pasti** benar".

- **Pasti benar**: benar pada **semua** susunan yang memenuhi syarat.
- **Mungkin benar**: benar pada **setidaknya satu** susunan.

Strategi: daftar semua kemungkinan susunan (biasanya hanya 2–4), lalu uji setiap pilihan.

## Contoh lengkap dengan beberapa kemungkinan

Lima kendaraan diparkir di petak 1–5: bus di petak 1 atau 5; motor di petak 3; van tidak bersebelahan dengan motor.

1. Van tidak boleh di 2, 3, atau 4 → van di **1 atau 5**.
2. Bus juga di 1 atau 5 → bus dan van menempati kedua ujung.
3. Dua kendaraan lain di petak 2 dan 4.

Pernyataan "Van berada di salah satu ujung" **pasti benar**; "Bus di petak 1" hanya *mungkin* benar.

## Ringkasan

- Ubah kalimat menjadi simbol (>, posisi, tabel).
- Isi dari syarat yang **paling pasti** ke yang paling longgar.
- Bedakan "pasti" dan "mungkin" dengan memeriksa semua susunan.

## Tips cepat

- Gunakan huruf awal nama agar cepat dicatat.
- Untuk "tepat di sebelah", posisinya **bersebelahan langsung**; "di sebelah kiri" tanpa "tepat" bisa berjarak.
- Bila sudah ada kontradiksi, berarti salah satu asumsi Anda keliru — kembali ke cabang lain.
$md$,
   true, 2, 15),
  ('tiu-analitis', 'Soal Jadwal, Pencocokan, dan Tabel Kebenaran', 'tiu-analitis-jadwal-kebenaran', 'Menyelesaikan soal penjadwalan, pencocokan atribut, dan teka-teki siapa yang jujur dengan tabel.',
$md$
## Soal jadwal

Soal jadwal menempatkan beberapa kegiatan ke dalam hari/jam dengan syarat tertentu. Teknik yang paling efektif adalah **tabel slot**.

**Contoh 1.** Lima pelatihan K, L, M, N, O dijadwalkan Senin–Jumat, satu per hari.

- M pada hari Rabu.
- O pada hari Jumat.
- K dilaksanakan sebelum M, tetapi tidak pada hari Senin.
- L dilaksanakan setelah N.

| Sen | Sel | Rab | Kam | Jum |
| --- | --- | --- | --- | --- |
| | | M | | O |
| | K | M | | O |
| N | K | M | L | O |

Langkah: K harus sebelum Rabu dan bukan Senin → Selasa. Senin dan Kamis tersisa untuk N dan L; karena L setelah N, maka N Senin, L Kamis.

> **Tips ujian:** Isi slot yang **dikunci** terlebih dahulu, lalu syarat "sebelum/sesudah", terakhir syarat "tidak".

## Soal pencocokan (matriks atribut)

Ketika beberapa orang dipasangkan dengan beberapa atribut (hobi, kota, pekerjaan), gunakan **matriks centang-silang**.

**Contoh 2.** Dian, Eko, dan Fani masing-masing punya satu hobi berbeda: renang, catur, melukis. Dian tidak suka renang maupun catur. Eko tidak suka renang.

| | Renang | Catur | Melukis |
| --- | --- | --- | --- |
| Dian | ✘ | ✘ | **✔** |
| Eko | ✘ | **✔** | ✘ |
| Fani | **✔** | ✘ | ✘ |

Setiap baris dan kolom hanya boleh punya satu ✔. Begitu Dian melukis, kolom melukis yang lain disilang; Eko tinggal catur; Fani renang.

## Teka-teki kejujuran (tabel kebenaran sederhana)

Bentuk: beberapa orang membuat pernyataan; diketahui **tepat satu** (atau tepat dua) yang jujur. Siapa pelakunya?

**Strategi:** andaikan tiap kemungkinan pelaku satu per satu, hitung berapa pernyataan yang benar.

**Contoh 3.** Satu dari Ari, Beni, Cici memecahkan gelas.

- Ari: "Beni pelakunya."
- Beni: "Bukan saya."
- Cici: "Bukan saya."

Hanya satu pernyataan yang benar.

| Andaikan pelaku | Ari | Beni | Cici | Jumlah benar |
| --- | --- | --- | --- | --- |
| Ari | S | B | B | 2 |
| Beni | B | S | B | 2 |
| Cici | S | B | S | **1** |

Hanya pengandaian "Cici" yang menghasilkan tepat satu pernyataan benar, jadi pelakunya **Cici**.

## Rantai syarat "jika … maka …"

**Contoh 4.** Jika Lia ikut, Mira ikut. Jika Mira ikut, Nina tidak ikut. Ternyata Nina ikut.

1. Nina ikut → dari kontraposisi syarat kedua: Mira **tidak** ikut.
2. Mira tidak ikut → dari kontraposisi syarat pertama: Lia **tidak** ikut.

## Menghitung hari

Soal analitis kadang memuat kalender. Gunakan sisa bagi 7:

$$\text{hari ke-}n \text{ setelah hari ini} = \text{hari ini} + (n \bmod 7)$$

**Contoh 5.** Hari ini Rabu. 100 hari lagi?
$100 = 14 \times 7 + 2$, sisa 2 → Rabu + 2 = **Jumat**.

## Latihan tambahan

**Contoh 6 (pencocokan tempat tugas).** Rani, Sigit, dan Tari ditempatkan di Medan, Solo, dan Ambon (satu orang satu kota). Sigit tidak ditempatkan di Medan maupun Solo. Rani tidak ditempatkan di Medan.

| | Medan | Solo | Ambon |
| --- | --- | --- | --- |
| Rani | ✘ | **✔** | ✘ |
| Sigit | ✘ | ✘ | **✔** |
| Tari | **✔** | ✘ | ✘ |

Sigit langsung terkunci di Ambon. Rani bukan Medan dan Ambon sudah terisi, jadi Rani di Solo. Tari mendapat Medan.

**Contoh 7 (pernyataan tentang pernyataan).** Satu dari Doni, Edo, atau Fajar mengambil kue.

- Doni: "Edo yang mengambil."
- Edo: "Doni berbohong."
- Fajar: "Bukan saya yang mengambil."

Diketahui **tepat satu** pernyataan benar.

| Andaikan pelaku | Doni | Edo | Fajar | Jumlah benar |
| --- | --- | --- | --- | --- |
| Doni | S | B | B | 2 |
| Edo | B | S | B | 2 |
| Fajar | S | B | S | **1** |

Perhatikan bahwa pernyataan Edo selalu bernilai **kebalikan** dari pernyataan Doni. Karena itu, salah satu dari mereka pasti benar, sehingga pernyataan Fajar harus salah — Fajar pelakunya.

## Ringkasan

- Jadwal → tabel slot; pencocokan → matriks ✔/✘.
- Kejujuran → uji setiap kemungkinan dan hitung pernyataan benar.
- Rantai implikasi → gunakan kontraposisi untuk "mundur".
- Kalender → sisa pembagian 7.

## Tips cepat

1. Jangan menyimpan syarat di kepala; tulis semuanya di kertas buram.
2. Dalam soal kejujuran, mulailah dari pernyataan yang saling bertentangan — salah satunya pasti benar.
3. Periksa kembali jawaban akhir terhadap **semua** syarat sebelum mengklik.
$md$,
   false, 3, 16),
  ('tiu-berhitung', 'Pecahan, Desimal, dan Persen', 'tiu-berhitung-pecahan-persen', 'Operasi pecahan, desimal dan persen beserta tabel konversi yang wajib dihafal.',
$md$
## Tiga wajah bilangan yang sama

Dalam soal berhitung, satu bilangan bisa muncul sebagai **pecahan**, **desimal**, atau **persen**. Kemampuan berpindah bentuk dengan cepat adalah kunci menghemat waktu.

| Pecahan | Desimal | Persen |
| --- | --- | --- |
| $\frac{1}{2}$ | 0,5 | 50% |
| $\frac{1}{3}$ | 0,333… | 33,33% |
| $\frac{1}{4}$ | 0,25 | 25% |
| $\frac{1}{5}$ | 0,2 | 20% |
| $\frac{1}{6}$ | 0,1666… | 16,67% |
| $\frac{1}{8}$ | 0,125 | 12,5% |
| $\frac{3}{8}$ | 0,375 | 37,5% |
| $\frac{1}{12}$ | 0,0833… | 8,33% |
| $\frac{1}{16}$ | 0,0625 | 6,25% |

> **Tips ujian:** Hafalkan kelipatan $\frac{1}{8}$: 12,5% – 25% – 37,5% – 50% – 62,5% – 75% – 87,5%. Angka-angka ini sangat sering muncul.

## Operasi pecahan

### Penjumlahan dan pengurangan

Samakan penyebut dengan KPK:

$$\frac{3}{4} + \frac{5}{6} - \frac{2}{3} = \frac{9}{12} + \frac{10}{12} - \frac{8}{12} = \frac{11}{12}$$

### Perkalian dan pembagian

$$\frac{a}{b} \times \frac{c}{d} = \frac{ac}{bd} \qquad \frac{a}{b} \div \frac{c}{d} = \frac{a}{b} \times \frac{d}{c}$$

Sederhanakan **sebelum** mengalikan (coret silang) agar angka tetap kecil:

$$\frac{4}{5} \times \frac{3}{8} \times 960 = \frac{4 \times 3 \times 960}{5 \times 8} = \frac{3 \times 960}{10} = 288$$

## Operasi desimal

- **Perkalian**: kalikan seperti bilangan bulat, lalu jumlah angka di belakang koma = jumlah angka di belakang koma kedua faktor. $0{,}75 \times 64 = 48{,}00$.
- **Pembagian**: geser koma pada pembagi dan yang dibagi sejauh sama. $1{,}25 \div 0{,}05 = 125 \div 5 = 25$.

## Persen

$$p\% \text{ dari } N = \frac{p}{100} \times N$$

Trik **tukar posisi**: $p\%$ dari $N$ sama dengan $N\%$ dari $p$.
Contoh: 16% dari 25 = 25% dari 16 = **4**.

### Persen dari persen

Persen yang bertumpuk dikalikan, **bukan dijumlahkan**:

$$20\% \text{ lalu } 10\% \text{ diskon} \Rightarrow 0{,}8 \times 0{,}9 = 0{,}72 \Rightarrow \text{diskon total } 28\%$$

### Persen perubahan

$$\text{persen perubahan} = \frac{\text{nilai baru} - \text{nilai lama}}{\text{nilai lama}} \times 100\%$$

## Contoh soal bertahap

**Contoh 1.** 25% dari 480 + $\frac{1}{3}$ dari 270 = …

1. 25% dari 480 = $\frac{480}{4}$ = 120.
2. $\frac{1}{3}$ dari 270 = 90.
3. Jumlah = **210**.

**Contoh 2.** $(\frac{1}{2} + \frac{1}{3}) \div (\frac{1}{2} - \frac{1}{3})$ = …

1. Pembilang: $\frac{3}{6} + \frac{2}{6} = \frac{5}{6}$.
2. Penyebut: $\frac{3}{6} - \frac{2}{6} = \frac{1}{6}$.
3. Hasil: $\frac{5}{6} \div \frac{1}{6} = 5$.

**Contoh 3.** 0,2% dari 15.000 = …

$\frac{0{,}2}{100} \times 15.000 = 0{,}2 \times 150 = 30$.

**Contoh 4.** 12,5% dari 64 sama dengan berapa persen dari 32?

1. 12,5% dari 64 = $\frac{64}{8}$ = 8.
2. $\frac{8}{32} \times 100\% = 25\%$.

## Pecahan campuran dan membandingkan pecahan

### Pecahan campuran

Ubah dulu menjadi pecahan biasa:

$$2\tfrac{1}{4} \times 1\tfrac{1}{3} = \frac{9}{4} \times \frac{4}{3} = \frac{9}{3} = 3$$

### Membandingkan pecahan

Gunakan **perkalian silang**: $\frac{a}{b} > \frac{c}{d}$ jika $a \times d > b \times c$ (untuk penyebut positif).

**Contoh 5.** Urutkan $\frac{3}{5}$, $\frac{5}{8}$, $\frac{7}{12}$ dari yang terkecil.

| Pecahan | Desimal |
| --- | --- |
| $\frac{3}{5}$ | 0,6 |
| $\frac{5}{8}$ | 0,625 |
| $\frac{7}{12}$ | 0,583… |

Urutan: $\frac{7}{12} < \frac{3}{5} < \frac{5}{8}$.

Cek dengan perkalian silang: $\frac{3}{5}$ vs $\frac{5}{8}$ → $3 \times 8 = 24 < 5 \times 5 = 25$, jadi $\frac{3}{5} < \frac{5}{8}$ ✔.

## Ringkasan

- Hafalkan tabel konversi pecahan–desimal–persen.
- Samakan penyebut untuk penjumlahan; balik pecahan untuk pembagian.
- Diskon/kenaikan berurutan **dikalikan**.
- Trik tukar posisi: $a\%$ dari $b$ = $b\%$ dari $a$.

## Tips cepat

1. Ubah persen "jelek" menjadi pecahan cantik: 37,5% = $\frac{3}{8}$.
2. Saat membagi desimal, hilangkan koma dengan mengalikan keduanya dengan 10, 100, dst.
3. Periksa jawaban dengan estimasi kasar: apakah hasilnya masuk akal?
$md$,
   true, 2, 15),
  ('tiu-berhitung', 'Akar, Pangkat, dan Trik Hitung Cepat', 'tiu-berhitung-akar-pangkat-trik', 'Sifat pangkat dan akar, perkalian istimewa, serta teknik estimasi untuk menghemat waktu.',
$md$
## Sifat-sifat pangkat

| Sifat | Rumus | Contoh |
| --- | --- | --- |
| Perkalian basis sama | $a^m \cdot a^n = a^{m+n}$ | $2^5 \cdot 2^3 = 2^8$ |
| Pembagian basis sama | $a^m \div a^n = a^{m-n}$ | $2^8 \div 2^4 = 2^4 = 16$ |
| Pangkat dari pangkat | $(a^m)^n = a^{mn}$ | $(3^2)^3 = 3^6 = 729$ |
| Pangkat nol | $a^0 = 1$ | $7^0 = 1$ |
| Pangkat negatif | $a^{-n} = \frac{1}{a^n}$ | $2^{-3} = \frac{1}{8}$ |
| Pangkat pecahan | $a^{m/n} = \sqrt[n]{a^m}$ | $8^{2/3} = 4$ |

**Contoh.** $2^{10} - 2^9 - 2^8$

Faktorkan $2^8$: $2^8(2^2 - 2 - 1) = 2^8 \times 1 = 256$.

## Kuadrat dan pangkat tiga yang perlu dihafal

| $n$ | $n^2$ | $n^3$ |
| --- | --- | --- |
| 11 | 121 | 1.331 |
| 12 | 144 | 1.728 |
| 13 | 169 | 2.197 |
| 14 | 196 | 2.744 |
| 15 | 225 | 3.375 |
| 16 | 256 | 4.096 |
| 17 | 289 | 4.913 |
| 18 | 324 | 5.832 |
| 19 | 361 | 6.859 |
| 25 | 625 | 15.625 |

## Akar

- $\sqrt{196} = 14$, $\sqrt[3]{125} = 5$.
- Akar desimal: hitung tanpa koma, lalu bagi jumlah angka desimal dengan 2. $\sqrt{0{,}0144} = 0{,}12$ (karena $\sqrt{144} = 12$ dan 4 angka desimal menjadi 2).
- $\sqrt{a \cdot b} = \sqrt{a} \cdot \sqrt{b}$, misalnya $\sqrt{72} = \sqrt{36}\sqrt{2} = 6\sqrt{2}$.

> **Tips ujian:** Angka kuadrat sempurna selalu berakhir dengan 0, 1, 4, 5, 6, atau 9. Jika pilihan jawaban untuk sebuah kuadrat berakhiran 2, 3, 7, atau 8, langsung coret.

## Perkalian istimewa

$$(a+b)^2 = a^2 + 2ab + b^2 \qquad (a-b)^2 = a^2 - 2ab + b^2$$

$$a^2 - b^2 = (a+b)(a-b)$$

**Contoh 1.** $63^2 - 37^2 = (63+37)(63-37) = 100 \times 26 = 2.600$.

**Contoh 2.** $47^2 = (50-3)^2 = 2.500 - 300 + 9 = 2.209$.

**Contoh 3.** $(x+y)^2 - 2xy = x^2 + y^2$. Dengan $x = 0{,}4$ dan $y = 2{,}5$: $0{,}16 + 6{,}25 = 6{,}41$.

## Trik hitung cepat

| Trik | Cara | Contoh |
| --- | --- | --- |
| Kali 5 | kali 10 lalu bagi 2 | $48 \times 5 = 240$ |
| Kali 25 | kali 100 lalu bagi 4 | $36 \times 25 = 900$ |
| Kali 125 | kali 1.000 lalu bagi 8 | $48 \times 125 = 6.000$ |
| Kali 99 | kali 100 dikurangi sekali | $87 \times 99 = 8.700 - 87 = 8.613$ |
| Kali 11 | sisipkan jumlah digit | $43 \times 11 = 4\,(4+3)\,3 = 473$ |
| Kali 1001 | tulis bilangan 3 digit dua kali | $037 \times 1001 = 37.037$ |
| Kuadrat berakhiran 5 | $n5^2 = n(n+1)$ lalu tambahkan 25 | $35^2 = 12\,|\,25 = 1.225$ |

### Deret bilangan berurutan

$$1 + 2 + \cdots + n = \frac{n(n+1)}{2}$$

Contoh: $1 + 2 + \cdots + 50 = \frac{50 \times 51}{2} = 1.275$.

## Estimasi

Jika pilihan jawaban berjauhan, bulatkan angka:

- $49{,}8 \times 20{,}1 \approx 50 \times 20 = 1.000$.
- $\frac{398}{19{,}9} \approx \frac{400}{20} = 20$.

Gunakan **digit terakhir** untuk membedakan pilihan yang dekat: $87 \times 99$ berakhiran $7 \times 9 = 63$ → digit terakhir 3, sehingga pilihan berakhiran selain 3 gugur.

## Ringkasan

- Kuasai sifat pangkat dan akar, terutama basis sama.
- Hafalkan kuadrat 11–25 dan pangkat tiga 1–10.
- Gunakan $a^2 - b^2 = (a+b)(a-b)$ dan $(a \pm b)^2$.
- Estimasi dan digit terakhir mempercepat eliminasi.

## Tips cepat

1. Faktorkan suku yang sama sebelum menghitung ($2^8$ pada contoh di atas).
2. Kali 99, 999 → kalikan 100, 1.000 lalu kurangi.
3. Jangan menghitung penuh jika pilihan bisa dieliminasi dari digit terakhir.
$md$,
   false, 3, 16),
  ('tiu-deret-angka', 'Deret Bertingkat, Selang-Seling, dan Fibonacci', 'tiu-deret-bertingkat-selang-seling', 'Strategi membedah deret angka yang tidak sekadar aritmetika atau geometri biasa.',
$md$
## Langkah standar membedah deret

Ketika bertemu deret angka, lakukan pemeriksaan berurutan:

1. **Selisih** antar suku (aritmetika? bertingkat?).
2. **Rasio** antar suku (geometri?).
3. **Selang-seling**: pisahkan suku ganjil dan genap.
4. **Fibonacci**: apakah suku = jumlah dua suku sebelumnya?
5. **Pola bilangan khusus**: kuadrat, kubik, prima.
6. **Operasi campuran**: misalnya $\times 2 + 1$, atau bergantian $-2$ dan $\times 2$.

> **Tips ujian:** 80% soal deret selesai di langkah 1–3. Jangan langsung mencari pola rumit.

## Deret aritmetika dan geometri (pengingat)

$$U_n = a + (n-1)b \qquad U_n = a \cdot r^{n-1}$$

Contoh: 5, 12, 19, 26, … (beda 7) → 33. Contoh: 81, 27, 9, 3, … (rasio $\frac{1}{3}$) → 1.

## Deret bertingkat

Jika selisihnya belum konstan, cari **selisih dari selisih**.

**Contoh 1.** 4, 6, 10, 16, 24, …

```
Deret   :  4   6   10   16   24   ?
Selisih I:    2   4    6    8   10
Selisih II:     2   2    2    2
```

Selisih tingkat I naik 2 → berikutnya 10 → $24 + 10 = 34$.

**Contoh 2.** 3, 4, 8, 17, 33, …

- Selisih: 1, 4, 9, 16 → bilangan kuadrat $1^2, 2^2, 3^2, 4^2$.
- Selisih berikutnya $5^2 = 25$ → $33 + 25 = 58$.

**Contoh 3.** 5, 7, 11, 19, 35, …

- Selisih: 2, 4, 8, 16 → deret geometri rasio 2.
- Berikutnya 32 → $35 + 32 = 67$.

## Deret selang-seling

Suku ganjil (ke-1, 3, 5, …) dan suku genap (ke-2, 4, 6, …) membentuk dua deret yang berbeda.

**Contoh 4.** 2, 10, 4, 20, 6, 30, …

| Posisi | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Nilai | 2 | 10 | 4 | 20 | 6 | 30 | **?** |
| Deret ganjil | 2 | | 4 | | 6 | | **8** |
| Deret genap | | 10 | | 20 | | 30 | |

Suku ke-7 termasuk deret ganjil → **8**.

## Operasi bergantian

**Contoh 5.** 7, 5, 10, 8, 16, 14, …

Pola: $-2, \times 2, -2, \times 2, -2, \ldots$ → $14 \times 2 = 28$.

**Contoh 6.** 2, 6, 7, 21, 22, 66, …

Pola: $\times 3, +1, \times 3, +1, \times 3$ → berikutnya $+1$ → 67.

## Fibonacci dan variasinya

Deret Fibonacci: setiap suku = jumlah dua suku sebelumnya.

$$U_n = U_{n-1} + U_{n-2}$$

Contoh: 2, 3, 5, 8, 13, **21**. Variasi: jumlah **tiga** suku sebelumnya (tribonacci), misalnya 1, 1, 2, 4, 7, 13, **24**.

## Pola bilangan khusus

| Pola | Contoh | Rumus suku ke-$n$ |
| --- | --- | --- |
| Kuadrat | 1, 4, 9, 16, 25 | $n^2$ |
| Kubik | 1, 8, 27, 64 | $n^3$ |
| Kuadrat dikurangi 1 | 0, 3, 8, 15, 24 | $n^2 - 1$ |
| Segitiga | 1, 3, 6, 10, 15 | $\frac{n(n+1)}{2}$ |
| Faktorial | 1, 2, 6, 24, 120 | $n!$ |
| Prima | 2, 3, 5, 7, 11, 13 | — |

## Ringkasan

- Urutan pemeriksaan: selisih → rasio → selang-seling → Fibonacci → bilangan khusus → operasi campuran.
- Deret bertingkat: cari selisih tingkat dua (bisa konstan, kuadrat, atau geometri).
- Deret selang-seling: pisahkan posisi ganjil dan genap.

## Tips cepat

1. Tulis selisih di bawah deret; pola sering langsung terlihat.
2. Jika deret naik sangat cepat, curigai perkalian atau faktorial.
3. Jika deret naik-turun, curigai selang-seling atau operasi bergantian.
4. Selalu cek jawaban dengan memasukkannya kembali ke pola.
$md$,
   true, 2, 15),
  ('tiu-deret-angka', 'Deret Huruf dan Deret Campuran', 'tiu-deret-huruf-campuran', 'Mengubah huruf menjadi angka (A=1 … Z=26) untuk memecahkan deret huruf dan deret huruf-angka.',
$md$
## Kunci deret huruf: ubah menjadi angka

Hampir semua deret huruf menjadi mudah setelah setiap huruf diubah ke nomor urutnya dalam alfabet.

| A | B | C | D | E | F | G | H | I | J | K | L | M |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 |

| N | O | P | Q | R | S | T | U | V | W | X | Y | Z |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |

> **Tips ujian:** Hafalkan "jangkar" **E = 5, J = 10, O = 15, T = 20, Y = 25**. Huruf lain cukup dihitung maju/mundur dari jangkar terdekat.

Huruf dari belakang juga berguna: Z = 26, Y = 25, X = 24, W = 23. Jumlah posisi huruf dan "pasangan cerminnya" selalu 27 (A–Z, B–Y, C–X, …).

## Contoh 1 — Selisih tetap

B, E, H, K, …

1. Angka: 2, 5, 8, 11.
2. Selisih tetap 3 → 14.
3. 14 = **N**.

## Contoh 2 — Selisih bertambah (mundur)

Z, X, U, Q, …

1. Angka: 26, 24, 21, 17.
2. Selisih: −2, −3, −4 → berikutnya −5.
3. $17 - 5 = 12$ = **L**.

## Contoh 3 — Lewat Z (melingkar)

W, Z, C, F, …

Jika angka melewati 26, kurangi 26 (alfabet berputar).

1. Angka: 23, 26, 29 → 3 (C), 32 → 6 (F).
2. Selisih tetap 3 → $6 + 3 = 9$ = **I**.

## Contoh 4 — Selang-seling huruf

A, Z, C, X, E, V, …

| Posisi | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Huruf | A | Z | C | X | E | V | ? |
| Angka | 1 | 26 | 3 | 24 | 5 | 22 | ? |

Suku ganjil: 1, 3, 5 → 7 = **G**. Suku genap: 26, 24, 22 (mundur 2).

## Contoh 5 — Deret huruf-angka

A2, C4, E6, G8, …

- Huruf: A, C, E, G → loncat satu → **I**.
- Angka: 2, 4, 6, 8 → **10**.
- Jawaban: **I10**.

Perhatikan bahwa angka di sini sama dengan nomor huruf **plus satu** (A=1 → 2, C=3 → 4), sehingga kedua pola konsisten.

## Contoh 6 — Kelompok huruf

ABC, BCD, CDE, …

Setiap kelompok bergeser satu huruf → **DEF**.

## Pola yang sering keluar

| Pola | Contoh | Angka |
| --- | --- | --- |
| Loncat tetap | A, C, E, G | 1, 3, 5, 7 |
| Loncat bertambah | A, B, D, G, K | 1, 2, 4, 7, 11 |
| Mundur | Z, W, T, Q | 26, 23, 20, 17 |
| Kuadrat | A, D, I, P | 1, 4, 9, 16 |
| Selang-seling | A, Z, B, Y | 1, 26, 2, 25 |

## Ringkasan

- Ubah huruf ke angka (A = 1, …, Z = 26), lalu perlakukan seperti deret angka biasa.
- Gunakan jangkar E, J, O, T, Y untuk konversi cepat.
- Jika melewati Z, kurangi 26 (berputar ke A).
- Deret campuran: pecah menjadi beberapa deret (huruf dan angka) secara terpisah.

## Tips cepat

1. Tulis angka kecil di atas setiap huruf pada kertas buram.
2. Pasangan cermin berjumlah 27: Z = 27 − 1, Y = 27 − 2, dst.
3. Untuk kelompok huruf (ABC, BCD), lihat huruf pertama saja dulu.
$md$,
   false, 3, 13),
  ('tiu-perbandingan', 'Perbandingan Senilai, Berbalik Nilai, dan Skala', 'tiu-perbandingan-senilai-berbalik', 'Membedakan perbandingan senilai dan berbalik nilai, rasio bertingkat, serta perhitungan skala peta.',
$md$
## Perbandingan senilai

Dua besaran **senilai** jika yang satu naik, yang lain ikut naik dengan **rasio sama**. Contoh: jumlah barang dan total harga.

$$\frac{a_1}{b_1} = \frac{a_2}{b_2}$$

**Contoh 1.** Harga 4 pulpen Rp14.000. Harga 10 pulpen?

$\frac{4}{14.000} = \frac{10}{x} \Rightarrow x = \frac{10 \times 14.000}{4} = 35.000$.

## Perbandingan berbalik nilai

Dua besaran **berbalik nilai** jika yang satu naik, yang lain turun, dengan **hasil kali tetap**. Contoh: jumlah pekerja dan lama pekerjaan.

$$a_1 \times b_1 = a_2 \times b_2$$

**Contoh 2.** Persediaan pakan cukup untuk 40 ekor ternak selama 15 hari. Jika ternak bertambah 10 ekor?

$40 \times 15 = 50 \times x \Rightarrow x = \frac{600}{50} = 12$ hari.

| Ciri | Senilai | Berbalik nilai |
| --- | --- | --- |
| Arah perubahan | sama | berlawanan |
| Yang tetap | hasil bagi | hasil kali |
| Contoh | barang–harga, waktu–jarak (kecepatan tetap) | pekerja–waktu, kecepatan–waktu (jarak tetap) |

> **Tips ujian:** Tanyakan pada diri sendiri: "Kalau yang ini bertambah, yang itu bertambah atau berkurang?" Jawaban itu menentukan rumus yang dipakai.

## Rasio dan pembagian

Jika uang dibagi dengan perbandingan $a : b$ dan totalnya $T$:

$$\text{bagian A} = \frac{a}{a+b} \times T$$

**Contoh 3.** Uang A : B = 3 : 5, jumlah Rp240.000. Bagian B = $\frac{5}{8} \times 240.000 = 150.000$.

### Rasio dengan selisih

**Contoh 4.** Kelereng A : B = 5 : 3, selisihnya 18. Jumlah kelereng?

1. Selisih bagian = $5 - 3 = 2$ bagian = 18 → 1 bagian = 9.
2. Jumlah = $8 \times 9 = 72$.

### Rasio bertingkat

**Contoh 5.** A : B = 2 : 3 dan B : C = 4 : 5. Tentukan A : B : C.

1. Samakan B: KPK(3, 4) = 12.
2. A : B = 8 : 12, B : C = 12 : 15.
3. A : B : C = **8 : 12 : 15**.

## Skala

$$\text{Skala} = \frac{\text{jarak pada peta}}{\text{jarak sebenarnya}}$$

Ingat konversi: 1 km = 1.000 m = 100.000 cm.

**Contoh 6.** Skala 1 : 250.000, jarak peta 6 cm.
Jarak sebenarnya = $6 \times 250.000 = 1.500.000$ cm = **15 km**.

**Contoh 7.** Jarak sebenarnya 45 km digambar 9 cm.
45 km = 4.500.000 cm → skala = $\frac{9}{4.500.000} = \frac{1}{500.000}$ → **1 : 500.000**.

## Roda gigi dan putaran

Roda gigi yang saling bersinggungan memiliki **jumlah gigi × putaran** yang sama (berbalik nilai).

**Contoh 8.** Roda A 30 gigi berputar 60 kali. Roda B 45 gigi berputar $\frac{30 \times 60}{45} = 40$ kali.

## Latihan tambahan

**Contoh 9 (senilai).** Resep untuk 6 porsi membutuhkan 450 gram tepung. Untuk 10 porsi?

$\frac{450}{6} = 75$ gram per porsi → $10 \times 75 = 750$ gram.

**Contoh 10 (berbalik nilai dengan target waktu).** Sebuah proyek dikerjakan 12 pekerja dalam 20 hari. Agar selesai dalam 15 hari, berapa pekerja tambahan yang diperlukan?

1. Total pekerjaan $= 12 \times 20 = 240$ orang-hari.
2. Pekerja yang dibutuhkan $= \frac{240}{15} = 16$ orang.
3. Tambahan $= 16 - 12 = 4$ orang.

> **Awas:** Pertanyaan "berapa pekerja **tambahan**" berbeda dengan "berapa pekerja yang dibutuhkan". Pilihan 16 biasanya disediakan sebagai pengecoh.

## Ringkasan

- Senilai: hasil bagi tetap. Berbalik nilai: hasil kali tetap.
- Pembagian rasio: bagian = (porsi/total porsi) × total.
- Rasio bertingkat: samakan suku tengah dengan KPK.
- Skala: perhatikan satuan (cm ↔ km dikali/dibagi 100.000).

## Tips cepat

1. Tulis data dalam dua baris sejajar sebelum menghitung.
2. Untuk berbalik nilai, kalikan silang **mendatar**; untuk senilai, kalikan silang **menyilang**.
3. Untuk skala, pindahkan semua satuan ke cm terlebih dahulu.
$md$,
   true, 2, 15),
  ('tiu-perbandingan', 'Kecepatan, Jarak, Waktu, dan Pekerjaan Bersama', 'tiu-perbandingan-kecepatan-pekerjaan', 'Rumus kecepatan, soal papasan dan menyusul, kecepatan rata-rata, serta pekerjaan bersama dengan 1/t.',
$md$
## Rumus dasar

$$s = v \times t \qquad v = \frac{s}{t} \qquad t = \frac{s}{v}$$

dengan $s$ = jarak, $v$ = kecepatan, $t$ = waktu. Pastikan satuannya cocok (km dengan jam, m dengan detik).

> **Tips ujian:** 1 jam = 60 menit, jadi 0,5 jam = 30 menit dan 0,25 jam = 15 menit. Konversi km/jam ke m/detik: kalikan $\frac{5}{18}$.

**Contoh 1.** Jarak 180 km ditempuh dengan kecepatan 72 km/jam, berangkat pukul 07.15.

1. $t = \frac{180}{72} = 2{,}5$ jam = 2 jam 30 menit.
2. Tiba pukul $07.15 + 2.30 = 09.45$.

## Papasan (berlawanan arah)

Dua kendaraan bergerak saling mendekat: kecepatannya **dijumlahkan**.

$$t_\text{papasan} = \frac{s}{v_1 + v_2}$$

**Contoh 2.** Kota P dan Q berjarak 210 km. Mobil A dari P (40 km/jam) dan mobil B dari Q (30 km/jam) berangkat bersamaan pukul 08.00.

$t = \frac{210}{40 + 30} = 3$ jam → bertemu pukul **11.00**. Saat itu mobil A sudah menempuh $40 \times 3 = 120$ km dari P.

## Menyusul (searah)

Kendaraan belakang lebih cepat: kecepatan **dikurangkan**.

$$t_\text{susul} = \frac{\text{jarak awal}}{v_2 - v_1}$$

**Contoh 3.** Andi bersepeda 12 km/jam mulai 07.00. Budi menyusul pukul 07.30 dengan 18 km/jam.

1. Jarak awal saat Budi berangkat: $12 \times 0{,}5 = 6$ km.
2. $t = \frac{6}{18 - 12} = 1$ jam.
3. Budi menyusul pukul **08.30**.

## Kecepatan rata-rata

Kecepatan rata-rata **bukan** rata-rata kecepatan!

$$\bar{v} = \frac{\text{total jarak}}{\text{total waktu}}$$

Jika jarak pergi dan pulang sama:

$$\bar{v} = \frac{2 v_1 v_2}{v_1 + v_2}$$

**Contoh 4.** Pergi 60 km/jam, pulang 40 km/jam. $\bar{v} = \frac{2 \times 60 \times 40}{100} = 48$ km/jam (bukan 50).

## Pekerjaan bersama

Jika seseorang menyelesaikan pekerjaan dalam $t$ satuan waktu, kecepatan kerjanya $\frac{1}{t}$ pekerjaan per satuan waktu. Kecepatan kerja **dijumlahkan** saat bekerja bersama:

$$\frac{1}{t_\text{bersama}} = \frac{1}{t_A} + \frac{1}{t_B}$$

Untuk dua orang, bentuk ringkasnya $t_\text{bersama} = \frac{t_A \cdot t_B}{t_A + t_B}$.

**Contoh 5.** A 10 hari, B 15 hari.
$\frac{1}{10} + \frac{1}{15} = \frac{3 + 2}{30} = \frac{1}{6}$ → bersama **6 hari**.

### Keran mengisi dan membuang

Pipa pembuang bertanda **negatif**.

**Contoh 6.** Keran A mengisi bak dalam 20 menit; lubang B mengosongkan bak penuh dalam 30 menit.
$\frac{1}{20} - \frac{1}{30} = \frac{3-2}{60} = \frac{1}{60}$ → bak penuh dalam **60 menit**.

### Pekerja ditambah di tengah jalan

Gunakan satuan **orang-hari**.

**Contoh 7.** 8 orang dapat menyelesaikan pekerjaan dalam 15 hari. Setelah 5 hari, ditambah 2 orang.

| Tahap | Orang | Hari | Orang-hari |
| --- | --- | --- | --- |
| Total pekerjaan | 8 | 15 | 120 |
| Sudah dikerjakan | 8 | 5 | 40 |
| Sisa | 10 | $x$ | 80 |

$x = \frac{80}{10} = 8$ hari lagi (total 13 hari).

## Latihan tambahan

**Contoh 8 (benda berpanjang).** Kereta sepanjang 200 m melaju 72 km/jam.

1. $72 \text{ km/jam} = 72 \times \frac{5}{18} = 20$ m/detik.
2. Melewati sebuah tiang: jarak = panjang kereta = 200 m → $\frac{200}{20} = 10$ detik.
3. Melewati jembatan 300 m: jarak = $200 + 300 = 500$ m → $\frac{500}{20} = 25$ detik.

**Contoh 9 (tiga pekerja).** A selesai dalam 4 jam, B dalam 6 jam, C dalam 12 jam.

$$\frac{1}{4} + \frac{1}{6} + \frac{1}{12} = \frac{3 + 2 + 1}{12} = \frac{6}{12} = \frac{1}{2}$$

Bersama-sama mereka selesai dalam **2 jam**.

## Ringkasan

- $s = v \cdot t$; samakan satuan.
- Papasan: $v_1 + v_2$. Menyusul: $v_2 - v_1$ dengan jarak awal.
- Kecepatan rata-rata = total jarak ÷ total waktu.
- Pekerjaan bersama: jumlahkan $\frac{1}{t}$; pembuang bernilai negatif; gunakan orang-hari untuk perubahan pekerja.

## Tips cepat

1. Gambar garis jarak untuk soal papasan/menyusul.
2. Waspadai jawaban "rata-rata biasa" (50 km/jam) — itu jebakan.
3. Untuk dua pekerja, langsung pakai $\frac{t_A t_B}{t_A + t_B}$.
$md$,
   false, 3, 17),
  ('tiu-soal-cerita', 'Soal Umur, Rata-Rata, dan Himpunan', 'tiu-soal-cerita-umur-rata-himpunan', 'Menerjemahkan cerita menjadi persamaan untuk soal umur, rata-rata gabungan, dan diagram Venn himpunan.',
$md$
## Prinsip utama: terjemahkan kalimat ke persamaan

Soal cerita sebenarnya soal aljabar yang dibungkus kalimat. Langkahnya:

1. Tentukan **variabel** (misalnya umur anak sekarang = $x$).
2. Ubah setiap kalimat menjadi **persamaan**.
3. Selesaikan, lalu **jawab yang ditanya** (sering kali bukan $x$ itu sendiri!).

> **Tips ujian:** Jika waktu terbatas, masukkan pilihan jawaban ke cerita (*substitusi balik*). Cara ini sering lebih cepat untuk soal umur.

## Soal umur

Kunci: **selisih umur dua orang selalu tetap**, dan "$n$ tahun lagi" berarti setiap orang bertambah $n$.

**Contoh 1.** Umur ayah sekarang 3 kali umur anaknya. Sepuluh tahun lagi, umur ayah 2 kali umur anaknya. Berapa umur anak sekarang?

1. Anak = $x$, ayah = $3x$.
2. $3x + 10 = 2(x + 10)$.
3. $3x + 10 = 2x + 20 \Rightarrow x = 10$.
4. Cek: sekarang 10 dan 30; sepuluh tahun lagi 20 dan 40 ✔.

**Contoh 2.** Lima tahun lalu umur kakak 2 kali umur adik. Sekarang jumlah umur mereka 40 tahun.

1. Kakak $K$, adik $A$: $K - 5 = 2(A - 5)$ → $K = 2A - 5$.
2. $K + A = 40 \Rightarrow 3A - 5 = 40 \Rightarrow A = 15$, $K = 25$.
3. Cek: lima tahun lalu 20 dan 10 ✔.

## Rata-rata

$$\bar{x} = \frac{\text{jumlah data}}{\text{banyak data}} \quad \Rightarrow \quad \text{jumlah} = \bar{x} \times n$$

Hampir semua soal rata-rata diselesaikan lewat **jumlah**, bukan rata-rata langsung.

**Contoh 3 (data ditambah).** Rata-rata 5 siswa = 72. Setelah satu siswa bergabung, rata-rata = 74.

- Jumlah awal $= 5 \times 72 = 360$. Jumlah baru $= 6 \times 74 = 444$.
- Nilai siswa baru $= 444 - 360 = 84$.

**Contoh 4 (rata-rata gabungan).**

$$\bar{x}_\text{gab} = \frac{n_1 \bar{x}_1 + n_2 \bar{x}_2}{n_1 + n_2}$$

Kelas A: 30 siswa rata-rata 70. Kelas B: 20 siswa rata-rata 80.
$\bar{x} = \frac{2.100 + 1.600}{50} = 74$.

Perhatikan bahwa hasilnya **lebih dekat ke kelompok yang lebih besar** (70), bukan tepat di tengah (75).

## Himpunan

Untuk dua himpunan:

$$n(A \cup B) = n(A) + n(B) - n(A \cap B)$$

$$n(S) = n(A \cup B) + n(\text{bukan keduanya})$$

**Contoh 5.** Dari 40 pegawai, 25 suka kopi, 20 suka teh, 8 tidak suka keduanya.

1. $n(A \cup B) = 40 - 8 = 32$.
2. $32 = 25 + 20 - n(A \cap B) \Rightarrow n(A \cap B) = 13$.

Diagram Venn teks:

```
   Kopi saja   Keduanya   Teh saja
  [   12    (    13    )     7    ]   + 8 tidak keduanya = 40
```

Cek: $12 + 13 + 7 + 8 = 40$ ✔.

## Latihan tambahan

**Contoh 6 (data salah catat).** Rata-rata 20 data adalah 65. Ternyata satu data yang seharusnya 80 tercatat 60. Rata-rata yang benar?

1. Jumlah tercatat $= 20 \times 65 = 1.300$.
2. Koreksi: $+80 - 60 = +20$ → jumlah benar 1.320.
3. Rata-rata benar $= \frac{1.320}{20} = 66$.

**Contoh 7 (irisan minimal dan maksimal).** Dari 30 siswa, 18 menyukai matematika dan 20 menyukai IPA. Berapa paling sedikit dan paling banyak siswa yang menyukai keduanya?

- **Minimal**: $18 + 20 - 30 = 8$ (jika semua siswa menyukai minimal satu pelajaran).
- **Maksimal**: 18 (jika semua penyuka matematika juga menyukai IPA).

| Kondisi | Rumus |
| --- | --- |
| Irisan minimal | $\max(0,\; n(A) + n(B) - n(S))$ |
| Irisan maksimal | $\min(n(A),\; n(B))$ |

## Ringkasan

- Ubah cerita menjadi persamaan; jawab yang ditanyakan.
- Umur: selisih tetap; semua orang bertambah umur bersamaan.
- Rata-rata: kerjakan lewat **jumlah**.
- Himpunan: $n(A \cup B) = n(A) + n(B) - n(A \cap B)$.

## Tips cepat

1. Substitusi pilihan jawaban ke soal umur untuk mengecek cepat.
2. Rata-rata gabungan selalu berada di antara rata-rata kelompok, lebih dekat ke kelompok yang lebih banyak.
3. Pada himpunan, isi daerah irisan terlebih dahulu lalu daerah "saja".
$md$,
   true, 2, 16),
  ('tiu-soal-cerita', 'Untung-Rugi, Diskon, Bunga Tunggal, dan Campuran', 'tiu-soal-cerita-keuangan-campuran', 'Rumus aritmetika sosial: persentase untung-rugi, diskon bertingkat, bunga tunggal, dan harga campuran.',
$md$
## Untung dan rugi

$$\text{Untung} = \text{harga jual} - \text{harga beli}$$

$$\%\text{untung} = \frac{\text{untung}}{\text{harga beli}} \times 100\%$$

Persentase untung/rugi selalu dihitung terhadap **harga beli (modal)**.

**Contoh 1.** Beli Rp80.000, jual Rp100.000. Untung 20.000 → $\frac{20.000}{80.000} = 25\%$ (bukan 20%).

**Contoh 2 (mencari harga beli).** Barang dijual Rp135.000 dengan untung 12,5%.

$$\text{harga beli} = \frac{\text{harga jual}}{1 + 0{,}125} = \frac{135.000}{1{,}125} = 120.000$$

> **Tips ujian:** Jangan menghitung $135.000 - 12{,}5\% \times 135.000$. Itu menghitung persen dari harga jual dan hasilnya (Rp118.125) sengaja dijadikan pengecoh.

**Contoh 3 (barang rusak).** Membeli 50 mangga seharga Rp150.000, 5 busuk, sisanya dijual Rp3.500 per buah.

1. Penjualan: $45 \times 3.500 = 157.500$.
2. Untung: $157.500 - 150.000 = 7.500$.
3. Persentase: $\frac{7.500}{150.000} = 5\%$ untung.

## Diskon

$$\text{harga setelah diskon } d\% = (1 - d) \times \text{harga awal}$$

Diskon bertingkat **dikalikan**:

**Contoh 4.** Harga Rp200.000, diskon 20% + 10%.
$200.000 \times 0{,}8 \times 0{,}9 = 144.000$ (diskon efektif 28%, bukan 30%).

| Diskon bertingkat | Faktor pengali | Diskon efektif |
| --- | --- | --- |
| 10% + 10% | $0{,}9 \times 0{,}9 = 0{,}81$ | 19% |
| 20% + 10% | $0{,}8 \times 0{,}9 = 0{,}72$ | 28% |
| 50% + 20% | $0{,}5 \times 0{,}8 = 0{,}40$ | 60% |
| 25% + 20% | $0{,}75 \times 0{,}8 = 0{,}60$ | 40% |

## Bunga tunggal

$$B = M \times i \times t$$

dengan $M$ = modal awal, $i$ = suku bunga per tahun, $t$ = waktu dalam **tahun**. Untuk bulan: $t = \frac{\text{bulan}}{12}$.

**Contoh 5.** Tabungan Rp2.000.000, bunga 6% per tahun, 8 bulan.
$B = 2.000.000 \times 0{,}06 \times \frac{8}{12} = 80.000$. Saldo = Rp2.080.000.

**Contoh 6 (mencari suku bunga).** Rp2.000.000 menjadi Rp2.360.000 setelah 1,5 tahun.

1. Bunga = 360.000 → persentase total $= 18\%$ dalam 1,5 tahun.
2. Per tahun $= \frac{18\%}{1{,}5} = 12\%$.

## Campuran

### Harga campuran

$$\text{harga rata-rata} = \frac{m_1 h_1 + m_2 h_2}{m_1 + m_2}$$

**Contoh 7.** 10 kg beras @Rp12.000 dicampur 15 kg @Rp14.000.
$\frac{120.000 + 210.000}{25} = 13.200$ per kg.

### Kadar larutan

Zat terlarut tetap, volume bertambah ketika ditambah air.

**Contoh 8.** 20 liter larutan gula 15% ditambah 10 liter air.

1. Gula = $0{,}15 \times 20 = 3$ liter.
2. Kadar baru = $\frac{3}{30} = 10\%$.

## Persamaan dua variabel

**Contoh 9.** 3 buku + 2 pensil = Rp31.000; 2 buku + 4 pensil = Rp26.000.

1. Bagi persamaan kedua dengan 2: $b + 2p = 13.000$.
2. Kurangkan dari persamaan pertama: $2b = 18.000 \Rightarrow b = 9.000$.
3. $p = \frac{13.000 - 9.000}{2} = 2.000$.

## Latihan tambahan

**Contoh 10 (rugi).** Beli Rp250.000, jual Rp225.000.
Rugi $= 25.000$ → $\frac{25.000}{250.000} = 10\%$ rugi.

**Contoh 11 (harga sebelum diskon).** Setelah diskon 25%, harga menjadi Rp90.000.
$\text{harga awal} = \frac{90.000}{0{,}75} = 120.000$.
Pengecoh yang sering muncul: $90.000 + 25\% \times 90.000 = 112.500$ (salah karena 25% dihitung dari harga akhir).

**Contoh 12 (lama menabung).** Modal Rp5.000.000, bunga tunggal 9% per tahun, bunga yang diterima Rp300.000.

1. Bunga per tahun $= 5.000.000 \times 9\% = 450.000$.
2. $t = \frac{300.000}{450.000} = \frac{2}{3}$ tahun $= 8$ bulan.

## Ringkasan

- %untung/rugi terhadap **harga beli**.
- Harga beli = harga jual ÷ (1 + %untung).
- Diskon bertingkat dikalikan.
- Bunga tunggal: $M \cdot i \cdot t$ dengan $t$ dalam tahun.
- Campuran: rata-rata berbobot; kadar = zat ÷ total.

## Tips cepat

1. Tuliskan faktor pengali (0,8; 1,125; …) agar tidak salah arah.
2. Ubah bulan ke tahun sebelum menghitung bunga.
3. Cek ulang: harga campuran harus berada di antara dua harga asal.
$md$,
   false, 3, 16),
  ('tiu-analogi-gambar', 'Transformasi Dasar dalam Analogi Gambar', 'tiu-analogi-gambar-transformasi', 'Rotasi, pencerminan, perubahan warna, dan perubahan jumlah elemen sebagai dasar analogi gambar.',
$md$
## Apa yang diuji?

Soal analogi gambar berbentuk:

$$\text{Gambar 1} : \text{Gambar 2} = \text{Gambar 3} : \ldots$$

Anda harus menemukan **aturan perubahan** dari gambar 1 ke gambar 2, lalu menerapkan aturan yang **sama persis** pada gambar 3. Prinsipnya sama dengan analogi kata, hanya saja "hubungannya" berupa transformasi visual.

> **Tips ujian:** Bandingkan gambar 1 dan 2 berdasarkan **empat pertanyaan**: Apakah berputar? Apakah dicerminkan? Apakah warnanya berubah? Apakah jumlah/ukuran elemennya berubah?

## Empat keluarga transformasi

| Transformasi | Ciri | Contoh |
| --- | --- | --- |
| Rotasi | bentuk sama, arah berubah | ↑ → → (90° searah jarum jam) |
| Pencerminan | bentuk menjadi bayangan cermin | ◀ → ▶ (cermin sumbu tegak) |
| Perubahan warna/arsiran | bentuk sama, isian berubah | ● → ○ |
| Perubahan jumlah/ukuran | elemen bertambah/berkurang/membesar | ▲ → ▲▲ |

### Rotasi

Hafalkan arah panah untuk setiap putaran **searah jarum jam**:

| Awal | 45° | 90° | 135° | 180° | 270° |
| --- | --- | --- | --- | --- | --- |
| ↑ | ↗ | → | ↘ | ↓ | ← |
| → | ↘ | ↓ | ↙ | ← | ↑ |
| ↓ | ↙ | ← | ↖ | ↑ | → |

Rotasi 270° searah jarum jam sama dengan 90° berlawanan arah jarum jam.

### Pencerminan

- **Cermin sumbu tegak** (kiri ↔ kanan): ◀ ↔ ▶, ↖ ↔ ↗, ◐ (kiri hitam) ↔ ◑ (kanan hitam).
- **Cermin sumbu datar** (atas ↔ bawah): ▲ ↔ ▼, ↗ ↔ ↘, ◓ (atas hitam) ↔ ◒ (bawah hitam).

> **Awas ambiguitas:** ▲ → ▼ bisa berarti rotasi 180° **atau** cermin sumbu datar. Keduanya memberi hasil berbeda pada gambar lain (◀ dirotasi 180° menjadi ▶, tetapi dicerminkan terhadap sumbu datar tetap ◀). Jika ada dua aturan yang mungkin, periksa pilihan jawaban: biasanya hanya satu aturan yang hasilnya tersedia.

### Perubahan warna

Pola umum: hitam ↔ putih (●/○, ■/□, ▲/△, ◆/◇), atau arsiran berpindah posisi.

### Perubahan jumlah

Pola umum: ditambah satu, dikalikan dua, atau dikurangi satu. Bila gambar 1 berisi 2 elemen dan gambar 2 berisi 4, aturan bisa "+2" **atau** "×2" — gunakan gambar 3 dan pilihan untuk memutuskan.

## Contoh dengan pembahasan

**Contoh 1.** ●●● : ○○○ = ■■ : …

- Jumlah tetap (3 → 3), bentuk tetap, warna hitam → putih.
- Terapkan: ■■ → **□□**.

**Contoh 2.** ↑ : ↗ = → : …

- ↑ ke ↗ adalah rotasi 45° searah jarum jam (tidak mungkin pencerminan karena ↗ bukan bayangan cermin ↑ terhadap sumbu tegak/datar).
- → diputar 45° searah jarum jam → **↘**.

**Contoh 3.** ↑● : ↓○ = →■ : …

Dua perubahan sekaligus:

1. Panah diputar 180° (↑ → ↓).
2. Warna dibalik (● → ○).

Terapkan pada →■: panah menjadi ←, ■ menjadi □ → **←□**.

**Contoh 4.** Segitiga (3 sisi) : persegi (4 sisi) = segi lima : …

- Jumlah sisi bertambah satu → **segi enam**.

## Membaca gambar yang dideskripsikan dengan kata

Karena soal pada aplikasi ini berbentuk teks, posisi dalam kisi sering ditulis seperti "pojok kiri atas" atau digambar sebagai baris:

```
Kisi 2×2 (■ di kiri atas)     Setelah diputar 180°
  ■ □                           □ □
  □ □                           □ ■
```

Rotasi 180° memindahkan setiap sel ke pojok **diagonal seberangnya**.

## Ringkasan

- Cari aturan dari gambar 1 → 2 dengan empat pertanyaan: rotasi, cermin, warna, jumlah.
- Hafalkan tabel rotasi panah 45° dan 90°.
- Waspadai aturan ganda (rotasi + warna).
- Jika dua aturan sama-sama cocok, gunakan pilihan jawaban untuk memilih.

## Tips cepat

1. Ikuti **satu titik khas** (ujung panah, sudut hitam) untuk melacak rotasi.
2. Hitung elemen secara eksplisit; jangan menebak dari kesan.
3. Uji jawaban: terapkan aturan Anda pada gambar 1 — harus menghasilkan gambar 2 persis.
$md$,
   true, 2, 14),
  ('tiu-analogi-gambar', 'Strategi Eliminasi dan Aturan Ganda', 'tiu-analogi-gambar-strategi', 'Teknik memecah gambar majemuk menjadi beberapa komponen dan mengeliminasi pilihan dengan cepat.',
$md$
## Gambar majemuk

Soal analogi gambar tingkat sulit biasanya memuat **beberapa komponen** yang berubah dengan aturan berbeda, misalnya panah yang berputar **dan** lingkaran yang berganti warna. Kuncinya: **pisahkan komponen**.

| Komponen | Gambar 1 | Gambar 2 | Aturan |
| --- | --- | --- | --- |
| Panah | ↑ | ↓ | rotasi 180° |
| Bulatan | ● | ○ | warna dibalik |
| Jumlah elemen | 2 | 2 | tetap |

Setelah tabel terisi, terapkan setiap aturan **satu per satu** pada gambar 3.

> **Tips ujian:** Eliminasi lebih cepat daripada konstruksi. Terapkan aturan pertama saja dan coret semua pilihan yang tidak sesuai; biasanya tinggal 1–2 pilihan.

## Langkah eliminasi

1. Tentukan aturan **paling mudah dicek** (misalnya warna atau jumlah).
2. Coret pilihan yang melanggar aturan itu.
3. Tentukan aturan kedua (misalnya arah rotasi).
4. Coret lagi. Jawaban tersisa adalah kunci.

## Contoh 1 — Perpindahan posisi dalam kisi

Dalam kotak 2×2:

- Gambar 1: ■ di **kiri atas** → Gambar 2: ■ di **kanan bawah**.
- Gambar 1': ◆ di **kanan atas** → Gambar 2': ◆ di **kiri bawah**.

Aturan: setiap elemen pindah ke pojok diagonal seberang (rotasi 180°). Jika ● di **kiri bawah**, hasilnya di **kanan atas**.

Mengapa perlu dua contoh? Karena dengan satu contoh saja (kiri atas → kanan bawah), aturan "cermin terhadap diagonal kanan atas–kiri bawah" juga cocok, padahal aturan itu membiarkan elemen di kanan atas tetap di tempatnya. Contoh kedua menghilangkan keraguan itu.

## Contoh 2 — Setengah lingkaran berputar

Simbol setengah hitam:

| Simbol | Bagian hitam |
| --- | --- |
| ◐ | kiri |
| ◓ | atas |
| ◑ | kanan |
| ◒ | bawah |

Soal: ◐ : ◓ = ◑ : …

1. Kiri hitam → atas hitam: bagian hitam bergeser 90° searah jarum jam.
2. Kanan hitam diputar 90° searah jarum jam → bawah hitam → **◒**.

## Contoh 3 — Jumlah ganda

▲▲ : ▲▲▲▲ = ●●● : …

- Aturan "×2" memberi ●●●●●● (6), sedangkan "+2" memberi ●●●●● (5).
- Untuk memutuskan, lihat pilihan. Jika soal menyediakan keduanya, soal tersebut cacat; soal yang baik hanya menyediakan salah satunya atau memberi contoh tambahan.
- Pada latihan SiapASN, aturan dinyatakan lewat contoh yang cukup sehingga hanya satu jawaban yang konsisten.

## Kesalahan umum

- **Hanya memperhatikan satu komponen**, padahal ada dua yang berubah.
- **Salah arah rotasi** (searah vs berlawanan jarum jam). Gunakan jam dinding sebagai patokan: 12 → 3 adalah searah jarum jam.
- **Tertukar antara rotasi dan cermin**. Cek: pada cermin, urutan "searah jarum jam" dari titik-titik khas menjadi terbalik.

## Contoh 4 — Pencerminan susunan baris

Gambar yang terdiri atas beberapa elemen dalam satu baris dapat dicerminkan kiri-kanan: urutannya dibaca terbalik.

■□□● : ●□□■ = ▲△▲▲ : …

| Posisi | 1 | 2 | 3 | 4 |
| --- | --- | --- | --- | --- |
| Gambar 1 | ■ | □ | □ | ● |
| Gambar 2 | ● | □ | □ | ■ |
| Gambar 3 | ▲ | △ | ▲ | ▲ |
| Jawaban | ▲ | ▲ | △ | ▲ |

Elemen posisi 1 bertukar dengan posisi 4, posisi 2 dengan posisi 3. Jawaban: **▲▲△▲**.

Pengecoh yang sering muncul adalah ▲△▲▲ (tidak berubah) dan △▲△△ (warna dibalik, padahal warna pada contoh tidak berubah).

## Ringkasan

- Pisahkan gambar menjadi komponen; tentukan aturan untuk masing-masing.
- Gunakan eliminasi bertahap dari aturan termudah.
- Hafalkan simbol setengah hitam ◐ ◓ ◑ ◒ beserta urutan rotasinya.

## Tips cepat

1. Mulai dari warna dan jumlah, baru arah.
2. Ucapkan aturan dalam kalimat: "panah putar 180°, bulatan dibalik warnanya".
3. Jangan menghabiskan lebih dari 60 detik; tandai dan kembali nanti.
$md$,
   false, 3, 12),
  ('tiu-ketidaksamaan', 'Menemukan Gambar yang Berbeda', 'tiu-ketidaksamaan-ciri-pembeda', 'Daftar ciri yang biasa menjadi pembeda pada soal ketidaksamaan gambar dan cara mengujinya.',
$md$
## Bentuk soal

Soal ketidaksamaan (*odd one out*) menyajikan lima gambar. Empat gambar memiliki **satu sifat yang sama**, dan satu gambar **tidak**. Tugas Anda menemukan gambar yang berbeda itu.

> **Tips ujian:** Sifat pembeda harus berlaku untuk **empat gambar sekaligus**. Jika Anda menemukan sifat yang hanya dimiliki 3 gambar, itu bukan jawabannya — cari sifat lain.

## Daftar periksa ciri pembeda

| Ciri | Pertanyaan yang diajukan | Contoh perbedaan |
| --- | --- | --- |
| Jumlah elemen | Berapa banyak bentuk/garis/titik? | empat gambar berjumlah ganjil, satu genap |
| Warna/arsiran | Berapa yang hitam, berapa putih? | empat "2 hitam 1 putih", satu "1 hitam 2 putih" |
| Arah | Ke mana panah/ujung menghadap? | empat lurus, satu diagonal |
| Rotasi | Apakah semuanya rotasi dari bentuk yang sama? | empat sudut siku (┌ ┐ └ ┘), satu ├ |
| Pencerminan | Apakah pasangan simetris terhadap sumbu sama? | empat cermin kiri-kanan, satu atas-bawah |
| Pola susunan | Apakah urutan elemen berselang-seling? | ●○●○ vs ▼▽▽▼ |
| Bentuk | Lengkung vs bersudut, terbuka vs tertutup | lingkaran di antara segi banyak |
| Simetri | Apakah gambar simetris? | satu-satunya yang asimetris |

## Contoh 1 — Komposisi warna

Pilihan: ■■□, ▲▲△, ◆◇◇, ▼▼▽, ▶▶▷

1. Bentuk: semuanya bersudut; masing-masing memakai satu jenis bentuk.
2. Warna: ■■□ = 2 hitam 1 putih; ▲▲△ = 2 hitam 1 putih; **◆◇◇ = 1 hitam 2 putih**; ▼▼▽ dan ▶▶▷ = 2 hitam 1 putih.
3. Jawaban: **◆◇◇**.

## Contoh 2 — Rotasi

Pilihan berupa pasangan panah: ↑→, →↓, ↓←, ←↑, ↑↓

- Pada empat pasangan, panah kedua = panah pertama diputar **90° searah jarum jam**.
- ↑↓ adalah putaran **180°** → berbeda.

## Contoh 3 — Jumlah

Pilihan: ■■■, ■■■■■, ■■■■■■■, ■■■■, ■■■■■■■■■

- Jumlah: 3, 5, 7, 4, 9. Empat ganjil, satu genap → **■■■■**.

## Contoh 4 — Pola susunan

Pilihan: ●○●○, ■□■□, ▲△▲△, ◆◇◆◇, ▼▽▽▼

- Empat pilihan berpola "hitam-putih-hitam-putih".
- ▼▽▽▼ berpola "hitam-putih-putih-hitam" → berbeda.

## Mengatasi dua kandidat

Kadang dua gambar tampak "berbeda" karena alasan yang berlainan. Dalam hal ini:

1. Tuliskan sifat yang membuat masing-masing kandidat unik.
2. Periksa apakah sifat itu **benar-benar dimiliki empat gambar lain** secara seragam.
3. Pilih sifat yang lebih **sistematis** (jumlah, rotasi, warna) daripada sifat kebetulan.

## Contoh 5 — Simetri

Pilihan: A, H, M, T, F (huruf kapital sebagai gambar)

- A, H, M, dan T **simetris** terhadap sumbu tegak: jika dilipat kiri-kanan, kedua sisi berimpit.
- F tidak memiliki sumbu simetri tegak.
- Jawaban: **F**.

## Contoh 6 — Bentuk lengkung

Pilihan: segitiga, persegi, segi lima, lingkaran, segi enam

- Empat bangun tersusun dari **sisi lurus** (segi banyak).
- Lingkaran tidak memiliki sisi lurus → berbeda.

Perhatikan: jika pilihannya segitiga, persegi, segi lima, segi enam, dan **segi delapan**, ciri "sisi lurus" tidak lagi membedakan. Anda harus mencari ciri lain, misalnya jumlah sisi ganjil/genap — dan bila ciri itu pun tidak memisahkan tepat satu gambar, periksa ciri berikutnya di daftar.

## Ringkasan

- Empat gambar berbagi satu sifat; satu tidak.
- Gunakan daftar periksa: jumlah, warna, arah, rotasi, cermin, susunan, bentuk, simetri.
- Sifat pembeda harus berlaku untuk tepat empat gambar.

## Tips cepat

1. Mulai dari ciri **paling mudah dihitung**: jumlah elemen dan warna.
2. Untuk panah dan sudut, bayangkan memutar kertas.
3. Jika semua ciri tampak sama, periksa detail kecil seperti posisi titik atau ketebalan garis.
$md$,
   true, 2, 13),
  ('tiu-ketidaksamaan', 'Ketidaksamaan Berbasis Rotasi dan Pencerminan', 'tiu-ketidaksamaan-rotasi-cermin', 'Membedakan gambar hasil rotasi dari gambar hasil pencerminan, dan mengenali simbol yang setara.',
$md$
## Inti masalah

Soal ketidaksamaan tingkat sulit sering berisi empat gambar yang merupakan **rotasi** dari satu bentuk dasar, dan satu gambar yang merupakan **pencerminan** (atau bentuk lain). Mata kita mudah tertipu karena bayangan cermin terlihat "mirip".

> **Tips ujian:** Rotasi tidak mengubah urutan searah jarum jam dari titik-titik khas. Pencerminan **membalik** urutan itu.

## Rotasi versus pencerminan

Bayangkan huruf **L** dengan sudut di kiri bawah:

```
L asli     Rotasi 90°     Cermin kiri-kanan
|          ┌──            ⅃ (sudut di kanan bawah)
|__        |
```

- Rotasi L berapa pun derajatnya tetap bisa ditumpuk dengan L asli setelah diputar.
- Bayangan cermin L (⅃) **tidak pernah** bisa ditumpuk dengan L hanya dengan memutar — harus dibalik.

## Kelompok simbol sudut

Simbol ┌ ┐ └ ┘ adalah rotasi satu sama lain (sudut siku dengan dua kaki). Simbol ├ ┤ ┬ ┴ adalah kelompok lain (tiga kaki). Jika empat pilihan dari kelompok pertama dan satu dari kelompok kedua, yang kedua itulah yang berbeda.

| Kelompok | Anggota | Jumlah kaki |
| --- | --- | --- |
| Sudut | ┌ ┐ └ ┘ | 2 |
| Pertigaan | ├ ┤ ┬ ┴ | 3 |
| Perempatan | ┼ | 4 |

## Pasangan cermin

Untuk soal yang menyajikan **pasangan** gambar, tentukan hubungan dalam setiap pasangan:

| Pasangan | Cermin kiri-kanan? | Cermin atas-bawah? | Rotasi 180°? |
| --- | --- | --- | --- |
| ◀ ▶ | ya | tidak | ya |
| ↖ ↗ | ya | tidak | tidak |
| ↙ ↘ | ya | tidak | tidak |
| ⇐ ⇒ | ya | tidak | ya |
| ↑ ↓ | tidak | ya | ya |

Sifat "cermin kiri-kanan" dimiliki empat pasangan pertama, tetapi tidak oleh ↑ ↓. Sifat "rotasi 180°" justru dimiliki tiga pasangan saja — sehingga bukan sifat pembeda yang sah. Jawabannya **↑ ↓**.

## Simbol setengah terisi

◐ ◑ ◒ ◓ adalah lingkaran dengan **setengah** bagian hitam (kiri, kanan, bawah, atas). Keempatnya rotasi satu sama lain. Lingkaran penuh ● bukan rotasi dari setengah lingkaran, jadi menjadi pembeda pada pilihan ◐ ◑ ◒ ◓ ●.

## Langkah sistematis

1. Kelompokkan pilihan berdasarkan **bentuk dasar** (abaikan arah).
2. Jika semua bentuk dasar sama, periksa apakah ada yang **dicerminkan**.
3. Jika semuanya rotasi biasa, periksa **sudut rotasi** (90° vs 180° vs 45°).
4. Terakhir, periksa **warna** dan **jumlah**.

## Contoh terbimbing

Pilihan: ↑, →, ↓, ←, ↗

1. Bentuk dasar sama (panah).
2. Arah: empat arah utama (atas, kanan, bawah, kiri) dan satu diagonal.
3. Jawaban: **↗** — satu-satunya arah diagonal.

## Huruf b, d, p, q sebagai alat latihan

Empat huruf kecil ini sangat berguna untuk melatih kepekaan rotasi dan cermin:

| Pasangan | Hubungan |
| --- | --- |
| b ↔ d | cermin kiri-kanan |
| b ↔ p | cermin atas-bawah |
| b ↔ q | rotasi 180° |
| d ↔ p | rotasi 180° |

Jika soal menampilkan pasangan (b q), (d p), (q b), (p d), dan (b d), empat pasangan pertama adalah rotasi 180°, sedangkan (b d) adalah pencerminan — itulah yang berbeda.

## Ringkasan

- Rotasi mempertahankan urutan; cermin membaliknya.
- Kelompokkan simbol berdasarkan jumlah kaki, bentuk dasar, dan arah.
- Sifat pembeda harus dimiliki tepat empat pilihan.

## Tips cepat

1. Putar kertas buram (atau bayangkan) untuk menguji rotasi.
2. Ingat: ◐ ◓ ◑ ◒ berputar searah jarum jam (kiri → atas → kanan → bawah).
3. Diagonal (↗ ↘ ↙ ↖) selalu berbeda dari arah utama (↑ → ↓ ←).
$md$,
   false, 3, 12),
  ('tiu-serial-gambar', 'Pola Gerak dalam Serial Gambar', 'tiu-serial-gambar-pola-gerak', 'Rotasi bertahap, pergeseran posisi, dan pola melingkar pada deret gambar.',
$md$
## Bentuk soal serial gambar

Serial gambar adalah **deret** yang anggotanya gambar. Anda diminta menentukan gambar berikutnya. Polanya mirip deret angka: ada langkah tetap yang diulang.

> **Tips ujian:** Perlakukan serial gambar seperti deret angka. Ubah setiap perubahan menjadi "langkah" (misalnya +90°, geser 1 kotak, +2 elemen), lalu lanjutkan langkah itu.

## Pola 1 — Rotasi bertahap

Panah diputar dengan sudut tetap setiap langkah.

| Langkah | 1 | 2 | 3 | 4 | 5 | 6 |
| --- | --- | --- | --- | --- | --- | --- |
| 90° searah jarum jam | ↑ | → | ↓ | ← | ↑ | → |
| 45° searah jarum jam | ↑ | ↗ | → | ↘ | ↓ | ↙ |
| 90° berlawanan jarum jam | ↑ | ← | ↓ | → | ↑ | ← |

Rotasi 90° kembali ke posisi awal setelah **4 langkah**; rotasi 45° setelah **8 langkah**. Gunakan sisa bagi untuk menebak suku jauh:

$$\text{posisi suku ke-}n = \text{posisi awal} + (n-1) \times \text{sudut} \pmod{360^\circ}$$

**Contoh.** Panah mulai ↑ dan berputar 90° searah jarum jam tiap langkah. Suku ke-10?
$(10 - 1) \times 90^\circ = 810^\circ$, sisa bagi 360° adalah 90° → **→**.

## Pola 2 — Pergeseran posisi

Elemen bergeser satu sel setiap langkah dalam baris atau kisi.

```
Langkah 1: ● ○ ○ ○
Langkah 2: ○ ● ○ ○
Langkah 3: ○ ○ ● ○
Langkah 4: ○ ○ ○ ●
Langkah 5: ● ○ ○ ○   ← kembali ke kiri (melingkar)
```

Ada dua kemungkinan setelah mencapai ujung:

- **Melingkar** (*wrap*): kembali ke sel pertama.
- **Memantul** (*bounce*): berbalik arah ke sel ketiga.

Pastikan deret pada soal sudah menunjukkan perilaku di ujung sebelum Anda memilih.

## Pola 3 — Bertambah/berkurang

Jumlah elemen bertambah dengan pola angka.

| Langkah | Gambar | Jumlah |
| --- | --- | --- |
| 1 | ■ | 1 |
| 2 | ■■■ | 3 |
| 3 | ■■■■■ | 5 |
| 4 | ? | 7 |

Polanya +2, jadi gambar ke-4 berisi **7 persegi**.

## Pola 4 — Setengah lingkaran berputar

◐ (kiri hitam) → ◓ (atas hitam) → ◑ (kanan hitam) → ◒ (bawah hitam) → ◐ …

Bagian hitam berputar 90° searah jarum jam setiap langkah, berulang setiap 4 suku.

## Contoh terbimbing

**Soal.** ↑, ↗, →, ↘, ↓, …

1. Setiap langkah: putar 45° searah jarum jam.
2. ↓ diputar 45° searah jarum jam → **↙**.

**Soal.** ●○○○, ○●○○, ○○●○, ○○○●, ●○○○, ○●○○, …

1. Bulatan hitam bergeser satu sel ke kanan.
2. Dari ○○○● kembali ke ●○○○ → pola **melingkar**.
3. Berikutnya setelah ○●○○ → **○○●○**.

## Latihan tambahan

**Contoh pola memantul.** ●○○, ○●○, ○○●, ○●○, ●○○, …

- Bulatan hitam bergerak ke kanan sampai ujung, lalu **berbalik** ke kiri.
- Setelah ●○○ (kembali di ujung kiri), bulatan berbalik lagi ke kanan → **○●○**.

**Contoh rotasi berlawanan arah jarum jam.** Panah mulai ↑ dan berputar 90° berlawanan arah jarum jam setiap langkah. Suku ke-7?

1. Total putaran $= (7 - 1) \times 90^\circ = 540^\circ$.
2. $540^\circ - 360^\circ = 180^\circ$.
3. ↑ diputar 180° → **↓** (arah putaran tidak berpengaruh untuk 180°).

## Ringkasan

- Serial gambar = deret dengan langkah tetap (rotasi, geser, tambah).
- Rotasi 90° berulang tiap 4 suku; 45° tiap 8 suku.
- Untuk pergeseran, perhatikan perilaku di ujung: melingkar atau memantul.

## Tips cepat

1. Beri nomor setiap suku dan catat perubahan antar suku.
2. Gunakan sisa bagi untuk suku yang jauh.
3. Jika ragu, cocokkan setiap pilihan dengan **dua** suku terakhir, bukan hanya satu.
$md$,
   true, 2, 14),
  ('tiu-serial-gambar', 'Serial Gambar dengan Dua Aturan Sekaligus', 'tiu-serial-gambar-pola-ganda', 'Memisahkan aturan arah, jumlah, warna, dan posisi yang berjalan bersamaan dalam satu serial.',
$md$
## Mengapa dua aturan?

Soal serial yang lebih sulit menggabungkan **dua atau lebih aturan** yang berjalan bersamaan, misalnya panah yang berputar sambil bertambah jumlahnya, atau bulatan yang bertambah sambil berganti warna.

> **Tips ujian:** Buat tabel dengan satu kolom per aturan. Setiap kolom diperlakukan sebagai deret tersendiri.

## Contoh 1 — Arah + jumlah

Serial: ↑, →→, ↓↓↓, ←←←←, …

| Suku | Arah | Jumlah |
| --- | --- | --- |
| 1 | ↑ | 1 |
| 2 | → | 2 |
| 3 | ↓ | 3 |
| 4 | ← | 4 |
| 5 | **↑** | **5** |

- Arah: putar 90° searah jarum jam → setelah ← kembali ↑.
- Jumlah: +1 setiap suku.
- Suku ke-5: **↑↑↑↑↑**.

## Contoh 2 — Jumlah + warna

Serial: ●, ○○, ●●●, ○○○○, …

| Suku | Warna | Jumlah |
| --- | --- | --- |
| 1 | hitam | 1 |
| 2 | putih | 2 |
| 3 | hitam | 3 |
| 4 | putih | 4 |
| 5 | **hitam** | **5** |

Jawaban: **●●●●●**.

## Contoh 3 — Posisi + perubahan bentuk

Serial: ▲□□, □▲□, □□▲, ▼□□, □▼□, …

1. Segitiga bergeser satu sel ke kanan setiap langkah.
2. Ketika "melompat" kembali ke sel pertama, segitiga **dibalik** (▲ menjadi ▼).
3. Setelah □▼□, segitiga bergeser ke sel ketiga → **□□▼**.

## Contoh 4 — Pola selang-seling gambar

Kadang serial gambar adalah gabungan dua serial yang muncul bergantian, mirip deret selang-seling:

```
Suku :  1    2    3    4    5    6    7
Gambar: ↑    ■    →    ■■   ↓    ■■■  ?
```

- Suku ganjil: panah berputar 90° (↑, →, ↓) → suku 7 = **←**.
- Suku genap: persegi bertambah satu.

## Daftar aturan yang sering digabung

| Aturan A | Aturan B | Contoh |
| --- | --- | --- |
| Rotasi 90° | Jumlah +1 | ↑, →→, ↓↓↓ |
| Warna bergantian | Jumlah +1 | ●, ○○, ●●● |
| Geser posisi | Balik saat kembali | ▲□□ → □▲□ → □□▲ → ▼□□ |
| Rotasi 45° | Warna bergantian | ↑ hitam, ↗ putih, → hitam |

## Strategi menjawab

1. **Pisahkan** komponen gambar (arah, jumlah, warna, posisi).
2. **Tentukan** pola tiap komponen seperti deret angka.
3. **Gabungkan** hasil semua komponen untuk suku berikutnya.
4. **Eliminasi**: pilihan yang salah pada satu komponen langsung gugur.

## Contoh 5 — Rotasi + warna

Serial: ↑ (hitam), ↗ (putih), → (hitam), ↘ (putih), …

| Suku | Arah | Warna |
| --- | --- | --- |
| 1 | ↑ | hitam |
| 2 | ↗ | putih |
| 3 | → | hitam |
| 4 | ↘ | putih |
| 5 | **↓** | **hitam** |

- Arah: putar 45° searah jarum jam.
- Warna: bergantian; suku ganjil hitam.

### Latihan eliminasi

Jika pilihan untuk suku ke-5 adalah: (A) ↓ putih, (B) ↙ hitam, (C) ↓ hitam, (D) → hitam, (E) ↘ hitam:

1. Aturan warna (suku ganjil hitam) → A gugur.
2. Aturan arah (↘ diputar 45° = ↓) → B, D, E gugur.
3. Tersisa **C**.

## Ringkasan

- Serial sulit = beberapa deret sederhana yang berjalan bersamaan.
- Buat tabel satu kolom per aturan.
- Waspadai serial selang-seling (dua pola bergantian).

## Tips cepat

1. Hitung jumlah elemen setiap suku dan tuliskan angkanya.
2. Tandai warna dengan H (hitam) dan P (putih) agar polanya terlihat.
3. Eliminasi dimulai dari komponen yang paling mudah dicek, biasanya jumlah.
$md$,
   false, 3, 13)
) as v(sub, title, slug, summary, content, is_free, sort_order, est_minutes)
join public.subtopics s on s.slug = v.sub
on conflict (slug) do nothing;

insert into public.questions (test_code, subtopic_id, stem, options, explanation, difficulty, usage, status, source, year)
select 'TIU'::public.test_code, s.id, v.stem,
       jsonb_build_array(
         jsonb_build_object('label','A','text',v.a,'points',v.pa),
         jsonb_build_object('label','B','text',v.b,'points',v.pb),
         jsonb_build_object('label','C','text',v.c,'points',v.pc),
         jsonb_build_object('label','D','text',v.d,'points',v.pd),
         jsonb_build_object('label','E','text',v.e,'points',v.pe)),
       v.expl, v.diff::public.difficulty, 'both'::public.question_usage, 'published'::public.content_status, 'SiapASN original', 2026
from (values
  ('tiu-analogi', 'PENA : MENULIS = GUNTING : …', 'Kertas', 'Tajam', 'Penjahit', 'Memotong', 'Menjahit', 0, 0, 0, 5, 0, 'Hubungan alat dan fungsinya: pena digunakan untuk menulis, gunting digunakan untuk memotong.', 'easy'),
  ('tiu-analogi', 'PANAS : DINGIN = TERANG : …', 'Cahaya', 'Silau', 'Lampu', 'Gelap', 'Siang', 0, 0, 0, 5, 0, 'Hubungan antonim: lawan kata panas adalah dingin, lawan kata terang adalah gelap.', 'easy'),
  ('tiu-analogi', 'JARUM : PENJAHIT = CANGKUL : …', 'Sawah', 'Tanah', 'Menggali', 'Kebun', 'Petani', 0, 0, 0, 0, 5, 'Hubungan alat dan pelaku: jarum adalah alat kerja penjahit, cangkul adalah alat kerja petani. Sawah dan kebun adalah tempat, bukan pelaku.', 'easy'),
  ('tiu-analogi', 'RODA : MOBIL = DAUN : …', 'Pohon', 'Hijau', 'Klorofil', 'Gugur', 'Fotosintesis', 5, 0, 0, 0, 0, 'Hubungan bagian dan keseluruhan: roda adalah bagian dari mobil, daun adalah bagian dari pohon.', 'easy'),
  ('tiu-analogi', 'HUJAN LEBAT : BANJIR = KEMARAU PANJANG : …', 'Kekeringan', 'Musim', 'Matahari', 'Awan', 'Gerah', 5, 0, 0, 0, 0, 'Hubungan sebab-akibat: hujan lebat dapat menyebabkan banjir, kemarau panjang dapat menyebabkan kekeringan.', 'medium'),
  ('tiu-analogi', 'NAKHODA : KAPAL = PILOT : …', 'Pesawat', 'Bandara', 'Terbang', 'Pramugari', 'Landasan', 5, 0, 0, 0, 0, 'Pelaku dan kendaraan yang dikemudikannya: nakhoda mengemudikan kapal, pilot mengemudikan pesawat. Bandara adalah tempat, bukan kendaraan.', 'easy'),
  ('tiu-analogi', 'DETIK : MENIT = MENIT : …', 'Jam', 'Hari', 'Detik', 'Waktu', 'Arloji', 5, 0, 0, 0, 0, 'Hubungan tingkatan satuan: 60 detik membentuk 1 menit, 60 menit membentuk 1 jam (satu tingkat di atasnya).', 'easy'),
  ('tiu-analogi', 'HARIMAU : KARNIVORA = KAMBING : …', 'Omnivora', 'Mamalia', 'Rumput', 'Kandang', 'Herbivora', 0, 0, 0, 0, 5, 'Hewan dan golongan berdasarkan jenis makanannya: harimau pemakan daging (karnivora), kambing pemakan tumbuhan (herbivora). Mamalia adalah golongan berdasarkan ciri lain.', 'medium'),
  ('tiu-analogi', 'KEPOMPONG : KUPU-KUPU = BERUDU : …', 'Ikan', 'Kecebong', 'Kolam', 'Ulat', 'Katak', 0, 0, 0, 0, 5, 'Tahap muda dan bentuk dewasanya: kepompong berkembang menjadi kupu-kupu, berudu berkembang menjadi katak. Kecebong adalah sinonim berudu, bukan bentuk dewasanya.', 'medium'),
  ('tiu-analogi', 'MAHIR : TERAMPIL = LALAI : …', 'Rajin', 'Tekun', 'Cermat', 'Lambat', 'Abai', 0, 0, 0, 0, 5, 'Hubungan sinonim: mahir sama artinya dengan terampil, lalai sama artinya dengan abai.', 'medium'),
  ('tiu-analogi', 'DESA : KECAMATAN = KABUPATEN : …', 'Kota', 'Provinsi', 'Kelurahan', 'Bupati', 'Kecamatan', 0, 5, 0, 0, 0, 'Hubungan tingkatan wilayah satu tingkat di atasnya: desa berada di bawah kecamatan, kabupaten berada di bawah provinsi. Kota setingkat dengan kabupaten.', 'medium'),
  ('tiu-analogi', 'OPTIMIS : PESIMIS = PROGRESIF : …', 'Agresif', 'Maju', 'Liberal', 'Modern', 'Konservatif', 0, 0, 0, 0, 5, 'Hubungan antonim: optimis berlawanan dengan pesimis; progresif (menginginkan kemajuan/perubahan) berlawanan dengan konservatif (mempertahankan keadaan). Maju dan modern justru bersinonim dengan progresif.', 'hard'),
  ('tiu-analogi', 'Pasangan kata yang memiliki hubungan sama dengan TERMOMETER : SUHU adalah …', 'Speedometer : jarak', 'Higrometer : hujan', 'Penggaris : kertas', 'Anemometer : suhu', 'Barometer : tekanan udara', 0, 0, 0, 0, 5, 'Termometer adalah alat untuk mengukur suhu; barometer adalah alat untuk mengukur tekanan udara. Speedometer mengukur kecepatan, higrometer mengukur kelembapan, dan anemometer mengukur kecepatan angin.', 'medium'),
  ('tiu-analogi', 'Pasangan kata yang memiliki hubungan sama dengan PENULIS : NASKAH adalah …', 'Pembaca : buku', 'Guru : murid', 'Penerbit : percetakan', 'Arsitek : rancangan bangunan', 'Dokter : rumah sakit', 0, 0, 0, 5, 0, 'Pelaku dan hasil karyanya: penulis menghasilkan naskah, arsitek menghasilkan rancangan bangunan. Pembaca hanya menikmati buku, bukan menghasilkannya.', 'medium'),
  ('tiu-analogi', 'Pasangan kata yang memiliki hubungan sama dengan VIRUS : PENYAKIT adalah …', 'Api : kebakaran', 'Asap : api', 'Dokter : pasien', 'Air : gelas', 'Buku : perpustakaan', 5, 0, 0, 0, 0, 'Hubungan sebab-akibat dengan arah sebab lalu akibat: virus menyebabkan penyakit, api menyebabkan kebakaran. Asap : api berarah terbalik (akibat : sebab).', 'hard'),
  ('tiu-analogi', 'BUKU : HALAMAN = RANTAI : …', 'Besi', 'Gembok', 'Sepeda', 'Mata rantai', 'Kunci', 0, 0, 0, 5, 0, 'Keseluruhan dan bagian penyusunnya: buku tersusun atas halaman-halaman, rantai tersusun atas mata-mata rantai.', 'medium'),
  ('tiu-analogi', 'DOKTER : DIAGNOSIS = HAKIM : …', 'Pengadilan', 'Terdakwa', 'Jaksa', 'Vonis', 'Palu', 0, 0, 0, 5, 0, 'Pelaku dan keputusan profesional yang dihasilkannya: dokter menetapkan diagnosis, hakim menjatuhkan vonis. Pengadilan adalah tempat, terdakwa adalah pihak yang diadili, palu adalah alat.', 'hard'),
  ('tiu-analogi', 'MATAHARI : SIANG = BULAN : …', 'Bintang', 'Purnama', 'Langit', 'Gerhana', 'Malam', 0, 0, 0, 0, 5, 'Benda langit dan waktu kemunculannya yang khas: matahari menerangi siang hari, bulan tampak pada malam hari.', 'easy'),
  ('tiu-silogisme', 'Semua ASN wajib mengikuti apel pagi. Rudi adalah ASN. Kesimpulan yang tepat adalah …', 'Rudi tidak wajib mengikuti apel pagi', 'Rudi wajib mengikuti apel pagi', 'Sebagian ASN tidak mengikuti apel pagi', 'Semua yang mengikuti apel pagi adalah ASN', 'Rudi mungkin bukan ASN', 0, 5, 0, 0, 0, 'Modus ponens kategoris: Rudi termasuk himpunan ASN, sedangkan semua ASN wajib apel, sehingga Rudi wajib mengikuti apel pagi.', 'easy'),
  ('tiu-silogisme', 'Jika hujan turun, jalan menjadi licin. Jalan tidak licin. Kesimpulan yang tepat adalah …', 'Hujan turun', 'Jalan licin karena hal lain', 'Hujan turun tetapi jalan kering', 'Tidak dapat ditarik kesimpulan', 'Hujan tidak turun', 0, 0, 0, 0, 5, 'Modus tollens: p ⇒ q dan bukan q, maka bukan p. Karena jalan tidak licin, hujan tidak turun.', 'easy'),
  ('tiu-silogisme', 'Jika Andi rajin belajar, ia lulus ujian. Jika Andi lulus ujian, ia diterima bekerja. Kesimpulan yang sah adalah …', 'Jika Andi diterima bekerja, ia rajin belajar', 'Jika Andi tidak rajin belajar, ia tidak diterima bekerja', 'Andi rajin belajar', 'Jika Andi rajin belajar, ia diterima bekerja', 'Andi lulus ujian', 0, 0, 0, 5, 0, 'Silogisme hipotetis: p ⇒ q dan q ⇒ r menghasilkan p ⇒ r. Pilihan lain merupakan konvers, invers, atau fakta yang tidak dinyatakan premis.', 'medium'),
  ('tiu-silogisme', 'Tidak ada kucing yang dapat terbang. Semua hewan peliharaan Bu Sari adalah kucing. Kesimpulan yang tepat adalah …', 'Tidak ada hewan peliharaan Bu Sari yang dapat terbang', 'Sebagian hewan peliharaan Bu Sari dapat terbang', 'Semua hewan yang tidak dapat terbang adalah kucing', 'Bu Sari tidak memiliki hewan peliharaan', 'Semua kucing adalah hewan peliharaan Bu Sari', 5, 0, 0, 0, 0, 'Hewan peliharaan Bu Sari seluruhnya termasuk himpunan kucing, sedangkan himpunan kucing terpisah dari yang dapat terbang. Jadi tidak ada hewan peliharaan Bu Sari yang dapat terbang.', 'medium'),
  ('tiu-silogisme', 'Negasi dari pernyataan "Semua peserta lulus tes" adalah …', 'Semua peserta tidak lulus tes', 'Ada peserta yang tidak lulus tes', 'Tidak ada peserta yang lulus tes', 'Sebagian peserta lulus tes', 'Ada peserta yang lulus tes', 0, 5, 0, 0, 0, 'Negasi dari "semua A adalah B" adalah "ada (sebagian) A yang bukan B". Pernyataan "semua peserta tidak lulus" terlalu kuat dan bukan negasinya.', 'medium'),
  ('tiu-silogisme', 'Negasi dari pernyataan "Jika harga naik, maka permintaan turun" adalah …', 'Harga naik dan permintaan tidak turun', 'Jika harga tidak naik, maka permintaan tidak turun', 'Jika permintaan turun, maka harga naik', 'Harga tidak naik dan permintaan turun', 'Harga tidak naik atau permintaan turun', 5, 0, 0, 0, 0, 'Negasi implikasi p ⇒ q adalah p ∧ ¬q, yaitu "harga naik dan permintaan tidak turun". Pilihan "harga tidak naik atau permintaan turun" justru setara dengan pernyataan awal.', 'hard'),
  ('tiu-silogisme', 'Pernyataan yang setara (ekuivalen) dengan "Jika lampu menyala, maka ada aliran listrik" adalah …', 'Jika ada aliran listrik, maka lampu menyala', 'Jika lampu tidak menyala, maka tidak ada aliran listrik', 'Lampu menyala dan tidak ada aliran listrik', 'Lampu menyala dan ada aliran listrik', 'Jika tidak ada aliran listrik, maka lampu tidak menyala', 0, 0, 0, 0, 5, 'Implikasi p ⇒ q setara dengan kontraposisinya ¬q ⇒ ¬p. Pilihan lain adalah konvers, invers, atau bentuk konjungsi yang tidak setara.', 'medium'),
  ('tiu-silogisme', 'Dina pergi ke perpustakaan atau ke kantin. Dina tidak pergi ke kantin. Kesimpulan yang tepat adalah …', 'Dina tidak pergi ke perpustakaan', 'Dina pergi ke perpustakaan dan ke kantin', 'Dina pergi ke perpustakaan', 'Dina tidak pergi ke mana pun', 'Tidak dapat ditarik kesimpulan', 0, 0, 5, 0, 0, 'Silogisme disjungtif: p atau q, dan bukan q, maka p. Dina pasti pergi ke perpustakaan.', 'easy'),
  ('tiu-silogisme', 'Semua atlet berbadan sehat. Sebagian mahasiswa adalah atlet. Kesimpulan yang tepat adalah …', 'Semua mahasiswa berbadan sehat', 'Semua yang berbadan sehat adalah atlet', 'Sebagian mahasiswa tidak berbadan sehat', 'Sebagian mahasiswa berbadan sehat', 'Tidak ada mahasiswa yang berbadan sehat', 0, 0, 0, 5, 0, 'Mahasiswa yang merupakan atlet pasti berbadan sehat, sehingga sebagian mahasiswa berbadan sehat. Tentang mahasiswa lain tidak ada informasi.', 'medium'),
  ('tiu-silogisme', 'Semua dokter di rumah sakit itu memakai jas putih. Pak Budi memakai jas putih. Kesimpulan yang tepat adalah …', 'Pak Budi adalah dokter di rumah sakit itu', 'Pak Budi bukan dokter', 'Belum dapat dipastikan Pak Budi seorang dokter', 'Semua yang memakai jas putih adalah dokter', 'Sebagian dokter tidak memakai jas putih', 0, 0, 5, 0, 0, 'Premis hanya menyatakan dokter ⊂ berjas putih. Orang berjas putih bisa saja bukan dokter, sehingga status Pak Budi tidak dapat dipastikan (kesalahan term tengah tidak tersebar).', 'medium'),
  ('tiu-silogisme', 'Jika kantor menerapkan layanan digital, pelayanan menjadi cepat. Jika pelayanan cepat, kepuasan masyarakat meningkat. Kepuasan masyarakat tidak meningkat. Kesimpulan yang tepat adalah …', 'Kantor menerapkan layanan digital', 'Kantor tidak menerapkan layanan digital', 'Pelayanan menjadi cepat', 'Pelayanan cepat tetapi kepuasan tidak meningkat', 'Kantor menerapkan layanan digital tetapi pelayanan lambat', 0, 5, 0, 0, 0, 'Rantai p ⇒ q ⇒ r memberi p ⇒ r. Karena r salah (kepuasan tidak meningkat), dengan modus tollens p juga salah: kantor tidak menerapkan layanan digital.', 'hard'),
  ('tiu-silogisme', 'Tidak ada pegawai yang terlambat mendapat bonus. Sebagian pegawai bagian keuangan terlambat. Kesimpulan yang tepat adalah …', 'Sebagian pegawai bagian keuangan tidak mendapat bonus', 'Semua pegawai bagian keuangan tidak mendapat bonus', 'Semua pegawai bagian keuangan mendapat bonus', 'Tidak ada pegawai bagian keuangan yang mendapat bonus', 'Sebagian pegawai yang mendapat bonus terlambat', 5, 0, 0, 0, 0, 'Pegawai keuangan yang terlambat pasti tidak mendapat bonus, sehingga sebagian pegawai keuangan tidak mendapat bonus. Pegawai keuangan yang tidak terlambat tidak dapat dipastikan.', 'hard'),
  ('tiu-silogisme', 'Negasi dari pernyataan "Rina membawa payung atau jas hujan" adalah …', 'Rina tidak membawa payung dan tidak membawa jas hujan', 'Rina tidak membawa payung atau tidak membawa jas hujan', 'Rina membawa payung dan jas hujan', 'Rina tidak membawa payung tetapi membawa jas hujan', 'Rina membawa payung tetapi tidak membawa jas hujan', 5, 0, 0, 0, 0, 'Hukum De Morgan: ¬(p ∨ q) ≡ ¬p ∧ ¬q. Jadi Rina tidak membawa keduanya.', 'medium'),
  ('tiu-silogisme', 'Negasi dari pernyataan "Toko itu buka dan pembelinya ramai" adalah …', 'Toko itu tidak buka dan pembelinya tidak ramai', 'Toko itu buka atau pembelinya ramai', 'Toko itu tidak buka atau pembelinya tidak ramai', 'Toko itu tutup dan pembelinya ramai', 'Jika toko itu buka, pembelinya ramai', 0, 0, 5, 0, 0, 'Hukum De Morgan: ¬(p ∧ q) ≡ ¬p ∨ ¬q. Kata "dan" berubah menjadi "atau" dan setiap komponen dinegasikan.', 'medium'),
  ('tiu-silogisme', 'Pernyataan yang setara dengan "Jika Sinta lulus, ia mentraktir temannya" adalah …', 'Sinta lulus atau ia mentraktir temannya', 'Sinta lulus dan ia tidak mentraktir temannya', 'Sinta tidak lulus atau ia mentraktir temannya', 'Jika Sinta mentraktir temannya, ia lulus', 'Sinta tidak lulus dan ia tidak mentraktir temannya', 0, 0, 5, 0, 0, 'p ⇒ q setara dengan ¬p ∨ q, yaitu "Sinta tidak lulus atau ia mentraktir temannya". Pilihan "lulus dan tidak mentraktir" adalah negasinya, sedangkan "jika mentraktir, ia lulus" adalah konvers.', 'hard'),
  ('tiu-silogisme', 'Semua mamalia bernapas dengan paru-paru. Semua paus adalah mamalia. Kesimpulan yang tepat adalah …', 'Sebagian paus bernapas dengan insang', 'Semua paus bernapas dengan paru-paru', 'Semua yang bernapas dengan paru-paru adalah paus', 'Sebagian mamalia adalah ikan', 'Tidak ada paus yang bernapas dengan paru-paru', 0, 5, 0, 0, 0, 'Paus ⊂ mamalia ⊂ bernapas dengan paru-paru, sehingga semua paus bernapas dengan paru-paru.', 'easy'),
  ('tiu-silogisme', 'Semua mangga di kebun Pak Tarno terasa manis. Tidak ada buah yang terasa manis dijual murah oleh Pak Tarno. Kesimpulan yang tepat adalah …', 'Sebagian mangga dari kebun Pak Tarno dijual murah', 'Tidak ada mangga dari kebun Pak Tarno yang dijual murah', 'Semua buah yang tidak dijual murah adalah mangga', 'Semua buah manis adalah mangga', 'Sebagian buah yang dijual murah adalah mangga dari kebun Pak Tarno', 0, 5, 0, 0, 0, 'Mangga kebun ⊂ buah manis, dan buah manis terpisah dari buah yang dijual murah. Maka tidak ada mangga kebun Pak Tarno yang dijual murah.', 'medium'),
  ('tiu-analitis', 'Lima orang P, Q, R, S, dan T mengantre. R berada paling depan dan T paling belakang. P tepat di belakang R. S berada di depan Q. Siapa yang berada di urutan ketiga dari depan?', 'S', 'P', 'Q', 'R', 'T', 5, 0, 0, 0, 0, 'Urutan: R paling depan, P kedua, T kelima. Urutan 3 dan 4 diisi S dan Q dengan S di depan Q, sehingga susunannya R, P, S, Q, T.', 'easy'),
  ('tiu-analitis', 'Ani lebih tinggi dari Budi. Citra lebih pendek dari Budi. Dedi lebih tinggi dari Ani. Eka lebih pendek dari Ani tetapi lebih tinggi dari Budi. Siapa yang menempati urutan ketiga tertinggi?', 'Ani', 'Budi', 'Dedi', 'Citra', 'Eka', 0, 0, 0, 0, 5, 'Gabungan syarat: Dedi > Ani > Eka > Budi > Citra. Urutan ketiga tertinggi adalah Eka.', 'medium'),
  ('tiu-analitis', 'Lima orang A, B, C, D, E duduk berjajar pada kursi 1–5 dari kiri ke kanan. C duduk di kursi 3. A duduk tepat di sebelah kiri C. E tidak duduk di ujung. D duduk tepat di sebelah kanan E. Siapa yang duduk di kursi paling kiri?', 'B', 'A', 'C', 'D', 'E', 5, 0, 0, 0, 0, 'C di kursi 3 dan A di kursi 2. Kursi tersisa 1, 4, 5; E bukan di ujung sehingga E di kursi 4, D di kursi 5, dan B di kursi 1.', 'medium'),
  ('tiu-analitis', 'Lima pelatihan K, L, M, N, O dijadwalkan Senin sampai Jumat, satu pelatihan per hari. M pada hari Rabu dan O pada hari Jumat. K dilaksanakan sebelum M tetapi tidak pada hari Senin. L dilaksanakan setelah N. Pelatihan apa yang dilaksanakan hari Kamis?', 'K', 'L', 'M', 'N', 'O', 0, 5, 0, 0, 0, 'K harus sebelum Rabu dan bukan Senin, jadi Selasa. Senin dan Kamis tersisa untuk N dan L; karena L setelah N, N hari Senin dan L hari Kamis.', 'medium'),
  ('tiu-analitis', 'Salah satu dari Ari, Beni, atau Cici memecahkan gelas. Ari berkata, "Beni pelakunya." Beni berkata, "Bukan saya pelakunya." Cici berkata, "Bukan saya pelakunya." Jika hanya satu dari mereka yang berkata benar, siapa pelakunya?', 'Ari', 'Beni', 'Ari dan Beni', 'Tidak dapat ditentukan', 'Cici', 0, 0, 0, 0, 5, 'Jika pelakunya Ari, pernyataan Beni dan Cici benar (2 benar). Jika Beni, pernyataan Ari dan Cici benar (2 benar). Jika Cici, hanya pernyataan Beni yang benar (1 benar), sesuai syarat.', 'hard'),
  ('tiu-analitis', 'Dian, Eko, dan Fani masing-masing memiliki satu hobi berbeda: renang, catur, atau melukis. Dian tidak menyukai renang maupun catur. Eko tidak menyukai renang. Apa hobi Fani?', 'Catur', 'Melukis', 'Catur atau melukis', 'Renang', 'Tidak dapat ditentukan', 0, 0, 0, 5, 0, 'Dian hanya mungkin melukis. Eko bukan renang dan melukis sudah milik Dian, jadi Eko catur. Fani mendapat hobi yang tersisa, yaitu renang.', 'easy'),
  ('tiu-analitis', 'Gita lebih tua dari Hana. Hana lebih tua dari Indra. Joko lebih muda dari Indra. Kiki lebih tua dari Gita. Siapakah orang termuda kedua?', 'Joko', 'Hana', 'Gita', 'Indra', 'Kiki', 0, 0, 0, 5, 0, 'Urutan dari tertua: Kiki > Gita > Hana > Indra > Joko. Termuda adalah Joko, termuda kedua adalah Indra.', 'medium'),
  ('tiu-analitis', 'Jika Lia ikut lomba, Mira ikut lomba. Jika Mira ikut lomba, Nina tidak ikut lomba. Ternyata Nina ikut lomba. Kesimpulan yang tepat adalah …', 'Lia ikut lomba, tetapi Mira tidak', 'Mira ikut lomba', 'Lia dan Mira tidak ikut lomba', 'Lia ikut lomba', 'Mira ikut lomba, tetapi Lia tidak', 0, 0, 5, 0, 0, 'Nina ikut, sehingga dari kontraposisi syarat kedua Mira tidak ikut. Karena Mira tidak ikut, dari kontraposisi syarat pertama Lia juga tidak ikut.', 'hard'),
  ('tiu-analitis', 'Empat orang A, B, C, D duduk mengelilingi meja persegi, satu orang di setiap sisi. A duduk berhadapan dengan C, dan B duduk di sebelah kanan A. Siapa yang duduk berhadapan dengan B?', 'A', 'D', 'C', 'B sendiri', 'Tidak dapat ditentukan', 0, 5, 0, 0, 0, 'Pada meja persegi hanya ada dua pasang posisi berhadapan. A berhadapan dengan C, sehingga dua orang sisanya, B dan D, pasti saling berhadapan.', 'easy'),
  ('tiu-analitis', 'Tiga kotak berwarna merah, biru, dan hijau masing-masing berisi satu benda berbeda: bola, buku, atau pena. Kotak merah tidak berisi bola. Kotak biru berisi pena. Apa isi kotak hijau?', 'Buku', 'Bola', 'Pena', 'Buku atau bola', 'Tidak dapat ditentukan', 0, 5, 0, 0, 0, 'Kotak biru berisi pena. Kotak merah tidak berisi bola, jadi berisi buku. Kotak hijau berisi benda yang tersisa, yaitu bola.', 'easy'),
  ('tiu-analitis', 'Kantor A, B, C, D, dan E menempati lantai 1 sampai 5 sebuah gedung, satu kantor per lantai. B berada di lantai paling atas. D tepat di bawah B. E berada di lantai 1. A berada di lantai yang lebih rendah daripada C. Kantor apa yang berada di lantai 3?', 'C', 'A', 'B', 'D', 'E', 5, 0, 0, 0, 0, 'B di lantai 5, D di lantai 4, E di lantai 1. Lantai 2 dan 3 untuk A dan C dengan A lebih rendah, sehingga A di lantai 2 dan C di lantai 3.', 'medium'),
  ('tiu-analitis', 'Nilai ujian lima siswa P, Q, R, S, T berbeda-beda. Nilai Q lebih tinggi dari R tetapi lebih rendah dari T. Nilai S lebih tinggi dari T. Nilai P paling rendah. Siapa yang menempati peringkat kedua?', 'T', 'S', 'Q', 'R', 'P', 5, 0, 0, 0, 0, 'Dari syarat: S > T > Q > R, dan P paling rendah. Urutan lengkap S, T, Q, R, P, sehingga peringkat kedua adalah T.', 'medium'),
  ('tiu-analitis', 'Sedan, truk, bus, motor, dan van diparkir berderet di petak 1–5. Bus berada di petak 1 atau 5. Motor berada di petak 3. Van tidak bersebelahan dengan motor. Sedan dan truk tidak bersebelahan. Pernyataan yang pasti benar adalah …', 'Bus berada di petak 1', 'Sedan berada di petak 2', 'Truk bersebelahan dengan van', 'Van berada di salah satu petak ujung', 'Motor bersebelahan dengan bus', 0, 0, 0, 5, 0, 'Van tidak boleh di petak 2 atau 4 (bersebelahan dengan motor di petak 3), jadi van di petak 1 atau 5. Bus mengisi ujung lainnya, sedan dan truk di petak 2 dan 4 dengan urutan bebas. Hanya pernyataan tentang van yang benar di semua susunan; motor justru tidak pernah bersebelahan dengan bus.', 'hard'),
  ('tiu-analitis', 'Hari ini hari Rabu. Hari apakah 100 hari lagi?', 'Jumat', 'Kamis', 'Sabtu', 'Selasa', 'Senin', 5, 0, 0, 0, 0, '100 = 14 × 7 + 2, sisa 2. Rabu ditambah 2 hari adalah Jumat.', 'medium'),
  ('tiu-analitis', 'Kotak W lebih berat dari kotak X. Kotak Y lebih ringan dari kotak Z tetapi lebih berat dari kotak W. Urutan kotak dari yang terberat adalah …', 'Y, Z, W, X', 'Z, W, Y, X', 'Z, Y, X, W', 'Z, Y, W, X', 'X, W, Y, Z', 0, 0, 0, 5, 0, 'Dari syarat: Z > Y, Y > W, dan W > X. Gabungannya Z > Y > W > X.', 'medium'),
  ('tiu-analitis', 'Terdapat tiga pintu dan tepat satu pintu menyimpan hadiah. Tulisan di pintu 1: "Hadiah ada di pintu ini." Pintu 2: "Hadiah tidak ada di pintu ini." Pintu 3: "Hadiah tidak ada di pintu 1." Jika tepat satu tulisan yang benar, hadiah ada di pintu …', '1', '3', '1 atau 3', 'Tidak dapat ditentukan', '2', 0, 0, 0, 0, 5, 'Jika hadiah di pintu 1, tulisan 1 dan 2 benar (dua benar). Jika di pintu 3, tulisan 2 dan 3 benar (dua benar). Jika di pintu 2, hanya tulisan 3 yang benar, sesuai syarat.', 'hard'),
  ('tiu-berhitung', 'Hasil dari 25% × 480 + 1/3 × 270 adalah …', '210', '200', '220', '190', '230', 5, 0, 0, 0, 0, '25% × 480 = 120 dan 1/3 × 270 = 90, sehingga 120 + 90 = 210.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 0,75 × 64 − 1,5 × 12 adalah …', '28', '30', '32', '36', '24', 0, 5, 0, 0, 0, '0,75 × 64 = 48 dan 1,5 × 12 = 18, sehingga 48 − 18 = 30.', 'easy'),
  ('tiu-berhitung', 'Hasil dari √196 + ∛125 adalah …', '18', '19', '21', '17', '24', 0, 5, 0, 0, 0, '√196 = 14 dan ∛125 = 5, sehingga 14 + 5 = 19.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 2⁵ × 2³ ÷ 2⁴ adalah …', '8', '32', '64', '16', '4', 0, 0, 0, 5, 0, 'Dengan sifat pangkat basis sama: 2^(5 + 3 − 4) = 2⁴ = 16.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 3/4 + 5/6 − 2/3 adalah …', '1', '7/12', '11/12', '5/6', '13/12', 0, 0, 5, 0, 0, 'Samakan penyebut menjadi 12: 9/12 + 10/12 − 8/12 = 11/12.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 99 × 87 adalah …', '8.623', '8.513', '8.613', '8.703', '8.603', 0, 0, 5, 0, 0, '99 × 87 = 100 × 87 − 87 = 8.700 − 87 = 8.613.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 47² adalah …', '2.109', '2.219', '2.209', '2.309', '2.199', 0, 0, 5, 0, 0, '47² = (50 − 3)² = 2.500 − 300 + 9 = 2.209.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 125 × 48 adalah …', '5.800', '6.200', '6.400', '5.600', '6.000', 0, 0, 0, 0, 5, '125 = 1.000/8, sehingga 125 × 48 = 1.000 × 48/8 = 1.000 × 6 = 6.000.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 1,25 ÷ 0,05 adalah …', '25', '2,5', '250', '0,25', '20', 5, 0, 0, 0, 0, 'Kalikan keduanya dengan 100: 125 ÷ 5 = 25.', 'easy'),
  ('tiu-berhitung', 'Jika x = 0,4 dan y = 2,5, maka nilai (x + y)² − 2xy adalah …', '8,41', '6,25', '4,41', '7,41', '6,41', 0, 0, 0, 0, 5, '(x + y)² − 2xy = x² + y² = 0,16 + 6,25 = 6,41.', 'medium'),
  ('tiu-berhitung', '12,5% dari 64 sama dengan berapa persen dari 32?', '25%', '20%', '40%', '12,5%', '50%', 5, 0, 0, 0, 0, '12,5% dari 64 = 64/8 = 8. Lalu 8/32 × 100% = 25%.', 'medium'),
  ('tiu-berhitung', 'Nilai yang paling mendekati hasil 49,8 × 20,1 adalah …', '1.000', '100', '10.000', '900', '1.100', 5, 0, 0, 0, 0, 'Bulatkan: 50 × 20 = 1.000. Hasil tepatnya 1.000,98, jadi paling dekat dengan 1.000.', 'easy'),
  ('tiu-berhitung', 'Hasil dari (1/2 + 1/3) ÷ (1/2 − 1/3) adalah …', '6', '1', '1/5', '3', '5', 0, 0, 0, 0, 5, '1/2 + 1/3 = 5/6 dan 1/2 − 1/3 = 1/6, sehingga 5/6 ÷ 1/6 = 5.', 'medium'),
  ('tiu-berhitung', 'Nilai dari 0,2% × 15.000 adalah …', '300', '3', '30', '3.000', '0,3', 0, 0, 5, 0, 0, '0,2% = 0,002, sehingga 0,002 × 15.000 = 30.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 1.001 × 37 adalah …', '3.737', '37.370', '37.307', '370.037', '37.037', 0, 0, 0, 0, 5, '1.001 × 37 = 37.000 + 37 = 37.037.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 63² − 37² adalah …', '2.500', '676', '2.700', '2.600', '1.600', 0, 0, 0, 5, 0, 'Gunakan a² − b² = (a + b)(a − b) = (63 + 37)(63 − 37) = 100 × 26 = 2.600.', 'hard'),
  ('tiu-berhitung', 'Hasil dari √0,0144 adalah …', '0,012', '0,12', '1,2', '0,0012', '0,144', 0, 5, 0, 0, 0, '√144 = 12, dan 0,0144 memiliki 4 angka desimal sehingga akarnya memiliki 2 angka desimal: 0,12. Cek: 0,12 × 0,12 = 0,0144.', 'hard'),
  ('tiu-berhitung', 'Hasil dari 1 + 2 + 3 + … + 50 adalah …', '1.250', '2.550', '1.275', '1.300', '1.225', 0, 0, 5, 0, 0, 'Gunakan rumus n(n + 1)/2 = 50 × 51/2 = 1.275.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 2¹⁰ − 2⁹ − 2⁸ adalah …', '128', '512', '0', '256', '384', 0, 0, 0, 5, 0, 'Faktorkan 2⁸: 2⁸(2² − 2 − 1) = 2⁸ × 1 = 256.', 'hard'),
  ('tiu-berhitung', 'Nilai dari 4/5 × 3/8 × 960 adalah …', '300', '360', '270', '288', '320', 0, 0, 0, 5, 0, '3/8 × 960 = 360, lalu 4/5 × 360 = 288.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 5, 12, 19, 26, …', '32', '34', '35', '31', '33', 0, 0, 0, 0, 5, 'Deret aritmetika dengan beda 7, sehingga 26 + 7 = 33.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 3, 6, 12, 24, …', '36', '42', '30', '96', '48', 0, 0, 0, 0, 5, 'Deret geometri dengan rasio 2, sehingga 24 × 2 = 48.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 100, 91, 82, 73, …', '64', '63', '65', '62', '66', 5, 0, 0, 0, 0, 'Setiap suku berkurang 9, sehingga 73 − 9 = 64.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 3, 5, 8, 13, …', '18', '20', '26', '21', '34', 0, 0, 0, 5, 0, 'Pola Fibonacci: setiap suku adalah jumlah dua suku sebelumnya, sehingga 8 + 13 = 21.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 4, 6, 10, 16, 24, …', '32', '34', '36', '30', '40', 0, 5, 0, 0, 0, 'Selisihnya 2, 4, 6, 8 (naik 2), sehingga selisih berikutnya 10: 24 + 10 = 34.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 1, 4, 9, 16, 25, …', '30', '35', '36', '49', '34', 0, 0, 5, 0, 0, 'Deret bilangan kuadrat 1², 2², 3², 4², 5², sehingga suku berikutnya 6² = 36.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 10, 4, 20, 6, 30, …', '40', '36', '8', '10', '12', 0, 0, 5, 0, 0, 'Deret selang-seling. Suku ganjil 2, 4, 6 (naik 2) dan suku genap 10, 20, 30. Suku ke-7 termasuk suku ganjil, yaitu 8.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 1, 8, 27, 64, …', '100', '81', '128', '216', '125', 0, 0, 0, 0, 5, 'Deret bilangan kubik 1³, 2³, 3³, 4³, sehingga suku berikutnya 5³ = 125.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 3, 4, 8, 17, 33, …', '49', '58', '54', '57', '66', 0, 5, 0, 0, 0, 'Selisihnya 1, 4, 9, 16 yaitu bilangan kuadrat 1², 2², 3², 4². Selisih berikutnya 5² = 25, sehingga 33 + 25 = 58.', 'hard'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 5, 11, 23, 47, …', '94', '93', '71', '95', '96', 0, 0, 0, 5, 0, 'Pola: setiap suku dikali 2 lalu ditambah 1. 47 × 2 + 1 = 95.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 1, 2, 6, 24, 120, …', '600', '240', '720', '840', '144', 0, 0, 5, 0, 0, 'Setiap suku dikalikan dengan 2, 3, 4, 5 secara berurutan, sehingga berikutnya 120 × 6 = 720.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 81, 27, 9, 3, …', '0', '1', '1/3', '2', '3/2', 0, 5, 0, 0, 0, 'Deret geometri dengan rasio 1/3, sehingga 3 × 1/3 = 1.', 'easy'),
  ('tiu-deret-angka', 'Tentukan huruf berikutnya: A, C, E, G, …', 'I', 'H', 'J', 'K', 'F', 5, 0, 0, 0, 0, 'A=1, C=3, E=5, G=7 (loncat satu huruf). Berikutnya 9 = I.', 'easy'),
  ('tiu-deret-angka', 'Tentukan huruf berikutnya: B, E, H, K, …', 'M', 'O', 'L', 'P', 'N', 0, 0, 0, 0, 5, 'B=2, E=5, H=8, K=11, selisih tetap 3. Berikutnya 14 = N.', 'medium'),
  ('tiu-deret-angka', 'Tentukan huruf berikutnya: Z, X, U, Q, …', 'M', 'K', 'N', 'J', 'L', 0, 0, 0, 0, 5, 'Z=26, X=24, U=21, Q=17 dengan selisih −2, −3, −4. Selisih berikutnya −5, sehingga 17 − 5 = 12 = L.', 'hard'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 7, 5, 10, 8, 16, 14, …', '28', '12', '30', '26', '32', 5, 0, 0, 0, 0, 'Pola bergantian dikurangi 2 lalu dikali 2: 7−2=5, 5×2=10, 10−2=8, 8×2=16, 16−2=14, maka 14×2=28.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 6, 7, 21, 22, 66, …', '198', '68', '67', '132', '88', 0, 0, 5, 0, 0, 'Pola bergantian dikali 3 lalu ditambah 1: 2×3=6, 6+1=7, 7×3=21, 21+1=22, 22×3=66, maka 66+1=67.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 0, 3, 8, 15, 24, …', '33', '36', '35', '34', '48', 0, 0, 5, 0, 0, 'Suku ke-n = n² − 1: 0, 3, 8, 15, 24, sehingga suku ke-6 = 36 − 1 = 35. Selisihnya juga 3, 5, 7, 9, 11.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 5, 7, 11, 19, 35, …', '51', '67', '65', '70', '69', 0, 5, 0, 0, 0, 'Selisihnya 2, 4, 8, 16 (dikali 2), sehingga selisih berikutnya 32: 35 + 32 = 67.', 'hard'),
  ('tiu-deret-angka', 'Tentukan suku berikutnya: A2, C4, E6, G8, …', 'H10', 'I10', 'I9', 'J10', 'H9', 0, 5, 0, 0, 0, 'Huruf meloncat satu (A, C, E, G, maka I) dan angka naik 2 (2, 4, 6, 8, maka 10). Jawabannya I10.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 6, 11, 21, 36, 56, …', '76', '81', '86', '80', '91', 0, 5, 0, 0, 0, 'Selisihnya 5, 10, 15, 20 (kelipatan 5), sehingga selisih berikutnya 25: 56 + 25 = 81.', 'hard'),
  ('tiu-perbandingan', 'Harga 4 pulpen adalah Rp14.000. Harga 10 pulpen yang sama adalah …', 'Rp34.000', 'Rp36.000', 'Rp35.000', 'Rp40.000', 'Rp28.000', 0, 0, 5, 0, 0, 'Perbandingan senilai: harga 1 pulpen = 14.000 ÷ 4 = 3.500, sehingga 10 pulpen = Rp35.000.', 'easy'),
  ('tiu-perbandingan', 'Pada peta berskala 1 : 250.000, jarak dua kota adalah 6 cm. Jarak sebenarnya kedua kota tersebut adalah …', '1,5 km', '150 km', '15 km', '25 km', '12,5 km', 0, 0, 5, 0, 0, 'Jarak sebenarnya = 6 × 250.000 = 1.500.000 cm = 15 km.', 'easy'),
  ('tiu-perbandingan', 'Jarak sebenarnya dua kota 45 km digambarkan pada peta sepanjang 9 cm. Skala peta tersebut adalah …', '1 : 50.000', '1 : 5.000.000', '1 : 450.000', '1 : 500.000', '1 : 400.000', 0, 0, 0, 5, 0, '45 km = 4.500.000 cm. Skala = 9 : 4.500.000 = 1 : 500.000.', 'medium'),
  ('tiu-perbandingan', 'Sebuah mobil melaju dengan kecepatan tetap 60 km/jam selama 2,5 jam. Jarak yang ditempuh adalah …', '120 km', '125 km', '160 km', '180 km', '150 km', 0, 0, 0, 0, 5, 'Jarak = kecepatan × waktu = 60 × 2,5 = 150 km.', 'easy'),
  ('tiu-perbandingan', 'Sebuah bus menempuh jarak 180 km dengan kecepatan rata-rata 72 km/jam. Jika bus berangkat pukul 07.15, bus tiba pukul …', '09.45', '09.30', '10.15', '09.15', '10.00', 5, 0, 0, 0, 0, 'Waktu = 180 ÷ 72 = 2,5 jam = 2 jam 30 menit. 07.15 + 2.30 = 09.45.', 'medium'),
  ('tiu-perbandingan', 'Andi dapat mengecat pagar dalam 6 jam, sedangkan Budi dalam 3 jam. Jika mereka bekerja bersama, pagar selesai dicat dalam …', '4,5 jam', '3 jam', '1,5 jam', '2 jam', '2,5 jam', 0, 0, 0, 5, 0, '1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2 pekerjaan per jam, sehingga waktu bersama = 2 jam.', 'medium'),
  ('tiu-perbandingan', 'Seorang tukang dapat menyelesaikan sebuah pekerjaan dalam 10 hari, sedangkan tukang lain dalam 15 hari. Jika bekerja bersama, pekerjaan selesai dalam …', '6 hari', '12,5 hari', '5 hari', '7 hari', '8 hari', 5, 0, 0, 0, 0, '1/10 + 1/15 = 3/30 + 2/30 = 5/30 = 1/6, sehingga bersama-sama selesai dalam 6 hari.', 'medium'),
  ('tiu-perbandingan', 'Persediaan pakan cukup untuk 40 ekor ternak selama 15 hari. Jika ternak bertambah 10 ekor, persediaan pakan itu akan habis dalam …', '10 hari', '12 hari', '13 hari', '18 hari', '20 hari', 0, 5, 0, 0, 0, 'Perbandingan berbalik nilai: 40 × 15 = 50 × x, sehingga x = 600 ÷ 50 = 12 hari.', 'medium'),
  ('tiu-perbandingan', 'Perbandingan uang A dan B adalah 3 : 5. Jika jumlah uang mereka Rp240.000, uang B adalah …', 'Rp90.000', 'Rp150.000', 'Rp120.000', 'Rp144.000', 'Rp160.000', 0, 5, 0, 0, 0, 'Uang B = 5/(3 + 5) × 240.000 = 5/8 × 240.000 = Rp150.000.', 'easy'),
  ('tiu-perbandingan', 'Diketahui A : B = 2 : 3 dan B : C = 4 : 5. Perbandingan A : B : C adalah …', '2 : 3 : 5', '8 : 12 : 15', '2 : 4 : 5', '8 : 12 : 20', '6 : 12 : 15', 0, 5, 0, 0, 0, 'Samakan nilai B dengan KPK 3 dan 4, yaitu 12: A : B = 8 : 12 dan B : C = 12 : 15, sehingga A : B : C = 8 : 12 : 15.', 'medium'),
  ('tiu-perbandingan', 'Perbandingan kelereng Dodi dan Eko adalah 5 : 3. Jika selisih kelereng mereka 18 butir, jumlah kelereng mereka adalah …', '54 butir', '45 butir', '90 butir', '72 butir', '64 butir', 0, 0, 0, 5, 0, 'Selisih 5 − 3 = 2 bagian = 18 butir, jadi 1 bagian = 9 butir. Jumlah = 8 bagian = 72 butir.', 'medium'),
  ('tiu-perbandingan', 'Kota P dan Q berjarak 210 km. Mobil A berangkat dari P menuju Q dengan kecepatan 40 km/jam, dan mobil B berangkat dari Q menuju P dengan kecepatan 30 km/jam. Jika keduanya berangkat pukul 08.00, mereka berpapasan pukul …', '10.30', '11.30', '12.00', '11.00', '10.00', 0, 0, 0, 5, 0, 'Saat berpapasan kecepatan dijumlahkan: waktu = 210 ÷ (40 + 30) = 3 jam, sehingga berpapasan pukul 11.00.', 'medium'),
  ('tiu-perbandingan', 'Andi bersepeda dengan kecepatan 12 km/jam mulai pukul 07.00. Budi menyusul dari tempat yang sama pukul 07.30 dengan kecepatan 18 km/jam melalui jalan yang sama. Budi menyusul Andi pukul …', '08.00', '08.30', '09.00', '08.15', '09.30', 0, 5, 0, 0, 0, 'Saat Budi berangkat, Andi sudah menempuh 12 × 0,5 = 6 km. Waktu menyusul = 6 ÷ (18 − 12) = 1 jam setelah 07.30, yaitu pukul 08.30.', 'hard'),
  ('tiu-perbandingan', 'Seseorang pergi ke kota B dengan kecepatan 60 km/jam dan kembali melalui jalan yang sama dengan kecepatan 40 km/jam. Kecepatan rata-rata perjalanan pulang-pergi adalah …', '50 km/jam', '45 km/jam', '52 km/jam', '48 km/jam', '100 km/jam', 0, 0, 0, 5, 0, 'Kecepatan rata-rata = total jarak ÷ total waktu = 2 × 60 × 40 ÷ (60 + 40) = 4.800 ÷ 100 = 48 km/jam, bukan rata-rata biasa 50 km/jam.', 'hard'),
  ('tiu-perbandingan', 'Sebuah pekerjaan dapat diselesaikan 8 orang dalam 15 hari. Setelah dikerjakan 5 hari, ditambah 2 orang pekerja dengan kemampuan sama. Sisa pekerjaan selesai dalam … lagi.', '10 hari', '13 hari', '8 hari', '6 hari', '12 hari', 0, 0, 5, 0, 0, 'Total pekerjaan 8 × 15 = 120 orang-hari. Setelah 5 hari terselesaikan 40, sisa 80 orang-hari dikerjakan 10 orang, sehingga butuh 80 ÷ 10 = 8 hari lagi.', 'hard'),
  ('tiu-perbandingan', 'Sebuah mesin fotokopi mencetak 240 lembar dalam 4 menit. Waktu yang dibutuhkan untuk mencetak 900 lembar adalah …', '12 menit', '16 menit', '18 menit', '15 menit', '20 menit', 0, 0, 0, 5, 0, 'Kecepatan mesin 240 ÷ 4 = 60 lembar per menit, sehingga 900 lembar butuh 900 ÷ 60 = 15 menit.', 'easy'),
  ('tiu-perbandingan', 'Keran A dapat mengisi penuh sebuah bak dalam 20 menit. Lubang di dasar bak dapat mengosongkan bak yang penuh dalam 30 menit. Jika bak kosong dan keran dibuka sementara lubang tetap terbuka, bak akan penuh dalam …', '12 menit', '50 menit', '10 menit', '60 menit', '45 menit', 0, 0, 0, 5, 0, 'Laju bersih = 1/20 − 1/30 = 3/60 − 2/60 = 1/60 bak per menit, sehingga bak penuh dalam 60 menit.', 'hard'),
  ('tiu-perbandingan', 'Roda gigi A memiliki 30 gigi dan bersinggungan dengan roda gigi B yang memiliki 45 gigi. Jika roda A berputar 60 kali, roda B berputar sebanyak …', '90 kali', '45 kali', '30 kali', '40 kali', '60 kali', 0, 0, 0, 5, 0, 'Jumlah gigi × putaran kedua roda sama (berbalik nilai): 30 × 60 = 45 × n, sehingga n = 1.800 ÷ 45 = 40 kali.', 'medium'),
  ('tiu-soal-cerita', 'Umur ayah sekarang 3 kali umur anaknya. Sepuluh tahun lagi, umur ayah menjadi 2 kali umur anaknya. Umur anak sekarang adalah …', '15 tahun', '10 tahun', '12 tahun', '20 tahun', '8 tahun', 0, 5, 0, 0, 0, 'Misal umur anak x, ayah 3x. 3x + 10 = 2(x + 10), sehingga x = 10. Cek: 30 + 10 = 40 = 2 × 20.', 'medium'),
  ('tiu-soal-cerita', 'Jumlah umur Ana dan Beti adalah 50 tahun. Ana 6 tahun lebih tua daripada Beti. Umur Beti adalah …', '28 tahun', '25 tahun', '22 tahun', '24 tahun', '20 tahun', 0, 0, 5, 0, 0, 'Beti = x, Ana = x + 6. 2x + 6 = 50, sehingga x = 22 tahun (Ana 28 tahun).', 'easy'),
  ('tiu-soal-cerita', 'Seorang pedagang membeli barang seharga Rp80.000 dan menjualnya seharga Rp100.000. Persentase keuntungannya adalah …', '20%', '25%', '15%', '30%', '80%', 0, 5, 0, 0, 0, 'Untung = 20.000. Persentase untung terhadap harga beli = 20.000 ÷ 80.000 × 100% = 25%.', 'easy'),
  ('tiu-soal-cerita', 'Sebuah barang dijual seharga Rp135.000 dan pedagang memperoleh untung 12,5%. Harga beli barang tersebut adalah …', 'Rp118.125', 'Rp125.000', 'Rp121.500', 'Rp115.000', 'Rp120.000', 0, 0, 0, 0, 5, 'Harga jual = 112,5% × harga beli, sehingga harga beli = 135.000 ÷ 1,125 = Rp120.000.', 'medium'),
  ('tiu-soal-cerita', 'Sebuah tas berharga Rp200.000 mendapat diskon 20%, kemudian diskon lanjutan 10% dari harga setelah diskon pertama. Harga yang harus dibayar adalah …', 'Rp140.000', 'Rp144.000', 'Rp150.000', 'Rp160.000', 'Rp136.000', 0, 5, 0, 0, 0, '200.000 × 0,8 = 160.000, lalu 160.000 × 0,9 = Rp144.000. Diskon bertingkat dikalikan, bukan dijumlahkan.', 'medium'),
  ('tiu-soal-cerita', 'Pak Hadi menabung Rp2.000.000 dengan bunga tunggal 6% per tahun. Jumlah tabungannya setelah 8 bulan adalah …', 'Rp2.120.000', 'Rp2.096.000', 'Rp2.060.000', 'Rp2.080.000', 'Rp2.960.000', 0, 0, 0, 5, 0, 'Bunga = 2.000.000 × 6% × 8/12 = 80.000, sehingga tabungan menjadi Rp2.080.000.', 'medium'),
  ('tiu-soal-cerita', 'Tabungan Rp2.000.000 dengan bunga tunggal menjadi Rp2.360.000 setelah 1,5 tahun. Suku bunga per tahunnya adalah …', '18%', '9%', '15%', '10%', '12%', 0, 0, 0, 0, 5, 'Bunga 360.000 adalah 18% dari modal selama 1,5 tahun, sehingga per tahun 18% ÷ 1,5 = 12%.', 'hard'),
  ('tiu-soal-cerita', 'Rata-rata nilai 5 siswa adalah 72. Setelah seorang siswa baru bergabung, rata-ratanya menjadi 74. Nilai siswa baru tersebut adalah …', '76', '74', '86', '84', '82', 0, 0, 0, 5, 0, 'Jumlah awal 5 × 72 = 360, jumlah baru 6 × 74 = 444. Nilai siswa baru = 444 − 360 = 84.', 'medium'),
  ('tiu-soal-cerita', 'Kelas A terdiri atas 30 siswa dengan rata-rata nilai 70, sedangkan kelas B terdiri atas 20 siswa dengan rata-rata nilai 80. Rata-rata nilai gabungan kedua kelas adalah …', '75', '74', '72', '76', '73', 0, 5, 0, 0, 0, 'Rata-rata gabungan = (30 × 70 + 20 × 80) ÷ 50 = (2.100 + 1.600) ÷ 50 = 74.', 'medium'),
  ('tiu-soal-cerita', 'Dari 40 pegawai, 25 orang menyukai kopi, 20 orang menyukai teh, dan 8 orang tidak menyukai keduanya. Banyak pegawai yang menyukai kopi dan teh adalah …', '5 orang', '12 orang', '13 orang', '15 orang', '17 orang', 0, 0, 5, 0, 0, 'Yang menyukai minimal salah satu = 40 − 8 = 32. Irisan = 25 + 20 − 32 = 13 orang.', 'medium'),
  ('tiu-soal-cerita', 'Dari 50 peserta, 30 orang mengikuti pelatihan A, 26 orang mengikuti pelatihan B, dan 10 orang mengikuti keduanya. Banyak peserta yang tidak mengikuti pelatihan A maupun B adalah …', '4 orang', '6 orang', '14 orang', '0 orang', '10 orang', 5, 0, 0, 0, 0, 'Peserta yang mengikuti minimal satu pelatihan = 30 + 26 − 10 = 46, sehingga yang tidak mengikuti keduanya = 50 − 46 = 4 orang.', 'medium'),
  ('tiu-soal-cerita', 'Beras 10 kg seharga Rp12.000 per kg dicampur dengan 15 kg beras seharga Rp14.000 per kg. Harga beras campuran per kg adalah …', 'Rp13.000', 'Rp13.400', 'Rp12.800', 'Rp13.200', 'Rp13.500', 0, 0, 0, 5, 0, 'Total harga = 120.000 + 210.000 = 330.000 untuk 25 kg, sehingga harga per kg = 330.000 ÷ 25 = Rp13.200.', 'medium'),
  ('tiu-soal-cerita', 'Sebanyak 20 liter larutan gula berkadar 15% ditambah 10 liter air murni. Kadar gula larutan yang baru adalah …', '7,5%', '12%', '10%', '5%', '15%', 0, 0, 5, 0, 0, 'Gula = 15% × 20 = 3 liter. Volume baru 30 liter, sehingga kadar = 3 ÷ 30 = 10%.', 'hard'),
  ('tiu-soal-cerita', 'Harga 3 buku dan 2 pensil adalah Rp31.000, sedangkan harga 2 buku dan 4 pensil adalah Rp26.000. Harga 1 buku adalah …', 'Rp8.000', 'Rp9.000', 'Rp7.500', 'Rp10.000', 'Rp2.000', 0, 5, 0, 0, 0, 'Persamaan kedua dibagi 2: b + 2p = 13.000. Dikurangkan dari persamaan pertama: 2b = 18.000, sehingga b = Rp9.000 (pensil Rp2.000).', 'medium'),
  ('tiu-soal-cerita', 'Seorang pedagang membeli 50 buah mangga seharga Rp150.000. Ternyata 5 buah busuk dan tidak dapat dijual, sedangkan sisanya dijual Rp3.500 per buah. Pedagang tersebut mengalami …', 'Rugi 5%', 'Untung 7,5%', 'Untung 5%', 'Untung 10%', 'Impas (tidak untung maupun rugi)', 0, 0, 5, 0, 0, 'Penjualan = 45 × 3.500 = 157.500. Untung = 157.500 − 150.000 = 7.500, yaitu 7.500 ÷ 150.000 = 5%.', 'hard'),
  ('tiu-soal-cerita', 'Lima tahun yang lalu umur kakak 2 kali umur adik. Sekarang jumlah umur mereka 40 tahun. Umur kakak sekarang adalah …', '15 tahun', '30 tahun', '20 tahun', '25 tahun', '27 tahun', 0, 0, 0, 5, 0, 'K − 5 = 2(A − 5) sehingga K = 2A − 5. K + A = 40 memberi 3A − 5 = 40, A = 15, dan K = 25. Cek: lima tahun lalu 20 dan 10.', 'hard'),
  ('tiu-soal-cerita', 'Upah lembur Pak Dodi Rp25.000 per jam. Ia lembur 3 jam setiap hari kerja selama 2 minggu dengan 5 hari kerja per minggu. Total upah lemburnya adalah …', 'Rp750.000', 'Rp525.000', 'Rp1.050.000', 'Rp500.000', 'Rp700.000', 5, 0, 0, 0, 0, 'Hari kerja = 2 × 5 = 10 hari, total lembur = 10 × 3 = 30 jam, upah = 30 × 25.000 = Rp750.000.', 'easy'),
  ('tiu-soal-cerita', 'Harga sekilo daging naik dari Rp40.000 menjadi Rp46.000. Persentase kenaikan harganya adalah …', '13%', '6%', '12%', '16%', '15%', 0, 0, 0, 0, 5, 'Kenaikan = 6.000. Persentase = 6.000 ÷ 40.000 × 100% = 15%.', 'easy'),
  ('tiu-soal-cerita', 'Rata-rata empat bilangan adalah 15. Jika satu bilangan dikeluarkan, rata-rata tiga bilangan sisanya menjadi 13. Bilangan yang dikeluarkan adalah …', '21', '2', '15', '19', '17', 5, 0, 0, 0, 0, 'Jumlah empat bilangan = 60, jumlah tiga sisanya = 39, sehingga bilangan yang dikeluarkan = 60 − 39 = 21.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ●●● : ○○○ = ■■ : …', '■■■', '□□□', '□□', '○○', '■□', 0, 0, 5, 0, 0, 'Dari gambar pertama ke kedua, jumlah dan bentuk tetap, hanya warna hitam berubah menjadi putih. Maka ■■ menjadi □□.', 'easy'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut (setiap panah dapat diputar): ↑ : → = ↓ : …', '←', '↑', '→', '↓', '↗', 5, 0, 0, 0, 0, '↑ menjadi → berarti panah diputar 90° searah jarum jam. ↓ diputar 90° searah jarum jam menjadi ←.', 'easy'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ↑ : ↗ = → : …', '↗', '↓', '↘', '↙', '←', 0, 0, 5, 0, 0, '↑ menjadi ↗ adalah rotasi 45° searah jarum jam. → diputar 45° searah jarum jam menjadi ↘.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ▲▲ : ▲▲▲▲ = ●●● : … (gambar kedua selalu berisi bentuk yang sama dengan jumlah dua kali lipat gambar pertama)', '●●●●', '●●●●●', '●●●●●●', '▲▲▲▲▲▲', '○○○○○○', 0, 0, 5, 0, 0, 'Jumlah elemen dikalikan dua dengan bentuk dan warna tetap: 3 bulatan hitam menjadi 6 bulatan hitam.', 'easy'),
  ('tiu-analogi-gambar', 'Simbol ◐ = lingkaran dengan bagian kiri hitam, ◓ = bagian atas hitam, ◑ = bagian kanan hitam, ◒ = bagian bawah hitam. Perhatikan analogi: ◐ : ◓ = ◑ : …', '◐', '◓', '◑', '●', '◒', 0, 0, 0, 0, 5, 'Bagian hitam berpindah dari kiri ke atas, yaitu berputar 90° searah jarum jam. Bagian hitam di kanan yang diputar 90° searah jarum jam berpindah ke bawah, yaitu ◒.', 'hard'),
  ('tiu-analogi-gambar', 'Dalam sebuah kotak 2×2, ■ berpindah dari pojok kiri atas ke pojok kanan bawah, dan dengan aturan yang sama ◆ berpindah dari pojok kanan atas ke pojok kiri bawah. Jika ● berada di pojok kiri bawah, dengan aturan yang sama ● akan berpindah ke pojok …', 'Kiri atas', 'Kanan atas', 'Kanan bawah', 'Kiri bawah', 'Tengah kotak', 0, 5, 0, 0, 0, 'Kedua contoh menunjukkan setiap elemen pindah ke pojok diagonal seberangnya (rotasi 180°). Pojok diagonal seberang kiri bawah adalah kanan atas.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi bangun berikut: ▲ (segitiga, 3 sisi) : ■ (persegi, 4 sisi) = segi lima : …', 'Segi lima', 'Segi enam', 'Segi delapan', 'Segitiga', 'Lingkaran', 0, 5, 0, 0, 0, 'Dari segitiga ke persegi, jumlah sisi bertambah satu (3 menjadi 4). Segi lima (5 sisi) bertambah satu sisi menjadi segi enam.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ↑● : ↓○ = →■ : …', '←■', '→□', '←□', '↓□', '↑□', 0, 0, 5, 0, 0, 'Ada dua perubahan: panah diputar 180° (↑ menjadi ↓) dan warna bangun dibalik (● menjadi ○). Maka → menjadi ← dan ■ menjadi □, sehingga hasilnya ←□.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ▲○○ : ○○▲ = ■●● : … (setiap gambar dibaca dari kiri ke kanan)', '■●●', '●●■', '●■●', '□○○', '○○□', 0, 5, 0, 0, 0, 'Gambar kedua adalah pencerminan kiri-kanan dari gambar pertama: elemen paling kiri pindah ke paling kanan, warna dan bentuk tetap. ■●● dicerminkan menjadi ●●■.', 'hard'),
  ('tiu-ketidaksamaan', 'Perhatikan kelompok gambar: ■■□, ▲▲△, ◆◇◇, ▼▼▽, ▶▶▷. Manakah gambar yang berbeda dari yang lain?', '■■□', '▲▲△', '▼▼▽', '▶▶▷', '◆◇◇', 0, 0, 0, 0, 5, 'Empat gambar terdiri atas 2 bangun hitam dan 1 bangun putih, sedangkan ◆◇◇ terdiri atas 1 bangun hitam dan 2 bangun putih.', 'easy'),
  ('tiu-ketidaksamaan', 'Perhatikan panah-panah berikut: ↑, →, ↓, ←, ↗. Manakah arah panah yang berbeda dari yang lain?', '↑', '→', '↓', '←', '↗', 0, 0, 0, 0, 5, 'Empat panah menunjuk arah utama (atas, kanan, bawah, kiri), sedangkan ↗ satu-satunya yang menunjuk arah diagonal.', 'easy'),
  ('tiu-ketidaksamaan', 'Perhatikan pasangan panah berikut: (↑ →), (→ ↓), (↓ ←), (← ↑), (↑ ↓). Manakah pasangan yang berbeda dari yang lain?', '↑ →', '→ ↓', '↓ ←', '← ↑', '↑ ↓', 0, 0, 0, 0, 5, 'Pada empat pasangan, panah kedua adalah panah pertama yang diputar 90° searah jarum jam. Pada ↑ ↓ panah diputar 180°.', 'medium'),
  ('tiu-ketidaksamaan', 'Perhatikan susunan berikut: ●○●○, ■□■□, ▲△▲△, ◆◇◆◇, ▼▽▽▼. Manakah susunan yang berbeda dari yang lain?', '●○●○', '■□■□', '▼▽▽▼', '▲△▲△', '◆◇◆◇', 0, 0, 5, 0, 0, 'Empat susunan berpola hitam-putih-hitam-putih secara berselang-seling, sedangkan ▼▽▽▼ berpola hitam-putih-putih-hitam.', 'medium'),
  ('tiu-ketidaksamaan', 'Perhatikan pasangan simbol berikut: (◀ ▶), (↖ ↗), (↙ ↘), (⇐ ⇒), (↑ ↓). Empat pasangan memiliki hubungan yang sama. Manakah pasangan yang berbeda?', '◀ ▶', '↖ ↗', '↑ ↓', '↙ ↘', '⇐ ⇒', 0, 0, 5, 0, 0, 'Pada empat pasangan, simbol kedua adalah pencerminan simbol pertama terhadap sumbu tegak (kiri-kanan). ↑ ↓ adalah pencerminan terhadap sumbu datar (atas-bawah); ↑ yang dicerminkan kiri-kanan tetap ↑.', 'hard'),
  ('tiu-ketidaksamaan', 'Perhatikan kelompok gambar: ■■■, ■■■■■, ■■■■■■■, ■■■■, ■■■■■■■■■. Manakah gambar yang berbeda dari yang lain?', '■■■', '■■■■', '■■■■■', '■■■■■■■', '■■■■■■■■■', 0, 5, 0, 0, 0, 'Empat gambar berisi persegi dalam jumlah ganjil (3, 5, 7, 9), sedangkan ■■■■ berisi 4 persegi (genap).', 'easy'),
  ('tiu-ketidaksamaan', 'Perhatikan simbol garis berikut: ┌, ┐, └, ┘, ├. Manakah simbol yang berbeda dari yang lain?', '┌', '┐', '├', '└', '┘', 0, 0, 5, 0, 0, '┌, ┐, └, dan ┘ adalah sudut siku dengan dua kaki yang merupakan rotasi satu sama lain, sedangkan ├ memiliki tiga kaki.', 'easy'),
  ('tiu-ketidaksamaan', 'Simbol ◐, ◑, ◒, ◓ adalah lingkaran yang setengah bagiannya hitam (kiri, kanan, bawah, atas). Manakah simbol yang berbeda dari yang lain?', '●', '◐', '◑', '◒', '◓', 5, 0, 0, 0, 0, '◐, ◑, ◒, ◓ adalah lingkaran setengah hitam yang merupakan rotasi satu sama lain, sedangkan ● seluruhnya hitam.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ↑, →, ↓, ←, ↑, →, …', '←', '↑', '→', '↗', '↓', 0, 0, 0, 0, 5, 'Panah diputar 90° searah jarum jam setiap langkah. Setelah → berikutnya adalah ↓.', 'easy'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ↑, ↗, →, ↘, ↓, …', '←', '↘', '↙', '↖', '↓', 0, 0, 5, 0, 0, 'Panah diputar 45° searah jarum jam setiap langkah. ↓ diputar 45° searah jarum jam menjadi ↙.', 'easy'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ■, ■■■, ■■■■■, …', '■■■■■■', '■■■■■■■■', '■■■■■■■■■', '■■■■■■■', '■■■■■', 0, 0, 0, 5, 0, 'Jumlah persegi bertambah 2 setiap langkah: 1, 3, 5, sehingga berikutnya 7 persegi.', 'easy'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ●○○○, ○●○○, ○○●○, ○○○●, ●○○○, ○●○○, …', '●○○○', '○○○●', '○●○○', '●●○○', '○○●○', 0, 0, 0, 0, 5, 'Bulatan hitam bergeser satu kotak ke kanan setiap langkah; setelah kotak terakhir ia kembali ke kotak pertama. Setelah ○●○○ berikutnya ○○●○.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ↑, →→, ↓↓↓, ←←←←, …', '↑↑↑↑↑', '→→→→→', '↑↑↑↑', '↓↓↓↓↓', '←←←←←', 5, 0, 0, 0, 0, 'Dua aturan berjalan bersamaan: arah panah berputar 90° searah jarum jam (↑, →, ↓, ←, lalu kembali ↑) dan jumlah panah bertambah satu. Suku kelima adalah lima panah ↑.', 'medium'),
  ('tiu-serial-gambar', 'Simbol ◐ = kiri hitam, ◓ = atas hitam, ◑ = kanan hitam, ◒ = bawah hitam. Tentukan gambar berikutnya: ◐, ◓, ◑, ◒, ◐, ◓, …', '◑', '◐', '◓', '◒', '●', 5, 0, 0, 0, 0, 'Bagian hitam berputar 90° searah jarum jam setiap langkah (kiri, atas, kanan, bawah) dan berulang setiap empat suku. Setelah ◓ adalah ◑.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ●, ○○, ●●●, ○○○○, …', '●●●●●', '○○○○○', '●●●●', '○○○○○○', '●●●●●●', 5, 0, 0, 0, 0, 'Jumlah bulatan bertambah satu setiap langkah dan warnanya bergantian hitam-putih. Suku kelima berisi 5 bulatan hitam.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ▲□□, □▲□, □□▲, ▼□□, □▼□, …', '▲□□', '□□▲', '□□▼', '▼□□', '□▲□', 0, 0, 5, 0, 0, 'Segitiga bergeser satu kotak ke kanan setiap langkah; ketika kembali ke kotak pertama, segitiga dibalik (▲ menjadi ▼). Setelah □▼□, segitiga ▼ bergeser ke kotak ketiga menjadi □□▼.', 'hard'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ↑, ■, →, ■■, ↓, ■■■, …', '↑', '■■■■', '→', '←', '↓', 0, 0, 0, 5, 0, 'Serial ini selang-seling. Suku ganjil berupa panah yang berputar 90° searah jarum jam (↑, →, ↓), suku genap berupa persegi yang bertambah satu. Suku ketujuh adalah suku ganjil, sehingga panah berikutnya ←.', 'hard')
) as v(sub, stem, a, b, c, d, e, pa, pb, pc, pd, pe, expl, diff)
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
