-- SiapASN original TIU content, round 2: new sub-topics (sinonim, antonim, aljabar, geometri),
-- 18 additional lessons and 204 additional practice questions. Written from scratch for SiapASN.
-- Every numeric key was computed and asserted by a generator script; logic and figural items were
-- checked by exhaustive enumeration. Idempotent: safe to run repeatedly.
begin;

insert into public.subtopics (topic_id, name, slug, sort_order)
select t.id, v.name, v.slug, v.sort_order
from (values
  ('tiu-verbal', 'Sinonim (Persamaan Kata)', 'tiu-sinonim', 4),
  ('tiu-verbal', 'Antonim (Lawan Kata)', 'tiu-antonim', 5),
  ('tiu-numerik', 'Aljabar & Persamaan Sederhana', 'tiu-aljabar', 5),
  ('tiu-numerik', 'Bangun Datar & Ruang', 'tiu-geometri', 6)
) as v(topic, name, slug, sort_order)
join public.topics t on t.slug = v.topic
on conflict (slug) do nothing;

insert into public.lessons (subtopic_id, title, slug, summary, content, is_free, sort_order, est_minutes, status)
select s.id, v.title, v.slug, v.summary, v.content, v.is_free, v.sort_order, v.est_minutes, 'published'
from (values
  ('tiu-aljabar', 'Identitas Aljabar, Persamaan Kuadrat, Eksponen, dan Nilai Mutlak', 'tiu-aljabar-identitas-kuadrat-eksponen', 'Memakai identitas aljabar, rumus jumlah dan hasil kali akar, sifat eksponen, serta nilai mutlak untuk soal HOTS tanpa hitungan panjang.',
$md$
## Gagasan utama

Soal aljabar tingkat menengah sampai HOTS di TIU jarang meminta Anda menghitung secara "brutal". Hampir selalu ada **identitas** atau **sifat** yang memangkas hitungan. Pelajaran ini merangkum alat-alat tersebut.

## 1. Identitas aljabar yang wajib hafal

| Identitas | Bentuk |
| --- | --- |
| Kuadrat jumlah | $(a + b)^2 = a^2 + 2ab + b^2$ |
| Kuadrat selisih | $(a - b)^2 = a^2 - 2ab + b^2$ |
| Selisih kuadrat | $a^2 - b^2 = (a + b)(a - b)$ |
| Jumlah kuadrat | $a^2 + b^2 = (a + b)^2 - 2ab = (a - b)^2 + 2ab$ |
| Bentuk kebalikan | $x^2 + \dfrac{1}{x^2} = \left(x + \dfrac{1}{x}\right)^2 - 2$ |

**Contoh 1.** Jika $a + b = 9$ dan $ab = 14$, tentukan $a^2 + b^2$.

1. Gunakan $a^2 + b^2 = (a + b)^2 - 2ab$.
2. $= 81 - 28 = 53$.
3. Jebakan: menjawab $81$ karena lupa mengurangi $2ab$.

**Contoh 2.** Jika $x - \dfrac{1}{x} = 3$, tentukan $x^2 + \dfrac{1}{x^2}$.

1. Kuadratkan: $\left(x - \dfrac{1}{x}\right)^2 = x^2 - 2 + \dfrac{1}{x^2} = 9$.
2. Jadi $x^2 + \dfrac{1}{x^2} = 11$. Perhatikan tandanya: untuk bentuk *selisih*, kita **menambah** 2.

**Contoh 3 (selisih kuadrat).** Jika $m + n = 12$ dan $m^2 - n^2 = 48$, tentukan $m$.

1. $m^2 - n^2 = (m + n)(m - n)$, jadi $12(m - n) = 48$ dan $m - n = 4$.
2. Jumlahkan dengan $m + n = 12$: $2m = 16$, sehingga $m = 8$.

## 2. Faktorisasi bentuk kuadrat

Untuk $x^2 + bx + c$, cari dua bilangan yang **hasil kalinya $c$** dan **jumlahnya $b$**.

**Contoh 4.** Faktorkan $x^2 - 9x + 18$.

1. Cari pasangan dengan hasil kali 18 dan jumlah $-9$: yaitu $-3$ dan $-6$.
2. Jadi $x^2 - 9x + 18 = (x - 3)(x - 6)$.
3. Akar persamaan $x^2 - 9x + 18 = 0$ adalah $x = 3$ atau $x = 6$.

## 3. Jumlah dan hasil kali akar

Untuk $ax^2 + bx + c = 0$ dengan akar $x_1$ dan $x_2$:

$$x_1 + x_2 = -\frac{b}{a}, \qquad x_1 \cdot x_2 = \frac{c}{a}$$

Turunan yang sering ditanyakan:

| Ditanyakan | Rumus |
| --- | --- |
| $x_1^2 + x_2^2$ | $(x_1 + x_2)^2 - 2x_1x_2$ |
| $\dfrac{1}{x_1} + \dfrac{1}{x_2}$ | $\dfrac{x_1 + x_2}{x_1 x_2}$ |
| $(x_1 - x_2)^2$ | $(x_1 + x_2)^2 - 4x_1x_2$ |

**Contoh 5.** Akar-akar $3x^2 - 12x + 5 = 0$ adalah $x_1$ dan $x_2$. Tentukan $\dfrac{1}{x_1} + \dfrac{1}{x_2}$.

1. $x_1 + x_2 = \dfrac{12}{3} = 4$ dan $x_1 x_2 = \dfrac{5}{3}$.
2. $\dfrac{1}{x_1} + \dfrac{1}{x_2} = \dfrac{4}{5/3} = \dfrac{12}{5}$.
3. Tidak perlu mencari akarnya sama sekali.

## 4. Eksponen dan persamaan eksponen

| Sifat | Contoh |
| --- | --- |
| $a^m \cdot a^n = a^{m+n}$ | $3^2 \cdot 3^4 = 3^6$ |
| $a^m \div a^n = a^{m-n}$ | $5^7 \div 5^5 = 5^2$ |
| $(a^m)^n = a^{mn}$ | $(2^3)^2 = 2^6$ |
| $a^0 = 1$, $a^{-n} = \dfrac{1}{a^n}$ | $4^{-2} = \dfrac{1}{16}$ |

Kunci persamaan eksponen: **samakan basis**, lalu samakan pangkat.

**Contoh 6.** Tentukan $x$ jika $4^{x+1} = 8^{x-1}$.

1. Ubah ke basis 2: $2^{2(x+1)} = 2^{3(x-1)}$.
2. Samakan pangkat: $2x + 2 = 3x - 3$.
3. Jadi $x = 5$. Cek: $4^6 = 4096$ dan $8^4 = 4096$. Benar.

## 5. Nilai mutlak

$|a|$ adalah jarak $a$ dari nol, sehingga selalu tak negatif. Persamaan $|u| = k$ (dengan $k > 0$) menghasilkan **dua** kemungkinan: $u = k$ atau $u = -k$.

**Contoh 7.** Tentukan jumlah semua nilai $x$ yang memenuhi $|3x - 6| = 9$.

1. Kasus 1: $3x - 6 = 9$, maka $x = 5$.
2. Kasus 2: $3x - 6 = -9$, maka $x = -1$.
3. Jumlahnya $5 + (-1) = 4$.
4. Jebakan: hanya menuliskan kasus pertama, lalu menjawab 5.

## Ringkasan

- Ubah $a^2 + b^2$, $x^2 + 1/x^2$, dan $a^2 - b^2$ dengan identitas, bukan dengan mencari nilai variabel.
- Faktorkan $x^2 + bx + c$ dengan mencari dua bilangan: kalinya $c$, jumlahnya $b$.
- Gunakan $x_1 + x_2 = -b/a$ dan $x_1x_2 = c/a$ untuk semua bentuk simetris akar.
- Persamaan eksponen: samakan basis lalu samakan pangkat.
- Nilai mutlak selalu menghasilkan dua kasus.

## Tips cepat

1. Jika soal memberi $a + b$ dan $ab$, hampir pasti jawabannya lewat identitas kuadrat.
2. Ingat tanda: $x + 1/x$ → kurangi 2; $x - 1/x$ → tambah 2.
3. Pada rumus jumlah akar, jangan lupa tanda minus: $-b/a$.
4. Hafalkan pangkat kecil: $2^{10} = 1024$, $3^5 = 243$, $5^4 = 625$.
5. Cek akhir dengan substitusi bila waktu masih ada.
$md$,
   false, 2, 15),
  ('tiu-aljabar', 'Persamaan Linear, SPLDV, dan Fungsi Sederhana', 'tiu-aljabar-persamaan-linear', 'Menyelesaikan persamaan linear satu variabel, sistem dua variabel, pertidaksamaan, dan fungsi f(x) dengan cepat dan rapi.',
$md$
## Mengapa aljabar penting di TIU?

Soal numerik TIU sering "menyamar" sebagai soal cerita, padahal intinya adalah **persamaan linear**. Begitu Anda terbiasa memindahkan suku dan menyederhanakan, banyak soal bisa diselesaikan dalam kurang dari satu menit. Materi ini membahas empat bekal dasar:

1. Persamaan linear satu variabel (PLSV).
2. Sistem persamaan linear dua variabel (SPLDV).
3. Pertidaksamaan linear.
4. Fungsi sederhana $f(x)$.

## 1. Persamaan linear satu variabel

Bentuk umumnya $ax + b = c$ dengan $a \neq 0$. Prinsipnya: **apa pun yang dilakukan pada ruas kiri juga dilakukan pada ruas kanan**.

| Operasi | Aturan saat dipindah ruas |
| --- | --- |
| Penjumlahan $+k$ | menjadi pengurangan $-k$ |
| Pengurangan $-k$ | menjadi penjumlahan $+k$ |
| Perkalian $\times k$ | menjadi pembagian $\div k$ |
| Pembagian $\div k$ | menjadi perkalian $\times k$ |

**Contoh 1.** Tentukan $x$ jika $4x - 9 = x + 15$.

1. Kumpulkan suku $x$ di kiri: $4x - x = 15 + 9$.
2. Sederhanakan: $3x = 24$.
3. Bagi kedua ruas dengan 3: $x = 8$.
4. Cek: $4(8) - 9 = 23$ dan $8 + 15 = 23$. Benar.

**Contoh 2 (pecahan).** Tentukan $x$ jika $\dfrac{x}{2} + \dfrac{x}{5} = 21$.

1. Kalikan kedua ruas dengan KPK penyebut, yaitu 10: $5x + 2x = 210$.
2. $7x = 210$, sehingga $x = 30$.

> **Jebakan:** saat mengalikan dengan KPK, *semua* suku harus dikalikan, termasuk ruas kanan. Banyak peserta lupa mengalikan 21 dengan 10.

## 2. Sistem persamaan linear dua variabel (SPLDV)

Ada dua variabel dan dua persamaan. Tiga cara utama:

| Metode | Kapan dipakai | Ciri |
| --- | --- | --- |
| Substitusi | salah satu variabel mudah dinyatakan, misal $y = 2x - 1$ | ganti variabel ke persamaan lain |
| Eliminasi | koefisien mudah disamakan | jumlahkan/kurangkan persamaan |
| Trik jumlah–selisih | koefisien "bertukar", misal $3x + 2y$ dan $2x + 3y$ | jumlahkan dan kurangkan langsung |

**Contoh 3 (eliminasi).** Diketahui $3x + 2y = 23$ dan $x - 2y = -3$. Tentukan $x + y$.

1. Jumlahkan kedua persamaan agar $y$ hilang: $4x = 20$, jadi $x = 5$.
2. Substitusi ke persamaan kedua: $5 - 2y = -3$, sehingga $2y = 8$ dan $y = 4$.
3. Jadi $x + y = 9$.

**Contoh 4 (trik jumlah–selisih).** Diketahui $5a + 3b = 41$ dan $3a + 5b = 39$. Tentukan $a - b$.

1. Kurangkan persamaan pertama dengan kedua: $2a - 2b = 2$, jadi $a - b = 1$.
2. Selesai, tanpa perlu mencari $a$ dan $b$ satu per satu. (Jika ingin cek: jumlahkan, $8a + 8b = 80$, maka $a + b = 10$, sehingga $a = 5{,}5$ dan $b = 4{,}5$. Hasil $a - b = 1$ tetap konsisten.)

> **Tips HOTS:** perhatikan apa yang *ditanyakan*. Jika yang ditanya $a - b$ atau $a + b$, sering kali Anda tidak perlu menemukan nilai masing-masing.

## 3. Pertidaksamaan linear

Aturannya sama dengan persamaan, dengan satu pengecualian penting:

$$\text{Jika kedua ruas dikalikan atau dibagi bilangan negatif, tanda pertidaksamaan dibalik.}$$

**Contoh 5.** Tentukan himpunan penyelesaian $7 - 3x \geq 2x - 8$.

1. Pindahkan suku: $-3x - 2x \geq -8 - 7$.
2. Sederhanakan: $-5x \geq -15$.
3. Bagi dengan $-5$ dan **balik tanda**: $x \leq 3$.
4. Jika yang ditanya bilangan asli, jawabannya $\{1, 2, 3\}$.

Jebakan klasik: peserta menulis $x \geq 3$ karena lupa membalik tanda. Uji cepat dengan $x = 0$: $7 \geq -8$ benar, jadi daerah penyelesaian memuat 0, yang hanya cocok dengan $x \leq 3$.

## 4. Fungsi sederhana

Fungsi $f(x) = 2x + 5$ berarti "ambil $x$, kalikan 2, tambah 5". Ada tiga tipe soal yang sering muncul.

**Tipe A — mencari nilai fungsi.** Jika $f(x) = 2x + 5$, maka $f(7) = 2(7) + 5 = 19$.

**Tipe B — mencari input.** Jika $f(a) = 29$, maka $2a + 5 = 29$, sehingga $a = 12$.

**Tipe C — menentukan rumus dari dua data.** Diketahui $f(x) = mx + c$ dengan $f(2) = 7$ dan $f(5) = 16$.

1. Selisihkan: $f(5) - f(2) = 3m = 9$, jadi $m = 3$.
2. Substitusi: $3(2) + c = 7$, jadi $c = 1$.
3. Rumusnya $f(x) = 3x + 1$, sehingga misalnya $f(10) = 31$.

**Contoh 6 (komposisi).** Jika $f(x) = x + 4$ dan $g(x) = 3x$, tentukan $(g \circ f)(2)$.

1. Kerjakan yang paling dalam dulu: $f(2) = 6$.
2. Masukkan ke $g$: $g(6) = 18$.
3. Bandingkan dengan $(f \circ g)(2) = f(6) = 10$. Urutan komposisi **tidak** boleh ditukar.

## Kesalahan yang paling sering terjadi

- Lupa mengubah tanda saat memindahkan suku ke ruas lain.
- Mengalikan hanya sebagian suku dengan KPK.
- Lupa membalik tanda pertidaksamaan saat membagi bilangan negatif.
- Tertukar urutan komposisi fungsi.
- Menjawab nilai $x$ padahal yang ditanya $x + y$ atau $2x$.

## Ringkasan

- PLSV diselesaikan dengan mengumpulkan variabel di satu ruas dan konstanta di ruas lain.
- SPLDV: pilih substitusi, eliminasi, atau trik jumlah–selisih sesuai bentuk koefisien.
- Pertidaksamaan mengikuti aturan persamaan, tetapi tanda dibalik bila dikali/dibagi bilangan negatif.
- Fungsi $f(x) = mx + c$ dapat ditentukan dari dua pasang data dengan selisih nilai.

## Tips cepat

1. Selalu baca ulang **apa yang ditanyakan** sebelum menghitung.
2. Gunakan uji substitusi: masukkan pilihan jawaban ke persamaan bila hitungan terasa panjang.
3. Untuk pecahan, kalikan dengan KPK sejak awal agar bebas pecahan.
4. Pada pertidaksamaan, cek jawaban dengan satu angka uji (misalnya 0).
5. Untuk komposisi, kerjakan dari dalam ke luar.
$md$,
   true, 1, 14),
  ('tiu-analitis', 'Strategi Cepat Analitis: Tabel, Pecah Kasus, dan Eliminasi', 'tiu-analitis-strategi-kasus-eliminasi', 'Teknik tabel grid, pemecahan kasus, pembedaan "pasti benar" dan "mungkin benar", serta soal kalender dan benar-bohong.',
$md$
## Soal analitis adalah soal manajemen informasi

Soal penalaran analitis memberi sejumlah syarat lalu menanyakan satu fakta. Kesulitannya bukan pada rumus, tetapi pada **banyaknya informasi** yang harus dipegang sekaligus. Kuncinya: pindahkan informasi dari kepala ke kertas dalam bentuk yang rapi, lalu biarkan bentuk itu yang "berpikir".

## Teknik 1: tabel grid untuk soal pencocokan

Untuk soal "siapa bertugas di mana", buat tabel orang × pilihan. Isi ✗ untuk yang mustahil dan ✓ untuk yang pasti. Setiap baris dan kolom hanya boleh memiliki satu ✓.

**Contoh 1.** Ani, Budi, dan Cici bertugas di Medan, Solo, dan Ambon (masing-masing satu kota berbeda). Ani tidak di Medan. Budi tidak di Solo maupun Medan. Di mana Cici bertugas?

| | Medan | Solo | Ambon |
| --- | --- | --- | --- |
| Ani | ✗ | ✓ | ✗ |
| Budi | ✗ | ✗ | ✓ |
| Cici | ✓ | ✗ | ✗ |

1. Budi mencoret Medan dan Solo → Budi di Ambon.
2. Ani bukan Medan dan Ambon sudah terisi → Ani di Solo.
3. Sisa: **Cici di Medan**.

## Teknik 2: pecah kasus

Jika syarat belum mengunci posisi, **pecah menjadi beberapa kasus** dari syarat yang pilihannya paling sedikit. Syarat "R duduk tepat di sebelah Q" hanya punya dua kemungkinan, jadi ideal untuk dipecah.

**Contoh 2.** P, Q, R, S, T duduk di kursi 1–5 dari kiri. Q di kursi 2. R tepat di sebelah Q. S tidak di ujung. T duduk di sebelah kanan P (tidak harus bersebelahan).

1. Kasus R di kursi 1: kursi 3, 4, 5 untuk P, S, T. S tidak boleh di 5, dan T harus di kanan P. Kemungkinan: P-S-T atau S-P-T → susunan **RQPST** dan **RQSPT**.
2. Kasus R di kursi 3: kursi 1, 4, 5 untuk P, S, T. S tidak di ujung → S di 4. P harus di kiri T → P di 1, T di 5 → **PQRST**.
3. Total ada tiga susunan yang memenuhi.

## Teknik 3: "pasti benar" vs "mungkin benar"

Setelah semua kasus ditemukan, bedakan dua jenis pertanyaan:

| Pertanyaan | Syarat jawaban | Pada Contoh 2 |
| --- | --- | --- |
| Pasti benar | berlaku di **semua** kasus | T di kursi 5 |
| Mungkin benar | berlaku di **minimal satu** kasus | S di kursi 4 (2 kasus), P di kursi 1 (1 kasus) |
| Pasti salah | tidak berlaku di kasus mana pun | S di kursi 3 |

Pengecoh favorit adalah pernyataan yang benar di sebagian besar kasus, misalnya "S di kursi 4", tetapi bukan semua kasus.

## Teknik 4: soal kalender dan hari

Hari berulang setiap 7 hari, sehingga cukup hitung **sisa pembagian** selisih hari dengan 7.

$$\text{hari baru} = \text{hari awal} + (\text{selisih} \bmod 7)$$

**Contoh 3.** Jika 1 Mei jatuh pada hari Jumat, 1 Agustus tahun yang sama jatuh pada hari apa?

1. Selisih: Mei 31 + Juni 30 + Juli 31 = 92 hari.
2. $92 = 7 \times 13 + 1$, sisa 1.
3. Jumat + 1 = **Sabtu**.

Hafalkan jumlah hari tiap bulan dan ingat bahwa Februari memiliki 29 hari pada tahun kabisat.

## Teknik 5: soal benar-bohong

Ada pernyataan dari beberapa orang dan diketahui berapa yang jujur. Strateginya: **anggap satu kemungkinan pelaku**, hitung berapa pernyataan yang benar, lalu cocokkan dengan syarat.

**Contoh 4.** Tepat satu dari A, B, C mengambil kue. A: "Saya tidak mengambil." B: "C yang mengambil." C: "B berbohong." Jika hanya satu pernyataan yang benar, siapa pelakunya?

| Andaikan pelaku | A benar? | B benar? | C benar? | Jumlah benar |
| --- | --- | --- | --- | --- |
| A | S | S | B | 1 |
| B | B | S | B | 2 |
| C | B | B | S | 2 |

Hanya pengandaian "A pelakunya" yang menghasilkan tepat satu pernyataan benar. Jawaban: **A**.

## Urutan kerja yang disarankan

1. Tulis semua syarat dalam bentuk singkat (Q=2, R~Q, S≠ujung, P<T).
2. Pasang syarat yang **paling mengunci** terlebih dahulu.
3. Pecah kasus dari syarat dengan kemungkinan paling sedikit.
4. Baru setelah itu baca pertanyaan dan cek tiap pilihan terhadap semua kasus.

## Ringkasan

- Tabel grid cocok untuk pencocokan; pecah kasus cocok untuk urutan dan posisi.
- "Pasti benar" harus berlaku di semua kasus, "mungkin benar" cukup di satu kasus.
- Soal kalender diselesaikan dengan sisa bagi 7.
- Soal benar-bohong diselesaikan dengan mengandaikan setiap kemungkinan pelaku.

## Tips cepat

1. Gunakan notasi singkat agar syarat muat dalam satu baris.
2. Jika satu kasus menghasilkan kontradiksi, coret seluruh kasus itu.
3. Untuk soal "pasti benar", cukup satu kasus pembantah untuk mencoret pilihan.
4. Soal analitis panjang boleh ditunda; kerjakan dulu soal yang lebih cepat.
$md$,
   false, 4, 15),
  ('tiu-analogi-gambar', 'Checklist Atribut dan Ambiguitas Rotasi–Cermin', 'tiu-analogi-gambar-checklist-atribut', 'Daftar periksa lima atribut gambar serta cara membedakan rotasi dan pencerminan dengan contoh kedua.',
$md$
## Analogi gambar = mencari perubahan atribut

Pada analogi gambar, gambar pertama berubah menjadi gambar kedua menurut suatu aturan. Tugas Anda menerapkan aturan yang sama pada gambar ketiga. Aturan hampir selalu dapat dipecah menjadi perubahan **atribut**. Dengan daftar periksa yang tetap, Anda tidak akan melewatkan satu perubahan pun.

## Checklist lima atribut

| No | Atribut | Pertanyaan pemeriksa | Contoh perubahan |
| --- | --- | --- | --- |
| 1 | Bentuk | Apakah jenis bangun berubah? | △ menjadi ○ |
| 2 | Warna / isi | Apakah putih menjadi hitam atau sebaliknya? | □ menjadi ■ |
| 3 | Jumlah | Bertambah, berkurang, dikali? | ● menjadi ●●● |
| 4 | Posisi | Apakah unsur berpindah tempat atau urutan dibalik? | ■●▲ menjadi ▲●■ |
| 5 | Orientasi | Apakah gambar diputar atau dicerminkan? | ↑ menjadi → |

Periksa kelima atribut **berurutan** untuk pasangan pertama dan catat setiap perubahan. Satu soal bisa mengandung dua atau tiga perubahan sekaligus.

**Contoh 1.** ○ : ●●● = □ : …

1. Bentuk: tetap (lingkaran tetap lingkaran).
2. Warna: putih → hitam.
3. Jumlah: 1 → 3.
4. Terapkan pada □: menjadi hitam dan berjumlah tiga → **■■■**.
5. Pilihan □□□ hanya memenuhi aturan jumlah; ■ hanya memenuhi aturan warna; ●●● salah karena bentuknya ikut berubah.

**Contoh 2.** ▲△△ : △▲▲ = ◆◆◇◇◆ : …

1. Bentuk, jumlah, posisi: tetap, unsur berada pada tempat yang sama.
2. Urutan tidak dibalik (▲△△ dibalik menjadi △△▲, bukan △▲▲).
3. Warna: setiap unsur dibalik (hitam ↔ putih).
4. Terapkan: ◆◆◇◇◆ → **◇◇◆◆◇**.

## Mengapa rotasi dan cermin bisa tertukar?

Orientasi adalah atribut paling licin. Untuk panah tegak, beberapa transformasi berbeda dapat memberi hasil yang sama. Misalnya ↑ menjadi ↓ bisa karena:

- diputar $180^\circ$, atau
- dicerminkan terhadap sumbu datar (atas–bawah dibalik).

Kedua aturan itu menghasilkan ↓ dari ↑, tetapi berbeda jika diterapkan pada panah mendatar:

| Gambar awal | Putar $180^\circ$ | Cermin atas–bawah |
| --- | --- | --- |
| ↑ | ↓ | ↓ |
| → | ← | → |
| ↗ | ↙ | ↘ |

Jadi soal "↑ : ↓ = → : …" sebenarnya **ambigu** karena jawabannya bisa ← atau →. Soal yang baik akan menghindari hal ini, salah satunya dengan **memberikan contoh kedua**.

### Bagaimana contoh kedua mengunci aturan

Misalkan diberikan: ┌ menjadi └ **dan** ┐ menjadi ┘. Kita uji dua kandidat aturan.

1. Putar $90^\circ$ berlawanan jarum jam: ┌ → └ (cocok), tetapi ┐ → ┌ (tidak cocok dengan ┘).
2. Cermin atas–bawah: ┌ → └ (cocok) dan ┐ → ┘ (cocok).

Hanya cermin atas–bawah yang lolos kedua contoh. Maka ┬ menjadi **┴**, bukan ├ (hasil putaran). Tanpa contoh kedua, kedua jawaban itu sama-sama dapat dibela.

Prinsip umumnya: setiap contoh tambahan **mencoret kandidat aturan** yang tidak konsisten. Aturan yang tersisa adalah satu-satunya yang boleh dipakai.

## Teknik mengenali putaran

Untuk panah, hitung besar putaran dalam kelipatan $45^\circ$. Delapan arah ↑ ↗ → ↘ ↓ ↙ ← ↖ tersusun searah jarum jam, sehingga putaran $k \times 45^\circ$ setara dengan maju $k$ langkah pada daftar itu. Contoh: ↑ diputar $135^\circ$ searah jarum jam = maju 3 langkah = ↘.

**Contoh 3.** ↑□ : ←■ = ↓■ : …

1. Orientasi: ↑ menjadi ←. Kandidat aturan: putar $90^\circ$ berlawanan jarum jam, atau cermin terhadap garis diagonal yang turun dari kiri atas ke kanan bawah. Untuk ↓, keduanya sama-sama menghasilkan →, sehingga tidak ada ambiguitas.
2. Warna: □ menjadi ■, berarti warna kotak dibalik; ■ menjadi □.
3. Jawaban: **→□**.

## Atribut jumlah: tambah atau kali?

Perubahan jumlah juga bisa ambigu. Jika ● menjadi ●●, aturannya bisa "ditambah satu" atau "dikali dua". Pada gambar ketiga berisi tiga unsur, aturan pertama menghasilkan 4 unsur, sedangkan aturan kedua menghasilkan 6 unsur. Soal yang baik menghindari ambiguitas ini dengan memberikan contoh kedua, misalnya ● menjadi ●● **dan** ●● menjadi ●●●●. Aturan "ditambah satu" gagal pada contoh kedua (●● akan menjadi ●●●), sehingga hanya "dikali dua" yang tersisa. Cara lain adalah menyatakan aturannya secara tertulis di soal. Jika Anda menemukan dua aturan yang sama-sama masuk akal, periksa pilihan jawaban: biasanya hanya salah satu hasilnya yang tersedia.

## Ringkasan

- Gunakan checklist tetap: bentuk, warna, jumlah, posisi, orientasi.
- Satu soal dapat memuat beberapa perubahan sekaligus; semua harus diterapkan.
- Rotasi dan pencerminan dapat memberi hasil sama pada satu gambar tetapi berbeda pada gambar lain.
- Contoh kedua berfungsi menyaring kandidat aturan.

## Tips cepat

1. Tulis singkatan perubahan, misalnya "W↔, J×2, R90".
2. Uji setiap pilihan terhadap semua atribut; coret begitu satu atribut gagal.
3. Jika aturan orientasi terasa ambigu, coba semua kandidat; jawaban yang konsisten untuk semua kandidat biasanya kunci.
4. Hafalkan urutan delapan arah panah searah jarum jam.
$md$,
   false, 4, 12),
  ('tiu-analogi', 'Jebakan dan Trik HOTS dalam Analogi Verbal', 'tiu-analogi-jebakan-hots', 'Mengenali jebakan derajat, arah, dan kelas kata serta teknik menyelesaikan analogi dua rumpang tipe HOTS.',
$md$
## Mengapa soal analogi HOTS terasa sulit?

Soal analogi tingkat dasar cukup diselesaikan dengan satu kalimat penghubung. Soal HOTS (*higher order thinking skills*) sengaja dibuat agar **dua atau tiga pilihan tampak cocok** dengan kalimat penghubung yang longgar. Untuk memenangkannya, Anda perlu memeriksa beberapa lapis hubungan sekaligus: jenis hubungan, arah, derajat, dan kelas kata.

> **Prinsip:** hubungan yang benar adalah hubungan **paling spesifik** yang berlaku pada pasangan soal dan juga pada jawaban.

## Lapis 1: derajat atau intensitas

Beberapa pasangan kata menyatakan **tingkat** dari sifat yang sama. PERCAYA DIRI : SOMBONG bukan sekadar sinonim; *sombong* adalah *percaya diri* yang berlebihan sehingga bernilai negatif. Maka analogi yang tepat juga harus "sifat positif : bentuk berlebihannya yang negatif".

| Sifat wajar | Bentuk berlebihan |
| --- | --- |
| percaya diri | sombong |
| dermawan | boros |
| santai | malas |
| teliti | cerewet / perfeksionis |
| tegas | otoriter |

Derajat juga muncul pada skala ukuran: GERIMIS : HUJAN : BADAI, atau HANGAT : PANAS : MENDIDIH. Perhatikan apakah soal bergerak **naik** atau **turun** satu tingkat.

## Lapis 2: arah hubungan

AIR : HAUS berarti "air menghilangkan haus". Pasangan MAKANAN : LAPAR cocok, sedangkan LAPAR : MAKANAN terbalik. Pada pilihan pasangan kata, pembuat soal sering menulis pasangan benar dengan **urutan terbalik**. Kalimat penghubung yang ditulis lengkap ("A … B") akan langsung menunjukkan kesalahan urutan.

## Lapis 3: kelas kata

PENA : MENULIS adalah benda : kata kerja. Jawaban seperti GUNTING : KERTAS (benda : benda) salah meskipun berasosiasi. Periksa kelas kata **kedua anggota** pasangan.

## Lapis 4: analogi dua rumpang

Bentuk HOTS yang sering muncul:

$$\ldots : \text{FOTOGRAFER} = \text{STETOSKOP} : \ldots$$

Di sini kedua pasangan memiliki rumpang. Strategi: **uji pilihan sebagai pasangan utuh**. Setiap pilihan berisi dua kata (X – Y). Masukkan menjadi X : FOTOGRAFER dan STETOSKOP : Y, lalu periksa apakah kedua sisi memakai kalimat penghubung yang sama.

## Contoh soal dan pembahasan

**Contoh 1.** PERCAYA DIRI : SOMBONG = TEGAS : …
A. otoriter B. lemah C. berwibawa D. pemimpin E. disiplin

1. Kalimat penghubung: "sombong adalah percaya diri yang berlebihan dan bernilai negatif."
2. Uji: "otoriter adalah tegas yang berlebihan" → cocok.
3. Lemah = antonim (jenis hubungan lain); berwibawa dan disiplin = sifat positif sejajar, bukan bentuk berlebihan; pemimpin = kata benda.
4. Jawaban: **A**.

**Contoh 2.** … : FOTOGRAFER = STETOSKOP : …
A. Kamera – dokter B. Foto – telinga C. Studio – rumah sakit D. Lensa – jantung E. Album – pasien

1. Uji A: kamera adalah alat kerja fotografer; stetoskop adalah alat kerja dokter. Pola: alat : pemakai. Cocok.
2. Uji B: foto adalah hasil karya fotografer, tetapi telinga bukan hasil karya stetoskop. Pola berbeda.
3. Uji C: studio adalah tempat kerja fotografer, sedangkan stetoskop : rumah sakit adalah alat : tempat. Kedua sisi tidak sejajar.
4. Uji D dan E: hubungan tidak konsisten.
5. Jawaban: **A**.

**Contoh 3.** GERIMIS : HUJAN = ANGIN SEPOI : …

1. Hubungan: tingkat lemah ke tingkat lebih kuat pada fenomena yang sama.
2. Angin sepoi yang lebih kuat → **angin kencang**. Pilihan "badai petir" melompat dua tingkat dan mengubah jenis fenomena.

## Teknik skor kecocokan

Jika masih ragu antara dua pilihan, beri skor kecocokan untuk empat lapis (jenis, arah, derajat, kelas kata), masing-masing bernilai 1. Pilih skor tertinggi. Misalnya pilihan X memenuhi 3 dari 4 lapis, sedangkan Y memenuhi 4 dari 4; maka skor $\frac{4}{4} > \frac{3}{4}$ dan Y dipilih.

| Lapis | Pertanyaan pemeriksa |
| --- | --- |
| Jenis | Apakah kalimat penghubungnya sama? |
| Arah | Apakah urutan A → B sejajar dengan C → D? |
| Derajat | Apakah lompatan tingkatnya sama besar? |
| Kelas kata | Apakah kelas kata kedua anggota sejajar? |

## Jebakan lain yang perlu diwaspadai

- **Kata yang sangat berasosiasi**, misalnya LEBAH : MADU lalu pilihan "sengat". Asosiasi kuat belum tentu hubungan yang sama.
- **Sinonim jawaban.** BERUDU dan KECEBONG bersinonim; jika soal meminta bentuk dewasa, sinonim tahap muda adalah pengecoh.
- **Kategori setingkat**: KABUPATEN sejajar dengan KOTA, bukan satu tingkat di atasnya.

## Ringkasan

- Soal HOTS menguji beberapa lapis hubungan sekaligus.
- Periksa derajat, arah, dan kelas kata setelah menentukan jenis hubungan.
- Untuk analogi dua rumpang, uji setiap pilihan sebagai pasangan utuh di kedua sisi.

## Tips cepat

1. Tulis kalimat penghubung lengkap, bukan hanya "berhubungan dengan".
2. Jika dua pilihan cocok, pertajam kalimat dengan keterangan derajat atau fungsi.
3. Untuk dua rumpang, mulai dari pilihan yang kata pertamanya paling jelas terkait dengan kata soal.
4. Batasi waktu 45 detik; jika masih ragu, pakai teknik skor kecocokan.
$md$,
   false, 4, 13),
  ('tiu-antonim', 'Jenis-Jenis Antonim dan Daftar Pasangan Kata', 'tiu-antonim-jenis-daftar-kata', 'Mengenal antonim mutlak, bertingkat, relasional, dan majemuk disertai tabel besar pasangan lawan kata yang sering diuji.',
$md$
## Apa itu antonim?

Antonim adalah kata yang **maknanya berlawanan** dengan kata lain. Soal antonim TIU biasanya berbentuk "Lawan kata FANA adalah …". Sama seperti sinonim, kata yang diuji umumnya kata serapan atau kata baku. Bedanya, pada soal antonim pembuat soal hampir selalu menyelipkan **sinonim** kata soal di antara pilihan, karena peserta yang tergesa-gesa sering memilih kata yang "terasa berhubungan".

> **Ingat:** dalam soal antonim, pilihan yang bermakna sama dengan kata soal pasti salah.

## Empat jenis antonim

### 1. Antonim mutlak (biner)

Dua kata yang tidak memiliki jalan tengah. Jika satu benar, yang lain pasti salah: *hidup–mati*, *lulus–gagal*, *hadir–absen*. Tidak ada keadaan "agak hidup".

### 2. Antonim bertingkat (gradual)

Ada tingkatan di antara keduanya: *panas–dingin* (ada hangat dan sejuk), *kaya–miskin*, *gersang–subur*. Saat menjawab, pilih **kutub yang berseberangan**, bukan tingkat tengah. Lawan *panas* adalah *dingin*, bukan *hangat*.

### 3. Antonim relasional (kebalikan)

Kedua kata saling mengandaikan: tidak ada *guru* tanpa *murid*, tidak ada *penjual* tanpa *pembeli*, tidak ada *ekspor* tanpa *impor* dalam perdagangan antarnegara. Relasi ini juga muncul pada pasangan *memberi–menerima* dan *promosi–demosi*.

### 4. Antonim majemuk

Satu kata dibandingkan dengan beberapa kata dalam satu kelompok: *merah* tidak sama dengan *kuning*, *hijau*, atau *biru*. Jenis ini jarang diuji di SKD karena jawabannya tidak tunggal.

## Ringkasan jenis dalam tabel

| Jenis | Ciri | Contoh |
| --- | --- | --- |
| Mutlak | tidak ada jalan tengah | hidup–mati |
| Bertingkat | ada tingkat di antaranya | panas–dingin |
| Relasional | saling mengandaikan | penjual–pembeli |
| Majemuk | satu lawan banyak | merah–(kuning, hijau, biru) |

## Tabel pasangan antonim yang sering diuji

| No | Kata | Antonim |
| --- | --- | --- |
| 1 | Eksplisit | implisit |
| 2 | Konkret | abstrak |
| 3 | Statis | dinamis |
| 4 | Heterogen | homogen |
| 5 | Mayor | minor |
| 6 | Surplus | defisit |
| 7 | Inflasi | deflasi |
| 8 | Vertikal | horizontal |
| 9 | Eksternal | internal |
| 10 | Promosi (jabatan) | demosi |
| 11 | Sintesis | analisis |
| 12 | Ofensif | defensif |
| 13 | Introver | ekstrover |
| 14 | Amatir | profesional |
| 15 | Sakral | profan |
| 16 | Tentatif | definitif |
| 17 | Absolut / mutlak | relatif / nisbi |
| 18 | Optimis | pesimis |
| 19 | Progresif | konservatif |
| 20 | Kikir | dermawan |
| 21 | Lalim | adil |
| 22 | Gersang | subur |
| 23 | Muskil | mudah |
| 24 | Akselerasi | perlambatan |
| 25 | Cembung | cekung |
| 26 | Pasang (air laut) | surut |
| 27 | Ekspor | impor |
| 28 | Imigrasi | emigrasi |
| 29 | Makro | mikro |
| 30 | Maksimum | minimum |
| 31 | Mayoritas | minoritas |
| 32 | Sekuler | religius |
| 33 | Formal | informal |
| 34 | Aktif | pasif |
| 35 | Prolog | epilog |
| 36 | Rigid | luwes |
| 37 | Hulu | hilir |
| 38 | Fana | baka |
| 39 | Sporadis | terus-menerus |
| 40 | Apatis | peduli |
| 41 | Boros | hemat |
| 42 | Ceroboh | cermat |
| 43 | Anonim | bernama |
| 44 | Rajin | malas |

## Contoh soal dan pembahasan

**Contoh 1.** Lawan kata MAYORITAS adalah …
A. kebanyakan B. sebagian besar C. minoritas D. umumnya E. mayor

1. Mayoritas = jumlah yang lebih besar.
2. Kebanyakan, sebagian besar, dan umumnya justru sinonimnya. "Mayor" hanya bentuk kata yang mirip.
3. Jawaban: **C. minoritas**.

**Contoh 2.** Lawan kata CEROBOH adalah …
A. lalai B. sembrono C. cermat D. lambat E. pemalas

1. Ceroboh termasuk antonim bertingkat: ceroboh → kurang hati-hati → hati-hati → cermat.
2. Lalai dan sembrono bersinonim; lambat dan pemalas hanya berasosiasi.
3. Jawaban: **C. cermat**.

**Contoh 3.** Lawan kata IMIGRASI adalah …
A. transmigrasi B. urbanisasi C. emigrasi D. migrasi E. imigran

1. Imigrasi = perpindahan orang **masuk** ke suatu negara.
2. Transmigrasi dan urbanisasi adalah perpindahan di dalam negeri; migrasi adalah istilah umum; imigran adalah orangnya.
3. Emigrasi = perpindahan **keluar** dari negara sendiri, pasangan relasionalnya. Jawaban: **C**.

## Peta eliminasi

Dari lima pilihan, sering kali dua sampai tiga pilihan adalah sinonim. Jika Anda mencoret tiga sinonim, peluang benar menjadi $\frac{1}{2} = 50\%$ meski Anda belum tahu jawabannya, jauh di atas tebakan buta $20\%$.

## Ringkasan

- Kenali empat jenis antonim: mutlak, bertingkat, relasional, majemuk.
- Untuk antonim bertingkat, pilih kutub yang berseberangan.
- Sinonim kata soal di antara pilihan adalah pengecoh utama.
- Hafalkan tabel secara berpasangan agar dua kata sekaligus teringat.

## Tips cepat

1. Ucapkan "X lawannya …" sebelum membaca pilihan.
2. Coret semua pilihan yang terasa bersinonim dengan kata soal.
3. Perhatikan konteks kata bermakna ganda (misalnya *pasang* air laut vs *pasang* barang).
4. Banyak serapan berpasangan secara morfologis: *eks-/in-*, *makro-/mikro-*, *maks-/min-*.
$md$,
   true, 1, 14),
  ('tiu-antonim', 'Strategi Antonim: Imbuhan, Prefiks Serapan, dan Jebakan Sinonim', 'tiu-antonim-strategi-jebakan', 'Memanfaatkan imbuhan dan prefiks serapan untuk menebak lawan kata, membaca konteks kalimat, serta menghindari jebakan sinonim di pilihan jawaban.',
$md$
## Tiga senjata utama

Jika Anda tidak hafal sebuah kata, soal antonim masih bisa dijawab dengan tiga senjata:

1. **Analisis imbuhan dan prefiks serapan** — banyak kata serapan dibentuk dengan awalan yang menandai lawan makna.
2. **Konteks kalimat** — makna kata yang berlawanan bergantung pada pemakaiannya.
3. **Eliminasi sinonim** — pilihan yang bermakna sama dengan kata soal pasti salah.

## Senjata 1: prefiks serapan

Bahasa Indonesia menyerap banyak awalan dari bahasa Latin, Yunani, dan Inggris. Awalan berikut sering menandai makna "tidak" atau "kebalikan":

| Prefiks | Makna | Contoh kata | Lawannya |
| --- | --- | --- | --- |
| a- | tidak, tanpa | asimetris | simetris |
| a- | tidak, tanpa | ateis | teis |
| in- / im- | tidak | informal | formal |
| in- / im- | tidak | imparsial | parsial (memihak) |
| ir- / il- | tidak | irasional | rasional |
| ir- / il- | tidak | ilegal | legal |
| de- | menurunkan, kebalikan | deflasi | inflasi |
| de- | menurunkan, kebalikan | desentralisasi | sentralisasi |
| anti- | melawan | antisosial | sosial |
| non- | bukan | nonaktif | aktif |
| dis- | tidak, kebalikan | disharmoni | harmoni |
| eks- / in- | luar / dalam | eksternal | internal |

Hati-hati: tidak semua kata yang berawal "in-" bermakna "tidak". *Inflasi*, *inovasi*, dan *intensif* bukan bentuk negatif dari kata lain. Prefiks hanya petunjuk, bukan rumus.

## Senjata 2: imbuhan dan bentuk kata asli

Kata Indonesia asli sering membentuk lawan kata dengan pola yang sama. Pastikan kelas kata dan imbuhan jawaban **sejajar** dengan kata soal:

| Kata soal | Antonim sejajar | Pilihan yang tidak sejajar |
| --- | --- | --- |
| menaikkan | menurunkan | turun |
| pemasukan | pengeluaran | keluar |
| bertambah | berkurang | kurang |
| kedatangan | kepergian | pergi |
| terbuka | tertutup | tutup |

## Tabel tambahan antonim serapan

| No | Kata | Antonim |
| --- | --- | --- |
| 1 | Parsial | menyeluruh |
| 2 | Legal | ilegal |
| 3 | Simetris | asimetris |
| 4 | Sentralisasi | desentralisasi |
| 5 | Harmoni | disharmoni |
| 6 | Kolektif | individual |
| 7 | Konstruktif | destruktif |
| 8 | Kontra | pro |
| 9 | Konveks | konkaf |
| 10 | Divergen | konvergen |
| 11 | Deduktif | induktif |
| 12 | Subjektif | objektif |
| 13 | Teoretis | praktis |
| 14 | Kualitatif | kuantitatif |
| 15 | Ofensif | defensif |
| 16 | Dinamis | statis |
| 17 | Eksklusif | inklusif |
| 18 | Akut | kronis |
| 19 | Transparan | tertutup |
| 20 | Rasional | irasional |
| 21 | Preventif | kuratif |
| 22 | Universal | partikular |
| 23 | Klimaks | antiklimaks |
| 24 | Proaktif | reaktif |
| 25 | Ekspansi | kontraksi |
| 26 | Apresiasi | depresiasi (nilai) |
| 27 | Surplus | defisit |
| 28 | Positif | negatif |
| 29 | Intrinsik | ekstrinsik |
| 30 | Tentatif | definitif |
| 31 | Aposteriori | apriori |

## Senjata 3: konteks dan eliminasi sinonim

Beberapa kata memiliki lawan berbeda menurut konteks. *Tinggi* lawannya *pendek* (untuk orang) atau *rendah* (untuk harga, suara, gedung). *Pasang* pada air laut lawannya *surut*, tetapi pada barang lawannya *lepas* atau *copot*. Jika soal memberi kalimat, tentukan konteksnya dulu.

## Contoh soal dan pembahasan

**Contoh 1.** "Program imunisasi itu bersifat PREVENTIF." Lawan kata bercetak kapital adalah …
A. kuratif B. pencegahan C. antisipatif D. protektif E. promotif

1. Konteks kesehatan: preventif = bersifat mencegah sebelum sakit.
2. Pencegahan, antisipatif, dan protektif searah maknanya. Coret.
3. Promotif = bersifat meningkatkan kesehatan, bukan kebalikan.
4. Kuratif = bersifat menyembuhkan setelah sakit. Jawaban: **A**.

**Contoh 2.** Lawan kata DESENTRALISASI adalah …
A. otonomi B. sentralisasi C. pemekaran D. demokratisasi E. swatantra

1. Prefiks *de-* memberi petunjuk kebalikan: desentralisasi = penyerahan wewenang dari pusat ke daerah.
2. Kebalikannya = pemusatan wewenang = sentralisasi.
3. Otonomi, pemekaran, dan swatantra berkaitan dengan daerah sehingga searah; demokratisasi hanya berasosiasi. Jawaban: **B**.

**Contoh 3.** Lawan kata MENAIKKAN adalah …

1. Kata soal berimbuhan *me-kan* (kata kerja aktif transitif).
2. Jawaban sejajar: **menurunkan**, bukan "turun" atau "penurunan".

## Hitungan cepat eliminasi

Misalkan dari lima pilihan Anda yakin dua adalah sinonim kata soal. Peluang menebak benar menjadi $\frac{1}{5-2} = \frac{1}{3}$. Jika tiga dapat dicoret, peluangnya $\frac{1}{2}$. Setiap eliminasi menaikkan peluang secara nyata.

## Ringkasan

- Prefiks serapan (*a-, in-, ir-, il-, de-, anti-, non-, dis-*) sering menandai lawan makna, tetapi bukan rumus mutlak.
- Antonim yang baik sejajar kelas kata dan imbuhannya.
- Tentukan konteks untuk kata bermakna ganda.
- Coret sinonim lebih dulu; sisanya jauh lebih mudah dipilih.

## Tips cepat

1. Pecah kata serapan menjadi prefiks + akar, lalu balikkan prefiksnya.
2. Jika dua pilihan sama-sama berlawanan, pilih yang **paling langsung** berlawanan dan sejajar bentuknya.
3. Istilah satu bidang (ekonomi, hukum) sering dijadikan pengecoh; pastikan maknanya benar-benar berkebalikan.
4. Baca ulang kata soal: soal "lawan kata" sering tertukar dibaca "persamaan kata" saat panik.
$md$,
   false, 2, 13),
  ('tiu-berhitung', 'Kumpulan Trik HOTS Berhitung', 'tiu-berhitung-trik-hots', 'Teknik angka satuan, deret teleskopik, pasangan Gauss bertanda selang-seling, notasi ilmiah, membandingkan pecahan, dan estimasi untuk soal hitung HOTS.',
$md$
## Mengapa perlu trik khusus?

Soal berhitung HOTS dirancang agar **tidak mungkin** dikerjakan dengan hitungan biasa dalam waktu satu menit. Misalnya angka satuan dari $8^{2031}$ atau jumlah puluhan pecahan. Kuncinya adalah mengenali **struktur** soal. Berikut enam trik yang paling sering dibutuhkan.

## 1. Angka satuan bilangan berpangkat

Angka satuan pangkat selalu berulang dalam siklus pendek.

| Angka satuan basis | Siklus angka satuan | Panjang siklus |
| --- | --- | --- |
| 0, 1, 5, 6 | tetap | 1 |
| 2 | 2, 4, 8, 6 | 4 |
| 3 | 3, 9, 7, 1 | 4 |
| 4 | 4, 6 | 2 |
| 7 | 7, 9, 3, 1 | 4 |
| 8 | 8, 4, 2, 6 | 4 |
| 9 | 9, 1 | 2 |

Cara pakai: hitung sisa pembagian pangkat oleh panjang siklus. Sisa 0 berarti ambil anggota **terakhir** siklus.

**Contoh 1.** Tentukan angka satuan $3^{2027}$.

1. Siklus 3: (3, 9, 7, 1), panjang 4.
2. $2027 = 4 \times 506 + 3$, sisa 3.
3. Anggota ke-3 siklus adalah **7**.

**Contoh 2.** Angka satuan $12^{40}$?

1. Cukup lihat angka satuan basis, yaitu 2. Siklus (2, 4, 8, 6).
2. $40 \div 4$ bersisa 0, jadi ambil anggota terakhir: **6**.

## 2. Deret teleskopik

Pecahan berbentuk $\dfrac{1}{n(n+1)}$ dapat dipecah menjadi $\dfrac{1}{n} - \dfrac{1}{n+1}$. Saat dijumlahkan, suku tengah saling menghapus seperti teropong yang dilipat.

**Contoh 3.** Hitung $\dfrac{1}{2 \cdot 3} + \dfrac{1}{3 \cdot 4} + \dots + \dfrac{1}{11 \cdot 12}$.

1. Tulis sebagai $\left(\tfrac{1}{2} - \tfrac{1}{3}\right) + \left(\tfrac{1}{3} - \tfrac{1}{4}\right) + \dots + \left(\tfrac{1}{11} - \tfrac{1}{12}\right)$.
2. Yang tersisa hanya suku pertama dan terakhir: $\tfrac{1}{2} - \tfrac{1}{12} = \tfrac{5}{12}$.

Variasi: $\dfrac{1}{n(n+2)} = \dfrac{1}{2}\left(\dfrac{1}{n} - \dfrac{1}{n+2}\right)$. Jangan lupa faktor $\tfrac{1}{2}$.

## 3. Pasangan Gauss dan tanda bergantian

Jumlah $1 + 2 + \dots + n = \dfrac{n(n+1)}{2}$. Untuk deret bertanda bergantian, **pasangkan** suku-suku berdekatan.

**Contoh 4.** Hitung $2 - 4 + 6 - 8 + \dots + 98 - 100$.

1. Pasangkan: $(2 - 4) + (6 - 8) + \dots + (98 - 100)$.
2. Setiap pasangan bernilai $-2$. Banyak suku 50, jadi ada 25 pasangan.
3. Hasil $= 25 \times (-2) = -50$.

**Contoh 5.** Hitung $50^2 - 49^2 + 48^2 - 47^2 + \dots + 2^2 - 1^2$.

1. Setiap pasangan $a^2 - (a-1)^2 = a + (a - 1)$.
2. Jadi jumlahnya sama dengan $50 + 49 + \dots + 1 = \dfrac{50 \times 51}{2} = 1275$.

## 4. Notasi ilmiah

Pisahkan **angka depan** dan **pangkat sepuluh**, hitung masing-masing.

**Contoh 6.** Hitung $\dfrac{4{,}8 \times 10^{5} \times 2{,}5 \times 10^{-3}}{6 \times 10^{-1}}$.

1. Angka depan: $\dfrac{4{,}8 \times 2{,}5}{6} = \dfrac{12}{6} = 2$.
2. Pangkat: $10^{5 + (-3) - (-1)} = 10^{3}$.
3. Hasil $= 2 \times 10^3 = 2000$.

## 5. Membandingkan pecahan

| Cara | Kapan dipakai |
| --- | --- |
| Perkalian silang | membandingkan dua pecahan: $\tfrac{a}{b}$ vs $\tfrac{c}{d}$ → bandingkan $ad$ dan $bc$ |
| Ubah ke desimal | banyak pecahan dengan penyebut kecil |
| Selisih dengan 1 | pecahan dekat 1, misal $\tfrac{8}{9}$ vs $\tfrac{9}{10}$ |

**Contoh 7.** Mana yang lebih besar, $\tfrac{11}{13}$ atau $\tfrac{17}{20}$?

1. Kali silang: $11 \times 20 = 220$ dan $17 \times 13 = 221$.
2. Karena $220 < 221$, maka $\tfrac{11}{13} < \tfrac{17}{20}$.

Trik selisih dengan 1: $\tfrac{8}{9} = 1 - \tfrac{1}{9}$ dan $\tfrac{9}{10} = 1 - \tfrac{1}{10}$. Karena $\tfrac{1}{10}$ lebih kecil, $\tfrac{9}{10}$ lebih besar.

## 6. Estimasi

Jika pilihan jawaban berjauhan, bulatkan angka lalu hitung kasar.

**Contoh 8.** Nilai paling dekat dengan $\sqrt{99} \times \sqrt{26}$?

1. $\sqrt{99} \approx 10$ dan $\sqrt{26} \approx 5$.
2. Perkiraan $\approx 50$. Nilai sebenarnya $\sqrt{2574} \approx 50{,}7$.

Untuk bentuk $\sqrt{a} \times \sqrt{b}$, kadang lebih cepat menggabungkan: $\sqrt{20} \times \sqrt{45} = \sqrt{900} = 30$ tepat.

## Ringkasan

- Angka satuan pangkat mengikuti siklus; gunakan sisa bagi.
- Deret pecahan $\tfrac{1}{n(n+1)}$ dihitung dengan teleskopik.
- Deret bertanda bergantian diselesaikan dengan berpasangan.
- Notasi ilmiah: hitung angka depan dan pangkat secara terpisah.
- Bandingkan pecahan dengan kali silang atau selisih terhadap 1.
- Estimasi menyelamatkan waktu bila pilihan berjauhan.

## Tips cepat

1. Lihat pilihan jawaban sebelum menghitung; sering kali estimasi cukup.
2. Hafalkan siklus angka satuan 2, 3, 7, dan 8.
3. Pada deret panjang, tulis dua atau tiga suku pertama dan terakhir untuk melihat pola penghapusan.
4. Hitung banyak suku dengan teliti sebelum membagi menjadi pasangan.
5. Gabungkan akar ($\sqrt{a}\sqrt{b} = \sqrt{ab}$) bila hasil kalinya kuadrat sempurna.
$md$,
   false, 4, 14),
  ('tiu-deret-angka', 'Strategi 60 Detik Menebak Pola Deret', 'tiu-deret-strategi-60-detik', 'Urutan pemeriksaan pola deret yang paling efisien, rumus suku ke-n dan jumlah deret aritmetika-geometri, serta teknik deret huruf dengan nomor urut.',
$md$
## Masalah utama: waktu

Rata-rata waktu per soal TIU kurang dari satu menit. Pada soal deret, peserta sering macet karena mencoba pola secara acak. Solusinya adalah **urutan pemeriksaan tetap** — semacam daftar periksa — yang dijalankan dari pola paling umum ke pola paling jarang.

## Daftar periksa 8 langkah

| Urutan | Cek | Tanda-tanda | Contoh |
| --- | --- | --- | --- |
| 1 | Selisih tetap | naik/turun teratur | 4, 9, 14, 19 |
| 2 | Rasio tetap | naik/turun sangat cepat, habis dibagi | 5, 15, 45, 135 |
| 3 | Selang-seling | naik-turun tidak konsisten | 2, 30, 4, 27, 6, 24 |
| 4 | Bertingkat | selisih membentuk pola baru | 3, 5, 9, 15, 23 |
| 5 | Kuadrat/kubik | dekat dengan 1, 4, 9, 16 atau 1, 8, 27 | 3, 6, 11, 18 ($n^2 + 2$) |
| 6 | Bilangan prima | tidak ada selisih teratur, semua ganjil kecuali 2 | 11, 13, 17, 19 |
| 7 | Penjumlahan suku sebelumnya | mirip Fibonacci | 1, 2, 3, 6, 11, 20 |
| 8 | Bentuk campuran | angka "tanggung" | 2, 12, 36, 80 ($n^2(n+1)$) |

Biasakan menulis **selisih** di bawah deret secara otomatis. Selisih adalah sumber informasi paling kaya: dari sana terlihat apakah pola tetap, bertingkat, atau selang-seling.

## Contoh penerapan

**Contoh 1.** 3, 5, 9, 15, 23, …

1. Langkah 1: selisih 2, 4, 6, 8 — tidak tetap.
2. Langkah 4: selisih naik 2 setiap kali (bertingkat). Selisih berikutnya 10.
3. Suku berikutnya $23 + 10 = 33$.

**Contoh 2.** 2, 30, 4, 27, 6, 24, …

1. Selisih tidak teratur: +28, −26, +23, … Curigai selang-seling.
2. Suku ganjil: 2, 4, 6 (naik 2). Suku genap: 30, 27, 24 (turun 3).
3. Suku ke-7 adalah suku ganjil: **8**.

**Contoh 3.** 1, 2, 3, 6, 11, 20, …

1. Selisih 1, 1, 3, 5, 9 — tidak berpola jelas.
2. Langkah 7: $1 + 2 + 3 = 6$, $2 + 3 + 6 = 11$, $3 + 6 + 11 = 20$. Ini pola **tribonacci** (jumlah tiga suku sebelumnya).
3. Berikutnya $6 + 11 + 20 = 37$.

**Contoh 4.** 2, 12, 36, 80, …

1. Selisih 10, 24, 44 dan rasio tidak tetap.
2. Faktorkan: $2 = 1^2 \times 2$, $12 = 2^2 \times 3$, $36 = 3^2 \times 4$, $80 = 4^2 \times 5$.
3. Pola $n^2(n+1)$, sehingga suku ke-5 $= 25 \times 6 = 150$.

## Rumus suku ke-n dan jumlah

Soal kadang menanyakan suku jauh (ke-40, ke-100) atau jumlah beberapa suku. Jangan menulis satu per satu.

| Jenis | Suku ke-$n$ | Jumlah $n$ suku pertama |
| --- | --- | --- |
| Aritmetika (beda $b$) | $U_n = a + (n-1)b$ | $S_n = \dfrac{n}{2}\,(2a + (n-1)b)$ |
| Geometri (rasio $r$) | $U_n = a\,r^{\,n-1}$ | $S_n = \dfrac{a(r^n - 1)}{r - 1}$ |

**Contoh 5.** Suku ke-40 dari 7, 11, 15, 19, …

1. $a = 7$, $b = 4$.
2. $U_{40} = 7 + 39 \times 4 = 163$.
3. Jebakan: memakai $40 \times 4$ sehingga hasilnya 167.

**Contoh 6.** Jumlah 15 suku pertama dari 2, 5, 8, …

1. $a = 2$, $b = 3$.
2. $S_{15} = \dfrac{15}{2}(4 + 14 \times 3) = \dfrac{15}{2} \times 46 = 345$.

**Contoh 7.** Jumlah 6 suku pertama dari 3, 6, 12, …

1. $a = 3$, $r = 2$.
2. $S_6 = \dfrac{3(2^6 - 1)}{2 - 1} = 3 \times 63 = 189$.

## Deret huruf dengan nomor urut

Ubah setiap huruf menjadi nomor urutnya, kerjakan sebagai deret angka, lalu kembalikan ke huruf.

| A | B | C | D | E | F | G | H | I | J | K | L | M |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 |
| **N** | **O** | **P** | **Q** | **R** | **S** | **T** | **U** | **V** | **W** | **X** | **Y** | **Z** |
| 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 | 25 | 26 |

Patokan hafalan cepat: **E = 5, J = 10, O = 15, T = 20, Y = 25**.

**Contoh 8.** D, G, K, P, …

1. Nomor urut: 4, 7, 11, 16.
2. Selisih 3, 4, 5, sehingga berikutnya +6 menjadi 22.
3. Huruf ke-22 adalah **V**.

Jika hasil melebihi 26, kurangi 26 (huruf berputar kembali ke A).

## Ringkasan

- Jalankan daftar periksa: selisih → rasio → selang-seling → bertingkat → kuadrat/kubik → prima → penjumlahan suku → bentuk campuran.
- Tulis selisih di bawah deret sebagai kebiasaan.
- Gunakan rumus $U_n$ dan $S_n$ untuk suku jauh dan jumlah.
- Deret huruf diubah ke nomor urut dengan patokan E-J-O-T-Y.

## Tips cepat

1. Deret yang naik turun hampir selalu selang-seling.
2. Deret yang naik sangat cepat: cek rasio atau perkalian dengan tambahan.
3. Jika selisih tingkat pertama tidak berpola, hitung selisih tingkat kedua.
4. Angka seperti 2, 12, 36, 80 atau 2, 9, 28, 65 menandakan pangkat.
5. Jika dalam 45 detik belum menemukan pola, lewati dulu dan kembali nanti.
$md$,
   false, 4, 13),
  ('tiu-geometri', 'Bangun Datar, Pythagoras, dan Sudut Poligon', 'tiu-geometri-bangun-datar', 'Rumus luas dan keliling bangun datar, tripel Pythagoras, sudut segi-n, serta teknik menghitung daerah arsiran.',
$md$
## Mengapa geometri muncul di TIU?

Soal geometri di TIU biasanya berupa soal hitung singkat: luas kebun, keliling pagar, panjang tangga yang bersandar, atau luas daerah yang diarsir. Rumusnya sederhana, tetapi jebakannya ada pada **satuan**, **jari-jari versus diameter**, dan **membaca apa yang ditanyakan**.

## 1. Rumus luas dan keliling

| Bangun | Luas | Keliling |
| --- | --- | --- |
| Persegi (sisi $s$) | $s^2$ | $4s$ |
| Persegi panjang ($p$, $l$) | $p \times l$ | $2(p + l)$ |
| Segitiga (alas $a$, tinggi $t$) | $\tfrac{1}{2} a t$ | jumlah ketiga sisi |
| Jajar genjang | $a \times t$ | $2(a + b)$ |
| Trapesium (sisi sejajar $a$, $b$) | $\tfrac{1}{2}(a + b)t$ | jumlah keempat sisi |
| Belah ketupat (diagonal $d_1$, $d_2$) | $\tfrac{1}{2} d_1 d_2$ | $4s$ |
| Layang-layang | $\tfrac{1}{2} d_1 d_2$ | $2(a + b)$ |
| Lingkaran (jari-jari $r$) | $\pi r^2$ | $2\pi r = \pi d$ |

Gunakan $\pi = \tfrac{22}{7}$ bila jari-jari kelipatan 7, dan $\pi = 3{,}14$ bila tidak.

**Contoh 1.** Keliling persegi panjang 46 cm dan panjangnya 15 cm. Berapa luasnya?

1. $2(p + l) = 46$, jadi $p + l = 23$ dan $l = 8$ cm.
2. Luas $= 15 \times 8 = 120$ cm².

**Contoh 2.** Sebuah lingkaran berdiameter 42 cm. Tentukan luasnya.

1. Jari-jari $r = 21$ cm (bukan 42!).
2. Luas $= \tfrac{22}{7} \times 21 \times 21 = 1386$ cm².
3. Jika Anda memakai 42 sebagai jari-jari, hasilnya 5544 cm² — empat kali lipat dan pasti salah.

## 2. Teorema Pythagoras dan tripel

Pada segitiga siku-siku dengan sisi siku $a$, $b$ dan sisi miring $c$:

$$a^2 + b^2 = c^2$$

Hafalkan tripel berikut beserta kelipatannya agar tidak perlu menghitung akar:

| Tripel dasar | Kelipatan yang sering muncul |
| --- | --- |
| 3, 4, 5 | 6, 8, 10 · 9, 12, 15 · 12, 16, 20 |
| 5, 12, 13 | 10, 24, 26 |
| 8, 15, 17 | 16, 30, 34 |
| 7, 24, 25 | 14, 48, 50 |
| 20, 21, 29 | — |

**Contoh 3.** Tangga sepanjang 17 m bersandar pada tembok. Kaki tangga berjarak 8 m dari tembok. Berapa tinggi ujung tangga?

1. Sisi miring 17, satu sisi siku 8. Ini tripel 8–15–17.
2. Tinggi $= \sqrt{17^2 - 8^2} = \sqrt{289 - 64} = \sqrt{225} = 15$ m.

**Contoh 4 (belah ketupat).** Diagonal belah ketupat 16 cm dan 30 cm. Tentukan kelilingnya.

1. Diagonal saling membagi dua tegak lurus, sehingga terbentuk segitiga siku-siku dengan sisi 8 dan 15.
2. Sisi belah ketupat $= 17$ cm (tripel 8–15–17).
3. Keliling $= 4 \times 17 = 68$ cm.

## 3. Sudut pada poligon

Untuk segi-$n$:

- Jumlah sudut dalam: $(n - 2) \times 180^\circ$.
- Satu sudut dalam segi-$n$ **beraturan**: $\dfrac{(n - 2) \times 180^\circ}{n}$.
- Jumlah sudut luar selalu $360^\circ$, sehingga satu sudut luar beraturan $= \dfrac{360^\circ}{n}$.

| $n$ | Nama | Jumlah sudut dalam | Satu sudut dalam (beraturan) |
| --- | --- | --- | --- |
| 5 | segi lima | $540^\circ$ | $108^\circ$ |
| 6 | segi enam | $720^\circ$ | $120^\circ$ |
| 8 | segi delapan | $1080^\circ$ | $135^\circ$ |
| 10 | segi sepuluh | $1440^\circ$ | $144^\circ$ |

**Contoh 5.** Satu sudut luar sebuah segi-$n$ beraturan adalah $24^\circ$. Berapa banyak sisinya?

1. $n = \dfrac{360^\circ}{24^\circ} = 15$.
2. Jadi bangun tersebut segi lima belas. Cara lewat sudut luar jauh lebih cepat daripada lewat sudut dalam.

Hubungan sudut lain yang sering muncul: dua sudut **berpelurus** berjumlah $180^\circ$, dua sudut **berpenyiku** berjumlah $90^\circ$, dan jumlah sudut segitiga $180^\circ$.

## 4. Daerah arsiran

Prinsipnya: **luas arsiran = luas bangun besar − luas bagian yang tidak diarsir**.

**Contoh 6.** Di dalam persegi bersisi 28 cm terdapat lingkaran yang menyinggung keempat sisinya. Berapa luas daerah di dalam persegi tetapi di luar lingkaran?

1. Diameter lingkaran = sisi persegi = 28 cm, jadi $r = 14$ cm.
2. Luas persegi $= 784$ cm².
3. Luas lingkaran $= \tfrac{22}{7} \times 14^2 = 616$ cm².
4. Luas arsiran $= 784 - 616 = 168$ cm².

**Contoh 7.** Taman persegi panjang 30 m × 20 m dikelilingi jalan selebar 1 m di bagian luarnya. Berapa luas jalan?

1. Ukuran luar menjadi $(30 + 2) \times (20 + 2) = 32 \times 22 = 704$ m².
2. Luas taman $= 600$ m².
3. Luas jalan $= 704 - 600 = 104$ m². Jebakan: menambah lebar jalan hanya sekali (bukan di kedua sisi).

## Ringkasan

- Kuasai tabel rumus luas dan keliling; bedakan jari-jari dan diameter.
- Gunakan tripel Pythagoras untuk menghindari perhitungan akar.
- Jumlah sudut dalam segi-$n$ adalah $(n - 2) \times 180^\circ$; sudut luar total $360^\circ$.
- Daerah arsiran dihitung dengan prinsip pengurangan luas.

## Tips cepat

1. Gambar sketsa kecil, walau soal tidak menyertakan gambar.
2. Pilih nilai $\pi$ yang membuat hitungan bulat.
3. Tulis satuan di setiap langkah; luas bersatuan persegi.
4. Untuk jalan atau bingkai di sekeliling bangun, tambahkan lebarnya **dua kali** pada tiap ukuran.
5. Jika muncul segitiga siku-siku, cek dulu apakah sisinya tripel yang dikenal.
$md$,
   true, 1, 14),
  ('tiu-geometri', 'Bangun Ruang, Konversi Liter, dan Efek Skala', 'tiu-geometri-bangun-ruang', 'Rumus volume dan luas permukaan bangun ruang utama, konversi satuan volume ke liter, serta pengaruh perbesaran terhadap luas dan volume.',
$md$
## Gambaran umum

Soal bangun ruang di TIU umumnya meminta **volume** (isi bak, tangki, kemasan) atau **luas permukaan** (bahan pembungkus, cat). Soal HOTS sering memadukan rumus dengan **konversi satuan** atau **perubahan ukuran**. Pelajaran ini membahas ketiganya.

## 1. Tabel rumus bangun ruang

| Bangun | Volume | Luas permukaan |
| --- | --- | --- |
| Kubus (rusuk $s$) | $s^3$ | $6s^2$ |
| Balok ($p$, $l$, $t$) | $p\,l\,t$ | $2(pl + pt + lt)$ |
| Prisma | luas alas × tinggi | $2 \times$ luas alas + keliling alas × tinggi |
| Tabung ($r$, $t$) | $\pi r^2 t$ | $2\pi r^2 + 2\pi r t$ |
| Kerucut ($r$, $t$, garis pelukis $s$) | $\tfrac{1}{3}\pi r^2 t$ | $\pi r^2 + \pi r s$ |
| Limas | $\tfrac{1}{3}$ × luas alas × tinggi | luas alas + jumlah luas sisi tegak |
| Bola ($r$) | $\tfrac{4}{3}\pi r^3$ | $4\pi r^2$ |

Hubungan penting: volume kerucut adalah $\tfrac{1}{3}$ volume tabung dengan alas dan tinggi sama; demikian pula limas terhadap prisma. Garis pelukis kerucut memenuhi $s^2 = r^2 + t^2$.

Hal lain yang sering ditanyakan:

- Diagonal sisi kubus $= s\sqrt{2}$, diagonal ruang kubus $= s\sqrt{3}$.
- Diagonal ruang balok $= \sqrt{p^2 + l^2 + t^2}$.
- Panjang kerangka kubus $= 12s$; kerangka balok $= 4(p + l + t)$.

**Contoh 1.** Luas permukaan sebuah kubus 216 cm². Berapa volumenya?

1. $6s^2 = 216$, jadi $s^2 = 36$ dan $s = 6$ cm.
2. Volume $= 6^3 = 216$ cm³. (Kebetulan angkanya sama, tetapi satuannya berbeda.)

**Contoh 2.** Sebuah tabung berjari-jari 14 cm dan tinggi 20 cm. Tentukan volumenya.

1. $V = \tfrac{22}{7} \times 14^2 \times 20 = \tfrac{22}{7} \times 196 \times 20$.
2. $= 616 \times 20 = 12.320$ cm³.

**Contoh 3.** Kerucut berjari-jari 9 cm dan tinggi 12 cm. Tentukan luas permukaannya (pakai $\pi = 3{,}14$).

1. Garis pelukis $s = \sqrt{9^2 + 12^2} = 15$ cm (tripel 9–12–15).
2. Luas $= \pi r (r + s) = 3{,}14 \times 9 \times 24 = 678{,}24$ cm².

## 2. Konversi satuan volume

| Satuan | Setara |
| --- | --- |
| 1 liter | 1 dm³ = 1.000 cm³ |
| 1 m³ | 1.000 liter |
| 1 mL | 1 cm³ |

**Contoh 4.** Bak mandi berbentuk balok berukuran 80 cm × 60 cm × 50 cm diisi penuh. Berapa liter airnya?

1. Volume $= 80 \times 60 \times 50 = 240.000$ cm³.
2. Bagi 1.000: $240$ liter.

**Contoh 5.** Tangki tersebut diisi dengan debit 12 liter per menit. Berapa lama sampai penuh?

1. $240 \div 12 = 20$ menit.

Jebakan: mencampur cm dan m dalam satu perhitungan. Samakan dulu semua ukuran ke satuan yang sama.

## 3. Efek skala: luas $k^2$, volume $k^3$

Jika **semua** ukuran panjang suatu bangun dikalikan $k$, maka:

$$\text{luas baru} = k^2 \times \text{luas lama}, \qquad \text{volume baru} = k^3 \times \text{volume lama}$$

| Faktor panjang $k$ | Luas menjadi | Volume menjadi |
| --- | --- | --- |
| 2 | 4 kali | 8 kali |
| 3 | 9 kali | 27 kali |
| 1,1 (naik 10%) | 1,21 kali (naik 21%) | 1,331 kali (naik 33,1%) |
| 1,2 (naik 20%) | 1,44 kali (naik 44%) | 1,728 kali (naik 72,8%) |

**Contoh 6.** Rusuk kubus diperpanjang 50%. Berapa persen kenaikan volumenya?

1. $k = 1{,}5$, sehingga volume baru $= 1{,}5^3 = 3{,}375$ kali.
2. Kenaikan $= 237{,}5\%$. Jawaban "150%" adalah jebakan karena hanya menambahkan persen secara linear.

**Contoh 7.** Jari-jari tabung dijadikan dua kali, sedangkan tingginya tetap. Volume menjadi berapa kali?

1. Hanya $r$ yang berubah; $V \propto r^2$.
2. Volume menjadi $2^2 = 4$ kali, **bukan** 8 kali, karena tinggi tidak ikut berubah.

## Ringkasan

- Hafalkan tabel volume dan luas permukaan; kerucut dan limas memiliki faktor $\tfrac{1}{3}$.
- Gunakan Pythagoras untuk garis pelukis dan diagonal ruang.
- 1 liter = 1.000 cm³ dan 1 m³ = 1.000 liter.
- Perbesaran semua ukuran sebesar $k$: luas $\times k^2$, volume $\times k^3$. Jika hanya sebagian ukuran yang berubah, hitung pengaruhnya per ukuran.

## Tips cepat

1. Tulis rumus dulu, baru masukkan angka; cara ini mengurangi salah faktor.
2. Pilih $\pi = \tfrac{22}{7}$ untuk jari-jari kelipatan 7.
3. Konversi satuan **sebelum** menghitung, bukan sesudahnya.
4. Untuk soal persentase perubahan ukuran, langsung gunakan faktor $k^2$ atau $k^3$.
5. Cek kewajaran: volume kerucut harus lebih kecil dari tabung yang sama ukurannya.
$md$,
   false, 2, 15),
  ('tiu-ketidaksamaan', 'Trik Cepat dan Jebakan Ketidaksamaan Gambar', 'tiu-ketidaksamaan-trik-cepat', 'Teknik menemukan gambar yang berbeda melalui rasio warna, simetri, arah putar, dan pasangan cermin, serta cara menghindari jebakan ciri ganda.',
$md$
## Inti soal ketidaksamaan

Soal ketidaksamaan memberi lima gambar; empat mengikuti aturan yang sama dan satu tidak. Kesulitannya: setiap gambar pasti berbeda dalam **sesuatu**, sehingga Anda harus menemukan ciri yang **dimiliki tepat empat gambar**. Ciri yang hanya membedakan dua atau tiga gambar bukan kunci.

> **Uji kunci:** setelah menemukan ciri pembeda, hitung berapa gambar yang memilikinya. Harus 4 lawan 1.

## Empat ciri yang sering dipakai pada soal HOTS

| Ciri | Pertanyaan pemeriksa | Contoh |
| --- | --- | --- |
| Rasio warna | Berapa perbandingan hitam : putih? | ■■□ (2 : 1) |
| Simetri | Apakah susunan sama jika dibaca terbalik? | ●○● simetris |
| Arah putar | Searah atau berlawanan jarum jam? | ↑ → ↓ searah |
| Pasangan cermin | Apakah gambar kedua bayangan cermin yang pertama? | ◀ ▶ |

### Rasio warna

Jangan hanya menghitung jumlah total, tetapi juga perbandingannya. Rasio dapat ditulis sebagai $\frac{\text{hitam}}{\text{putih}}$.

**Contoh 1.** Manakah yang berbeda: ●●●○, ■■■■■■□□, ▲▲▲△, ◆◆◆◆◆◆◇◇, ★★○?

1. Hitung rasio hitam : putih: 3 : 1, 6 : 2, 3 : 1, 6 : 2, 2 : 1 (★★ hitam, ○ putih).
2. Sederhanakan: $\frac{3}{1}, \frac{6}{2} = 3, 3, 3, 2$.
3. Empat gambar berrasio 3 : 1; **★★○** berasio 2 : 1 sehingga berbeda.

### Simetri

Susunan simetris terbaca sama dari kiri maupun kanan (seperti palindrom). Untuk simbol tunggal, periksa apakah simbol itu sama dengan bayangan cerminnya.

**Contoh 2.** Manakah yang berbeda: □■■□, ○●●○, △▲▲△, ◇◆◆◇, ☆★☆★?

1. Baca terbalik: □■■□ → □■■□ (sama), ○●●○ sama, △▲▲△ sama, ◇◆◆◇ sama.
2. ☆★☆★ dibaca terbalik menjadi ★☆★☆, tidak sama.
3. Jawaban: **☆★☆★**.

### Arah putar

Untuk urutan panah, ubah setiap langkah menjadi sudut. Delapan arah searah jarum jam: ↑ ↗ → ↘ ↓ ↙ ← ↖. Setiap langkah ke kanan pada daftar itu bernilai $+45^\circ$.

**Contoh 3.** Manakah yang berbeda: (↑ ↓), (→ ←), (↗ ↙), (↖ ↘), (← ↖)?

1. Hitung putaran tiap pasangan: ↑ ke ↓ = $180^\circ$, → ke ← = $180^\circ$, ↗ ke ↙ = $180^\circ$, ↖ ke ↘ = $180^\circ$.
2. ← ke ↖ = $45^\circ$.
3. Jawaban: **(← ↖)**.

### Pasangan cermin

Pencerminan kiri–kanan menukar arah kiri dan kanan tetapi mempertahankan atas dan bawah. Contoh: ┌ ↔ ┐, ├ ↔ ┤, ↗ ↔ ↖. Pencerminan berbeda dari putaran $180^\circ$: ┌ diputar $180^\circ$ menjadi ┘, bukan ┐.

## Jebakan ciri ganda

Jebakan paling umum adalah **ciri yang membedakan gambar lain**. Misalnya pada lima gambar ▲▲, ■■, ●●●, ◆◆, ★★, Anda mungkin tergoda memilih ★★ karena "satu-satunya bintang". Padahal setiap bentuk memang berbeda, sehingga bentuk bukan ciri pengelompok. Ciri yang membagi 4 : 1 adalah jumlah: empat gambar berisi dua unsur, sedangkan ●●● berisi tiga.

Langkah aman:

1. Daftar semua ciri yang terlihat (bentuk, warna, jumlah, rasio, simetri, orientasi).
2. Untuk setiap ciri, hitung pembagiannya: 5 : 0, 4 : 1, 3 : 2, atau semua berbeda.
3. Pilih ciri dengan pembagian **4 : 1**.
4. Jika ada dua ciri 4 : 1 yang menunjuk gambar berbeda, periksa ulang hitungan Anda; soal yang baik hanya memiliki satu.

Jebakan kedua adalah **ciri yang terlalu halus**, misalnya ukuran sedikit berbeda atau ketebalan garis. Pada soal berbasis teks dan simbol, ciri seperti itu hampir tidak pernah menjadi kunci. Utamakan ciri yang dapat dihitung atau diperiksa dengan pasti: jumlah, warna, urutan, dan arah.

## Tabel ringkas hitungan pembagian

| Ciri | Pembagian | Layak jadi kunci? |
| --- | --- | --- |
| Semua bentuk berbeda | 1 : 1 : 1 : 1 : 1 | Tidak |
| Tiga hitam, dua putih | 3 : 2 | Tidak |
| Empat simetris, satu tidak | 4 : 1 | Ya |
| Semua berjumlah sama | 5 : 0 | Tidak |

## Ringkasan

- Kunci ketidaksamaan adalah ciri yang membagi gambar menjadi 4 : 1.
- Periksa rasio warna, bukan hanya jumlah total.
- Simetri, arah putar, dan pasangan cermin adalah ciri favorit soal HOTS.
- Waspadai ciri yang mencolok tetapi tidak membagi 4 : 1.

## Tips cepat

1. Mulai dari ciri yang paling mudah dihitung: jumlah, lalu warna.
2. Untuk panah, ubah ke derajat dengan kelipatan $45^\circ$.
3. Untuk pasangan simbol, uji dulu "cermin kiri–kanan", lalu "putar $180^\circ$".
4. Batasi 40 detik per soal; jika belum ketemu, tandai dan lanjutkan.
$md$,
   false, 4, 12),
  ('tiu-perbandingan', 'Jebakan Satuan dan Soal HOTS Perbandingan', 'tiu-perbandingan-jebakan-satuan-hots', 'Mengatasi jebakan konversi satuan, soal kereta dan terowongan, arus sungai, skala luas, pekerjaan dengan jeda, serta keran yang dibuka bergantian.',
$md$
## Mengapa banyak peserta salah di soal perbandingan?

Rumus dasar perbandingan sebenarnya sedikit: $jarak = kecepatan \times waktu$, perbandingan senilai, dan berbalik nilai. Kesalahan justru datang dari **satuan yang tidak disamakan** dan **detail cerita yang terlewat**. Pelajaran ini membahas enam jebakan yang paling sering dijadikan soal HOTS.

## 1. Konversi km/jam ↔ m/s

$$1 \text{ km/jam} = \frac{1000 \text{ m}}{3600 \text{ s}} = \frac{5}{18} \text{ m/s}$$

| km/jam | m/s |
| --- | --- |
| 18 | 5 |
| 36 | 10 |
| 54 | 15 |
| 72 | 20 |
| 90 | 25 |
| 108 | 30 |

Aturan praktis: km/jam → m/s kalikan $\tfrac{5}{18}$; m/s → km/jam kalikan $\tfrac{18}{5} = 3{,}6$.

**Contoh 1.** Seorang pesepeda menempuh 600 m dalam 2 menit. Berapa kecepatannya dalam km/jam?

1. $v = \dfrac{600}{120} = 5$ m/s.
2. $5 \times 3{,}6 = 18$ km/jam.

## 2. Kereta melewati terowongan atau jembatan

Agar kereta **seluruhnya** melewati terowongan, ujung belakang kereta harus keluar. Jarak yang ditempuh adalah:

$$\text{jarak} = \text{panjang terowongan} + \text{panjang kereta}$$

**Contoh 2.** Kereta sepanjang 150 m melaju 54 km/jam melewati jembatan sepanjang 300 m. Berapa detik waktu yang diperlukan sampai kereta seluruhnya melewati jembatan?

1. Kecepatan $54$ km/jam $= 15$ m/s.
2. Jarak $= 300 + 150 = 450$ m.
3. Waktu $= 450 \div 15 = 30$ detik.
4. Jebakan: memakai jarak 300 m saja sehingga menjawab 20 detik.

Jika yang dilewati adalah **tiang** atau orang yang berdiri, jaraknya hanya panjang kereta.

## 3. Arus sungai

| Arah | Kecepatan efektif |
| --- | --- |
| Searah arus (ke hilir) | $v_{perahu} + v_{arus}$ |
| Melawan arus (ke hulu) | $v_{perahu} - v_{arus}$ |

**Contoh 3.** Perahu berkecepatan 15 km/jam di air tenang. Kecepatan arus 5 km/jam. Perahu pergi ke hilir sejauh 40 km lalu kembali. Berapa total waktunya?

1. Ke hilir: $40 \div 20 = 2$ jam.
2. Ke hulu: $40 \div 10 = 4$ jam.
3. Total $6$ jam. Perhatikan bahwa rata-rata kecepatannya bukan 15 km/jam, melainkan $80 \div 6 \approx 13{,}3$ km/jam.

## 4. Skala luas = kuadrat skala panjang

Skala $1 : n$ berlaku untuk **panjang**. Untuk luas, faktornya $n^2$.

**Contoh 4.** Denah rumah berskala 1 : 100. Sebuah kamar pada denah berukuran 4 cm × 3 cm. Berapa luas sebenarnya?

1. Ubah setiap ukuran: 4 cm → 400 cm = 4 m; 3 cm → 3 m.
2. Luas sebenarnya $= 4 \times 3 = 12$ m².
3. Jebakan: mengalikan luas denah (12 cm²) dengan 100 saja, sehingga mendapat 1.200 cm² = 0,12 m².

Cara paling aman: **konversi panjang dulu, baru hitung luas**.

## 5. Pekerjaan dengan jeda atau penambahan pekerja

Gunakan satuan **orang-hari**: total pekerjaan $= \text{banyak pekerja} \times \text{lama hari}$.

**Contoh 5.** Proyek direncanakan selesai dalam 30 hari oleh 12 orang. Setelah 10 hari, pekerjaan terhenti 5 hari karena cuaca. Berapa pekerja tambahan yang dibutuhkan agar proyek tetap selesai tepat waktu?

1. Total pekerjaan $= 12 \times 30 = 360$ orang-hari.
2. Sudah dikerjakan $12 \times 10 = 120$, sisa $240$ orang-hari.
3. Sisa waktu $= 30 - 10 - 5 = 15$ hari.
4. Pekerja yang diperlukan $= 240 \div 15 = 16$ orang, jadi **tambahan 4 orang**.
5. Jebakan: menjawab 16 (jumlah total, bukan tambahan).

## 6. Keran yang dibuka berurutan

Nyatakan kemampuan setiap keran sebagai **bagian bak per jam**.

**Contoh 6.** Keran A mengisi bak penuh dalam 3 jam, keran B dalam 6 jam. Mula-mula A dibuka sendiri selama 1 jam, lalu B ikut dibuka. Berapa lama waktu total sampai bak penuh?

1. Kecepatan A $= \tfrac{1}{3}$, B $= \tfrac{1}{6}$ bak per jam.
2. Dalam 1 jam pertama terisi $\tfrac{1}{3}$, sisa $\tfrac{2}{3}$.
3. Bersama: $\tfrac{1}{3} + \tfrac{1}{6} = \tfrac{1}{2}$ bak per jam.
4. Sisa memerlukan $\tfrac{2}{3} \div \tfrac{1}{2} = \tfrac{4}{3}$ jam $= 1$ jam 20 menit.
5. Total $= 2$ jam 20 menit.

Jika ada lubang pembuangan, kecepatannya bernilai **negatif** dan dijumlahkan dengan cara yang sama.

## Ringkasan

- Samakan satuan sebelum menghitung; ingat faktor $\tfrac{5}{18}$ dan $3{,}6$.
- Kereta melewati terowongan/jembatan: jarak = panjang lintasan + panjang kereta.
- Hilir dijumlah, hulu dikurang kecepatan arus.
- Skala luas adalah kuadrat skala panjang.
- Gunakan orang-hari untuk pekerjaan yang terganggu atau ditambah pekerja.
- Keran dan lubang dinyatakan sebagai bagian bak per satuan waktu.

## Tips cepat

1. Lingkari satuan di soal dan di pilihan jawaban sebelum mulai menghitung.
2. Baca kata "tambahan", "total", atau "sisa" pada pertanyaan dengan teliti.
3. Hafalkan pasangan 36 ↔ 10 dan 72 ↔ 20 untuk konversi cepat.
4. Untuk soal keran, tulis dalam pecahan, bukan desimal.
5. Uji kewajaran: waktu bersama harus lebih singkat dari keran tercepat.
$md$,
   false, 4, 15),
  ('tiu-serial-gambar', 'Pola Siklus dan Suku Jauh pada Serial Gambar', 'tiu-serial-gambar-siklus-suku-jauh', 'Menentukan gambar ke-n dengan sisa bagi, memahami pergeseran posisi yang berputar, pola jumlah Fibonacci, dan serial dengan dua aturan sekaligus.',
$md$
## Dari "gambar berikutnya" ke "gambar ke-50"

Soal serial gambar biasa meminta gambar berikutnya. Versi HOTS meminta **gambar ke-23** atau **ke-50**, sehingga Anda tidak sempat menggambar semuanya. Kuncinya adalah mengenali bahwa hampir semua serial gambar bersifat **siklus**: setelah beberapa langkah, gambar kembali ke bentuk awal.

## 1. Panjang siklus dan sisa bagi

Jika sebuah pola berulang setiap $k$ gambar, maka gambar ke-$n$ sama dengan gambar ke-$r$, dengan

$$r = \text{sisa pembagian } n \text{ oleh } k, \quad \text{dan jika } r = 0 \text{ maka ambil gambar ke-}k.$$

| Jenis perubahan | Panjang siklus |
| --- | --- |
| Rotasi 90° | 4 |
| Rotasi 45° | 8 |
| Rotasi 180° atau pergantian warna hitam/putih | 2 |
| Pergeseran dalam $m$ kotak, satu kotak per langkah | $m$ |
| Dua aturan dengan siklus $a$ dan $b$ | KPK$(a, b)$ |

**Contoh 1.** Serial: ↑, →, ↓, ←, ↑, → … Gambar ke-30 adalah …

1. Panah berputar 90° searah jarum jam; siklus 4: (↑, →, ↓, ←).
2. $30 = 4 \times 7 + 2$, sisa 2.
3. Gambar ke-30 sama dengan gambar ke-2: **→**.

**Contoh 2.** Serial: ◐, ◓, ◑, ◒, ◐, … (bagian hitam berputar 90° searah jarum jam). Gambar ke-40?

1. Siklus 4.
2. $40 \div 4$ bersisa 0, maka ambil gambar ke-4: **◒**.
3. Jebakan: menganggap sisa 0 sebagai gambar pertama.

## 2. Pergeseran posisi dengan wrap-around

Bayangkan deretan kotak yang ujungnya tersambung: ketika penanda keluar dari kotak terakhir, ia muncul lagi di kotak pertama.

Rumus posisi untuk $m$ kotak, posisi awal $p_1$, dan langkah $d$ kotak per gambar:

$$p_n = \big((p_1 - 1) + (n - 1)d\big) \bmod m + 1$$

**Contoh 3.** Dalam 5 kotak, bulatan hitam mulai di kotak 1 dan melompat 2 kotak setiap langkah:

●○○○○, ○○●○○, ○○○○●, ○●○○○, …

1. Posisi: 1, 3, 5, 2, 4, 1, … (siklus 5).
2. Gambar ke-5 berada di posisi $((0) + 4 \times 2) \bmod 5 + 1 = 8 \bmod 5 + 1 = 4$, yaitu **○○○●○**.
3. Gambar ke-12: $(11 \times 2) \bmod 5 + 1 = 22 \bmod 5 + 1 = 3$, yaitu ○○●○○.

**Contoh 4.** Dua penanda bergerak berlawanan: ■ bergeser ke kanan, □ bergeser ke kiri dalam 4 kotak. Tuliskan posisi keduanya dalam tabel terpisah. Setiap penanda dianalisis sendiri, lalu digabung kembali.

| Langkah | Posisi ■ (ke kanan) | Posisi □ (ke kiri) |
| --- | --- | --- |
| 1 | 1 | 4 |
| 2 | 2 | 3 |
| 3 | 3 | 2 |
| 4 | 4 | 1 |
| 5 | 1 | 4 |

## 3. Pola jumlah: aritmetika dan Fibonacci

Tidak semua serial berupa rotasi. Ada serial yang **banyak elemennya** mengikuti deret angka.

**Contoh 5.** ▲, ▲▲▲, ▲▲▲▲▲, … gambar ke-10 berisi berapa segitiga?

1. Banyaknya 1, 3, 5, … (aritmetika, beda 2).
2. $U_{10} = 1 + 9 \times 2 = 19$ segitiga.

**Contoh 6.** ●, ●, ●●, ●●●, ●●●●●, … gambar berikutnya?

1. Banyaknya 1, 1, 2, 3, 5: setiap suku adalah jumlah dua suku sebelumnya (Fibonacci).
2. Berikutnya $3 + 5 = 8$ bulatan.

Hitunglah elemen dalam kelompok tiga (●●● ●●● ●●) agar tidak salah hitung saat membaca simbol yang berjajar panjang.

## 4. Dua aturan sekaligus

Serial HOTS sering memadukan dua aturan, misalnya **arah** dan **warna**. Pisahkan setiap aturan, cari siklusnya masing-masing, lalu gabungkan.

**Contoh 7.** ↑■, →□, ↓■, ←□, ↑■, … Gambar ke-11?

1. Aturan arah: rotasi 90° searah jarum jam, siklus 4. $11 \bmod 4 = 3$ → **↓**.
2. Aturan warna: hitam-putih bergantian, siklus 2. $11$ ganjil → **■**.
3. Gabungan: **↓■**. Siklus gabungan KPK$(4, 2) = 4$, konsisten dengan hasil di atas.

**Contoh 8.** Panah berputar 45° searah jarum jam, sedangkan banyak panah bertambah satu: ↑, ↗↗, →→→, … Gambar ke-6?

1. Arah: siklus 8 (↑, ↗, →, ↘, ↓, ↙, ←, ↖). Gambar ke-6 → **↙**.
2. Banyak: 6.
3. Jawaban: ↙↙↙↙↙↙.

## Ringkasan

- Kenali panjang siklus: rotasi 90° = 4, rotasi 45° = 8, warna bergantian = 2.
- Gambar ke-$n$ = gambar ke-(sisa bagi $n$ oleh panjang siklus); sisa 0 berarti gambar terakhir siklus.
- Pergeseran berputar dihitung dengan modulo jumlah kotak.
- Banyak elemen dapat mengikuti deret aritmetika atau Fibonacci.
- Serial dua aturan: analisis terpisah, lalu gabungkan.

## Tips cepat

1. Beri nomor setiap gambar di kertas buram sebelum mencari pola.
2. Untuk rotasi, tandai satu ciri (ujung panah atau bagian hitam) dan ikuti ciri itu saja.
3. Ingat aturan sisa 0 → anggota terakhir siklus.
4. Kelompokkan simbol per tiga agar penghitungan cepat dan akurat.
5. Jika dua pilihan hanya berbeda satu atribut, periksa ulang atribut itu saja.
$md$,
   false, 4, 13),
  ('tiu-silogisme', 'Kesalahan Logika yang Sering Menjebak', 'tiu-silogisme-kesalahan-logika', 'Mengenali lima kesalahan penalaran yang paling sering dijadikan pilihan pengecoh dalam soal silogisme TIU.',
$md$
## Mengapa mempelajari kesalahan?

Pada soal silogisme, empat dari lima pilihan biasanya **terdengar masuk akal**. Pilihan itu sengaja disusun dari kesalahan logika yang umum. Jika Anda hafal pola kesalahannya, Anda bisa mencoret pengecoh dalam hitungan detik, bahkan sebelum menemukan jawaban benar.

Kita memakai lambang: $p \Rightarrow q$ dibaca "jika $p$ maka $q$", $\neg p$ dibaca "bukan $p$".

## Tabel kebenaran implikasi

| $p$ | $q$ | $p \Rightarrow q$ |
| --- | --- | --- |
| B | B | B |
| B | S | S |
| S | B | B |
| S | S | B |

Implikasi hanya salah ketika $p$ benar tetapi $q$ salah. Baris ketiga dan keempat menunjukkan bahwa jika $p$ salah, $q$ boleh benar atau salah. Dari sinilah dua kesalahan pertama lahir.

## Kesalahan 1: menegaskan konsekuen

Pola: $p \Rightarrow q$, $q$ benar, lalu disimpulkan $p$.

> Jika listrik padam, lampu mati. Lampu mati. Maka listrik padam. (**SALAH**)

Lampu bisa mati karena bohlamnya putus. Pada tabel, $q$ benar terjadi di baris 1 dan 3; pada baris 3, $p$ salah. Jadi $p$ **belum tentu** benar.

## Kesalahan 2: menyangkal anteseden

Pola: $p \Rightarrow q$, $\neg p$, lalu disimpulkan $\neg q$.

> Jika listrik padam, lampu mati. Listrik tidak padam. Maka lampu tidak mati. (**SALAH**)

Baris 3 tabel menunjukkan $p$ salah dan $q$ tetap bisa benar. Yang sah hanya dua: **modus ponens** ($p$, maka $q$) dan **modus tollens** ($\neg q$, maka $\neg p$).

## Kesalahan 3: term tengah tidak terdistribusi

Pola: "Semua A adalah B. Semua C adalah B. Maka semua A adalah C." (**SALAH**)

> Semua kucing berkaki empat. Semua meja berkaki empat. Maka semua kucing adalah meja.

Term tengah (B, "berkaki empat") tidak pernah dibicarakan seluruhnya; A dan C hanya sama-sama berada di dalam B tanpa harus beririsan. Dalam diagram Venn, dua lingkaran kecil boleh terpisah di dalam lingkaran besar.

## Kesalahan 4: negasi berkuantor

| Pernyataan | Negasi yang benar | Negasi yang salah (pengecoh) |
| --- | --- | --- |
| Semua A adalah B | Ada A yang bukan B | Semua A bukan B |
| Ada A yang B | Semua A bukan B | Ada A yang bukan B |
| $p$ dan $q$ | $\neg p$ atau $\neg q$ | $\neg p$ dan $\neg q$ |
| $p$ atau $q$ | $\neg p$ dan $\neg q$ | $\neg p$ atau $\neg q$ |
| $p \Rightarrow q$ | $p$ dan $\neg q$ | $\neg p \Rightarrow \neg q$ |

Ingat juga negasi implikasi berkuantor: negasi "Jika semua pegawai hadir, rapat dimulai" adalah "Semua pegawai hadir **dan** rapat tidak dimulai". Bagian depan tidak dinegasikan.

## Kesalahan 5: memperlakukan implikasi sebagai biimplikasi

Biimplikasi $p \Leftrightarrow q$ ("jika dan hanya jika") benar ketika $p$ dan $q$ bernilai sama.

| $p$ | $q$ | $p \Leftrightarrow q$ |
| --- | --- | --- |
| B | B | B |
| B | S | S |
| S | B | S |
| S | S | B |

Pada biimplikasi, menegaskan konsekuen dan menyangkal anteseden **menjadi sah**. Kesalahan terjadi ketika soal hanya memberi "jika … maka …", tetapi peserta memperlakukannya seperti "jika dan hanya jika". Baca kata penghubungnya dengan teliti.

## Contoh soal dan pembahasan

**Contoh 1.** Jika Rina lulus seleksi, ia pindah ke Jakarta. Rina pindah ke Jakarta. Kesimpulan yang tepat?

1. Pola: $p \Rightarrow q$, $q$.
2. Menyimpulkan $p$ adalah kesalahan menegaskan konsekuen.
3. Jawaban: **Rina belum tentu lulus seleksi**.

**Contoh 2.** Semua peserta wawancara membawa map. Sebagian pegawai membawa map. Kesimpulan?

1. Term tengah "membawa map" tidak terdistribusi.
2. "Sebagian pegawai adalah peserta wawancara" tidak sah.
3. Jawaban: **tidak dapat ditarik kesimpulan yang pasti**.

**Contoh 3.** Perpustakaan buka jika dan hanya jika hari kerja. Hari ini perpustakaan tidak buka.

1. Pola biimplikasi: $p \Leftrightarrow q$ dan $\neg p$.
2. Pada biimplikasi, $\neg p$ menghasilkan $\neg q$.
3. Jawaban: **hari ini bukan hari kerja**.

**Contoh 4.** Uji dengan tabel: apakah $(p \Rightarrow q) \wedge \neg p$ menjamin $\neg q$?

1. Baris yang memenuhi premis: baris 3 ($p$ = S, $q$ = B) dan baris 4 ($p$ = S, $q$ = S).
2. Pada baris 3, $q$ benar, sehingga $\neg q$ salah.
3. Karena ada baris yang membuat kesimpulan salah, argumen **tidak sah**.

## Ringkasan

- Hanya modus ponens, modus tollens, dan silogisme hipotetis yang sah untuk implikasi biasa.
- Menegaskan konsekuen dan menyangkal anteseden adalah pengecoh favorit.
- Term tengah harus terdistribusi agar silogisme kategoris sah.
- Negasi "semua" adalah "ada yang tidak"; negasi implikasi adalah "$p$ dan bukan $q$".
- Biimplikasi berbeda dari implikasi; cek kata "jika dan hanya jika".

## Tips cepat

1. Ubah premis ke lambang $p$, $q$ sebelum membaca pilihan.
2. Coret pilihan yang berpola konvers ($q \Rightarrow p$) atau invers ($\neg p \Rightarrow \neg q$).
3. Untuk soal kategoris, gambar Venn kecil dan cari satu contoh yang membantah pilihan.
4. Jika semua pilihan spesifik gagal, jawaban "tidak dapat disimpulkan" layak dipertimbangkan.
$md$,
   false, 4, 14),
  ('tiu-sinonim', 'Sinonim Kontekstual dan Jebakan Bunyi Mirip', 'tiu-sinonim-konteks-jebakan', 'Menentukan sinonim kata bermakna ganda dari konteks kalimat dan menghindari pengecoh yang bunyinya mirip.',
$md$
## Mengapa konteks penting?

Banyak kata Indonesia bersifat **polisemi**, yaitu memiliki lebih dari satu makna. Kata *tinggi* pada "gedung tinggi" bersinonim dengan *jangkung* atau *menjulang*, tetapi pada "harga tinggi" lebih dekat ke *mahal*. Karena itu, soal sinonim kontekstual memberikan kalimat dan meminta makna kata **dalam kalimat tersebut**, bukan makna kamus yang pertama kali terlintas.

> **Aturan emas:** makna sebuah kata dalam soal kontekstual ditentukan oleh kalimatnya. Ganti kata itu dengan pilihan jawaban, lalu baca ulang seluruh kalimat.

## Langkah menjawab soal kontekstual

1. **Tutup pilihan jawaban.** Baca kalimat dan ganti kata bercetak kapital dengan kata Anda sendiri.
2. **Bandingkan** kata Anda dengan pilihan.
3. **Uji substitusi**: kalimat harus tetap wajar dan maknanya tidak bergeser.
4. **Waspadai makna lain** dari kata yang sama; pembuat soal sengaja memasukkannya sebagai pengecoh.

### Contoh polisemi

| Kata | Kalimat | Makna dalam kalimat |
| --- | --- | --- |
| Bunga | Bunga pinjaman itu 6% per tahun. | imbalan jasa uang |
| Bunga | Ia menanam bunga mawar. | kembang |
| Berat | Tugas itu terasa berat baginya. | sulit |
| Berat | Berat paket itu 3 kg. | bobot |
| Tajam | Analisisnya sangat tajam. | kritis, mendalam |
| Tajam | Pisau itu tajam. | bermata tipis, mudah memotong |

## Jebakan bunyi mirip

Pengecoh paling licik adalah kata yang **ejaannya mirip** dengan kata soal atau dengan jawaban benar. Kenali pasangan berikut:

| Kata | Makna | Sering tertukar dengan | Makna kata itu |
| --- | --- | --- | --- |
| Mangkus | efektif, berhasil guna | Sangkil | efisien, berdaya guna |
| Koherensi | kepaduan | Koersi | paksaan |
| Infiltrasi | penyusupan | Filtrasi | penyaringan |
| Takzim | hormat | Takjub | heran, kagum |
| Efektif | membawa hasil | Efisien | hemat tenaga, waktu, biaya |
| Afeksi | kasih sayang | Efek | akibat |
| Prestasi | hasil yang dicapai | Prestise | wibawa, gengsi |
| Eminen | terkemuka | Imanen | berada dalam kesadaran |
| Interupsi | penyelaan | Intervensi | campur tangan |
| Korelasi | hubungan timbal balik | Koreksi | pembetulan |
| Imigrasi | perpindahan masuk ke suatu negara | Emigrasi | perpindahan keluar dari negara sendiri |
| Asimilasi | pembauran | Akulturasi | percampuran budaya tanpa hilangnya unsur asli |

## Tabel kata tambahan yang sering diuji

| No | Kata | Makna / sinonim |
| --- | --- | --- |
| 1 | Friksi | perpecahan, pergeseran pendapat |
| 2 | Hegemoni | pengaruh kepemimpinan, dominasi |
| 3 | Integritas | kejujuran, keutuhan |
| 4 | Kapabel | cakap, mampu |
| 5 | Kompatibel | cocok, sesuai |
| 6 | Mitigasi | upaya mengurangi risiko |
| 7 | Prestise | wibawa, gengsi |
| 8 | Rasional | masuk akal |
| 9 | Skeptis | ragu-ragu, kurang percaya |
| 10 | Transparan | terbuka, tembus pandang |
| 11 | Independen | mandiri |
| 12 | Inovasi | pembaruan |
| 13 | Dispensasi | kelonggaran, pengecualian |
| 14 | Eksodus | perpindahan penduduk besar-besaran |
| 15 | Resesi | kemunduran ekonomi |
| 16 | Otoritas | kewenangan |
| 17 | Proporsional | sebanding |
| 18 | Taksa | ambigu, bermakna ganda |
| 19 | Sepadan | setara, sebanding |
| 20 | Rancu | kacau |
| 21 | Rentan | mudah terkena |
| 22 | Luwes | fleksibel, tidak kaku |
| 23 | Sigap | tangkas, cekatan |
| 24 | Canggung | kaku, kikuk |
| 25 | Jemu | bosan |
| 26 | Pandir | bodoh |
| 27 | Nanar | bingung |
| 28 | Sejawat | rekan sekerja |
| 29 | Tatkala | ketika |
| 30 | Semu | tidak sebenarnya |
| 31 | Pamrih | maksud tersembunyi demi keuntungan sendiri |
| 32 | Kohesi | keterikatan antarunsur |

## Contoh soal dan pembahasan

**Contoh 1.** Jabatan baru itu memberinya PRESTISE di mata warga. Sinonim kata bercetak kapital adalah …
A. prestasi B. wibawa C. kekayaan D. keterampilan E. tugas

1. Konteks: "di mata warga" → menekankan **penghargaan atau gengsi** dari orang lain.
2. Prestise = wibawa, gengsi; prestasi = hasil yang dicapai.
3. Jawaban: **B. wibawa**. Pilihan "prestasi" adalah jebakan bunyi mirip.

**Contoh 2.** Kata INTERUPSI dalam "Seorang peserta rapat mengajukan interupsi" bermakna …
A. campur tangan B. penyelaan C. persetujuan D. penolakan E. pengunduran diri

1. Peserta rapat memotong pembicaraan yang sedang berlangsung → **penyelaan**.
2. "Campur tangan" adalah makna *intervensi*, kata yang bunyinya mirip.
3. Jawaban: **B**.

**Contoh 3.** "Harga cabai di pasar sedang TINGGI." Kata yang paling tepat menggantikan adalah …

1. Konteks harga, bukan ukuran fisik.
2. "Jangkung" tidak cocok untuk harga; "mahal" cocok.
3. Jawaban: **mahal**.

## Mengukur kecepatan

Dalam SKD, TIU berisi 35 soal dari total 110 soal dalam 100 menit, sehingga rata-rata waktu per soal sekitar $\frac{100}{110} \approx 0{,}9$ menit. Soal sinonim seharusnya selesai jauh lebih cepat, sekitar 20–30 detik, agar waktunya bisa dipakai untuk soal hitungan.

## Ringkasan

- Kata polisemi harus diartikan sesuai kalimat.
- Uji substitusi adalah alat terkuat untuk soal kontekstual.
- Hafalkan pasangan bunyi mirip: mangkus–sangkil, koherensi–koersi, infiltrasi–filtrasi, takzim–takjub.

## Tips cepat

1. Jika dua pilihan sama-sama sinonim kamus, pilih yang **cocok dengan konteks**.
2. Curigai pilihan yang ejaannya hampir sama dengan kata soal.
3. Buat kartu hafalan berpasangan untuk kata-kata yang sering tertukar.
4. Jangan berlama-lama: jika belum tahu setelah 30 detik, eliminasi lalu tebak.
$md$,
   false, 2, 13),
  ('tiu-sinonim', 'Strategi Sinonim dan Daftar Kata yang Sering Diuji', 'tiu-sinonim-strategi-daftar-kata', 'Cara cepat menjawab soal sinonim TIU beserta tabel besar kata baku dan serapan yang sering muncul.',
$md$
## Apa yang diuji dalam soal sinonim?

Soal sinonim (persamaan kata) meminta Anda memilih kata yang **maknanya paling dekat** dengan kata soal. Dalam SKD, kata yang diuji hampir selalu kata baku, kata serapan, atau istilah ilmiah populer yang jarang dipakai sehari-hari. Artinya, soal sinonim lebih banyak menguji **perbendaharaan kata** daripada penalaran. Kabar baiknya: daftar kata yang sering keluar relatif terbatas, sehingga bisa dihafal secara bertahap.

Bentuk soalnya biasanya:

- "Sinonim kata SAHIH adalah …"
- "Kata yang bermakna sama dengan kata bercetak kapital dalam kalimat … adalah …"
- "Pasangan kata berikut yang BUKAN sinonim adalah …"

> **Prinsip utama:** sinonim jarang identik 100%. Pilih makna yang **paling dekat**, bukan yang sekadar berhubungan.

## Langkah menjawab

1. **Baca kata soal dan tebak maknanya sebelum melihat pilihan.** Ini mencegah Anda terpancing pilihan yang bunyinya mirip.
2. **Tentukan kelas kata.** Jika kata soal adalah kata sifat (SKEPTIS), jawaban ideal juga kata sifat (ragu-ragu), bukan kata benda.
3. **Coret antonim.** Pembuat soal sering memasukkan lawan kata sebagai pengecoh, misalnya FANA dengan pilihan "baka" (kekal).
4. **Coret kata yang hanya berasosiasi.** WAHANA sering muncul bersama kata "permainan", tetapi maknanya *sarana* atau *alat*.
5. **Uji dalam kalimat.** Masukkan pilihan ke kalimat contoh; sinonim yang benar tidak mengubah makna kalimat.

## Tabel kata yang sering diuji

| No | Kata | Makna / sinonim |
| --- | --- | --- |
| 1 | Absah | sah |
| 2 | Adiksi | kecanduan |
| 3 | Afeksi | kasih sayang |
| 4 | Akurat | teliti, saksama, tepat |
| 5 | Ambigu | bermakna ganda, taksa |
| 6 | Anomali | penyimpangan dari yang biasa |
| 7 | Apatis | acuh tak acuh, masa bodoh |
| 8 | Asumsi | dugaan, anggapan |
| 9 | Baku | standar, patokan |
| 10 | Bonafide | dapat dipercaya |
| 11 | Delegasi | perutusan |
| 12 | Eksplisit | tersurat, gamblang |
| 13 | Implisit | tersirat |
| 14 | Empiris | berdasarkan pengalaman |
| 15 | Esensi | hakikat, inti |
| 16 | Fiktif | rekaan, khayalan |
| 17 | Fluktuasi | gejolak naik turun |
| 18 | Hipotesis | dugaan sementara |
| 19 | Insomnia | tidak dapat tidur |
| 20 | Konklusi | kesimpulan |
| 21 | Konsensus | mufakat, kesepakatan |
| 22 | Kontradiksi | pertentangan |
| 23 | Kredibel | dapat dipercaya |
| 24 | Kulminasi | puncak |
| 25 | Lugas | apa adanya, tidak berbelit-belit |
| 26 | Monoton | tidak bervariasi, membosankan |
| 27 | Nisbi | relatif |
| 28 | Mutlak | absolut |
| 29 | Otonomi | swatantra |
| 30 | Persepsi | tanggapan |
| 31 | Prediksi | ramalan, perkiraan |
| 32 | Relevan | bersangkut paut |
| 33 | Sinergi | kerja sama, paduan |
| 34 | Sporadis | jarang dan tidak tentu |
| 35 | Suaka | perlindungan |
| 36 | Tendensi | kecenderungan |
| 37 | Utopia | khayalan |
| 38 | Vakum | kosong, hampa |
| 39 | Verifikasi | pemeriksaan kebenaran |
| 40 | Wahana | sarana, alat |
| 41 | Kamuflase | penyamaran |
| 42 | Kontemporer | masa kini |
| 43 | Piawai | mahir, pandai |
| 44 | Sahaja | sederhana |
| 45 | Andal | dapat diandalkan |
| 46 | Lazim | biasa |
| 47 | Acap | sering |
| 48 | Tabiat | watak, perangai |

Tidak perlu menghafal semuanya dalam satu hari. Targetkan sekitar 10 kata per hari, lalu ulangi kata minggu lalu sebelum menambah kata baru.

## Contoh soal dan pembahasan

**Contoh 1.** Sinonim kata VERIFIKASI adalah …
A. pengesahan B. pemeriksaan kebenaran C. pendaftaran D. penghapusan E. pengumuman

1. Tebak dulu: verifikasi berasal dari *verify* → memeriksa benar tidaknya sesuatu.
2. Pengesahan dan pendaftaran sering terjadi setelah atau sebelum verifikasi, jadi hanya berasosiasi.
3. Jawaban: **B. pemeriksaan kebenaran**.

**Contoh 2.** Sinonim kata AFEKSI adalah …
A. akibat B. kasih sayang C. kebencian D. pengaruh E. kemarahan

1. Afeksi = rasa kasih sayang. Kebencian dan kemarahan justru berlawanan.
2. "Akibat" adalah makna *efek*, kata yang bunyinya mirip; "pengaruh" juga dekat dengan *efek*.
3. Jawaban: **B. kasih sayang**.

**Contoh 3.** Kata bercetak kapital dalam kalimat "Kesaksian itu sulit diterima karena isinya FIKTIF" bermakna …

1. Fiktif berasal dari *fiksi*, yaitu cerita rekaan.
2. Uji pilihan "rekaan" dalam kalimat: "isinya rekaan" → makna tetap.
3. Jawaban: **rekaan**.

## Peluang menebak dengan eliminasi

Jika Anda yakin dapat mencoret dua pilihan, peluang menebak benar naik dari $\frac{1}{5} = 20\%$ menjadi $\frac{1}{3} \approx 33\%$. Karena soal TIU tidak mengenal nilai negatif, **jangan pernah mengosongkan jawaban**; eliminasi dulu, baru tebak.

## Ringkasan

- Soal sinonim menguji kosakata baku dan serapan.
- Tebak makna sebelum membaca pilihan, lalu cocokkan kelas kata.
- Coret antonim dan kata yang hanya berasosiasi.
- Hafalkan tabel secara bertahap dan ulangi berkala.

## Tips cepat

1. Kenali akar serapan: *-asi* (verifikasi, delegasi) biasanya kata benda proses atau hasil.
2. Jika ragu antara dua pilihan, masukkan keduanya ke kalimat; pilih yang paling tidak mengubah makna.
3. Waspadai pilihan yang bunyinya mirip dengan kata soal; itu sering pengecoh.
4. Simpan catatan kata asing yang Anda temui saat latihan, lengkap dengan contoh kalimat.
$md$,
   true, 1, 14),
  ('tiu-soal-cerita', 'Menerjemahkan Soal Cerita ke Persamaan dan Jebakan Persen', 'tiu-soal-cerita-model-persamaan', 'Teknik mengubah kalimat soal cerita menjadi persamaan, serta menghindari jebakan diskon bertingkat, PPN, perubahan persen berurutan, salah catat rata-rata, dan bunga majemuk.',
$md$
## Soal cerita adalah soal terjemahan

Kesulitan soal cerita jarang terletak pada hitungannya. Yang sulit adalah **menerjemahkan bahasa sehari-hari menjadi bahasa matematika**. Setelah persamaan tertulis dengan benar, sisanya hanya aljabar sederhana.

## 1. Kamus terjemahan

| Ungkapan dalam soal | Bentuk matematika |
| --- | --- |
| "A lebih banyak 5 dari B" | $A = B + 5$ |
| "A dua kali B" | $A = 2B$ |
| "A kurang 3 dari dua kali B" | $A = 2B - 3$ |
| "perbandingan A dan B 3 : 4" | $A = 3k$, $B = 4k$ |
| "5 tahun lalu" | kurangi 5 pada umur **setiap** orang |
| "naik 20%" | kalikan $1{,}2$ |
| "turun 20%" | kalikan $0{,}8$ |
| "sisanya" | total dikurangi bagian yang sudah dipakai |

Langkah baku:

1. Tentukan variabel untuk besaran yang **belum diketahui** (sebisa mungkin satu variabel saja).
2. Terjemahkan setiap kalimat menjadi persamaan.
3. Selesaikan, lalu **jawab yang ditanyakan**, bukan sekadar nilai variabel.

**Contoh 1.** Uang Rina Rp15.000 lebih banyak daripada uang Sari. Jika Rina memberi Sari Rp20.000, uang Sari menjadi dua kali uang Rina. Berapa jumlah uang mereka?

1. Misalkan uang Sari $= s$, uang Rina $= s + 15$ (dalam ribuan).
2. Setelah memberi: Rina $s - 5$, Sari $s + 20$.
3. Persamaan: $s + 20 = 2(s - 5)$, sehingga $s = 30$.
4. Rina $= 45$, Sari $= 30$. Jumlah $= $ Rp75.000.

## 2. Jebakan persen bertingkat

Persen yang terjadi **berurutan** dikalikan, bukan dijumlahkan.

| Kejadian | Faktor pengali | Perubahan bersih |
| --- | --- | --- |
| Diskon 20% lalu 10% | $0{,}8 \times 0{,}9 = 0{,}72$ | turun 28% (bukan 30%) |
| Naik 10% lalu turun 10% | $1{,}1 \times 0{,}9 = 0{,}99$ | turun 1% (bukan tetap) |
| Diskon 10% lalu PPN 11% | $0{,}9 \times 1{,}11 = 0{,}999$ | turun 0,1% |
| Naik 25% lalu turun 20% | $1{,}25 \times 0{,}8 = 1$ | kembali tetap |

**Contoh 2.** Harga sebuah printer Rp2.000.000. Toko memberi diskon 15%, lalu dikenai PPN 11% dari harga setelah diskon. Berapa yang dibayar?

1. Setelah diskon: $2.000.000 \times 0{,}85 = 1.700.000$.
2. Dengan PPN: $1.700.000 \times 1{,}11 = 1.887.000$.
3. Jawaban: Rp1.887.000.

### Harga naik, konsumsi harus turun berapa?

Agar **pengeluaran tetap** ketika harga naik $p\%$, konsumsi harus turun sebesar

$$\frac{p}{100 + p} \times 100\%$$

**Contoh 3.** Harga minyak naik 60%. Agar pengeluaran tetap, berapa persen pemakaian harus dikurangi?

1. Faktor harga $1{,}6$, maka konsumsi baru $= \tfrac{1}{1{,}6} = 0{,}625$.
2. Pemakaian turun $37{,}5\%$. Jawaban "60%" adalah jebakan.

## 3. Salah catat pada rata-rata

Rata-rata berubah karena **jumlah total** berubah. Koreksi jumlahnya dulu.

**Contoh 4.** Rata-rata nilai 20 peserta adalah 72. Ternyata satu nilai 59 tercatat sebagai 95. Berapa rata-rata yang benar?

1. Jumlah tercatat $= 20 \times 72 = 1440$.
2. Selisih salah catat $= 95 - 59 = 36$, jadi jumlah benar $= 1404$.
3. Rata-rata benar $= 1404 \div 20 = 70{,}2$.

Cara cepat: rata-rata turun sebesar $36 \div 20 = 1{,}8$, sehingga $72 - 1{,}8 = 70{,}2$.

## 4. Bunga tunggal versus bunga majemuk

| Jenis | Rumus nilai akhir |
| --- | --- |
| Bunga tunggal | $M\,(1 + n\,i)$ |
| Bunga majemuk | $M\,(1 + i)^n$ |

dengan $M$ modal, $i$ suku bunga per periode, dan $n$ banyak periode.

**Contoh 5.** Modal Rp5.000.000 disimpan dengan bunga majemuk 10% per tahun. Berapa saldo setelah 3 tahun?

1. $5.000.000 \times 1{,}1^3 = 5.000.000 \times 1{,}331$.
2. $= $ Rp6.655.000.
3. Bandingkan dengan bunga tunggal: $5.000.000 \times 1{,}3 = 6.500.000$. Selisih Rp155.000 inilah "bunga atas bunga".

## Ringkasan

- Soal cerita adalah latihan terjemahan; gunakan kamus ungkapan.
- Pakai satu variabel bila memungkinkan dan jawab yang ditanyakan.
- Persen berurutan dikalikan; diskon 20% + 10% bukan 30%.
- Harga naik $p\%$ → konsumsi turun $\tfrac{p}{100+p}$.
- Salah catat: koreksi jumlah total, lalu bagi ulang.
- Bunga majemuk memakai pangkat, bunga tunggal memakai perkalian biasa.

## Tips cepat

1. Ubah semua persen menjadi faktor pengali ($1{,}1$; $0{,}85$; dan seterusnya).
2. Hitung dalam ribuan rupiah untuk menghindari salah nol.
3. Untuk soal umur, buat tabel "dulu – sekarang – nanti".
4. Cek jawaban dengan memasukkannya kembali ke cerita.
5. Waspadai kata "sisanya", "tambahan", dan "selisih" pada kalimat pertanyaan.
$md$,
   false, 4, 15)
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
  ('tiu-sinonim', 'Sinonim kata MANGKUS adalah …', 'Efisien', 'Ekonomis', 'Efektif', 'Mewah', 'Lamban', 0, 0, 5, 0, 0, 'Menurut KBBI, mangkus berarti berhasil guna (efektif). Efisien adalah padanan kata sangkil (berdaya guna), sehingga sering menjadi jebakan.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata SANGKIL adalah …', 'Efektif', 'Cerdik', 'Licin', 'Sempit', 'Efisien', 0, 0, 0, 0, 5, 'Sangkil berarti berdaya guna atau tepat guna tanpa pemborosan (efisien). Efektif adalah padanan mangkus; keduanya sering dipertukarkan sebagai jebakan.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata NISBI adalah …', 'Relatif', 'Mutlak', 'Absolut', 'Nyata', 'Umum', 5, 0, 0, 0, 0, 'Nisbi berarti hanya terlihat (terasa) jika dibandingkan dengan yang lain, yaitu relatif. Mutlak dan absolut justru lawan katanya.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata KONKLUSI adalah …', 'Pendahuluan', 'Kesimpulan', 'Gagasan', 'Pembahasan', 'Pertanyaan', 0, 5, 0, 0, 0, 'Konklusi berarti kesimpulan, yaitu pendapat terakhir yang diperoleh dari uraian atau penalaran.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata SPORADIS adalah …', 'Terus-menerus', 'Menyeluruh', 'Teratur', 'Jarang dan tidak tentu', 'Mendadak', 0, 0, 0, 5, 0, 'Sporadis berarti terjadi sesekali, tidak tentu, dan tersebar (jarang). Terus-menerus dan teratur berlawanan maknanya; mendadak menyangkut waktu kejadian, bukan frekuensi.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata FLUKTUASI adalah …', 'Kenaikan', 'Penurunan', 'Gejolak naik turun', 'Kestabilan', 'Perputaran', 0, 0, 5, 0, 0, 'Fluktuasi berarti gejala yang menunjukkan turun naiknya (harga, nilai, dan sebagainya). Kenaikan atau penurunan saja hanya separuh makna, sedangkan kestabilan adalah kebalikannya.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata ESENSI adalah …', 'Hakikat', 'Penampilan', 'Tambahan', 'Ringkasan', 'Wewangian', 5, 0, 0, 0, 0, 'Esensi berarti hakikat atau inti. Wewangian adalah jebakan bunyi dari kata esens/esensial yang sering dikaitkan dengan minyak wangi (essence).', 'easy'),
  ('tiu-sinonim', 'Sinonim kata APATIS adalah …', 'Antusias', 'Acuh tak acuh', 'Peduli', 'Pemarah', 'Pemalu', 0, 5, 0, 0, 0, 'Apatis berarti acuh tak acuh, tidak peduli, atau masa bodoh. Antusias dan peduli adalah lawannya.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata TENDENSI adalah …', 'Ketegangan', 'Kesimpulan', 'Penolakan', 'Kecenderungan', 'Ketetapan', 0, 0, 0, 5, 0, 'Tendensi berarti kecenderungan. Ketegangan adalah jebakan bunyi dari kata tension (tensi).', 'medium'),
  ('tiu-sinonim', 'Sinonim kata KREDIBEL adalah …', 'Berutang', 'Terkenal', 'Kaya raya', 'Berwenang', 'Dapat dipercaya', 0, 0, 0, 0, 5, 'Kredibel berarti dapat dipercaya. Berutang adalah jebakan karena kemiripan bunyi dengan kata kredit.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata FRIKSI adalah …', 'Persatuan', 'Perpecahan', 'Rekaan', 'Pertemuan', 'Peraturan', 0, 5, 0, 0, 0, 'Friksi berarti pergeseran yang menimbulkan perbedaan pendapat; perpecahan. Rekaan adalah arti kata fiksi yang bunyinya mirip.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata SUAKA adalah …', 'Hukuman', 'Pengasingan', 'Penghargaan', 'Perlindungan', 'Penjara', 0, 0, 0, 5, 0, 'Suaka berarti tempat mengungsi atau perlindungan, misalnya suaka politik (perlindungan bagi orang asing). Pengasingan justru berarti pembuangan.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata LUGAS adalah …', 'Berbunga-bunga', 'Rumit', 'Kasar', 'Ragu-ragu', 'Apa adanya', 0, 0, 0, 0, 5, 'Lugas berarti mengenai yang pokok saja, tidak berbelit-belit, apa adanya. Bahasa yang lugas tidak sama dengan bahasa yang kasar.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata AMBIGU adalah …', 'Taksa', 'Lugas', 'Tegas', 'Baku', 'Gamblang', 5, 0, 0, 0, 0, 'Ambigu berarti bermakna lebih dari satu (ganda), yang dalam KBBI juga disebut taksa. Lugas, tegas, dan gamblang justru bermakna jelas.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata KULMINASI adalah …', 'Permulaan', 'Pertengahan', 'Puncak', 'Penurunan', 'Peralihan', 0, 0, 5, 0, 0, 'Kulminasi berarti titik (tingkat) tertinggi, puncak, misalnya kulminasi matahari.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata ANOMALI adalah …', 'Kebiasaan', 'Keseragaman', 'Kenormalan', 'Penyimpangan', 'Kemajuan', 0, 0, 0, 5, 0, 'Anomali berarti ketidaknormalan atau penyimpangan dari yang biasa. Kebiasaan dan kenormalan adalah lawan maknanya.', 'medium'),
  ('tiu-sinonim', 'Sinonim kata PIAWAI adalah …', 'Pemalas', 'Mahir', 'Pemula', 'Ceroboh', 'Ragu', 0, 5, 0, 0, 0, 'Piawai berarti pandai, cakap, atau mahir dalam suatu keahlian.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata BERSAHAJA adalah …', 'Mewah', 'Sombong', 'Sendirian', 'Sekadarnya', 'Sederhana', 0, 0, 0, 0, 5, 'Bersahaja berarti sederhana, tidak berlebih-lebihan. Sendirian dan sekadarnya hanya mirip bunyinya.', 'easy'),
  ('tiu-sinonim', 'Sinonim kata INFILTRASI adalah …', 'Penyusupan', 'Penyaringan', 'Pengusiran', 'Pemeriksaan', 'Penyebaran', 5, 0, 0, 0, 0, 'Infiltrasi berarti penyusupan (misalnya penyusupan ke dalam suatu organisasi). Penyaringan adalah arti filtrasi, jebakan karena bunyinya mirip.', 'hard'),
  ('tiu-sinonim', 'Dalam kalimat "Pemerintah daerah menyusun langkah mitigasi untuk menekan dampak banjir", kata mitigasi bermakna …', 'Upaya memulihkan keadaan setelah bencana', 'Pemindahan penduduk ke tempat aman', 'Upaya mengurangi risiko dan dampak bencana', 'Pendataan jumlah korban bencana', 'Pemberian bantuan logistik kepada pengungsi', 0, 0, 5, 0, 0, 'Mitigasi adalah tindakan mengurangi dampak bencana atau risikonya. Pemulihan setelah bencana disebut rehabilitasi/rekonstruksi, pemindahan penduduk disebut evakuasi.', 'hard'),
  ('tiu-sinonim', 'Pasangan kata berikut yang BUKAN merupakan sinonim adalah …', 'Konsensus – mufakat', 'Otonomi – swatantra', 'Kapabel – cakap', 'Implisit – tersurat', 'Vakum – hampa', 0, 0, 0, 5, 0, 'Implisit berarti tersirat (tidak dinyatakan secara langsung), sedangkan tersurat adalah makna eksplisit. Pasangan lainnya bersinonim: konsensus = mufakat, otonomi = swatantra, kapabel = cakap, vakum = hampa.', 'hard'),
  ('tiu-sinonim', 'Sinonim kata KOHERENSI adalah …', 'Kepaduan', 'Paksaan', 'Kerumunan', 'Kejujuran', 'Pertentangan', 5, 0, 0, 0, 0, 'Koherensi berarti hubungan yang logis antarbagian; kepaduan atau keterpaduan. Paksaan adalah arti koersi, jebakan karena bunyinya mirip.', 'hard'),
  ('tiu-antonim', 'Antonim kata PASANG (tentang air laut) adalah …', 'Naik', 'Surut', 'Ombak', 'Deras', 'Tinggi', 0, 5, 0, 0, 0, 'Air laut pasang berarti naik atau meninggi; lawannya surut, yaitu air laut turun atau berkurang. Naik dan tinggi justru searah maknanya.', 'easy'),
  ('tiu-antonim', 'Antonim kata KONKRET adalah …', 'Nyata', 'Jelas', 'Abstrak', 'Padat', 'Berwujud', 0, 0, 5, 0, 0, 'Konkret berarti nyata dan berwujud; lawannya abstrak, yaitu tidak berwujud atau tidak dapat diraba.', 'easy'),
  ('tiu-antonim', 'Antonim kata STATIS adalah …', 'Tetap', 'Diam', 'Lamban', 'Dinamis', 'Stabil', 0, 0, 0, 5, 0, 'Statis berarti dalam keadaan diam, tidak bergerak, atau tidak berubah. Lawannya dinamis, yaitu penuh gerak dan perubahan.', 'easy'),
  ('tiu-antonim', 'Antonim kata MAYOR (dalam arti besar/utama) adalah …', 'Kapten', 'Utama', 'Pokok', 'Besar', 'Minor', 0, 0, 0, 0, 5, 'Mayor berarti besar atau utama; lawannya minor (kecil, kurang penting). Kapten adalah jebakan karena mayor juga nama pangkat militer.', 'medium'),
  ('tiu-antonim', 'Antonim kata SURPLUS adalah …', 'Defisit', 'Laba', 'Kelebihan', 'Inflasi', 'Untung', 5, 0, 0, 0, 0, 'Surplus berarti kelebihan (penerimaan atas pengeluaran). Lawannya defisit, yaitu kekurangan. Inflasi adalah kenaikan harga secara umum, bukan lawan surplus.', 'medium'),
  ('tiu-antonim', 'Antonim kata HETEROGEN adalah …', 'Beragam', 'Majemuk', 'Homogen', 'Campuran', 'Plural', 0, 0, 5, 0, 0, 'Heterogen berarti terdiri atas berbagai unsur yang berbeda (beragam, majemuk). Lawannya homogen, yaitu terdiri atas unsur yang sejenis.', 'easy'),
  ('tiu-antonim', 'Antonim kata AKSELERASI adalah …', 'Percepatan', 'Perlambatan', 'Penambahan', 'Perluasan', 'Peningkatan', 0, 5, 0, 0, 0, 'Akselerasi berarti percepatan. Lawannya perlambatan (deselerasi). Penambahan dan peningkatan masih searah maknanya.', 'medium'),
  ('tiu-antonim', 'Antonim kata KONVEKS adalah …', 'Cembung', 'Datar', 'Bulat', 'Lengkung', 'Cekung', 0, 0, 0, 0, 5, 'Konveks berarti cembung (melengkung ke luar). Lawannya konkaf, yaitu cekung.', 'medium'),
  ('tiu-antonim', 'Antonim kata GERSANG adalah …', 'Subur', 'Tandus', 'Kering', 'Panas', 'Gundul', 5, 0, 0, 0, 0, 'Gersang berarti kering dan tandus (tanah tidak dapat ditanami). Lawannya subur.', 'easy'),
  ('tiu-antonim', 'Antonim kata KIKIR adalah …', 'Pelit', 'Kedekut', 'Hemat', 'Dermawan', 'Serakah', 0, 0, 0, 5, 0, 'Kikir berarti terlalu hemat memakai harta, pelit. Lawannya dermawan (suka berderma). Hemat bukan lawan kikir; hemat berlawanan dengan boros.', 'medium'),
  ('tiu-antonim', 'Antonim kata SAKRAL adalah …', 'Suci', 'Profan', 'Keramat', 'Kudus', 'Agung', 0, 5, 0, 0, 0, 'Sakral berarti suci atau keramat. Lawannya profan, yaitu tidak bersangkutan dengan agama atau tujuan keagamaan (duniawi).', 'hard'),
  ('tiu-antonim', 'Antonim kata VERTIKAL adalah …', 'Tegak lurus', 'Diagonal', 'Miring', 'Menjulang', 'Horizontal', 0, 0, 0, 0, 5, 'Vertikal berarti tegak lurus dari bawah ke atas. Lawannya horizontal (mendatar). Diagonal dan miring bukan lawan langsungnya.', 'easy'),
  ('tiu-antonim', 'Antonim kata EKSTERNAL adalah …', 'Luar', 'Asing', 'Internal', 'Formal', 'Nasional', 0, 0, 5, 0, 0, 'Eksternal berarti menyangkut bagian luar. Lawannya internal, yaitu menyangkut bagian dalam.', 'easy'),
  ('tiu-antonim', 'Dalam kepegawaian, antonim kata PROMOSI (kenaikan jabatan) adalah …', 'Demosi', 'Mutasi', 'Rotasi', 'Iklan', 'Kenaikan', 5, 0, 0, 0, 0, 'Promosi jabatan berarti kenaikan pangkat atau jabatan; lawannya demosi, yaitu penurunan jabatan. Mutasi dan rotasi adalah perpindahan tugas tanpa naik atau turun jabatan.', 'medium'),
  ('tiu-antonim', 'Antonim kata SINTESIS adalah …', 'Hipotesis', 'Gabungan', 'Paduan', 'Analisis', 'Tesis', 0, 0, 0, 5, 0, 'Sintesis berarti paduan berbagai unsur menjadi satu kesatuan. Lawannya analisis, yaitu penguraian suatu pokok atas bagian-bagiannya.', 'hard'),
  ('tiu-antonim', 'Antonim kata DEFENSIF adalah …', 'Bertahan', 'Protektif', 'Pasif', 'Waspada', 'Ofensif', 0, 0, 0, 0, 5, 'Defensif berarti bersikap bertahan. Lawannya ofensif, yaitu bersikap menyerang.', 'medium'),
  ('tiu-antonim', 'Antonim kata AMATIR adalah …', 'Pemula', 'Awam', 'Penggemar', 'Profesional', 'Pelajar', 0, 0, 0, 5, 0, 'Amatir berarti melakukan sesuatu atas dasar kesenangan, bukan untuk mencari nafkah, atau belum ahli. Lawannya profesional. Pemula dan awam mendekati sinonim.', 'medium'),
  ('tiu-antonim', 'Antonim kata MUSKIL adalah …', 'Mudah', 'Sulit', 'Pelik', 'Mustahil', 'Rumit', 5, 0, 0, 0, 0, 'Muskil berarti sukar, sulit, atau pelik. Lawannya mudah. Mustahil adalah jebakan bunyi (tidak mungkin), bukan lawan muskil.', 'medium'),
  ('tiu-antonim', 'Antonim kata LALIM adalah …', 'Kejam', 'Bengis', 'Adil', 'Zalim', 'Sewenang-wenang', 0, 0, 5, 0, 0, 'Lalim berarti bengis, tidak adil, kejam, atau sewenang-wenang. Lawannya adil.', 'medium'),
  ('tiu-antonim', 'Lawan kata yang tepat untuk kata bercetak kapital dalam kalimat "Jadwal yang diumumkan masih bersifat TENTATIF sehingga dapat berubah" adalah …', 'Sementara', 'Definitif', 'Fleksibel', 'Opsional', 'Relatif', 0, 5, 0, 0, 0, 'Tentatif berarti belum pasti atau masih dapat berubah. Lawannya definitif, yaitu sudah pasti dan tidak berubah lagi. Sementara dan fleksibel justru dekat dengan makna tentatif.', 'hard'),
  ('tiu-antonim', 'Pasangan kata berikut yang merupakan antonim adalah …', 'Bonafide – tepercaya', 'Vakum – hampa', 'Konsensus – mufakat', 'Mutlak – relatif', 'Kapabel – cakap', 0, 0, 0, 5, 0, 'Mutlak (absolut) berlawanan dengan relatif (nisbi). Pasangan lain bersinonim: bonafide = tepercaya, vakum = hampa, konsensus = mufakat, kapabel = cakap.', 'medium'),
  ('tiu-antonim', 'Antonim kata DEFLASI adalah …', 'Resesi', 'Inflasi', 'Depresiasi', 'Devaluasi', 'Stagnasi', 0, 5, 0, 0, 0, 'Deflasi adalah penurunan tingkat harga barang secara umum (atau berkurangnya uang beredar). Lawannya inflasi, kenaikan harga secara umum. Resesi, depresiasi, devaluasi, dan stagnasi sama-sama bermakna pelemahan, bukan lawan deflasi.', 'hard'),
  ('tiu-analogi', 'KOMPAS : ARAH = JAM : …', 'Waktu', 'Jarum', 'Dinding', 'Detik', 'Baterai', 5, 0, 0, 0, 0, 'Alat dan hal yang ditunjukkannya: kompas menunjukkan arah, jam menunjukkan waktu. Jarum dan baterai adalah bagian jam, detik adalah satuan.', 'easy'),
  ('tiu-analogi', 'AIR : HAUS = MAKANAN : …', 'Kenyang', 'Piring', 'Nasi', 'Gizi', 'Lapar', 0, 0, 0, 0, 5, 'Sesuatu dan keadaan yang dihilangkannya: air menghilangkan haus, makanan menghilangkan lapar. Kenyang adalah akibatnya, bukan keadaan yang dihilangkan.', 'easy'),
  ('tiu-analogi', 'SUTRADARA : FILM = KOMPONIS : …', 'Penyanyi', 'Gitar', 'Lagu', 'Konser', 'Panggung', 0, 0, 5, 0, 0, 'Pelaku dan karya yang diciptakannya: sutradara menghasilkan film, komponis menciptakan lagu (musik).', 'easy'),
  ('tiu-analogi', 'SAMUDRA : LAUT = GUNUNG : …', 'Lembah', 'Bukit', 'Puncak', 'Lereng', 'Gunung api', 0, 5, 0, 0, 0, 'Hubungan tingkat ukuran sejenis, dari yang lebih besar ke yang lebih kecil: samudra lebih luas daripada laut, gunung lebih tinggi daripada bukit. Puncak dan lereng adalah bagian gunung.', 'medium'),
  ('tiu-analogi', 'LISTRIK : KABEL = AIR : …', 'Keran', 'Bak', 'Sumur', 'Pipa', 'Ember', 0, 0, 0, 5, 0, 'Sesuatu dan media yang mengalirkannya: listrik dialirkan melalui kabel, air dialirkan melalui pipa. Keran adalah pengatur, bak dan ember adalah wadah, sumur adalah sumber.', 'medium'),
  ('tiu-analogi', 'MALAS : BODOH = RAJIN : …', 'Giat', 'Tekun', 'Pandai', 'Lelah', 'Malas', 0, 0, 5, 0, 0, 'Sebab dan akibat: malas (belajar) menyebabkan bodoh, rajin menyebabkan pandai. Giat dan tekun adalah sinonim rajin, bukan akibatnya.', 'medium'),
  ('tiu-analogi', 'KAKI : SEPATU = TANGAN : …', 'Cincin', 'Jari', 'Gelang', 'Kuku', 'Sarung tangan', 0, 0, 0, 0, 5, 'Anggota tubuh dan benda yang membungkus/melindunginya: sepatu dikenakan menutupi kaki, sarung tangan menutupi tangan. Cincin dan gelang hanya perhiasan, jari dan kuku bagian tangan.', 'medium'),
  ('tiu-analogi', 'LEBAH : SARANG = KUDA : …', 'Pelana', 'Delman', 'Joki', 'Istal', 'Padang rumput', 0, 0, 0, 5, 0, 'Hewan dan tempat tinggalnya: lebah tinggal di sarang, kuda tinggal di istal (kandang kuda). Pelana adalah perlengkapan, joki adalah penunggang, padang rumput tempat merumput.', 'medium'),
  ('tiu-analogi', 'Pasangan kata yang memiliki hubungan sama dengan MEMBACA : BUKU adalah …', 'Menulis : pena', 'Menonton : film', 'Memasak : dapur', 'Berlari : sepatu', 'Menyanyi : penyanyi', 0, 5, 0, 0, 0, 'Kegiatan dan objeknya: yang dibaca adalah buku, yang ditonton adalah film. Pena dan sepatu adalah alat, dapur adalah tempat, penyanyi adalah pelaku.', 'medium'),
  ('tiu-analogi', 'KAYU : MEJA = BENANG : …', 'Kain', 'Jarum', 'Penjahit', 'Kapas', 'Gulungan', 5, 0, 0, 0, 0, 'Bahan dan barang jadi yang dibuat darinya: meja dibuat dari kayu, kain ditenun dari benang. Kapas adalah bahan benang, sehingga arahnya terbalik.', 'medium'),
  ('tiu-analogi', 'AKSELERASI : KECEPATAN = INFLASI : …', 'Uang', 'Bank', 'Harga', 'Ekonomi', 'Pajak', 0, 0, 5, 0, 0, 'Kata pertama adalah kenaikan dari kata kedua: akselerasi adalah peningkatan kecepatan, inflasi adalah kenaikan harga (barang dan jasa) secara umum.', 'hard'),
  ('tiu-analogi', 'ALAT TULIS : PENSIL = SAYURAN : …', 'Pasar', 'Petani', 'Vitamin', 'Bayam', 'Kebun', 0, 0, 0, 5, 0, 'Kelompok dan anggotanya: pensil termasuk alat tulis, bayam termasuk sayuran.', 'easy'),
  ('tiu-analogi', '… : PELUKIS = MIKROSKOP : …', 'Lukisan – lensa', 'Kuas – peneliti', 'Galeri – laboratorium', 'Cat – sel', 'Seni – sains', 0, 5, 0, 0, 0, 'Alat dan pelaku yang menggunakannya: kuas dipakai pelukis, mikroskop dipakai peneliti. Jika diisi Galeri – laboratorium, polanya menjadi tempat : pelaku dan alat : tempat, tidak sejajar.', 'hard'),
  ('tiu-analogi', 'HEMAT : KIKIR = BERANI : …', 'Penakut', 'Gagah', 'Pahlawan', 'Tegas', 'Nekat', 0, 0, 0, 0, 5, 'Hubungan derajat: kikir adalah hemat yang berlebihan (sifat baik yang menjadi buruk), nekat adalah berani yang berlebihan tanpa perhitungan. Penakut adalah lawan kata, gagah dan tegas setara derajatnya.', 'hard'),
  ('tiu-silogisme', 'Semua anggota tim inti mengikuti pemusatan latihan. Tidak ada peserta pemusatan latihan yang boleh pulang sebelum pukul 17.00. Kesimpulan yang tepat adalah …', 'Sebagian anggota tim inti boleh pulang sebelum pukul 17.00', 'Semua yang tidak boleh pulang sebelum pukul 17.00 adalah anggota tim inti', 'Tidak ada anggota tim inti yang boleh pulang sebelum pukul 17.00', 'Sebagian peserta pemusatan latihan bukan anggota tim inti', 'Semua peserta pemusatan latihan adalah anggota tim inti', 0, 0, 5, 0, 0, 'Himpunan anggota tim inti berada di dalam himpunan peserta pemusatan latihan, sedangkan himpunan peserta pemusatan latihan terpisah dari yang boleh pulang sebelum pukul 17.00. Jadi tidak ada anggota tim inti yang boleh pulang sebelum pukul 17.00. Pilihan lain tidak dijamin oleh premis (misalnya bisa saja semua peserta adalah anggota tim inti).', 'medium'),
  ('tiu-silogisme', 'Rapat paripurna dimulai jika dan hanya jika peserta memenuhi kuorum. Ternyata rapat paripurna tidak dimulai. Kesimpulan yang tepat adalah …', 'Peserta memenuhi kuorum', 'Peserta tidak memenuhi kuorum', 'Rapat dimulai tetapi peserta tidak kuorum', 'Rapat ditunda karena alasan lain', 'Tidak dapat ditarik kesimpulan', 0, 5, 0, 0, 0, 'Biimplikasi p ⇔ q berarti p dan q selalu bernilai sama. Karena rapat tidak dimulai (¬p), maka peserta tidak memenuhi kuorum (¬q). Berbeda dengan implikasi biasa, pada biimplikasi arah sebaliknya juga berlaku.', 'easy'),
  ('tiu-silogisme', 'Sebagian pegawai teladan berasal dari bagian umum. Semua pegawai teladan mendapat piagam. Kesimpulan yang tepat adalah …', 'Sebagian pegawai bagian umum mendapat piagam', 'Semua pegawai bagian umum mendapat piagam', 'Semua pegawai bagian umum adalah pegawai teladan', 'Tidak ada pegawai bagian umum yang mendapat piagam', 'Semua yang mendapat piagam adalah pegawai teladan', 5, 0, 0, 0, 0, 'Ada pegawai yang sekaligus teladan dan dari bagian umum. Karena semua pegawai teladan mendapat piagam, pegawai tersebut juga mendapat piagam. Jadi sebagian pegawai bagian umum mendapat piagam. Kesimpulan ''semua'' terlalu luas karena premis hanya menyebut ''sebagian''.', 'medium'),
  ('tiu-silogisme', 'Jika Rani berangkat naik bus, ia tiba di kantor pukul 07.30. Hari ini Rani tiba di kantor pukul 07.30. Kesimpulan yang tepat adalah …', 'Rani pasti berangkat naik bus', 'Rani pasti tidak berangkat naik bus', 'Rani tidak tiba pukul 07.30', 'Rani selalu naik bus setiap hari', 'Belum tentu Rani berangkat naik bus', 0, 0, 0, 0, 5, 'Bentuk p ⇒ q dan q tidak menghasilkan p (kesalahan ''menegaskan konsekuen''). Rani bisa saja tiba pukul 07.30 dengan kendaraan lain, sehingga kendaraan yang dipakai Rani tidak dapat dipastikan. Pernyataan ''pasti tidak naik bus'' juga tidak dijamin.', 'medium'),
  ('tiu-silogisme', 'Pernyataan yang setara dengan "Semua kendaraan yang lolos uji emisi mendapat stiker hijau" adalah …', 'Kendaraan yang mendapat stiker hijau pasti lolos uji emisi', 'Kendaraan yang tidak lolos uji emisi pasti tidak mendapat stiker hijau', 'Ada kendaraan yang lolos uji emisi tetapi tidak mendapat stiker hijau', 'Kendaraan yang tidak mendapat stiker hijau pasti tidak lolos uji emisi', 'Semua kendaraan mendapat stiker hijau', 0, 0, 0, 5, 0, 'Untuk setiap kendaraan berlaku: lolos ⇒ stiker hijau. Pernyataan yang setara adalah kontraposisinya: tidak mendapat stiker hijau ⇒ tidak lolos. Pilihan ''yang mendapat stiker pasti lolos'' adalah konvers dan ''yang tidak lolos pasti tidak mendapat stiker'' adalah invers; keduanya tidak setara.', 'medium'),
  ('tiu-silogisme', 'Ingkaran dari pernyataan "Ada pegawai yang tidak hadir dalam rapat" adalah …', 'Semua pegawai tidak hadir dalam rapat', 'Semua pegawai hadir dalam rapat', 'Ada pegawai yang hadir dalam rapat', 'Sebagian pegawai tidak hadir dalam rapat', 'Sebagian pegawai hadir dalam rapat', 0, 5, 0, 0, 0, 'Negasi ''ada x yang tidak P'' adalah ''semua x P''. Jadi ingkarannya: semua pegawai hadir dalam rapat. ''Sebagian pegawai tidak hadir'' justru bermakna sama dengan pernyataan awal, dan ''ada/sebagian pegawai hadir'' tidak meniadakan kemungkinan ada yang absen.', 'easy'),
  ('tiu-silogisme', 'Ingkaran dari pernyataan "Jika semua pegawai hadir, maka rapat dimulai tepat waktu" adalah …', 'Ada pegawai yang tidak hadir dan rapat dimulai tepat waktu', 'Jika ada pegawai yang tidak hadir, rapat tidak dimulai tepat waktu', 'Jika rapat dimulai tepat waktu, semua pegawai hadir', 'Semua pegawai hadir dan rapat tidak dimulai tepat waktu', 'Ada pegawai yang tidak hadir dan rapat tidak dimulai tepat waktu', 0, 0, 0, 5, 0, 'Negasi p ⇒ q adalah p ∧ ¬q. Di sini p = ''semua pegawai hadir'' tetap utuh (tidak dinegasikan), dan q dinegasikan menjadi ''rapat tidak dimulai tepat waktu''. Jebakannya adalah ikut menegasikan kuantor pada p.', 'hard'),
  ('tiu-silogisme', 'Jika anggaran disetujui, proyek dimulai pada bulan Mei. Jika tender belum selesai, proyek tidak dimulai pada bulan Mei. Kesimpulan yang sah adalah …', 'Jika anggaran disetujui, tender sudah selesai', 'Jika tender sudah selesai, anggaran disetujui', 'Jika anggaran tidak disetujui, tender belum selesai', 'Jika anggaran disetujui, tender belum selesai', 'Jika tender sudah selesai, proyek dimulai pada bulan Mei', 5, 0, 0, 0, 0, 'Premis kedua ¬t ⇒ ¬m setara dengan kontraposisinya m ⇒ t. Rangkaian a ⇒ m dan m ⇒ t menghasilkan a ⇒ t: jika anggaran disetujui, tender sudah selesai. Pilihan lain merupakan konvers/invers yang tidak sah.', 'hard'),
  ('tiu-silogisme', 'Semua pegawai di lantai 3 adalah staf keuangan. Semua staf keuangan mengikuti pelatihan akuntansi. Sebagian pegawai baru tidak mengikuti pelatihan akuntansi. Kesimpulan yang tepat adalah …', 'Sebagian pegawai baru adalah staf keuangan', 'Tidak ada pegawai baru yang berada di lantai 3', 'Sebagian pegawai baru tidak berada di lantai 3', 'Sebagian staf keuangan adalah pegawai baru', 'Tidak ada staf keuangan yang merupakan pegawai baru', 0, 0, 5, 0, 0, 'Rantai himpunan: lantai 3 ⊂ staf keuangan ⊂ peserta pelatihan akuntansi. Pegawai baru yang tidak ikut pelatihan pasti berada di luar ketiga himpunan itu, sehingga sebagian pegawai baru tidak berada di lantai 3. Namun pegawai baru lainnya mungkin saja berada di lantai 3, jadi ''tidak ada'' terlalu kuat.', 'hard'),
  ('tiu-silogisme', 'Jika Tono lembur, ia pulang naik taksi. Jika Tono tidak lembur, ia pulang naik KRL. Hari ini Tono tidak pulang naik taksi. Kesimpulan yang tepat adalah …', 'Tono lembur', 'Tono pulang naik taksi dan KRL', 'Tono tidak pulang naik KRL', 'Tidak dapat ditarik kesimpulan', 'Tono pulang naik KRL', 0, 0, 0, 0, 5, 'Dari premis 1 dan ''tidak naik taksi'' (modus tollens) diperoleh Tono tidak lembur. Dari premis 2 dan ''tidak lembur'' (modus ponens) diperoleh Tono pulang naik KRL.', 'medium'),
  ('tiu-silogisme', 'Jika listrik PLN padam, genset kantor menyala otomatis. Hari ini listrik PLN padam. Kesimpulan yang tepat adalah …', 'Genset kantor menyala otomatis', 'Genset kantor tidak menyala', 'Listrik PLN tidak padam', 'Listrik padam tetapi genset rusak', 'Tidak dapat ditarik kesimpulan', 5, 0, 0, 0, 0, 'Modus ponens: p ⇒ q dan p benar, maka q benar. Listrik padam, sehingga genset kantor menyala otomatis.', 'easy'),
  ('tiu-silogisme', 'Tidak ada pegawai yang membawa kendaraan pribadi diizinkan parkir di halaman depan. Pak Agus parkir di halaman depan. Kesimpulan yang tepat adalah …', 'Pak Agus membawa kendaraan pribadi', 'Pak Agus tidak parkir di halaman depan', 'Sebagian pegawai berkendaraan pribadi parkir di halaman depan', 'Pak Agus tidak membawa kendaraan pribadi', 'Semua yang parkir di halaman depan membawa kendaraan pribadi', 0, 0, 0, 5, 0, 'Himpunan pegawai berkendaraan pribadi terpisah dari yang parkir di halaman depan. Pak Agus termasuk yang parkir di halaman depan, sehingga ia tidak termasuk pegawai yang membawa kendaraan pribadi (dengan asumsi aturan ditaati, sesuai premis).', 'easy'),
  ('tiu-silogisme', 'Semua peserta yang lulus tes tertulis mengikuti wawancara. Sebagian peserta wawancara diterima bekerja. Sinta tidak mengikuti wawancara. Kesimpulan yang pasti benar adalah …', 'Sinta tidak diterima bekerja', 'Sinta lulus tes tertulis', 'Sinta tidak lulus tes tertulis', 'Semua peserta yang diterima lulus tes tertulis', 'Sebagian peserta yang lulus tes tertulis diterima bekerja', 0, 0, 5, 0, 0, 'Lulus tes tertulis ⇒ mengikuti wawancara. Kontraposisinya: tidak mengikuti wawancara ⇒ tidak lulus tes tertulis, sehingga Sinta tidak lulus tes tertulis. Status diterima atau tidaknya Sinta tidak dapat dipastikan karena premis tidak menyatakan bahwa semua yang diterima pernah diwawancarai.', 'medium'),
  ('tiu-silogisme', 'Jika kantor menerapkan kerja di kantor penuh, kantin buka setiap hari. Jika renovasi gedung berlangsung, kantin tidak buka setiap hari. Kantor menerapkan kerja di kantor penuh. Kesimpulan yang tepat adalah …', 'Renovasi gedung berlangsung', 'Renovasi gedung tidak berlangsung', 'Kantin tidak buka setiap hari', 'Kantor tidak menerapkan kerja di kantor penuh', 'Tidak dapat ditarik kesimpulan', 0, 5, 0, 0, 0, 'Dari premis 1 dan 3 (modus ponens): kantin buka setiap hari. Dari premis 2 dan ''kantin buka setiap hari'' (modus tollens): renovasi gedung tidak berlangsung.', 'medium'),
  ('tiu-analitis', 'Enam regu mengikuti kompetisi bola voli. Setiap regu bertanding tepat satu kali melawan setiap regu lainnya. Banyak pertandingan seluruhnya adalah …', '30', '36', '15', '12', '6', 0, 0, 5, 0, 0, 'Setiap pertandingan melibatkan 2 regu, jadi banyaknya = C(6,2) = 6 × 5 ÷ 2 = 15. Jawaban 30 muncul jika lupa membagi 2 (setiap pertandingan terhitung dua kali).', 'easy'),
  ('tiu-analitis', 'Jika tanggal 17 Agustus suatu tahun jatuh pada hari Selasa, maka tanggal 25 Desember pada tahun yang sama jatuh pada hari …', 'Jumat', 'Sabtu', 'Minggu', 'Senin', 'Rabu', 0, 5, 0, 0, 0, 'Selisih hari: sisa Agustus 31 − 17 = 14, September 30, Oktober 31, November 30, dan 25 hari di Desember. Totalnya 14 + 30 + 31 + 30 + 25 = 130 hari. 130 = 18 × 7 + 4, jadi maju 4 hari dari Selasa: Rabu, Kamis, Jumat, Sabtu.', 'medium'),
  ('tiu-analitis', 'Lima pelari P, Q, R, S, dan T mengikuti lomba. Q finis tepat setelah P. R finis lebih dulu daripada P. S finis paling akhir. T finis lebih dulu daripada R. Siapa yang finis di urutan ketiga?', 'P', 'Q', 'R', 'S', 'T', 5, 0, 0, 0, 0, 'S di urutan 5. Urutan T sebelum R sebelum P, dan Q tepat setelah P, sehingga empat posisi pertama harus T, R, P, Q. Urutan ketiga adalah P.', 'easy'),
  ('tiu-analitis', 'Enam orang A, B, C, D, E, dan F duduk mengelilingi meja bundar dengan jarak antarkursi sama. A duduk berhadapan dengan D. B duduk tepat di sebelah kiri A. E duduk berhadapan dengan B. C tidak duduk bersebelahan dengan D. Siapa yang duduk berhadapan dengan C?', 'A', 'B', 'D', 'E', 'F', 0, 0, 0, 0, 5, 'Letakkan A dan D berhadapan, B di sebelah kiri A, dan E di seberang B (sehingga E bersebelahan dengan D). Tersisa dua kursi untuk C dan F: satu bersebelahan dengan D dan satu bersebelahan dengan A. Karena C tidak bersebelahan dengan D, C duduk di sebelah A dan F di sebelah D. Kedua kursi itu saling berhadapan, jadi C berhadapan dengan F.', 'medium'),
  ('tiu-analitis', 'Enam rapat U, V, W, X, Y, dan Z dijadwalkan pada jam ke-1 sampai ke-6, satu rapat per jam. W dilaksanakan pada jam ke-4 dan X tepat setelah W. U dilaksanakan sebelum V, dan V sebelum W. Y tidak dilaksanakan pada jam ke-1. Jika Y dilaksanakan pada jam ke-2, rapat apakah yang dilaksanakan pada jam ke-6?', 'U', 'V', 'X', 'Z', 'Y', 0, 0, 0, 5, 0, 'W jam ke-4 dan X jam ke-5. U dan V harus sebelum jam ke-4 dengan U lebih dulu. Jika Y di jam ke-2, slot tersisa sebelum jam ke-4 adalah jam ke-1 dan ke-3, sehingga U jam ke-1 dan V jam ke-3. Satu-satunya slot tersisa, jam ke-6, diisi Z.', 'medium'),
  ('tiu-analitis', 'Di suatu desa, penduduk golongan Jujur selalu berkata benar dan penduduk golongan Bohong selalu berbohong. Rani berkata, "Saya dan Sari sama-sama golongan Bohong." Kesimpulan yang tepat adalah …', 'Rani dan Sari sama-sama golongan Bohong', 'Rani dan Sari sama-sama golongan Jujur', 'Rani golongan Bohong dan Sari golongan Jujur', 'Rani golongan Jujur dan Sari golongan Bohong', 'Tidak dapat ditentukan', 0, 0, 5, 0, 0, 'Jika Rani Jujur, ucapannya benar sehingga ia golongan Bohong — kontradiksi. Jadi Rani Bohong dan ucapannya salah: tidak benar bahwa keduanya Bohong. Karena Rani sudah pasti Bohong, Sari haruslah Jujur.', 'medium'),
  ('tiu-analitis', 'Lima pegawai—Fajar, Gina, Hadi, Intan, dan Joko—berkantor di lantai 1 sampai 5 sebuah gedung, satu orang per lantai. Gina berada di lantai yang lebih tinggi daripada Hadi. Intan berada tepat satu lantai di bawah Fajar. Joko tidak berada di lantai 1 maupun lantai 5. Hadi tidak berada di lantai 1. Pernyataan yang pasti benar adalah …', 'Gina berada di lantai 5', 'Hadi berada di lantai 3', 'Joko berada di lantai 4', 'Hadi berada di lantai 4', 'Intan berada di lantai 2', 5, 0, 0, 0, 0, 'Lantai 1 tidak mungkin ditempati Joko, Hadi, Gina (harus di atas Hadi), maupun Fajar (Intan harus di bawahnya). Jadi Intan di lantai 1 dan Fajar di lantai 2. Lantai 3–5 untuk Gina, Hadi, Joko; Joko bukan lantai 5 dan Hadi tidak mungkin di atas Gina, sehingga lantai 5 pasti Gina. Hadi dan Joko masih bisa bertukar di lantai 3 dan 4, jadi pilihan tentang mereka hanya ''mungkin benar''.', 'hard'),
  ('tiu-analitis', 'Putra, Qori, dan Raka masing-masing bekerja sebagai guru, perawat, atau polisi (berbeda-beda) dan tinggal di Bogor, Depok, atau Bekasi (berbeda-beda). Orang yang tinggal di Depok bekerja sebagai perawat. Putra bukan guru dan tidak tinggal di Bekasi. Raka tinggal di Bogor dan bukan polisi. Pekerjaan dan kota tempat tinggal Qori adalah …', 'Guru, Bekasi', 'Perawat, Depok', 'Polisi, Depok', 'Guru, Bogor', 'Polisi, Bekasi', 0, 0, 0, 0, 5, 'Raka di Bogor, jadi perawat (penghuni Depok) bukan Raka; Raka juga bukan polisi, maka Raka guru. Putra tidak di Bekasi dan Bogor sudah terisi, sehingga Putra di Depok dan menjadi perawat. Sisanya, Qori adalah polisi yang tinggal di Bekasi.', 'medium'),
  ('tiu-analitis', 'Tepat satu dari empat pegawai K, L, M, dan N menghilangkan kunci gudang. K berkata, "L pelakunya." L berkata, "N pelakunya." M berkata, "Bukan saya pelakunya." N berkata, "L berbohong." Jika hanya satu orang yang berkata jujur, siapa pelakunya?', 'K', 'M', 'L', 'N', 'Tidak dapat ditentukan', 0, 5, 0, 0, 0, 'Uji setiap kemungkinan pelaku dan hitung pernyataan yang benar. Pelaku K: benar M dan N (2). Pelaku L: benar K, M, N (3). Pelaku N: benar L dan M (2). Pelaku M: hanya N yang benar (1). Karena hanya satu yang jujur, pelakunya M.', 'hard'),
  ('tiu-analitis', 'Dari lima calon A, B, C, D, dan E akan dipilih tepat tiga orang sebagai panitia. Jika A dipilih, B juga harus dipilih. C dan D tidak boleh dipilih bersama-sama. E pasti dipilih. Pernyataan yang pasti benar adalah …', 'A pasti terpilih', 'C pasti tidak terpilih', 'D pasti terpilih', 'B pasti terpilih', 'A dan C terpilih bersama', 0, 0, 0, 5, 0, 'E pasti masuk, jadi dipilih dua lagi dari A, B, C, D. Pasangan AC dan AD gugur (A butuh B), pasangan CD dilarang. Susunan yang mungkin hanya {A, B, E}, {B, C, E}, dan {B, D, E}. Ketiganya memuat B.', 'medium'),
  ('tiu-analitis', 'Empat buku berbeda—Matematika, Fisika, Kimia, dan Biologi—akan disusun berjajar pada rak. Buku Matematika dan Fisika harus bersebelahan, dan buku Kimia tidak boleh berada di ujung paling kiri. Banyak susunan yang mungkin adalah …', '12', '6', '10', '8', '24', 0, 0, 0, 5, 0, 'Gabungkan Matematika–Fisika menjadi satu blok: blok, Kimia, Biologi dapat disusun 3! = 6 cara, dan blok dapat dibalik 2 cara, jadi 12 susunan. Susunan dengan Kimia di ujung kiri: Kimia tetap, sisanya (blok, Biologi) 2! × 2 = 4 cara. Hasil: 12 − 4 = 8.', 'hard'),
  ('tiu-analitis', 'Sebuah jam dinding selalu terlambat 2 menit setiap jam. Jam itu dicocokkan dengan waktu sebenarnya tepat pukul 06.00. Pada saat waktu sebenarnya pukul 18.00, jam dinding tersebut menunjukkan pukul …', '17.48', '17.36', '18.24', '17.58', '17.12', 0, 5, 0, 0, 0, 'Dari 06.00 sampai 18.00 berlalu 12 jam. Keterlambatan total 12 × 2 = 24 menit, sehingga jam menunjukkan 18.00 − 0.24 = 17.36. Jawaban 18.24 muncul jika keterlambatan ditambahkan.', 'medium'),
  ('tiu-analitis', 'Dalam suatu sandi, kata BUKU ditulis CVLV. Dengan aturan yang sama, kata MEJA ditulis …', 'LDIZ', 'NFKA', 'NFJB', 'OGLC', 'NFKB', 0, 0, 0, 0, 5, 'Setiap huruf digeser satu huruf ke depan dalam alfabet: B→C, U→V, K→L. Maka M→N, E→F, J→K, A→B sehingga MEJA menjadi NFKB.', 'easy'),
  ('tiu-analitis', 'Jika setiap huruf diganti dengan nomor urutnya dalam alfabet sehingga PAGI = 16-1-7-9, maka jumlah angka untuk kata SORE adalah …', '57', '56', '58', '54', '61', 5, 0, 0, 0, 0, 'S = 19, O = 15, R = 18, E = 5. Jumlahnya 19 + 15 + 18 + 5 = 57.', 'easy'),
  ('tiu-aljabar', 'Nilai x yang memenuhi 3x − 7 = 2x + 5 adalah …', '−2', '2', '12', '7', '−12', 0, 0, 5, 0, 0, 'Pindahkan suku x ke ruas kiri dan konstanta ke ruas kanan: 3x − 2x = 5 + 7, sehingga x = 12.', 'easy'),
  ('tiu-aljabar', 'Nilai x yang memenuhi 5(x − 2) = 3x + 6 adalah …', '2', '4', '6', '16', '8', 0, 0, 0, 0, 5, 'Uraikan kurung: 5x − 10 = 3x + 6. Maka 2x = 16 dan x = 8. Jawaban 2 muncul jika lupa mengalikan 5 dengan −2 (5x − 2 = 3x + 6).', 'easy'),
  ('tiu-aljabar', 'Nilai x yang memenuhi x/3 + x/4 = 14 adalah …', '24', '2', '12', '28', '98', 5, 0, 0, 0, 0, 'Samakan penyebut (KPK 12): 4x/12 + 3x/12 = 7x/12 = 14, sehingga x = 14 × 12 ÷ 7 = 24.', 'medium'),
  ('tiu-aljabar', 'Jika 2a + 3b = 19 dan a − b = 2, maka nilai a × b adalah …', '8', '10', '21', '15', '35', 0, 0, 0, 5, 0, 'Dari a − b = 2 diperoleh a = b + 2. Substitusi: 2(b + 2) + 3b = 19 → 5b = 15 → b = 3, sehingga a = 5. Jadi a × b = 15 (bukan a + b = 8).', 'medium'),
  ('tiu-aljabar', 'Jika x + 1/x = 5, maka nilai x² + 1/x² adalah …', '25', '23', '27', '21', '10', 0, 5, 0, 0, 0, 'Kuadratkan kedua ruas: (x + 1/x)² = x² + 2 + 1/x² = 25. Jadi x² + 1/x² = 25 − 2 = 23. Jawaban 25 muncul jika suku tengah 2 dilupakan.', 'medium'),
  ('tiu-aljabar', 'Jika p − q = 4 dan pq = 12, maka nilai p² + q² adalah …', '16', '28', '64', '40', '8', 0, 0, 0, 5, 0, 'Gunakan identitas p² + q² = (p − q)² + 2pq = 16 + 24 = 40. Jawaban 16 − 24 = −8 atau 16 + 12 = 28 adalah kesalahan umum dalam memakai faktor 2pq.', 'medium'),
  ('tiu-aljabar', 'Bentuk sederhana dari (x + 3)(x − 5) adalah …', 'x² + 2x − 15', 'x² − 2x − 15', 'x² − 8x − 15', 'x² − 2x + 15', 'x² + 8x − 15', 0, 5, 0, 0, 0, 'Kalikan setiap suku: x·x + x·(−5) + 3·x + 3·(−5) = x² − 5x + 3x − 15 = x² − 2x − 15.', 'easy'),
  ('tiu-aljabar', 'Bentuk faktor dari x² − 7x + 12 adalah …', '(x + 3)(x + 4)', '(x − 2)(x − 6)', '(x − 3)(x − 4)', '(x + 3)(x − 4)', '(x − 1)(x − 12)', 0, 0, 5, 0, 0, 'Cari dua bilangan yang hasil kalinya 12 dan jumlahnya −7, yaitu −3 dan −4. Jadi x² − 7x + 12 = (x − 3)(x − 4). (x − 2)(x − 6) memang menghasilkan konstanta 12 tetapi suku tengahnya −8x.', 'easy'),
  ('tiu-aljabar', 'Himpunan penyelesaian dari x² − 5x − 14 = 0 adalah …', '{−2, 7}', '{2, −7}', '{2, 7}', '{−2, −7}', '{−1, 14}', 5, 0, 0, 0, 0, 'Faktorkan: dua bilangan dengan hasil kali −14 dan jumlah −5 adalah −7 dan 2, sehingga (x − 7)(x + 2) = 0. Akar-akarnya x = 7 atau x = −2.', 'medium'),
  ('tiu-aljabar', 'Nilai x yang memenuhi 2^(x + 1) = 32 adalah …', '5', '3', '16', '6', '4', 0, 0, 0, 0, 5, '32 = 2⁵, sehingga x + 1 = 5 dan x = 4. Jawaban 5 muncul jika lupa mengurangi 1.', 'easy'),
  ('tiu-aljabar', 'Nilai x yang memenuhi 3^(2x − 1) = 27^(x − 2) adalah …', '5', '1', '7', '−5', '3', 5, 0, 0, 0, 0, 'Ubah ke basis 3: 27^(x − 2) = 3^(3x − 6). Samakan pangkat: 2x − 1 = 3x − 6, sehingga x = 5. Jawaban 1 muncul jika lupa mengalikan 3 dengan −2 (2x − 1 = 3x − 2), dan −5 muncul dari salah tanda saat memindahkan suku.', 'medium'),
  ('tiu-aljabar', 'Bilangan asli terbesar yang memenuhi pertidaksamaan 3x − 4 < 2x + 3 adalah …', '7', '5', '6', '8', '1', 0, 0, 5, 0, 0, '3x − 2x < 3 + 4, sehingga x < 7. Karena tanda < (bukan ≤), x = 7 tidak termasuk. Bilangan asli terbesar adalah 6.', 'medium'),
  ('tiu-aljabar', 'Diketahui f(x) = 3x − 2. Jika f(a) = 13, maka nilai a adalah …', '37', '5', '11', '3', '15', 0, 5, 0, 0, 0, 'f(a) = 3a − 2 = 13, sehingga 3a = 15 dan a = 5. Jawaban 37 muncul jika menghitung f(13), bukan mencari a.', 'easy'),
  ('tiu-aljabar', 'Diketahui f(x) = 2x + 1 dan g(x) = x². Nilai (g ∘ f)(2) adalah …', '9', '10', '16', '25', '5', 0, 0, 0, 5, 0, '(g ∘ f)(2) = g(f(2)). Hitung dulu f(2) = 2·2 + 1 = 5, lalu g(5) = 25. Jawaban 9 adalah (f ∘ g)(2) = f(4), urutan komposisi yang terbalik.', 'medium'),
  ('tiu-aljabar', 'Diketahui x + y = 10, y + z = 14, dan x + z = 12. Nilai y adalah …', '4', '8', '18', '7', '6', 0, 0, 0, 0, 5, 'Jumlahkan ketiga persamaan: 2(x + y + z) = 36, sehingga x + y + z = 18. Maka y = 18 − (x + z) = 18 − 12 = 6. (x = 4 dan z = 8.)', 'medium'),
  ('tiu-aljabar', 'Jika 4x − 3y = 0 dan x + y = 14, maka nilai 2x + y adalah …', '20', '22', '14', '18', '24', 5, 0, 0, 0, 0, '4x = 3y berarti x : y = 3 : 4. Dengan x + y = 14, setiap bagian bernilai 2, jadi x = 6 dan y = 8. Maka 2x + y = 12 + 8 = 20. Jawaban 22 muncul jika tertukar (x = 8, y = 6).', 'medium'),
  ('tiu-aljabar', 'Jika x − y = 3 dan x² − y² = 39, maka nilai x adalah …', '5', '8', '13', '6', '10', 0, 5, 0, 0, 0, 'x² − y² = (x + y)(x − y), sehingga 39 = (x + y) · 3 dan x + y = 13. Dengan x − y = 3, diperoleh 2x = 16 dan x = 8. Jawaban 13 adalah nilai x + y.', 'medium'),
  ('tiu-aljabar', 'Banyaknya pasangan bilangan asli (x, y) yang memenuhi 3x + 5y = 41 adalah …', '2', '4', '3', '5', '8', 0, 0, 5, 0, 0, 'y harus membuat 41 − 5y habis dibagi 3 dan positif. y = 1 → x = 12; y = 4 → x = 7; y = 7 → x = 2; y = 10 sudah membuat 5y > 41. Jadi ada 3 pasangan: (12, 1), (7, 4), (2, 7).', 'hard'),
  ('tiu-aljabar', 'Jika a/b = 2/3 dengan b ≠ 0, maka nilai (3a + 2b)/(4a − b) adalah …', '12/11', '5/12', '2', '6/5', '12/5', 0, 0, 0, 0, 5, 'Misalkan a = 2k dan b = 3k. Pembilang: 3(2k) + 2(3k) = 12k. Penyebut: 4(2k) − 3k = 5k. Hasilnya 12k/5k = 12/5, berapa pun nilai k.', 'hard'),
  ('tiu-aljabar', 'Akar-akar persamaan 2x² − 8x + 3 = 0 adalah x₁ dan x₂. Nilai x₁² + x₂² adalah …', '16', '10', '19', '13', '61', 0, 0, 0, 5, 0, 'x₁ + x₂ = −b/a = 8/2 = 4 dan x₁·x₂ = c/a = 3/2. Maka x₁² + x₂² = (x₁ + x₂)² − 2x₁x₂ = 16 − 3 = 13. Jawaban 10 muncul jika memakai x₁x₂ = 3 (lupa membagi a).', 'hard'),
  ('tiu-aljabar', 'Jumlah semua nilai x yang memenuhi |2x − 3| = 7 adalah …', '3', '5', '7', '−2', '10', 5, 0, 0, 0, 0, '|2x − 3| = 7 berarti 2x − 3 = 7 (x = 5) atau 2x − 3 = −7 (x = −2). Jumlahnya 5 + (−2) = 3. Jawaban 5 muncul jika hanya mengambil kasus positif.', 'hard'),
  ('tiu-aljabar', 'Nilai x yang memenuhi √(2x + 7) = 5 adalah …', '−1', '16', '4', '9', '12', 0, 0, 0, 5, 0, 'Kuadratkan kedua ruas: 2x + 7 = 25, sehingga 2x = 18 dan x = 9. Jawaban −1 muncul jika ruas kanan tidak dikuadratkan (2x + 7 = 5).', 'easy'),
  ('tiu-geometri', 'Sebuah persegi panjang memiliki keliling 30 cm dan panjang 9 cm. Luas persegi panjang tersebut adalah …', '81 cm²', '189 cm²', '54 cm²', '135 cm²', '30 cm²', 0, 0, 5, 0, 0, 'Keliling = 2(p + l) → 30 = 2(9 + l) → l = 6 cm. Luas = p × l = 9 × 6 = 54 cm². Jawaban 135 muncul jika lebar dianggap 30 ÷ 2 = 15 (lupa dikurangi panjang), 189 jika lebar dianggap 30 − 9 = 21, dan 81 jika bangun dianggap persegi.', 'easy'),
  ('tiu-geometri', 'Luas segitiga dengan alas 12 cm dan tinggi 7 cm adalah …', '84 cm²', '19 cm²', '38 cm²', '42 cm²', '21 cm²', 0, 0, 0, 5, 0, 'Luas segitiga = ½ × alas × tinggi = ½ × 12 × 7 = 42 cm². Jawaban 84 muncul jika lupa mengalikan ½.', 'easy'),
  ('tiu-geometri', 'Keliling lingkaran yang berjari-jari 14 cm adalah … (gunakan π = 22/7)', '88 cm', '44 cm', '616 cm', '176 cm', '154 cm', 5, 0, 0, 0, 0, 'Keliling = 2πr = 2 × 22/7 × 14 = 88 cm. Jawaban 44 berasal dari πr (lupa faktor 2), sedangkan 616 adalah luasnya.', 'easy'),
  ('tiu-geometri', 'Luas lingkaran yang berdiameter 28 cm adalah … (gunakan π = 22/7)', '2.464 cm²', '616 cm²', '88 cm²', '1.232 cm²', '308 cm²', 0, 5, 0, 0, 0, 'Jari-jari r = 28 ÷ 2 = 14 cm. Luas = πr² = 22/7 × 14 × 14 = 616 cm². Jawaban 2.464 muncul jika diameter dipakai sebagai jari-jari.', 'medium'),
  ('tiu-geometri', 'Sebuah segitiga siku-siku memiliki sisi siku-siku 9 cm dan 12 cm. Panjang sisi miringnya adalah …', '21 cm', '18 cm', '13 cm', '16 cm', '15 cm', 0, 0, 0, 0, 5, 'Teorema Pythagoras: c² = 9² + 12² = 81 + 144 = 225, sehingga c = 15 cm (kelipatan tripel 3-4-5). Jawaban 21 muncul jika sisi langsung dijumlahkan.', 'easy'),
  ('tiu-geometri', 'Sebuah trapesium memiliki sisi sejajar 10 cm dan 16 cm serta tinggi 8 cm. Luas trapesium tersebut adalah …', '208 cm²', '104 cm²', '128 cm²', '80 cm²', '52 cm²', 0, 5, 0, 0, 0, 'Luas trapesium = ½ × (jumlah sisi sejajar) × tinggi = ½ × 26 × 8 = 104 cm². Jawaban 208 muncul jika lupa ½.', 'easy'),
  ('tiu-geometri', 'Sebuah belah ketupat memiliki panjang diagonal 10 cm dan 24 cm. Keliling belah ketupat tersebut adalah …', '120 cm', '68 cm', '26 cm', '52 cm', '136 cm', 0, 0, 0, 5, 0, 'Diagonal belah ketupat saling tegak lurus dan membagi dua sama panjang, sehingga membentuk segitiga siku-siku dengan sisi 5 cm dan 12 cm. Sisi belah ketupat = √(25 + 144) = 13 cm. Keliling = 4 × 13 = 52 cm. Angka 120 adalah luasnya (½ × 10 × 24).', 'medium'),
  ('tiu-geometri', 'Sebuah kubus memiliki luas permukaan 150 cm². Volume kubus tersebut adalah …', '125 cm³', '25 cm³', '150 cm³', '625 cm³', '216 cm³', 5, 0, 0, 0, 0, 'Luas permukaan kubus = 6s² = 150, sehingga s² = 25 dan s = 5 cm. Volume = s³ = 125 cm³. Jawaban 25 adalah luas satu sisi.', 'medium'),
  ('tiu-geometri', 'Luas permukaan balok berukuran 8 cm × 5 cm × 3 cm adalah …', '120 cm²', '79 cm²', '316 cm²', '96 cm²', '158 cm²', 0, 0, 0, 0, 5, 'Luas permukaan balok = 2(pl + pt + lt) = 2(40 + 24 + 15) = 2 × 79 = 158 cm². Jawaban 120 adalah volumenya dan 79 muncul jika lupa dikali 2.', 'medium'),
  ('tiu-geometri', 'Volume tabung dengan jari-jari alas 7 cm dan tinggi 10 cm adalah … (gunakan π = 22/7)', '440 cm³', '3.080 cm³', '1.540 cm³', '154 cm³', '6.160 cm³', 0, 0, 5, 0, 0, 'Volume tabung = πr²t = 22/7 × 49 × 10 = 1.540 cm³. Jawaban 440 adalah luas selimut (2πrt), sedangkan 6.160 muncul jika diameter (14) dipakai sebagai jari-jari.', 'medium'),
  ('tiu-geometri', 'Volume kerucut dengan jari-jari alas 6 cm dan tinggi 7 cm adalah … (gunakan π = 22/7)', '264 cm³', '792 cm³', '132 cm³', '528 cm³', '88 cm³', 5, 0, 0, 0, 0, 'Volume kerucut = ⅓πr²t = ⅓ × 22/7 × 36 × 7 = 264 cm³. Jawaban 792 muncul jika lupa faktor ⅓ (sama dengan volume tabung).', 'medium'),
  ('tiu-geometri', 'Besar setiap sudut dalam segi enam beraturan adalah …', '60°', '108°', '135°', '720°', '120°', 0, 0, 0, 0, 5, 'Jumlah sudut dalam segi-n = (n − 2) × 180°. Untuk n = 6: 4 × 180° = 720°, sehingga setiap sudut = 720° ÷ 6 = 120°. Angka 60° adalah sudut luarnya, 108° untuk segi lima, 135° untuk segi delapan.', 'medium'),
  ('tiu-geometri', 'Jumlah besar sudut dalam segi delapan adalah …', '1.440°', '1.080°', '900°', '360°', '1.260°', 0, 5, 0, 0, 0, 'Jumlah sudut dalam segi-n = (n − 2) × 180° = 6 × 180° = 1.080°. Jawaban 1.440° muncul jika memakai n × 180°, sedangkan 360° adalah jumlah sudut luar.', 'medium'),
  ('tiu-geometri', 'Jika panjang sisi sebuah persegi diperbesar 20%, maka luasnya bertambah …', '20%', '40%', '44%', '120%', '4%', 0, 0, 5, 0, 0, 'Sisi baru 1,2s, luas baru (1,2s)² = 1,44s². Pertambahan luas = 0,44s², yaitu 44%. Jawaban 40% muncul jika kenaikan dikalikan 2 begitu saja.', 'hard'),
  ('tiu-geometri', 'Jika jari-jari sebuah bola diperbesar menjadi 2 kali semula, maka volumenya menjadi … kali semula.', '2', '4', '6', '8', '16', 0, 0, 0, 5, 0, 'Volume bola = 4/3 πr³ sebanding dengan r³. Jika r menjadi 2r, volume menjadi 2³ = 8 kali semula. Jawaban 4 adalah faktor perubahan luas permukaan (r²).', 'medium'),
  ('tiu-geometri', 'Tinggi segitiga sama sisi yang panjang sisinya 10 cm adalah …', '5 cm', '5√3 cm', '10√3 cm', '5√2 cm', '10√2 cm', 0, 5, 0, 0, 0, 'Garis tinggi membagi alas menjadi 5 cm dan 5 cm. Dengan Pythagoras: t² = 10² − 5² = 75, sehingga t = √75 = 5√3 cm (≈ 8,66 cm).', 'medium'),
  ('tiu-geometri', 'Di dalam sebuah persegi bersisi 14 cm dibuat lingkaran terbesar yang menyinggung keempat sisi persegi. Luas daerah persegi di luar lingkaran adalah … (gunakan π = 22/7)', '154 cm²', '196 cm²', '112 cm²', '42 cm²', '56 cm²', 0, 0, 0, 5, 0, 'Lingkaran terbesar memiliki diameter 14 cm (r = 7 cm). Luas persegi = 196 cm², luas lingkaran = 22/7 × 49 = 154 cm². Luas daerah sisa = 196 − 154 = 42 cm².', 'hard'),
  ('tiu-geometri', 'Sebuah kolam berukuran 20 m × 15 m dikelilingi jalan selebar 2 m di sekeliling luarnya. Luas jalan tersebut adalah …', '140 m²', '74 m²', '156 m²', '300 m²', '456 m²', 0, 0, 5, 0, 0, 'Ukuran kolam beserta jalan menjadi (20 + 2 + 2) × (15 + 2 + 2) = 24 × 19 = 456 m². Luas jalan = 456 − 300 = 156 m². Jawaban 140 = 2 × 2 × (20 + 15) melupakan empat pojok, 74 muncul jika lebar jalan hanya ditambahkan satu kali pada panjang dan lebar (22 × 17 − 300), dan 456 adalah luas kolam beserta jalan.', 'hard'),
  ('tiu-geometri', 'Panjang diagonal ruang sebuah kubus dengan rusuk 6 cm adalah …', '6√3 cm', '6√2 cm', '18 cm', '12 cm', '3√6 cm', 5, 0, 0, 0, 0, 'Diagonal ruang kubus = s√3 = 6√3 cm (≈ 10,39 cm). Diagonal sisi (bidang) adalah s√2 = 6√2 cm, jebakan yang paling umum.', 'medium'),
  ('tiu-geometri', 'Dua sudut saling berpelurus (jumlahnya 180°). Jika besar sudut yang satu 3 kali sudut yang lain, besar sudut yang lebih kecil adalah …', '60°', '30°', '135°', '22,5°', '45°', 0, 0, 0, 0, 5, 'Misalkan sudut kecil x, sudut besar 3x. x + 3x = 180°, sehingga x = 45°. Jawaban 22,5° muncul jika memakai sudut berpenyiku (90°), dan 135° adalah sudut yang besar.', 'easy'),
  ('tiu-geometri', 'Perbandingan besar sudut-sudut sebuah segitiga adalah 2 : 3 : 4. Besar sudut terbesarnya adalah …', '40°', '60°', '90°', '120°', '80°', 0, 0, 0, 0, 5, 'Jumlah perbandingan 2 + 3 + 4 = 9 bagian, dan jumlah sudut segitiga 180°, jadi 1 bagian = 20°. Sudut terbesar = 4 × 20° = 80°.', 'easy'),
  ('tiu-geometri', 'Sebuah bak air berbentuk tabung tanpa tutup memiliki jari-jari alas 7 dm dan tinggi 10 dm. Luas permukaan bak tersebut adalah … (gunakan π = 22/7)', '748 dm²', '440 dm²', '594 dm²', '1.540 dm²', '902 dm²', 0, 0, 5, 0, 0, 'Tanpa tutup berarti luas = alas + selimut = πr² + 2πrt = 154 + 440 = 594 dm². Jawaban 748 menghitung dua lingkaran (dengan tutup), 1.540 adalah volume.', 'hard'),
  ('tiu-berhitung', 'Hasil dari 0,125 × 0,8 + 0,45 adalah …', '1,45', '1', '0,55', '0,46', '0,1', 0, 0, 5, 0, 0, '0,125 × 0,8 = 0,1 (karena 1/8 × 8/10 = 1/10). Lalu 0,1 + 0,45 = 0,55.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 2 3/4 + 1 5/6 adalah …', '3 8/10', '4 7/12', '4 1/3', '3 7/12', '4 5/12', 0, 5, 0, 0, 0, 'Ubah ke pecahan biasa: 11/4 + 11/6 = 33/12 + 22/12 = 55/12 = 4 7/12. Jawaban 3 8/10 muncul dari menjumlahkan pembilang dan penyebut langsung.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 15% × 240 + 40% × 85 adalah …', '60', '72', '34', '66', '70', 0, 0, 0, 0, 5, '15% × 240 = 36 dan 40% × 85 = 34. Jumlahnya 36 + 34 = 70.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 998 × 1.002 adalah …', '999.996', '1.000.004', '999.994', '1.000.000', '999.896', 5, 0, 0, 0, 0, 'Gunakan (a − b)(a + b) = a² − b² dengan a = 1.000 dan b = 2: 1.000.000 − 4 = 999.996.', 'medium'),
  ('tiu-berhitung', 'Hasil dari √0,49 + √1,21 adalah …', '0,18', '1,7', '1,18', '1,8', '1,9', 0, 0, 0, 5, 0, '√0,49 = 0,7 dan √1,21 = 1,1. Jumlahnya 0,7 + 1,1 = 1,8.', 'easy'),
  ('tiu-berhitung', 'Hasil dari 3⁴ × 9⁻¹ ÷ 3 adalah …', '9', '3', '1', '27', '1/3', 0, 5, 0, 0, 0, '3⁴ = 81 dan 9⁻¹ = 1/9. Jadi 81 × 1/9 ÷ 3 = 9 ÷ 3 = 3. Dengan sifat pangkat: 3⁴ × 3⁻² ÷ 3¹ = 3^(4 − 2 − 1) = 3¹.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 1/(1×2) + 1/(2×3) + 1/(3×4) + … + 1/(9×10) adalah …', '1/10', '1', '10/11', '8/9', '9/10', 0, 0, 0, 0, 5, 'Setiap suku dapat dipecah: 1/(n(n + 1)) = 1/n − 1/(n + 1). Penjumlahan menjadi teleskopik: (1 − 1/2) + (1/2 − 1/3) + … + (1/9 − 1/10) = 1 − 1/10 = 9/10.', 'hard'),
  ('tiu-berhitung', 'Hasil dari 0,36 × 2,5 ÷ 0,09 adalah …', '10', '1', '100', '0,1', '4', 5, 0, 0, 0, 0, '0,36 × 2,5 = 0,9. Kemudian 0,9 ÷ 0,09 = 10.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 1 − 2 + 3 − 4 + 5 − 6 + … + 99 − 100 adalah …', '50', '−100', '0', '−50', '−1', 0, 0, 0, 5, 0, 'Kelompokkan berpasangan: (1 − 2) + (3 − 4) + … + (99 − 100). Ada 50 pasang dan setiap pasang bernilai −1, sehingga hasilnya −50.', 'medium'),
  ('tiu-berhitung', 'Di antara pecahan 3/5, 5/8, 7/11, 4/7, dan 2/3, pecahan yang nilainya paling besar adalah …', '3/5', '5/8', '2/3', '7/11', '4/7', 0, 0, 5, 0, 0, 'Ubah ke desimal: 3/5 = 0,6; 5/8 = 0,625; 7/11 ≈ 0,636; 4/7 ≈ 0,571; 2/3 ≈ 0,667. Yang terbesar adalah 2/3. Cara lain: semakin kecil selisih pembilang dan penyebut relatif terhadap penyebut, semakin dekat ke 1.', 'medium'),
  ('tiu-berhitung', 'Hasil dari 17 × 23 + 17 × 77 adalah …', '1.600', '1.717', '1.700', '1.300', '1.770', 0, 0, 5, 0, 0, 'Gunakan sifat distributif: 17 × (23 + 77) = 17 × 100 = 1.700.', 'easy'),
  ('tiu-berhitung', 'Angka satuan dari 7²⁰²⁶ adalah …', '7', '3', '1', '9', '4', 0, 0, 0, 5, 0, 'Angka satuan pangkat 7 berulang setiap 4: 7, 9, 3, 1. Sisa 2026 ÷ 4 adalah 2, sehingga angka satuannya sama dengan 7², yaitu 9.', 'hard'),
  ('tiu-berhitung', 'Hasil dari 0,333… + 0,666… × 3/4 adalah …', '3/4', '5/6', '1', '7/12', '1/2', 0, 5, 0, 0, 0, '0,333… = 1/3 dan 0,666… = 2/3. Kerjakan perkalian dahulu: 2/3 × 3/4 = 1/2. Lalu 1/3 + 1/2 = 5/6. Jawaban 3/4 muncul jika penjumlahan dikerjakan lebih dulu (1 × 3/4).', 'hard'),
  ('tiu-berhitung', 'Jika 40% dari suatu bilangan sama dengan 30% dari 120, bilangan tersebut adalah …', '160', '36', '144', '80', '90', 0, 0, 0, 0, 5, '30% × 120 = 36. Maka 40% × x = 36, sehingga x = 36 ÷ 0,4 = 90. Jawaban 160 muncul jika perbandingannya dibalik (120 × 4/3).', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 5, 14, 41, 122, …', '244', '365', '363', '366', '203', 0, 5, 0, 0, 0, 'Polanya ×3 lalu −1: 2×3−1 = 5, 5×3−1 = 14, 14×3−1 = 41, 41×3−1 = 122, sehingga 122×3−1 = 365. Selisihnya (3, 9, 27, 81, 243) juga membentuk kelipatan 3.', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 3, 5, 7, 11, 13, …', '17', '15', '19', '16', '14', 5, 0, 0, 0, 0, 'Deret bilangan prima berurutan. Setelah 13, bilangan prima berikutnya adalah 17 (15 = 3 × 5 bukan prima).', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 6, 12, 20, 30, …', '40', '36', '42', '44', '50', 0, 0, 5, 0, 0, 'Selisihnya 4, 6, 8, 10, sehingga selisih berikutnya 12 dan suku berikutnya 30 + 12 = 42. Atau rumus suku ke-n: n(n + 1), suku ke-6 = 6 × 7 = 42.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan yang hilang: 5, 8, …, 20, 29', '12', '14', '11', '13', '15', 0, 0, 0, 5, 0, 'Selisihnya bilangan ganjil berurutan: +3, +5, +7, +9. Jadi 8 + 5 = 13, dan dicek 13 + 7 = 20, 20 + 9 = 29.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 1, 3, 7, 13, 21, …', '29', '30', '33', '34', '31', 0, 0, 0, 0, 5, 'Selisihnya 2, 4, 6, 8 (bertambah 2), sehingga selisih berikutnya 10 dan suku berikutnya 21 + 10 = 31.', 'easy'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 1, 1, 2, 4, 7, 13, 24, …', '44', '37', '35', '48', '41', 5, 0, 0, 0, 0, 'Setiap suku adalah jumlah tiga suku sebelumnya (pola tribonacci): 2 + 4 + 7 = 13, 4 + 7 + 13 = 24, sehingga 7 + 13 + 24 = 44. Jawaban 37 muncul jika hanya menjumlahkan dua suku terakhir.', 'hard'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 4, 18, 48, 100, 180, …', '260', '294', '252', '288', '300', 0, 5, 0, 0, 0, 'Suku ke-n = n × (n + 1)²: 1×4 = 4, 2×9 = 18, 3×16 = 48, 4×25 = 100, 5×36 = 180. Suku ke-6 = 6 × 49 = 294. Dicek dengan selisih: 14, 30, 52, 80 → selisih tingkat dua 16, 22, 28 (bertambah 6), berikutnya 34 sehingga selisih tingkat satu 114 dan 180 + 114 = 294. Jawaban 288 muncul jika selisih tingkat dua dianggap tetap 28 (180 + 108).', 'hard'),
  ('tiu-deret-angka', 'Jumlah 20 suku pertama deret 3 + 7 + 11 + 15 + … adalah …', '79', '840', '820', '800', '1.640', 0, 0, 5, 0, 0, 'Deret aritmetika dengan a = 3 dan b = 4. Sₙ = n/2 × (2a + (n − 1)b) = 10 × (6 + 76) = 820. Angka 79 adalah suku ke-20, dan 1.640 muncul jika lupa membagi 2.', 'hard'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 3, 20, 6, 17, 9, 14, …', '11', '15', '18', '10', '12', 0, 0, 0, 0, 5, 'Deret selang-seling. Suku ganjil: 3, 6, 9, … (bertambah 3). Suku genap: 20, 17, 14 (berkurang 3). Suku ke-7 termasuk suku ganjil, jadi 9 + 3 = 12. Jawaban 11 berasal dari melanjutkan suku genap (14 − 3).', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 3, 4, 6, 10, 18, …', '26', '36', '32', '34', '28', 0, 0, 0, 5, 0, 'Selisihnya 1, 2, 4, 8 (dikali 2), sehingga selisih berikutnya 16 dan suku berikutnya 18 + 16 = 34. Jawaban 26 muncul jika selisih dianggap bertambah 8.', 'medium'),
  ('tiu-deret-angka', 'Tentukan huruf berikutnya: A, B, D, G, K, …', 'O', 'Q', 'P', 'N', 'M', 0, 0, 5, 0, 0, 'Ubah ke nomor urut: A = 1, B = 2, D = 4, G = 7, K = 11. Selisihnya 1, 2, 3, 4, jadi berikutnya 11 + 5 = 16, yaitu huruf P.', 'medium'),
  ('tiu-deret-angka', 'Tentukan huruf berikutnya: C, X, E, V, G, T, …', 'R', 'H', 'S', 'J', 'I', 0, 0, 0, 0, 5, 'Dua deret huruf berselang-seling. Posisi ganjil: C, E, G (maju 2 huruf). Posisi genap: X, V, T (mundur 2 huruf). Suku ke-7 berada di posisi ganjil, jadi setelah G adalah I. R adalah lanjutan deret genap (suku ke-8).', 'medium'),
  ('tiu-deret-angka', 'Tentukan bilangan berikutnya: 2, 4, 6, 12, 14, 28, …', '56', '42', '32', '30', '29', 0, 0, 0, 5, 0, 'Dua operasi bergantian: ×2, +2, ×2, +2, … yaitu 2×2 = 4, 4+2 = 6, 6×2 = 12, 12+2 = 14, 14×2 = 28. Langkah berikutnya giliran +2, sehingga 28 + 2 = 30. Jawaban 56 muncul jika mengalikan 2 dua kali berturut-turut.', 'medium'),
  ('tiu-deret-angka', 'Suku ke-50 dari barisan 4, 7, 10, 13, … adalah …', '154', '151', '150', '147', '153', 0, 5, 0, 0, 0, 'Barisan aritmetika dengan a = 4 dan b = 3. Uₙ = a + (n − 1)b = 4 + 49 × 3 = 151. Jawaban 154 muncul jika memakai n × b (4 + 50 × 3).', 'medium'),
  ('tiu-perbandingan', 'Uang A, B, dan C berbanding 2 : 3 : 5. Jika uang C lebih banyak Rp90.000 daripada uang A, jumlah uang mereka bertiga adalah …', 'Rp450.000', 'Rp180.000', 'Rp300.000', 'Rp900.000', 'Rp270.000', 0, 0, 5, 0, 0, 'Selisih C dan A = 5 − 2 = 3 bagian = Rp90.000, jadi 1 bagian = Rp30.000. Jumlah uang = 10 bagian = Rp300.000.', 'medium'),
  ('tiu-perbandingan', 'Pada denah berskala 1 : 200, sebuah ruangan berukuran 6 cm × 4 cm. Luas ruangan sebenarnya adalah …', '0,48 m²', '24 m²', '960 m²', '96 m²', '48 m²', 0, 0, 0, 5, 0, 'Panjang sebenarnya 6 × 200 = 1.200 cm = 12 m, lebar 4 × 200 = 800 cm = 8 m. Luas = 12 × 8 = 96 m². Jawaban 0,48 m² muncul jika luas denah (24 cm²) hanya dikali 200, padahal faktor skala untuk luas adalah 200².', 'medium'),
  ('tiu-perbandingan', 'Sebuah mobil yang melaju 80 km/jam menempuh suatu perjalanan dalam 3 jam. Jika kecepatannya 60 km/jam, waktu yang diperlukan adalah …', '2,25 jam', '2,5 jam', '5 jam', '3,5 jam', '4 jam', 0, 0, 0, 0, 5, 'Jarak tetap = 80 × 3 = 240 km (perbandingan berbalik nilai). Waktu = 240 ÷ 60 = 4 jam. Jawaban 2,25 jam muncul jika diperlakukan sebagai perbandingan senilai.', 'easy'),
  ('tiu-perbandingan', 'Untuk membuat 12 kue diperlukan 300 gram tepung. Tepung yang diperlukan untuk membuat 20 kue adalah …', '180 gram', '500 gram', '400 gram', '600 gram', '320 gram', 0, 5, 0, 0, 0, 'Perbandingan senilai: 300 ÷ 12 = 25 gram per kue, sehingga 20 kue memerlukan 20 × 25 = 500 gram. Jawaban 180 gram muncul jika dihitung sebagai berbalik nilai.', 'easy'),
  ('tiu-perbandingan', 'Pekerjaan memasang ubin dapat diselesaikan Ali dalam 6 hari, Badu dalam 10 hari, dan Candra dalam 15 hari. Jika ketiganya bekerja bersama-sama, pekerjaan selesai dalam …', '3 hari', '10 hari', '5 hari', '4 hari', '6 hari', 5, 0, 0, 0, 0, 'Kecepatan kerja per hari: 1/6 + 1/10 + 1/15 = 5/30 + 3/30 + 2/30 = 10/30 = 1/3. Jadi pekerjaan selesai dalam 3 hari. Jawaban 10 hari adalah rata-rata waktu, bukan kerja bersama.', 'medium'),
  ('tiu-perbandingan', 'Andi dan Budi bersama-sama dapat menyelesaikan sebuah laporan dalam 8 hari. Jika Andi sendirian dapat menyelesaikannya dalam 12 hari, Budi sendirian akan menyelesaikannya dalam …', '4 hari', '24 hari', '20 hari', '4,8 hari', '16 hari', 0, 5, 0, 0, 0, 'Kecepatan Budi = 1/8 − 1/12 = 3/24 − 2/24 = 1/24 per hari, sehingga Budi sendiri butuh 24 hari. Jawaban 4 hari berasal dari 12 − 8, sedangkan 4,8 hari dari 1/8 + 1/12.', 'medium'),
  ('tiu-perbandingan', 'Sebuah kereta sepanjang 200 m melaju dengan kecepatan tetap 72 km/jam dan melewati terowongan sepanjang 400 m. Waktu sejak ujung depan kereta memasuki terowongan hingga ujung belakang kereta keluar adalah …', '30 detik', '20 detik', '10 detik', '8 detik', '50 detik', 5, 0, 0, 0, 0, '72 km/jam = 72.000 m ÷ 3.600 s = 20 m/s. Jarak yang ditempuh = panjang terowongan + panjang kereta = 600 m. Waktu = 600 ÷ 20 = 30 detik. Jawaban 20 detik muncul jika panjang kereta tidak dihitung.', 'hard'),
  ('tiu-perbandingan', 'Kecepatan 54 km/jam sama dengan …', '5,4 m/s', '18 m/s', '15 m/s', '9 m/s', '30 m/s', 0, 0, 5, 0, 0, '54 km/jam = 54.000 m ÷ 3.600 detik = 15 m/s. Cara cepat: kalikan dengan 5/18, yaitu 54 × 5/18 = 15.', 'easy'),
  ('tiu-perbandingan', 'Perbandingan banyak peserta laki-laki dan perempuan dalam suatu pelatihan adalah 4 : 5. Setelah 6 peserta laki-laki bergabung, perbandingannya menjadi 1 : 1. Banyak peserta mula-mula adalah …', '60 orang', '45 orang', '30 orang', '48 orang', '54 orang', 0, 0, 0, 0, 5, 'Misalkan laki-laki 4k dan perempuan 5k. Setelah ditambah: 4k + 6 = 5k, sehingga k = 6. Peserta mula-mula = 9k = 54 orang. Angka 60 adalah jumlah setelah penambahan.', 'medium'),
  ('tiu-perbandingan', 'Sebuah perahu memiliki kecepatan 12 km/jam di air tenang. Kecepatan arus sungai 3 km/jam. Waktu yang diperlukan perahu untuk menempuh 45 km melawan arus adalah …', '3 jam', '3,75 jam', '4 jam', '5 jam', '4,5 jam', 0, 0, 0, 5, 0, 'Melawan arus, kecepatan efektif = 12 − 3 = 9 km/jam. Waktu = 45 ÷ 9 = 5 jam. Jawaban 3 jam memakai searah arus (15 km/jam), dan 3,75 jam memakai kecepatan air tenang saja.', 'medium'),
  ('tiu-perbandingan', 'Sebuah proyek direncanakan selesai dalam 24 hari oleh 15 pekerja. Setelah 8 hari bekerja, proyek terhenti selama 4 hari. Agar proyek selesai tepat waktu, banyak pekerja tambahan yang diperlukan adalah …', '20 orang', '5 orang', '4 orang', '3 orang', '10 orang', 0, 5, 0, 0, 0, 'Sisa pekerjaan setelah 8 hari = 15 × 16 = 240 hari-orang. Sisa waktu = 24 − 8 − 4 = 12 hari. Pekerja yang dibutuhkan = 240 ÷ 12 = 20 orang, jadi tambahannya 20 − 15 = 5 orang. Jawaban 20 adalah jumlah total pekerja, bukan tambahannya.', 'hard'),
  ('tiu-perbandingan', 'Keran A dapat mengisi penuh sebuah bak dalam 6 jam, sedangkan keran B dalam 4 jam. Mula-mula hanya keran A dibuka selama 2 jam, kemudian keran B ikut dibuka sampai bak penuh. Waktu total pengisian bak adalah …', '2 jam 24 menit', '4 jam', '3 jam 20 menit', '5 jam', '3 jam 36 menit', 0, 0, 0, 0, 5, 'Dalam 2 jam, keran A mengisi 2/6 = 1/3 bak. Sisa 2/3 bak diisi bersama dengan kecepatan 1/6 + 1/4 = 5/12 bak per jam, sehingga butuh (2/3) ÷ (5/12) = 8/5 jam = 1 jam 36 menit. Total 2 jam + 1 jam 36 menit = 3 jam 36 menit. Jawaban 2 jam 24 menit adalah waktu jika kedua keran dibuka sejak awal.', 'hard'),
  ('tiu-perbandingan', 'Perbandingan panjang dan lebar sebuah persegi panjang adalah 5 : 3. Jika kelilingnya 64 cm, panjang persegi panjang tersebut adalah …', '12 cm', '40 cm', '20 cm', '32 cm', '24 cm', 0, 0, 5, 0, 0, 'Keliling = 2(5k + 3k) = 16k = 64, sehingga k = 4. Panjang = 5k = 20 cm (lebar 12 cm). Jawaban 40 muncul jika 64 dibagi 8 tanpa faktor 2 keliling.', 'easy'),
  ('tiu-perbandingan', 'Seorang pelari menempuh 400 m dalam 50 detik. Kecepatan rata-ratanya dalam km/jam adalah …', '8 km/jam', '48 km/jam', '2,22 km/jam', '28,8 km/jam', '24 km/jam', 0, 0, 0, 5, 0, 'Kecepatan = 400 ÷ 50 = 8 m/s. Untuk mengubah ke km/jam, kalikan 3,6 (atau 18/5): 8 × 3,6 = 28,8 km/jam.', 'medium'),
  ('tiu-soal-cerita', 'Umur Ayu sekarang 4 tahun lebih tua daripada umur Bayu. Enam tahun yang lalu, perbandingan umur Ayu dan Bayu adalah 3 : 2. Umur Bayu sekarang adalah …', '8 tahun', '14 tahun', '18 tahun', '12 tahun', '10 tahun', 0, 5, 0, 0, 0, 'Enam tahun lalu umur Ayu 3k dan Bayu 2k; selisihnya tetap 4 tahun sehingga k = 4. Umur Bayu enam tahun lalu 8 tahun, jadi sekarang 8 + 6 = 14 tahun (Ayu 18 tahun). Jawaban 8 lupa menambahkan 6.', 'medium'),
  ('tiu-soal-cerita', 'Seorang pedagang membeli 2 lusin buku seharga Rp240.000 dan menjual semuanya dengan harga Rp12.500 per buah. Persentase keuntungannya adalah …', '20%', '12,5%', '30%', '15%', '25%', 0, 0, 0, 0, 5, '2 lusin = 24 buku. Hasil penjualan = 24 × Rp12.500 = Rp300.000. Untung = Rp60.000, sehingga persentase untung = 60.000/240.000 × 100% = 25%. Jawaban 20% dihitung terhadap harga jual, bukan harga beli.', 'medium'),
  ('tiu-soal-cerita', 'Harga sebuah printer Rp500.000. Toko memberi diskon 10%, kemudian harga setelah diskon dikenai PPN 11%. Harga yang harus dibayar pembeli adalah …', 'Rp505.000', 'Rp495.000', 'Rp499.500', 'Rp450.000', 'Rp555.000', 0, 0, 5, 0, 0, 'Setelah diskon: 500.000 × 0,9 = Rp450.000. Setelah PPN 11%: 450.000 × 1,11 = Rp499.500. Jawaban Rp505.000 muncul jika persen langsung dijumlahkan (+11% − 10% = +1%).', 'medium'),
  ('tiu-soal-cerita', 'Rata-rata nilai 10 peserta adalah 65. Ternyata satu nilai yang seharusnya 48 tercatat 84. Rata-rata nilai yang benar adalah …', '68,6', '62,6', '61', '61,4', '65', 0, 0, 0, 5, 0, 'Jumlah nilai tercatat = 10 × 65 = 650. Koreksi: 650 − 84 + 48 = 614. Rata-rata benar = 614 ÷ 10 = 61,4. Jawaban 68,6 muncul jika koreksi ditambahkan, bukan dikurangkan.', 'hard'),
  ('tiu-soal-cerita', 'Dari 60 siswa, 35 siswa menyukai matematika, 28 siswa menyukai IPA, dan 10 siswa menyukai keduanya. Banyak siswa yang menyukai tepat satu dari kedua pelajaran tersebut adalah …', '43 siswa', '53 siswa', '63 siswa', '7 siswa', '33 siswa', 5, 0, 0, 0, 0, 'Hanya matematika = 35 − 10 = 25, hanya IPA = 28 − 10 = 18. Tepat satu = 25 + 18 = 43. Angka 53 adalah yang menyukai minimal satu pelajaran, dan 7 adalah yang tidak menyukai keduanya.', 'medium'),
  ('tiu-soal-cerita', 'Gaji pokok seorang pegawai Rp4.000.000 dan ia menerima tunjangan 15% dari gaji pokok. Total penghasilan itu kemudian dipotong iuran 2%. Penghasilan bersih pegawai tersebut adalah …', 'Rp4.520.000', 'Rp4.600.000', 'Rp4.508.000', 'Rp4.520.800', 'Rp4.492.000', 0, 0, 5, 0, 0, 'Penghasilan kotor = 4.000.000 + 15% × 4.000.000 = Rp4.600.000. Potongan 2% = Rp92.000. Penghasilan bersih = Rp4.508.000. Jawaban Rp4.520.000 memotong 2% dari gaji pokok saja.', 'medium'),
  ('tiu-soal-cerita', 'Sebuah rapat dimulai pukul 13.45 dan berlangsung selama 2 jam 35 menit. Rapat tersebut selesai pukul …', '15.80', '16.20', '16.10', '15.20', '16.35', 0, 5, 0, 0, 0, '13.45 + 2 jam = 15.45. Ditambah 35 menit: 15.45 + 15 menit = 16.00, lalu sisa 20 menit menjadi 16.20.', 'easy'),
  ('tiu-soal-cerita', 'Jumlah tiga bilangan genap berurutan adalah 78. Bilangan yang terbesar adalah …', '26', '24', '30', '27', '28', 0, 0, 0, 0, 5, 'Misalkan bilangannya n, n + 2, n + 4. Jumlah 3n + 6 = 78, sehingga n = 24. Bilangan terbesar = 28 (bilangan tengah 26 = 78 ÷ 3).', 'easy'),
  ('tiu-soal-cerita', 'Pak Dimas menggunakan 1/4 gajinya untuk sewa rumah dan 1/3 gajinya untuk kebutuhan makan. Sisa gajinya Rp2.500.000. Besar gaji Pak Dimas adalah …', 'Rp4.285.000', 'Rp5.000.000', 'Rp7.500.000', 'Rp6.000.000', 'Rp3.500.000', 0, 0, 0, 5, 0, 'Bagian yang terpakai = 1/4 + 1/3 = 7/12, jadi sisa = 5/12 gaji = Rp2.500.000. Gaji = 2.500.000 × 12/5 = Rp6.000.000.', 'easy'),
  ('tiu-soal-cerita', 'Uang Rp50.000 terdiri atas 16 lembar pecahan Rp2.000 dan Rp5.000. Banyak lembar pecahan Rp5.000 adalah …', '6 lembar', '10 lembar', '8 lembar', '5 lembar', '4 lembar', 5, 0, 0, 0, 0, 'Misalkan lembar Rp5.000 ada x, maka lembar Rp2.000 ada 16 − x. 5.000x + 2.000(16 − x) = 50.000 → 3.000x + 32.000 = 50.000 → x = 6. Angka 10 adalah banyak lembar Rp2.000.', 'medium'),
  ('tiu-soal-cerita', 'Uang Rp10.000.000 ditabung dengan bunga majemuk 10% per tahun. Besar tabungan setelah 2 tahun adalah …', 'Rp12.000.000', 'Rp11.000.000', 'Rp12.210.000', 'Rp12.100.000', 'Rp12.100.100', 0, 0, 0, 5, 0, 'Tahun pertama: 10.000.000 × 1,1 = Rp11.000.000. Tahun kedua: 11.000.000 × 1,1 = Rp12.100.000. Jawaban Rp12.000.000 adalah hasil bunga tunggal.', 'medium'),
  ('tiu-soal-cerita', 'Harga beras naik 25%. Agar pengeluaran untuk membeli beras tetap sama, jumlah beras yang dibeli harus dikurangi sebesar …', '25%', '20%', '15%', '12,5%', '30%', 0, 5, 0, 0, 0, 'Pengeluaran = harga × jumlah. Harga menjadi 1,25 kali, jadi jumlah harus menjadi 1/1,25 = 0,8 kali semula, yaitu berkurang 20%. Jawaban 25% adalah jebakan karena persen tidak simetris.', 'hard'),
  ('tiu-soal-cerita', 'Jika Ani memberikan 10 kelereng kepada Budi, kelereng mereka menjadi sama banyak. Jika Budi memberikan 10 kelereng kepada Ani, kelereng Ani menjadi 2 kali kelereng Budi. Jumlah kelereng mereka berdua adalah …', '100 butir', '80 butir', '120 butir', '140 butir', '60 butir', 0, 0, 5, 0, 0, 'Kasus pertama: A − 10 = B + 10, sehingga A = B + 20. Kasus kedua: A + 10 = 2(B − 10) → B + 30 = 2B − 20 → B = 50, A = 70. Jumlahnya 120 butir.', 'hard'),
  ('tiu-soal-cerita', 'Pak Ali membeli 3 kemeja seharga Rp125.000 per buah dan 2 celana seharga Rp175.000 per buah. Jika ia membayar dengan uang Rp1.000.000, uang kembaliannya adalah …', 'Rp700.000', 'Rp300.000', 'Rp225.000', 'Rp325.000', 'Rp275.000', 0, 0, 0, 0, 5, 'Total belanja = 3 × 125.000 + 2 × 175.000 = 375.000 + 350.000 = Rp725.000. Kembalian = 1.000.000 − 725.000 = Rp275.000. Rp700.000 muncul jika hanya menjumlahkan satu kemeja dan satu celana.', 'easy'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: △ : ▲▲ = ◇ : …', '◇◇', '◆', '◆◆◆', '◆◆', '◇◆', 0, 0, 0, 5, 0, 'Dua perubahan terjadi bersamaan: bangun yang semula putih (garis tepi) menjadi hitam (diarsir penuh), dan jumlahnya menjadi dua. Maka ◇ menjadi dua belah ketupat hitam ◆◆. ◇◇ hanya menggandakan, ◆ hanya mengubah warna.', 'easy'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut (dibaca dari kiri ke kanan): ■●▲ : ▲●■ = ◆○△ : …', '◆○△', '△○◆', '○△◆', '△◆○', '▲●■', 0, 5, 0, 0, 0, 'Urutan unsur dibalik: unsur pertama dan terakhir bertukar tempat, unsur tengah tetap. Jadi ◆○△ menjadi △○◆. Pilihan ○△◆ adalah hasil menggeser urutan, bukan membalik.', 'easy'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ↑■ : →□ = ↓□ : …', '←■', '→■', '←□', '↑■', '→□', 5, 0, 0, 0, 0, 'Ada dua aturan. (1) Panah diputar 90° searah jarum jam: ↑ menjadi →, sehingga ↓ menjadi ←. (2) Warna persegi dibalik: ■ menjadi □, sehingga □ menjadi ■. Jawabannya ←■. Pilihan ←□ hanya menerapkan aturan panah.', 'medium'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ■■■□ : ■■□□ = ●●●●○ : …', '●●●○', '●●○○○', '●●●●○○', '○●●●●', '●●●○○', 0, 0, 0, 0, 5, 'Jumlah unsur tetap, tetapi satu unsur hitam berubah menjadi putih (hitam berkurang satu, putih bertambah satu). Dari ●●●●○ (4 hitam, 1 putih) diperoleh ●●●○○ (3 hitam, 2 putih). Pilihan ●●●○ mengurangi jumlah unsur, bukan mengubah warnanya.', 'medium'),
  ('tiu-analogi-gambar', 'Dua pasangan berikut mengikuti aturan yang sama: ┌ menjadi ┐, dan └ menjadi ┘. Dengan aturan yang sama, ├ menjadi …', '┬', '├', '┤', '┴', '┼', 0, 0, 5, 0, 0, 'Pasangan pertama saja bisa dibaca sebagai putaran 90° searah jarum jam atau pencerminan kiri-kanan. Pasangan kedua memastikan aturannya: jika diputar 90°, └ akan menjadi ┌, bukan ┘. Jadi aturannya pencerminan kiri-kanan, dan ├ (kaki ke kanan) menjadi ┤ (kaki ke kiri). Pilihan ┬ adalah hasil putaran 90°.', 'hard'),
  ('tiu-analogi-gambar', 'Perhatikan analogi gambar berikut: ●○○● : ○●●○ = ■■□■ : …', '□□■□', '■□■■', '■■□■', '□■□□', '□■■□', 5, 0, 0, 0, 0, 'Setiap unsur berganti warna pada posisinya masing-masing: hitam menjadi putih dan putih menjadi hitam (●○○● → ○●●○). Maka ■■□■ menjadi □□■□. Pilihan ■□■■ adalah urutan yang dibalik, bukan warna yang dibalik.', 'medium'),
  ('tiu-ketidaksamaan', 'Perhatikan kelompok gambar berikut: ▲▲▲, ■■■, ●●●, ◆◆, ★★★. Manakah yang berbeda dari yang lain?', '▲▲▲', '■■■', '◆◆', '●●●', '★★★', 0, 0, 5, 0, 0, 'Setiap kelompok berisi bangun yang sama, tetapi empat kelompok berisi tiga bangun, sedangkan ◆◆ hanya berisi dua.', 'easy'),
  ('tiu-ketidaksamaan', 'Perhatikan simbol berikut: ┬, ┴, ├, ┤, ┼. Manakah simbol yang berbeda dari yang lain?', '┬', '┴', '├', '┼', '┤', 0, 0, 0, 5, 0, '┬, ┴, ├, dan ┤ masing-masing memiliki tiga cabang dan merupakan putaran satu sama lain. ┼ memiliki empat cabang.', 'easy'),
  ('tiu-ketidaksamaan', 'Perhatikan pasangan panah berikut: (↑ ↓), (← →), (↗ ↙), (↖ ↘), (↗ ↘). Manakah pasangan yang berbeda dari yang lain?', '↗ ↘', '↑ ↓', '← →', '↗ ↙', '↖ ↘', 5, 0, 0, 0, 0, 'Pada empat pasangan, panah kedua menunjuk arah yang tepat berlawanan dengan panah pertama (diputar 180°). Pada (↗ ↘), panah kedua hanya diputar 90°.', 'medium'),
  ('tiu-ketidaksamaan', 'Perhatikan kelompok gambar berikut: ●●○, ■■■■□□, ▲▲▲▲▲▲△△△, ◆◆◆◇◇, ★★★★★★☆☆☆. Manakah yang berbeda dari yang lain?', '●●○', '■■■■□□', '▲▲▲▲▲▲△△△', '★★★★★★☆☆☆', '◆◆◆◇◇', 0, 0, 0, 0, 5, 'Hitung perbandingan hitam dan putih: ●●○ = 2 : 1, ■■■■□□ = 4 : 2, ▲ = 6 : 3, ★ = 6 : 3 — semuanya 2 : 1. ◆◆◆◇◇ berbanding 3 : 2. Jumlah bangun pun berbeda sendiri (5, bukan kelipatan 3).', 'hard'),
  ('tiu-ketidaksamaan', 'Perhatikan pasangan simbol berikut: (┌ ┐), (└ ┘), (├ ┤), (┘ └), (┌ ┘). Manakah pasangan yang berbeda dari yang lain?', '┌ ┐', '┌ ┘', '└ ┘', '├ ┤', '┘ └', 0, 5, 0, 0, 0, 'Pada empat pasangan, simbol kedua adalah bayangan cermin kiri-kanan dari simbol pertama. Pada (┌ ┘), simbol kedua diperoleh dengan putaran 180°; jika dicerminkan kiri-kanan, ┌ seharusnya menjadi ┐.', 'medium'),
  ('tiu-ketidaksamaan', 'Perhatikan kelompok panah berikut: (↑ ↗ →), (→ ↘ ↓), (↓ ↙ ←), (← ↖ ↑), (↑ ↖ ←). Manakah kelompok yang berbeda dari yang lain?', '↑ ↗ →', '→ ↘ ↓', '↑ ↖ ←', '↓ ↙ ←', '← ↖ ↑', 0, 0, 5, 0, 0, 'Pada empat kelompok, panah berputar 45° searah jarum jam pada setiap langkah. Pada (↑ ↖ ←), panah berputar 45° berlawanan arah jarum jam.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ●○○○○, ●●○○○, ●●●○○, …', '●●●○○', '●●●●●', '●●●●○', '○●●●●', '●●●○○○', 0, 0, 5, 0, 0, 'Setiap langkah, satu bulatan putih dari kiri berubah menjadi hitam, sedangkan jumlah bulatan tetap lima. Setelah ●●●○○ berikutnya ●●●●○.', 'easy'),
  ('tiu-serial-gambar', 'Perhatikan pola berikut: ┌, ┐, ┘, └, ┌, ┐, … Jika pola berlanjut, simbol ke-23 adalah …', '┌', '┐', '└', '├', '┘', 0, 0, 0, 0, 5, 'Simbol diputar 90° searah jarum jam setiap langkah, sehingga pola berulang setiap 4 suku (┌, ┐, ┘, └). 23 = 5 × 4 + 3, jadi suku ke-23 sama dengan suku ke-3, yaitu ┘.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ▲, ▲▲, ▼▼▼, ▼▼▼▼, ▲▲▲▲▲, …', '▼▼▼▼▼▼', '▲▲▲▲▲', '▲▲▲▲▲▲▲', '▲▲▲▲▲▲', '▼▼▼▼▼', 0, 0, 0, 5, 0, 'Jumlah segitiga bertambah satu setiap langkah (1, 2, 3, 4, 5, 6), sedangkan arahnya berganti setiap dua suku: ▲ ▲, ▼ ▼, ▲ ▲. Suku keenam masih berpasangan dengan suku kelima, sehingga berisi enam ▲.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ■□□□□, □□■□□, □□□□■, □■□□□, …', '■□□□□', '□□□■□', '□□■□□', '□■□□□', '□□□□■', 0, 5, 0, 0, 0, 'Persegi hitam melompat dua kotak ke kanan setiap langkah; jika melewati ujung kanan, hitungan berlanjut dari kiri. Posisinya 1, 3, 5, lalu 5 + 2 → kotak 2, sehingga berikutnya kotak 4: □□□■□.', 'medium'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ■, ■, ■■, ■■■, ■■■■■, …', '■■■■■■■■', '■■■■■■', '■■■■■■■', '■■■■■■■■■', '■■■■■■■■■■', 5, 0, 0, 0, 0, 'Banyak persegi: 1, 1, 2, 3, 5. Setiap suku adalah jumlah dua suku sebelumnya (pola Fibonacci), sehingga berikutnya 3 + 5 = 8 persegi. Jawaban 7 persegi muncul jika dianggap selisihnya bertambah satu.', 'hard'),
  ('tiu-serial-gambar', 'Tentukan gambar berikutnya: ◇, ◇◆, ◇◆◇, ◇◆◇◆, …', '◇◆◇◆◆', '◇◆◇◆◇', '◆◇◆◇◆', '◇◆◇◆◇◆', '◇◇◆◇◆', 0, 5, 0, 0, 0, 'Setiap langkah ditambahkan satu belah ketupat di sebelah kanan dengan warna berselang-seling putih dan hitam. Setelah ◇◆◇◆ (diakhiri hitam), tambahan berikutnya putih: ◇◆◇◆◇.', 'easy')
) as v(sub, stem, a, b, c, d, e, pa, pb, pc, pd, pe, expl, diff)
join public.subtopics s on s.slug = v.sub
where not exists (select 1 from public.questions q2 where q2.stem = v.stem);

commit;
