import type { ReactNode } from "react";

interface CalloutProps {
  /** "hinweis" (petrol) oder "achtung" (amber) */
  art?: "hinweis" | "achtung";
  titel?: string;
  children: ReactNode;
}

/** Hervorgehobener Kasten – angelehnt an die "Zusatzinformation"-Kästen
 *  des FOM-Leitfadens. */
export default function Callout({ art = "hinweis", titel, children }: CalloutProps) {
  const istAchtung = art === "achtung";
  return (
    <aside
      className={`my-5 rounded-md border-l-4 px-4 py-3 text-[15px] ${
        istAchtung
          ? "border-amber-500 bg-amber-50 text-amber-950"
          : "border-petrol bg-petrol-hauch text-tinte"
      }`}
    >
      {titel && <p className="mb-1 font-semibold">{titel}</p>}
      <div className="[&>p]:my-1 [&_code]:rounded [&_code]:bg-black/5 [&_code]:px-1 [&_code]:py-0.5 [&_code]:font-mono [&_code]:text-[13px]">
        {children}
      </div>
    </aside>
  );
}
