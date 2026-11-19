const WIB = "Asia/Jakarta";

export function rupiah(n: number) {
  return new Intl.NumberFormat("id-ID", { style: "currency", currency: "IDR", maximumFractionDigits: 0 }).format(n);
}

export function dateWIB(d: string | Date | null | undefined, withTime = false) {
  if (!d) return "-";
  return new Intl.DateTimeFormat("id-ID", {
    timeZone: WIB,
    day: "numeric",
    month: "short",
    year: "numeric",
    ...(withTime ? { hour: "2-digit", minute: "2-digit" } : {}),
  }).format(new Date(d)) + (withTime ? " WIB" : "");
}

export function duration(ms: number) {
  const total = Math.max(0, Math.floor(ms / 1000));
  const h = Math.floor(total / 3600);
  const m = Math.floor((total % 3600) / 60);
  const s = total % 60;
  const pad = (x: number) => String(x).padStart(2, "0");
  return h > 0 ? `${h}:${pad(m)}:${pad(s)}` : `${pad(m)}:${pad(s)}`;
}

export function daysUntil(date: string | null | undefined) {
  if (!date) return null;
  const diff = new Date(date + "T00:00:00+07:00").getTime() - Date.now();
  return Math.ceil(diff / 86400000);
}

/** Map RPC exception codes to Indonesian messages. */
export function errorMessage(err: { message?: string } | null | undefined) {
  const msg = err?.message ?? "";
  const map: Record<string, string> = {
    AUTH_REQUIRED: "Silakan masuk terlebih dahulu.",
    FREE_LIMIT_REACHED: "Kuota 50 soal latihan gratis sudah habis. Upgrade paket untuk latihan tanpa batas.",
    PACKAGE_REQUIRED: "Try-out ini memerlukan paket aktif.",
    OUTSIDE_WINDOW: "Try-out terjadwal ini hanya bisa dimulai di dalam jendela waktunya.",
    ATTEMPT_LIMIT_REACHED: "Batas jumlah percobaan untuk try-out ini sudah tercapai.",
    TRYOUT_NOT_FOUND: "Try-out tidak ditemukan.",
    TRYOUT_EMPTY: "Try-out belum memiliki soal.",
    ACCOUNT_SUSPENDED: "Akun Anda ditangguhkan. Hubungi admin.",
    TIME_UP: "Waktu habis. Jawaban Anda telah dikumpulkan otomatis.",
    ALREADY_SUBMITTED: "Try-out sudah dikumpulkan.",
    VOUCHER_INVALID: "Kode voucher tidak valid atau sudah habis.",
    PACKAGE_NOT_FOUND: "Paket tidak ditemukan.",
    FORBIDDEN: "Anda tidak memiliki akses untuk tindakan ini.",
  };
  for (const [code, text] of Object.entries(map)) if (msg.includes(code)) return text;
  return msg || "Terjadi kesalahan. Coba lagi.";
}

export function slugify(s: string) {
  return s
    .toLowerCase()
    .normalize("NFKD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "")
    .slice(0, 80);
}
