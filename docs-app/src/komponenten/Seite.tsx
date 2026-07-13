import type { ReactNode } from "react";

interface SeiteProps {
  /** Verweis auf den zugehörigen Abschnitt im FOM-Leitfaden, z. B. "Leitfaden 2.6" */
  leitfaden?: string;
  titel: string;
  einleitung?: ReactNode;
  children: ReactNode;
}

/** Seitengerüst: Eyebrow mit Leitfaden-Verweis, Serifen-Titel, Inhalt. */
export default function Seite({ leitfaden, titel, einleitung, children }: SeiteProps) {
  return (
    <article className="mx-auto max-w-[72ch] px-6 py-10 lg:px-10">
      {leitfaden && (
        <p className="mb-2 font-mono text-xs tracking-widest text-petrol-dunkel uppercase">
          {leitfaden}
        </p>
      )}
      <h1 className="font-display text-4xl font-bold tracking-tight text-tinte">{titel}</h1>
      {einleitung && <p className="mt-4 text-lg leading-relaxed text-marginalie">{einleitung}</p>}
      <div
        className="mt-8 text-[15.5px] leading-relaxed
          [&_h2]:font-display [&_h2]:mt-12 [&_h2]:mb-3 [&_h2]:border-b [&_h2]:border-blattgrau [&_h2]:pb-2 [&_h2]:text-2xl [&_h2]:font-semibold
          [&_h3]:mt-8 [&_h3]:mb-2 [&_h3]:text-lg [&_h3]:font-semibold
          [&_p]:my-3
          [&_ul]:my-3 [&_ul]:list-disc [&_ul]:pl-6 [&_ul>li]:my-1.5
          [&_ol]:my-3 [&_ol]:list-decimal [&_ol]:pl-6 [&_ol>li]:my-1.5
          [&_a]:font-medium [&_a]:text-petrol-dunkel [&_a]:underline [&_a]:decoration-petrol/40 [&_a]:underline-offset-2 hover:[&_a]:decoration-petrol
          [&_table]:my-5 [&_table]:w-full [&_table]:border-collapse [&_table]:text-sm
          [&_th]:border [&_th]:border-blattgrau [&_th]:bg-petrol-hauch [&_th]:px-3 [&_th]:py-2 [&_th]:text-left
          [&_td]:border [&_td]:border-blattgrau [&_td]:px-3 [&_td]:py-2 [&_td]:align-top
          [&_code:not(pre_code)]:rounded [&_code:not(pre_code)]:bg-blattgrau/60 [&_code:not(pre_code)]:px-1.5 [&_code:not(pre_code)]:py-0.5 [&_code:not(pre_code)]:font-mono [&_code:not(pre_code)]:text-[13px]"
      >
        {children}
      </div>
    </article>
  );
}
