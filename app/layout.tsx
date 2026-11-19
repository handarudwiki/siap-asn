import type { Metadata, Viewport } from "next";
import { Plus_Jakarta_Sans } from "next/font/google";
import "katex/dist/katex.min.css";
import "./globals.css";

const jakarta = Plus_Jakarta_Sans({
  variable: "--font-jakarta",
  subsets: ["latin"],
});

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
    <html lang="id" className={`${jakarta.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col font-sans">{children}</body>
    </html>
  );
}
