import Link from "next/link";
import { Logo } from "@/components/ui";

export function SiteFooter() {
  return (
    <footer className="bg-slate-950 text-slate-400">
      <div className="mx-auto grid max-w-6xl gap-10 px-4 py-14 sm:px-6 md:grid-cols-4">
        <div className="md:col-span-2">
          <Logo light />
          <p className="mt-4 max-w-sm text-sm">
            Platform persiapan SKD CPNS & Sekolah Kedinasan: materi terstruktur, latihan soal, dan try-out CAT dengan penilaian
            persis seperti ujian asli.
          </p>
          <p className="mt-4 text-xs text-slate-500">
            SiapASN adalah platform belajar independen dan tidak berafiliasi dengan BKN maupun KemenPANRB.
          </p>
        </div>
        <div>
          <p className="text-sm font-semibold text-white">Produk</p>
          <ul className="mt-3 space-y-2 text-sm">
            <li><Link href="/#fitur" className="hover:text-white">Fitur</Link></li>
            <li><Link href="/#harga" className="hover:text-white">Harga paket</Link></li>
            <li><Link href="/daftar" className="hover:text-white">Try-out gratis</Link></li>
          </ul>
        </div>
        <div>
          <p className="text-sm font-semibold text-white">Bantuan</p>
          <ul className="mt-3 space-y-2 text-sm">
            <li><Link href="/#faq" className="hover:text-white">FAQ</Link></li>
            <li><Link href="/privasi" className="hover:text-white">Kebijakan privasi</Link></li>
            <li><Link href="/syarat" className="hover:text-white">Syarat & ketentuan</Link></li>
          </ul>
        </div>
      </div>
      <div className="border-t border-slate-800 py-6 text-center text-xs">© 2026 SiapASN. Semua hak dilindungi.</div>
    </footer>
  );
}
