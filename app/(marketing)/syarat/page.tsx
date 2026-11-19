import type { Metadata } from "next";

export const metadata: Metadata = { title: "Syarat & Ketentuan" };

export default function TermsPage() {
  return (
    <article className="prose-siap mx-auto max-w-3xl px-4 py-16 sm:px-6">
      <h1 className="text-3xl font-extrabold">Syarat & Ketentuan</h1>
      <p className="text-sm text-slate-500">Draf – akan ditinjau tim legal sebelum peluncuran publik.</p>
      <h2>Akun</h2>
      <ul>
        <li>Satu akun untuk satu orang. Akun dapat aktif di maksimal 2 perangkat secara bersamaan.</li>
        <li>Berbagi akun atau paket dapat mengakibatkan penangguhan akun.</li>
      </ul>
      <h2>Paket & pembayaran</h2>
      <ul>
        <li>Akses paket aktif otomatis setelah pembayaran berhasil dan berakhir pukul 23:59 WIB pada tanggal kedaluwarsa.</li>
        <li>Riwayat dan hasil try-out tetap dapat dilihat setelah paket berakhir.</li>
      </ul>
      <h2>Try-out</h2>
      <ul>
        <li>Waktu try-out dihitung di server sejak try-out dibuka dan tidak dapat dijeda.</li>
        <li>Ranking hanya menghitung percobaan pertama setiap peserta.</li>
        <li>Menyalin, merekam, atau menyebarkan soal dilarang.</li>
      </ul>
      <h2>Konten</h2>
      <p>Seluruh materi dan soal adalah milik SiapASN dan disusun secara orisinal. SiapASN tidak berafiliasi dengan BKN maupun KemenPANRB.</p>
    </article>
  );
}
