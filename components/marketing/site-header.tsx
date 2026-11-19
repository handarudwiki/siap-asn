"use client";

import Link from "next/link";
import { useState } from "react";
import { Logo, buttonClass, cn } from "@/components/ui";

const links = [
  { href: "/#fitur", label: "Fitur" },
  { href: "/#format", label: "Format SKD" },
  { href: "/#harga", label: "Harga" },
  { href: "/#faq", label: "FAQ" },
];

export function SiteHeader() {
  const [open, setOpen] = useState(false);
  return (
    <header className="sticky top-0 z-40 border-b border-slate-200/70 bg-white/85 backdrop-blur">
      <div className="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
        <Link href="/" aria-label="SiapASN beranda">
          <Logo />
        </Link>
        <nav className="hidden items-center gap-8 text-sm font-medium text-slate-600 md:flex" aria-label="Navigasi situs">
          {links.map((l) => (
            <Link key={l.href} href={l.href} className="hover:text-slate-900">
              {l.label}
            </Link>
          ))}
        </nav>
        <div className="hidden items-center gap-2 md:flex">
          <Link href="/masuk" className={buttonClass("ghost")}>
            Masuk
          </Link>
          <Link href="/daftar" className={buttonClass("primary")}>
            Coba gratis
          </Link>
        </div>
        <button className="md:hidden" onClick={() => setOpen((o) => !o)} aria-expanded={open} aria-label="Buka menu">
          <svg viewBox="0 0 24 24" className="h-6 w-6" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
            {open ? <path d="M6 6l12 12M18 6L6 18" /> : <path d="M4 7h16M4 12h16M4 17h16" />}
          </svg>
        </button>
      </div>
      <div className={cn("border-t border-slate-200 bg-white px-4 py-4 md:hidden", !open && "hidden")}>
        <nav className="flex flex-col gap-3 text-sm font-medium">
          {links.map((l) => (
            <Link key={l.href} href={l.href} onClick={() => setOpen(false)}>
              {l.label}
            </Link>
          ))}
        </nav>
        <div className="mt-4 grid grid-cols-2 gap-2">
          <Link href="/masuk" className={buttonClass("secondary")}>
            Masuk
          </Link>
          <Link href="/daftar" className={buttonClass("primary")}>
            Coba gratis
          </Link>
        </div>
      </div>
    </header>
  );
}
