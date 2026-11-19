import type { Metadata } from "next";

export const metadata: Metadata = { title: "Kebijakan Privasi" };

export default function PrivacyPage() {
  return (
    <article className="prose-siap mx-auto max-w-3xl px-4 py-16 sm:px-6">
      <h1 className="text-3xl font-extrabold">Kebijakan Privasi</h1>
      <p className="text-sm text-slate-500">Draf – akan ditinjau tim legal sebelum peluncuran publik.</p>
      <h2>Data yang kami kumpulkan</h2>
      <ul>
        <li>Data akun: nama, email, nomor WhatsApp (opsional).</li>
        <li>Data belajar: target ujian, jenis formasi, progres materi, jawaban latihan dan try-out.</li>
        <li>Data transaksi: paket yang dibeli dan status pembayaran (kami tidak menyimpan data kartu atau rekening).</li>
        <li>Data teknis: perangkat, log aktivitas try-out (misalnya perpindahan tab) untuk menjaga integritas ujian.</li>
      </ul>
      <h2>Tujuan penggunaan</h2>
      <p>Menyediakan layanan belajar, menghitung skor dan ranking, menyusun rekomendasi belajar, memproses pembayaran, dan mengirim notifikasi terkait layanan.</p>
      <h2>Hak Anda (UU No. 27 Tahun 2022 tentang Pelindungan Data Pribadi)</h2>
      <ul>
        <li>Mengakses dan mengekspor data pribadi Anda (menu Profil → Ekspor data).</li>
        <li>Memperbaiki data yang tidak akurat.</li>
        <li>Meminta penghapusan akun dan data pribadi.</li>
        <li>Menarik persetujuan pemrosesan data.</li>
      </ul>
      <h2>Penyimpanan & keamanan</h2>
      <p>Data disimpan terenkripsi saat transit (HTTPS), password di-hash, dan akses internal dibatasi berdasarkan peran serta tercatat di log audit. Cadangan basis data dibuat harian dengan retensi 30 hari.</p>
      <h2>Kontak</h2>
      <p>Untuk permintaan terkait data pribadi, hubungi tim dukungan melalui email resmi SiapASN.</p>
    </article>
  );
}
