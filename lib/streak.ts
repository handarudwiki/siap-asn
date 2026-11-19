/** Consecutive WIB calendar days (ending today or yesterday) with any study activity. */
export function studyStreak(activity: (string | Date)[], now: number = Date.now()) {
  const fmt = (d: string | Date | number) => new Date(d).toLocaleDateString("en-CA", { timeZone: "Asia/Jakarta" });
  const days = new Set(activity.map(fmt));
  let streak = 0;
  for (let i = 0; i <= 366; i++) {
    if (days.has(fmt(now - i * 86400000))) streak++;
    else if (i > 0) break;
  }
  return streak;
}
