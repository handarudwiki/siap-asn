import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import { cn } from "@/components/ui";

/** Renders lesson / question markdown (GFM tables + LaTeX). Raw HTML is not rendered. */
export function Markdown({ children, className }: { children: string; className?: string }) {
  return (
    <div className={cn("prose-siap", className)}>
      <ReactMarkdown remarkPlugins={[remarkGfm, remarkMath]} rehypePlugins={[rehypeKatex]}>
        {children}
      </ReactMarkdown>
    </div>
  );
}
