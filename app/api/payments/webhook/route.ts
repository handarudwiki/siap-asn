import { NextResponse, type NextRequest } from "next/server";
import { applyPaymentStatus, verifyMidtransSignature, type MidtransNotification } from "@/lib/payments";

/** Midtrans HTTP notification endpoint (FR-A33). Configure in the Midtrans dashboard. */
export async function POST(request: NextRequest) {
  let body: MidtransNotification;
  try {
    body = (await request.json()) as MidtransNotification;
  } catch {
    return NextResponse.json({ error: "invalid json" }, { status: 400 });
  }
  if (!verifyMidtransSignature(body)) return NextResponse.json({ error: "invalid signature" }, { status: 401 });

  const s = body.transaction_status;
  const status =
    (s === "capture" && (body.fraud_status ?? "accept") === "accept") || s === "settlement"
      ? "paid"
      : s === "pending"
        ? "pending"
        : s === "expire"
          ? "expired"
          : "failed";
  const res = await applyPaymentStatus(body.order_id, status, body.payment_type, body);
  return NextResponse.json(res, { status: res.ok ? 200 : 404 });
}
