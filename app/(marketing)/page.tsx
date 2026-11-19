import Link from "next/link";
import type { Metadata } from "next";
import { cacheLife } from "next/cache";
import { Badge, buttonClass, cn } from "@/components/ui";
import { createPublicClient } from "@/lib/supabase/public";
import { rupiah } from "@/lib/format";
import type { Package } from "@/lib/types";

export const metadata: Metadata = {
  title: { absolute: "SiapASN – Persiapan SKD CPNS & Sekolah Kedinasan dengan Try-out CAT" },
  description:
    "Belajar TWK, TIU, TKP secara terstruktur, latihan soal dengan pembahasan, dan try-out CAT 110 soal / 100 menit dengan ranking nasional. Mulai gratis.",
  alternates: { canonical: "/" },
};

async function getPackages() {
  "use cache";
  cacheLife("hours");
  try {
    const { data } = await createPublicClient().from("packages").select("*").eq("is_active", true).order("sort_order");
    return (data ?? []) as Package[];
  } catch {
    return [];
  }
}

const FEATURES = [
  {
    title: "Materi terstruktur",
    body: "Silabus TWK, TIU, TKP dari nol: Tes → Topik → Sub-topik, lengkap dengan rumus, tabel, video, dan PDF.",
    icon: "M4 4h7a3 3 0 0 1 3 3v13a2 2 0 0 0-2-2H4zM20 4h-5a3 3 0 0 0-3 3v13a2 2 0 0 1 2-2h6z",
  },
  {
    title: "Latihan + pembahasan instan",
    body: "Jawab, langsung tahu benar/salah (TKP: poin 1–5) beserta pembahasan. Simpan soal sulit untuk diulang.",
    icon: "M4 20h4L19 9l-4-4L4 16zM14 6l4 4",
  },
  {
    title: "Try-out CAT persis SKD",
    body: "110 soal, 100 menit, navigator soal, tandai ragu-ragu, timer server, autosave, dan auto-submit.",
    icon: "M12 7v5l3 2M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18z",
  },
  {
    title: "Ranking nasional",
    body: "Bandingkan skor dengan peserta lain per try-out dan per jenis formasi, lengkap dengan persentil.",
    icon: "M8 21V11M16 21V3M12 21v-6M4 21h16",
  },
  {
    title: "Analitik titik lemah",
    body: "Akurasi dan waktu per sub-topik, tren skor, dan drill otomatis dari sub-topik dengan akurasi terendah.",
    icon: "M3 3v18h18M7 15l4-4 3 3 5-6",
  },
  {
    title: "Ramah formasi afirmasi",
    body: "Passing grade cumlaude, disabilitas, Papua, dsb. dihitung otomatis — plus mode waktu tambahan & ukuran huruf.",
    icon: "M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6z",
  },
];

const TESTS = [
  { code: "TWK", name: "Tes Wawasan Kebangsaan", q: 30, scoring: "Benar 5, salah/kosong 0", max: 150, pg: 65, topics: "Nasionalisme, integritas, bela negara, pilar negara, bahasa Indonesia" },
  { code: "TIU", name: "Tes Intelegensia Umum", q: 35, scoring: "Benar 5, salah/kosong 0", max: 175, pg: 80, topics: "Verbal, numerik, figural" },
  { code: "TKP", name: "Tes Karakteristik Pribadi", q: 45, scoring: "Setiap opsi 1–5, kosong 0", max: 225, pg: 166, topics: "Pelayanan publik, jejaring kerja, sosial budaya, TIK, profesionalisme, anti radikalisme" },
];

const PERSONAS = [
  { who: "Fresh graduate", need: "Mulai dari nol dengan silabus lengkap dan banyak try-out untuk tahu posisi di ranking." },
  { who: "Pekerja yang mengulang", need: "Waktu terbatas? Drill harian langsung ke sub-topik yang bikin nilai TIU tertahan." },
  { who: "Calon taruna kedinasan", need: "Jalur belajar terarah dengan penjelasan sederhana — format SKD-nya sama." },
  { who: "Pelamar formasi afirmasi", need: "Passing grade sesuai formasi Anda, bukan hanya formasi umum." },
];

