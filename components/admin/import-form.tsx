"use client";

import { useActionState } from "react";
import { Alert, Button } from "@/components/ui";
import { importQuestions } from "@/app/admin/soal/impor/actions";

export function ImportForm() {
  const [state, action, pending] = useActionState(importQuestions, undefined);
  return (
    <div className="space-y-4">
      <form action={action} className="space-y-4">
        <input type="file" name="file" accept=".csv,text/csv" required className="block w-full text-sm file:mr-4 file:rounded-lg file:border-0 file:bg-brand-50 file:px-4 file:py-2 file:font-semibold file:text-brand-700" />
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" name="review" defaultChecked /> Langsung ajukan review (status “Dalam review”)
        </label>
        <Button disabled={pending}>{pending ? "Mengimpor…" : "Impor"}</Button>
      </form>
      {state && "fatal" in state && <Alert>{state.fatal}</Alert>}
      {state && "inserted" in state && (
        <>
          <Alert tone={state.errors.length ? "amber" : "green"}>
            {state.inserted} soal berhasil diimpor. {state.errors.length} baris gagal{state.duplicates ? ` (${state.duplicates} duplikat)` : ""}.
          </Alert>
          {state.errors.length > 0 && (
            <div className="max-h-80 overflow-y-auto rounded-xl border border-slate-200">
              <table className="w-full text-sm">
                <thead className="sticky top-0 bg-slate-50 text-left text-xs text-slate-500">
                  <tr>
                    <th className="px-3 py-2">Baris</th>
                    <th>Masalah</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {state.errors.map((e, i) => (
                    <tr key={i}>
                      <td className="px-3 py-1.5 font-mono">{e.row || "–"}</td>
                      <td>{e.message}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </>
      )}
    </div>
  );
}
