"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/components/ui";

const icons: Record<string, string> = {
  home: "M3 10.5 12 3l9 7.5V21h-6v-6H9v6H3z",
  book: "M4 4h7a3 3 0 0 1 3 3v13a2 2 0 0 0-2-2H4zM20 4h-5a3 3 0 0 0-3 3v13a2 2 0 0 1 2-2h6z",
  pencil: "M4 20h4L19 9l-4-4L4 16zM14 6l4 4",
  clock: "M12 7v5l3 2M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18z",
  tag: "M3 12V3h9l9 9-9 9zM7.5 7.5h.01",
  user: "M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM4 21a8 8 0 0 1 16 0",
  shield: "M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6z",
};

export function Icon({ name, className }: { name: keyof typeof icons | string; className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={cn("h-5 w-5", className)} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" aria-hidden>
      <path d={icons[name] ?? icons.home} />
    </svg>
  );
}

export const LEARNER_NAV = [
  { href: "/dashboard", label: "Beranda", icon: "home" },
  { href: "/materi", label: "Materi", icon: "book" },
  { href: "/latihan", label: "Latihan", icon: "pencil" },
  { href: "/tryout", label: "Try-out", icon: "clock" },
  { href: "/paket", label: "Paket", icon: "tag" },
];

export function SideNav({ isStaff }: { isStaff: boolean }) {
  const path = usePathname();
  const items = [...LEARNER_NAV, { href: "/profil", label: "Profil", icon: "user" }];
  return (
    <nav className="flex flex-col gap-1" aria-label="Navigasi utama">
      {items.map((it) => {
        const active = path === it.href || path.startsWith(it.href + "/");
        return (
          <Link
            key={it.href}
            href={it.href}
            className={cn(
              "flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium",
              active ? "bg-brand-50 text-brand-700" : "text-slate-600 hover:bg-slate-100 hover:text-slate-900",
            )}
            aria-current={active ? "page" : undefined}
          >
            <Icon name={it.icon} />
            {it.label}
          </Link>
        );
      })}
      {isStaff && (
        <Link href="/admin" className="mt-4 flex items-center gap-3 rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 hover:bg-slate-100">
          <Icon name="shield" />
          Dashboard Admin
        </Link>
      )}
    </nav>
  );
}

export function BottomNav() {
  const path = usePathname();
  return (
    <nav className="fixed inset-x-0 bottom-0 z-30 grid grid-cols-5 border-t border-slate-200 bg-white pb-[env(safe-area-inset-bottom)] lg:hidden" aria-label="Navigasi utama">
      {LEARNER_NAV.map((it) => {
        const active = path === it.href || path.startsWith(it.href + "/");
        return (
          <Link
            key={it.href}
            href={it.href}
            className={cn("flex flex-col items-center gap-0.5 py-2 text-[11px] font-medium", active ? "text-brand-700" : "text-slate-500")}
            aria-current={active ? "page" : undefined}
          >
            <Icon name={it.icon} />
            {it.label}
          </Link>
        );
      })}
    </nav>
  );
}