const FAQ = [
  {
    q: "Apakah penilaiannya sama dengan SKD asli?",
    a: "Ya. TWK dan TIU bernilai 5 untuk jawaban benar dan 0 untuk salah/kosong, TKP bernilai 1–5 per opsi. Kelulusan dicek terhadap ketiga ambang batas (atau aturan kumulatif untuk formasi afirmasi) sesuai profil passing grade Anda.",
  },
  {
    q: "Apa saja yang gratis?",
    a: "Materi pembuka di setiap tes, 50 soal latihan dengan pembahasan, dan try-out gratis lengkap dengan hasil skor.",
  },
  {
    q: "Bagaimana jika koneksi saya terputus saat try-out?",
    a: "Setiap jawaban tersimpan otomatis di server. Buka kembali try-out dan lanjutkan — timer tetap berjalan di server sehingga tidak ada waktu yang hilang maupun bertambah.",
  },
  {
    q: "Metode pembayaran apa yang tersedia?",
    a: "QRIS, virtual account bank, dan e-wallet melalui payment gateway Indonesia. Akses paket aktif otomatis setelah pembayaran berhasil.",
  },
  {
    q: "Apakah soalnya bocoran soal resmi?",
    a: "Tidak. Seluruh soal disusun dan direview oleh tim konten kami mengikuti kisi-kisi SKD. Kami tidak menggunakan soal bocoran atau menyalin dari platform lain.",
  },
  {
    q: "Berapa lama akses paket berlaku?",
    a: "Sesuai paket (misalnya 3 atau 6 bulan) dan berakhir pukul 23:59 WIB pada tanggal kedaluwarsa. Riwayat dan hasil try-out tetap bisa dilihat setelahnya.",
  },
];

function Ico({ d, className }: { d: string; className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={cn("h-6 w-6", className)} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" aria-hidden>
      <path d={d} />
    </svg>
  );
}

function CatMock() {
  return (
    <div className="relative rounded-2xl border border-white/20 bg-white p-4 text-slate-900 shadow-2xl shadow-brand-950/40 sm:p-6">
      <div className="flex items-center justify-between border-b border-slate-100 pb-3">
        <div>
          <p className="text-xs font-semibold text-slate-500">Try-out Nasional #3</p>
          <p className="text-sm font-bold">Soal 42 · TIU – Deret Angka</p>
        </div>
        <span className="rounded-lg bg-red-50 px-3 py-1 font-mono text-sm font-bold text-red-600">01:12:45</span>
      </div>
      <p className="mt-4 text-sm font-medium">Tentukan bilangan berikutnya: 2, 6, 18, 54, …</p>
      <div className="mt-3 space-y-2 text-sm">
        {["108", "162", "148", "216", "72"].map((o, i) => (
          <div key={o} className={cn("flex items-center gap-3 rounded-lg border px-3 py-2", i === 1 ? "border-brand-500 bg-brand-50" : "border-slate-200")}>
            <span className={cn("grid h-6 w-6 place-items-center rounded-full text-xs font-bold", i === 1 ? "bg-brand-600 text-white" : "bg-slate-100")}>
              {"ABCDE"[i]}
            </span>
            {o}
          </div>
        ))}
      </div>
      <div className="mt-4 grid grid-cols-10 gap-1">
        {Array.from({ length: 30 }, (_, i) => (
          <span
            key={i}
            className={cn(
              "grid h-6 place-items-center rounded text-[10px] font-semibold",
              i === 11 ? "bg-amber-400 text-slate-900" : i < 22 ? "bg-emerald-500 text-white" : i === 22 ? "bg-brand-600 text-white ring-2 ring-brand-300" : "bg-slate-100 text-slate-500",
            )}
          >
            {i + 20}
          </span>
        ))}
      </div>
      <div className="absolute -bottom-6 -left-6 hidden rounded-xl bg-white p-4 shadow-xl sm:block">
        <p className="text-xs text-slate-500">Skor sementara</p>
        <p className="text-2xl font-extrabold text-emerald-600">412<span className="text-sm text-slate-400">/550</span></p>
      </div>
    </div>
  );
}

