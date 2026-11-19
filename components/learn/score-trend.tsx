type Point = { label: string; total: number; passed: boolean | null };

/** Lightweight SVG line chart of total score across try-outs (FR-L40). */
export function ScoreTrend({ points, max = 550 }: { points: Point[]; max?: number }) {
  if (points.length === 0) return null;
  const w = 640;
  const h = 200;
  const pad = { l: 36, r: 12, t: 12, b: 28 };
  const xs = (i: number) => pad.l + (points.length === 1 ? (w - pad.l - pad.r) / 2 : (i * (w - pad.l - pad.r)) / (points.length - 1));
  const ys = (v: number) => pad.t + (1 - v / max) * (h - pad.t - pad.b);
  const d = points.map((p, i) => `${i === 0 ? "M" : "L"}${xs(i).toFixed(1)},${ys(p.total).toFixed(1)}`).join(" ");
  const ticks = [0, 0.25, 0.5, 0.75, 1].map((t) => Math.round(t * max));
  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="h-auto w-full" role="img" aria-label="Tren skor total try-out">
      {ticks.map((t) => (
        <g key={t}>
          <line x1={pad.l} x2={w - pad.r} y1={ys(t)} y2={ys(t)} stroke="#e2e8f0" strokeDasharray={t === 0 ? "" : "3 3"} />
          <text x={pad.l - 6} y={ys(t) + 4} textAnchor="end" fontSize="10" fill="#64748b">
            {t}
          </text>
        </g>
      ))}
      <path d={d} fill="none" stroke="#2244ed" strokeWidth="2.5" strokeLinejoin="round" />
      {points.map((p, i) => (
        <g key={i}>
          <circle cx={xs(i)} cy={ys(p.total)} r="5" fill={p.passed ? "#10b981" : p.passed === false ? "#ef4444" : "#2244ed"} stroke="#fff" strokeWidth="2">
            <title>{`${p.label}: ${p.total}`}</title>
          </circle>
          <text x={xs(i)} y={h - 8} textAnchor="middle" fontSize="10" fill="#64748b">
            #{i + 1}
          </text>
        </g>
      ))}
    </svg>
  );
}
