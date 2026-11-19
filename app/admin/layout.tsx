import Link from "next/link";
import { Suspense } from "react";
import type { Metadata } from "next";
import { Logo, PageSkeleton } from "@/components/ui";
import { AdminNav } from "@/components/admin/admin-nav";
import { requireStaff } from "@/lib/auth";
import { ROLE_LABEL } from "@/lib/types";

export const metadata: Metadata = { title: { default: "Admin", template: "%s · Admin SiapASN" }, robots: { index: false } };
export const instant = false;

async function Shell({ children }: { children: React.ReactNode }) {
  const user = await requireStaff();
  return (
    <div className="flex min-h-screen">
      <aside className="sticky top-0 hidden h-screen w-60 shrink-0 flex-col overflow-y-auto bg-slate-900 p-4 md:flex">
        <Link href="/admin" className="mb-6 px-2">
          <Logo light />
        </Link>
        <AdminNav role={user.profile.role} />
        <div className="mt-auto space-y-1 px-3 pt-6 text-xs text-slate-400">
          <p className="truncate font-semibold text-slate-200">{user.profile.full_name ?? user.email}</p>
          <p>{ROLE_LABEL[user.profile.role]}</p>
          <Link href="/dashboard" className="block pt-2 hover:text-white">
            ← Aplikasi peserta
          </Link>
        </div>
      </aside>
      <div className="min-w-0 flex-1">
        <header className="flex items-center justify-between border-b border-slate-200 bg-white px-4 py-3 md:hidden">
          <Logo />
          <details className="relative">
            <summary className="cursor-pointer list-none text-sm font-semibold">Menu</summary>
            <div className="absolute right-0 z-40 mt-2 w-60 rounded-xl bg-slate-900 p-3 shadow-xl">
              <AdminNav role={user.profile.role} />
            </div>
          </details>
        </header>
        <main className="mx-auto max-w-7xl px-4 py-6 sm:px-6">{children}</main>
      </div>
    </div>
  );
}

export default function AdminLayout({ children }: LayoutProps<"/admin">) {
  return (
    <Suspense
      fallback={
        <div className="p-10">
          <PageSkeleton />
        </div>
      }
    >
      <Shell>{children}</Shell>
    </Suspense>
  );
}