async function Pricing() {
  const packages = await getPackages();
  const free = {
    name: "Gratis",
    price: 0,
    description: "Coba dulu tanpa biaya.",
    features: ["Materi pembuka tiap tes", "50 soal latihan + pembahasan", "1 try-out gratis", "Skor & status kelulusan"],
    highlight: false,
    duration: "Selamanya",
  };
  const items = [
    free,
    ...packages.map((p) => ({
      name: p.name,
      price: p.price,
      description: p.description ?? "",
      features: p.features,
      highlight: p.highlight,
      duration: p.duration_days ? `${Math.round(p.duration_days / 30)} bulan` : "Hingga ujian",
    })),
  ];
  return (
    <div className="mt-12 grid gap-6 md:grid-cols-2 lg:grid-cols-4">
      {items.map((p) => (
        <div
          key={p.name}
          className={cn(
            "relative flex flex-col rounded-2xl border bg-white p-6",
            p.highlight ? "border-brand-500 shadow-xl shadow-brand-600/10 ring-2 ring-brand-500" : "border-slate-200",
          )}
        >
          {p.highlight && <Badge tone="brand" className="absolute -top-3 left-6">Paling lengkap</Badge>}
          <p className="font-bold">{p.name}</p>
          <p className="mt-1 min-h-10 text-sm text-slate-500">{p.description}</p>
          <p className="mt-4 text-3xl font-extrabold">{p.price === 0 ? "Rp0" : rupiah(p.price)}</p>
          <p className="text-xs text-slate-500">{p.duration}</p>
          <ul className="mt-6 flex-1 space-y-2 text-sm">
            {p.features.map((f) => (
              <li key={f} className="flex gap-2">
                <Ico d="M5 12l4 4L19 6" className="h-5 w-5 shrink-0 text-emerald-500" />
                {f}
              </li>
            ))}
          </ul>
          <Link href="/daftar" className={buttonClass(p.highlight ? "primary" : "secondary", "md", "mt-6 w-full")}>
            {p.price === 0 ? "Daftar gratis" : "Pilih paket"}
          </Link>
        </div>
      ))}
    </div>
  );
}

