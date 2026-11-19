import { Logo } from "@/components/ui";

export default function SuspendedPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md flex-col items-center justify-center px-6 text-center">
      <Logo />
      <h1 className="mt-8 text-2xl font-bold">Akun ditangguhkan</h1>
      <p className="mt-2 text-slate-600">
        Akun Anda ditangguhkan karena terindikasi melanggar ketentuan (misalnya berbagi akun). Hubungi tim dukungan
        SiapASN untuk peninjauan.
      </p>
      <form action="/auth/keluar" method="post" className="mt-6">
        <button className="text-sm font-semibold text-brand-700 underline">Keluar</button>
      </form>
    </main>
  );
}
