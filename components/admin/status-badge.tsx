import { Badge } from "@/components/ui";
import { STATUS_LABEL, type ContentStatus } from "@/lib/types";

export function StatusBadge({ status }: { status: ContentStatus }) {
  const tone = status === "published" ? "green" : status === "in_review" ? "amber" : status === "archived" ? "slate" : "brand";
  return <Badge tone={tone}>{STATUS_LABEL[status]}</Badge>;
}
