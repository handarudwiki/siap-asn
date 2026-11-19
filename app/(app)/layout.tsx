import Link from "next/link";
import { Suspense } from "react";
import { Logo, PageSkeleton } from "@/components/ui";
import { BottomNav, SideNav } from "@/components/app/nav";
import { isStaffRole, requireUser } from "@/lib/auth";

export const instant = false;

async function Shell({ children }: { children: React.ReactNode }) {
  const user = await requireUser({ allowUnonboarded: true });
  const name = user.profile.full_name ?? user.email ?? "Peserta";
  return (
    <div className="flex min-h-screen" style={{ ["--font-scale" as string]: user.profile.font_scale }}>
      <aside className="sticky top-0 hidden h-screen w-64 shrink-0 flex-col border-r border-slate-200 bg-white p-4 lg:flex">
        <Link href="/dashboard" className="mb-8 px-2">
          <Logo />
        </Link>
        <SideNav isStaff={isStaffRole(user.profile.role)} />
        <div className="mt-auto rounded-xl bg-slate-50 p-3">
          <p className="truncate text-sm font-semibold">{name}</p>
          <p className="truncate text-xs text-slate-500">{user.email}</p>
          <form action="/auth/keluar" method="post">
            <button className="mt-2 text-xs font-semibold text-red-600 hover:underline">Keluar</button>
          </form>
        </div>
      </aside>
      <div className="flex min-w-0 flex-1 flex-col">
        <header className="sticky top-0 z-20 flex items-center justify-between border-b border-slate-200 bg-white/90 px-4 py-3 backdrop-blur lg:hidden">
          <Link href="/dashboard">
            <Logo />
          </Link>
          <Link href="/profil" className="grid h-9 w-9 place-items-center rounded-full bg-brand-100 text-sm font-bold text-brand-700" aria-label="Profil">
            {name.slice(0, 1).toUpperCase()}
          </Link>
        </header>
        <main className="mx-auto w-full max-w-6xl flex-1 px-4 pb-24 pt-6 sm:px-6 lg:pb-10">{children}</main>
      </div>
      <BottomNav />
    </div>
  );
}

export default function AppLayout({ children }: LayoutProps<"/">) {
  return (
    <Suspense
      fallback={
        <div className="mx-auto w-full max-w-6xl px-6 py-10">
          <PageSkeleton />
        </div>
      }
    >
      <Shell>{children}</Shell>
    </Suspense>
  );
}
