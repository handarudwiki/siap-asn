"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/components/ui";
import type { Role } from "@/lib/types";

type Item = { href: string; label: string; min: Role };
const GROUPS: { title: string; items: Item[] }[] = [
  { title: "Ringkasan", items: [{ href: "/admin", label: "Overview", min: "editor" }] },
  {
    title: "Konten",
    items: [
      { href: "/admin/taksonomi", label: "Taksonomi", min: "editor" },
      { href: "/admin/materi", label: "Materi", min: "editor" },
      { href: "/admin/soal", label: "Bank soal", min: "editor" },
      { href: "/admin/soal/impor", label: "Impor soal", min: "editor" },
      { href: "/admin/laporan-soal", label: "Laporan soal", min: "editor" },
    ],
  },
  {
    title: "Operasional",
    items: [
      { href: "/admin/tryout", label: "Try-out", min: "admin" },
      { href: "/admin/paket", label: "Paket & voucher", min: "admin" },
      { href: "/admin/transaksi", label: "Transaksi", min: "admin" },
      { href: "/admin/pengguna", label: "Pengguna", min: "admin" },
      { href: "/admin/pengumuman", label: "Pengumuman", min: "admin" },
      { href: "/admin/laporan", label: "Laporan", min: "admin" },
    ],
  },
  {
    title: "Sistem",
    items: [
      { href: "/admin/passing-grade", label: "Passing grade", min: "super_admin" },
      { href: "/admin/audit", label: "Audit log", min: "super_admin" },
    ],
  },
];

const RANK: Record<Role, number> = { learner: 0, editor: 1, reviewer: 2, admin: 3, super_admin: 4 };

export function AdminNav({ role }: { role: Role }) {
  const path = usePathname();
  return (
    <nav className="space-y-5 text-sm" aria-label="Navigasi admin">
      {GROUPS.map((g) => {
        const items = g.items.filter((i) => RANK[role] >= RANK[i.min]);
        if (!items.length) return null;
        return (
          <div key={g.title}>
            <p className="mb-1 px-3 text-[11px] font-bold uppercase tracking-wider text-slate-400">{g.title}</p>
            {items.map((i) => {
              const active = i.href === "/admin" ? path === "/admin" : path === i.href || (path.startsWith(i.href + "/") && !(i.href === "/admin/soal" && path.startsWith("/admin/soal/impor")));
              return (
                <Link
                  key={i.href}
                  href={i.href}
                  className={cn("block rounded-lg px-3 py-1.5", active ? "bg-slate-800 font-semibold text-white" : "text-slate-300 hover:bg-slate-800/60 hover:text-white")}
                >
                  {i.label}
                </Link>
              );
            })}
          </div>
        );
      })}
    </nav>
  );
}
