import { Suspense } from "react";
import { redirect } from "next/navigation";
import type { Metadata } from "next";
import { Card, Logo, Skeleton } from "@/components/ui";
import { OnboardingForm } from "@/components/app/onboarding-form";
import { requireUser } from "@/lib/auth";

export const metadata: Metadata = { title: "Kenalan dulu" };

async function Content() {
  const user = await requireUser({ allowUnonboarded: true });
  if (user.profile.onboarded) redirect("/dashboard");
  return <OnboardingForm defaultName={user.profile.full_name ?? ""} />;
}

export default function OnboardingPage() {
  return (
    <main className="mx-auto w-full max-w-xl px-4 py-10">
      <Logo />
      <h1 className="mt-8 text-2xl font-bold">Kenalan dulu, yuk!</h1>
      <p className="mt-1 text-sm text-slate-600">Jawaban Anda membantu kami menyusun target skor dan jalur belajar yang tepat.</p>
      <Card className="mt-6">
        <Suspense fallback={<Skeleton className="h-96" />}>
          <Content />
        </Suspense>
      </Card>
    </main>
  );
}
