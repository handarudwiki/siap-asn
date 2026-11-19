import type { Metadata, Viewport } from "next";
import "katex/dist/katex.min.css";
import "./globals.css";

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000";

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: "SiapASN – Persiapan SKD CPNS & Sekolah Kedinasan",
    template: "%s · SiapASN",
  },
  description:
    "Belajar materi TWK, TIU, TKP, latihan soal dengan pembahasan, dan try-out CAT yang dinilai persis seperti SKD asli. Mulai gratis.",
  applicationName: "SiapASN",
  manifest: "/manifest.webmanifest",
  openGraph: {
    title: "SiapASN – Lolos SKD dengan persiapan terarah",
    description: "Materi terstruktur, latihan soal, dan try-out CAT dengan ranking nasional.",
    type: "website",
    locale: "id_ID",
    siteName: "SiapASN",
  },
};

export const viewport: Viewport = {
  themeColor: "#2244ed",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="id" className="h-full antialiased">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="" />
        {/* eslint-disable-next-line @next/next/no-page-custom-font */}
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
      </head>
      <body className="min-h-full flex flex-col font-sans">{children}</body>
    </html>
  );
}
