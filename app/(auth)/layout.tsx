import Link from "next/link";
import { Logo } from "@/components/ui";

export default function AuthLayout({ children }: LayoutProps<"/">) {
  return (
    <div className="grid min-h-screen lg:grid-cols-2">
      <div className="flex flex-col px-6 py-8 sm:px-12">
        <Link href="/" aria-label="Beranda SiapASN">
          <Logo />
        </Link>
        <div className="mx-auto flex w-full max-w-sm flex-1 flex-col justify-center py-10">{children}</div>
      </div>
      <div className="relative hidden overflow-hidden bg-brand-700 lg:block">
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_30%_20%,#5d8bfd_0,transparent_50%),radial-gradient(circle_at_80%_80%,#1d2c88_0,transparent_45%)]" />
        <div className="relative flex h-full flex-col justify-end p-12 text-white">
          <p className="text-3xl font-bold leading-snug">Latihan seperti hari ujian. Tahu persis sub-topik mana yang harus dikejar.</p>
          <p className="mt-4 text-brand-100">Materi terstruktur · Latihan dengan pembahasan · Try-out CAT dengan ranking nasional</p>
          <div className="mt-10 grid grid-cols-3 gap-4 text-center">
            {[
              ["110", "soal / try-out"],
              ["100", "menit CAT"],
              ["550", "skor maksimal"],
            ].map(([n, l]) => (
              <div key={l} className="rounded-xl bg-white/10 p-4">
                <p className="text-2xl font-extrabold">{n}</p>
                <p className="text-xs text-brand-100">{l}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