export default function LandingPage() {
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: FAQ.map((f) => ({ "@type": "Question", name: f.q, acceptedAnswer: { "@type": "Answer", text: f.a } })),
  };

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd).replace(/</g, "\\u003c") }} />

      {/* Hero */}
      <section className="relative overflow-hidden bg-brand-800 text-white">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_15%_20%,#3863f8_0,transparent_45%),radial-gradient(circle_at_90%_70%,#161c52_0,transparent_50%)]" />
        <div className="relative mx-auto grid max-w-6xl items-center gap-12 px-4 py-16 sm:px-6 md:py-24 lg:grid-cols-2">
          <div>
            <span className="inline-flex rounded-full bg-white/15 px-3 py-1 text-xs font-semibold text-white ring-1 ring-white/25">
              CPNS & Sekolah Kedinasan · Format SKD terbaru
            </span>
            <h1 className="mt-5 text-4xl font-extrabold leading-tight tracking-tight sm:text-5xl">
              Lolos SKD dengan persiapan yang <span className="text-accent-400">terukur</span>.
            </h1>
            <p className="mt-5 max-w-xl text-lg text-brand-100">
              Materi TWK, TIU, TKP yang terstruktur, latihan soal dengan pembahasan, dan try-out CAT 110 soal / 100 menit yang
              dinilai persis seperti ujian asli — lengkap dengan ranking nasional.
            </p>
            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <Link href="/daftar" className={buttonClass("accent", "lg")}>
                Mulai try-out gratis
              </Link>
              <Link href="/#harga" className={buttonClass("ghost", "lg", "text-white hover:bg-white/10")}>
                Lihat paket
              </Link>
            </div>
            <p className="mt-4 text-sm text-brand-200">Tanpa kartu kredit · Daftar dengan Google dalam 10 detik</p>
          </div>
          <CatMock />
        </div>
      </section>

      {/* Problem strip */}
      <section className="border-b border-slate-200 bg-white">
        <div className="mx-auto grid max-w-6xl gap-6 px-4 py-10 sm:px-6 md:grid-cols-4">
          {[
            ["Materi tercecer?", "Satu silabus terstruktur per tes."],
            ["Latihan tidak realistis?", "Format & penilaian SKD asli."],
            ["Tidak tahu salahnya di mana?", "Analitik per sub-topik."],
            ["Soal ketinggalan zaman?", "Bank soal diperbarui tim konten."],
          ].map(([p, s]) => (
            <div key={p}>
              <p className="text-sm text-slate-500 line-through decoration-red-400">{p}</p>
              <p className="mt-1 font-semibold">{s}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Features */}
      <section id="fitur" className="scroll-mt-20 py-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <div className="max-w-2xl">
            <p className="text-sm font-bold uppercase tracking-wider text-brand-600">Semua dalam satu tempat</p>
            <h2 className="mt-2 text-3xl font-extrabold tracking-tight">Belajar, latihan, simulasi, lalu tahu apa yang harus dipelajari berikutnya.</h2>
          </div>
          <div className="mt-12 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {FEATURES.map((f) => (
              <div key={f.title} className="rounded-2xl border border-slate-200 bg-white p-6">
                <span className="grid h-11 w-11 place-items-center rounded-xl bg-brand-50 text-brand-600">
                  <Ico d={f.icon} />
                </span>
                <p className="mt-4 font-bold">{f.title}</p>
                <p className="mt-2 text-sm text-slate-600">{f.body}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* SKD format */}
      <section id="format" className="scroll-mt-20 bg-white py-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <div className="max-w-2xl">
            <p className="text-sm font-bold uppercase tracking-wider text-brand-600">Format SKD</p>
            <h2 className="mt-2 text-3xl font-extrabold tracking-tight">110 soal, 100 menit, 3 ambang batas.</h2>
            <p className="mt-3 text-slate-600">
              Engine try-out kami mereproduksi format ini persis. Passing grade disimpan sebagai profil yang bisa diperbarui setiap
              tahun regulasi — bukan angka mati.
            </p>
          </div>
          <div className="mt-10 overflow-x-auto rounded-2xl border border-slate-200">
            <table className="w-full min-w-[640px] text-left text-sm">
              <thead className="bg-slate-50 text-slate-600">
                <tr>
                  <th className="px-5 py-3 font-semibold">Tes</th>
                  <th className="px-5 py-3 font-semibold">Soal</th>
                  <th className="px-5 py-3 font-semibold">Penilaian</th>
                  <th className="px-5 py-3 font-semibold">Maks</th>
                  <th className="px-5 py-3 font-semibold">Passing grade*</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {TESTS.map((t) => (
                  <tr key={t.code}>
                    <td className="px-5 py-4">
                      <p className="font-bold">{t.code}</p>
                      <p className="text-xs text-slate-500">{t.name}</p>
                      <p className="mt-1 text-xs text-slate-400">{t.topics}</p>
                    </td>
                    <td className="px-5 py-4 font-semibold">{t.q}</td>
                    <td className="px-5 py-4">{t.scoring}</td>
                    <td className="px-5 py-4 font-semibold">{t.max}</td>
                    <td className="px-5 py-4 font-semibold text-brand-700">{t.pg}</td>
                  </tr>
                ))}
                <tr className="bg-slate-50 font-bold">
                  <td className="px-5 py-4">Total</td>
                  <td className="px-5 py-4">110</td>
                  <td className="px-5 py-4 font-normal text-slate-500">Semua ambang batas harus terpenuhi</td>
                  <td className="px-5 py-4">550</td>
                  <td className="px-5 py-4" />
                </tr>
              </tbody>
            </table>
          </div>
          <p className="mt-3 text-xs text-slate-500">
            *Formasi umum. Formasi afirmasi (cumlaude/diaspora, disabilitas, Papua, dll.) memakai aturan berbeda dan sudah didukung.
            Nilai mengikuti KepmenPANRB terbaru.
          </p>
        </div>
      </section>

      {/* How it works */}
      <section className="py-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <h2 className="text-center text-3xl font-extrabold tracking-tight">Cara kerja SiapASN</h2>
          <ol className="mt-12 grid gap-6 md:grid-cols-4">
            {[
              ["Daftar & atur target", "Pilih CPNS atau kedinasan, jenis formasi, dan tanggal ujian."],
              ["Ukur posisi awal", "Kerjakan try-out gratis untuk mengetahui skor dasar Anda."],
              ["Belajar yang perlu", "Ikuti materi & drill sub-topik dengan akurasi terendah."],
              ["Simulasi rutin", "Try-out berkala, pantau tren skor dan ranking nasional."],
            ].map(([t, d], i) => (
              <li key={t} className="rounded-2xl border border-slate-200 bg-white p-6">
                <span className="grid h-9 w-9 place-items-center rounded-full bg-brand-600 text-sm font-bold text-white">{i + 1}</span>
                <p className="mt-4 font-bold">{t}</p>
                <p className="mt-1 text-sm text-slate-600">{d}</p>
              </li>
            ))}
          </ol>
        </div>
      </section>

      {/* Personas */}
      <section className="bg-white py-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <h2 className="text-3xl font-extrabold tracking-tight">Dibuat untuk perjalanan Anda</h2>
          <div className="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {PERSONAS.map((p) => (
              <div key={p.who} className="rounded-2xl bg-slate-50 p-6">
                <p className="font-bold text-brand-800">{p.who}</p>
                <p className="mt-2 text-sm text-slate-600">{p.need}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Pricing */}
      <section id="harga" className="scroll-mt-20 py-20">
        <div className="mx-auto max-w-6xl px-4 sm:px-6">
          <div className="mx-auto max-w-2xl text-center">
            <p className="text-sm font-bold uppercase tracking-wider text-brand-600">Harga</p>
            <h2 className="mt-2 text-3xl font-extrabold tracking-tight">Mulai gratis, upgrade saat siap.</h2>
            <p className="mt-3 text-slate-600">Bayar sekali via QRIS, virtual account, atau e-wallet. Tanpa langganan otomatis.</p>
          </div>
          <Pricing />
        </div>
      </section>

      {/* FAQ */}
      <section id="faq" className="scroll-mt-20 bg-white py-20">
        <div className="mx-auto max-w-3xl px-4 sm:px-6">
          <h2 className="text-center text-3xl font-extrabold tracking-tight">Pertanyaan yang sering diajukan</h2>
          <div className="mt-10 divide-y divide-slate-200 rounded-2xl border border-slate-200">
            {FAQ.map((f) => (
              <details key={f.q} className="group p-5">
                <summary className="flex cursor-pointer list-none items-center justify-between font-semibold">
                  {f.q}
                  <span className="ml-4 text-brand-600 transition group-open:rotate-45">+</span>
                </summary>
                <p className="mt-3 text-sm text-slate-600">{f.a}</p>
              </details>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20">
        <div className="mx-auto max-w-5xl px-4 sm:px-6">
          <div className="rounded-3xl bg-brand-700 px-6 py-14 text-center text-white sm:px-12">
            <h2 className="text-3xl font-extrabold tracking-tight">Ukur kesiapan Anda hari ini.</h2>
            <p className="mx-auto mt-3 max-w-xl text-brand-100">
              Kerjakan try-out gratis dan dapatkan skor TWK, TIU, TKP beserta status kelulusan dalam hitungan detik.
            </p>
            <Link href="/daftar" className={buttonClass("accent", "lg", "mt-8")}>
              Daftar gratis sekarang
            </Link>
          </div>
        </div>
      </section>
    </>
  );
}
