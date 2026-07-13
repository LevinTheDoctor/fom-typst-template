import { useState, type ReactNode } from "react";

/** Sehr schlanke Hervorhebung: Kommentare, Strings und Typst-Funktionen. */
function hervorheben(code: string): ReactNode[] {
  const zeilen = code.split("\n");
  return zeilen.map((zeile, i) => {
    const teile: ReactNode[] = [];
    // Kommentarzeilen (//, #, %) komplett dämpfen – aber Typst-Funktionsaufrufe
    // wie "#vgl(...)" nicht als Kommentar behandeln.
    const kommentar = zeile.match(/^(\s*)(\/\/.*|%.*|# .*)$/);
    if (kommentar) {
      teile.push(kommentar[1]);
      teile.push(
        <span key="k" className="text-[#7d9693]">
          {kommentar[2]}
        </span>,
      );
    } else {
      // Typst-/Shell-Aufrufe und Strings einfärben
      const muster = /(#[a-zA-Z-]+|"[^"]*"|<[a-z0-9-]+>|@[a-z0-9-]+)/g;
      let rest = zeile;
      let m: RegExpExecArray | null;
      let pos = 0;
      while ((m = muster.exec(zeile)) !== null) {
        teile.push(zeile.slice(pos, m.index));
        const t = m[0];
        teile.push(
          <span
            key={m.index}
            className={
              t.startsWith('"')
                ? "text-[#a3d9c9]"
                : t.startsWith("#")
                  ? "text-[#5fd3c7]"
                  : "text-[#e0c88f]"
            }
          >
            {t}
          </span>,
        );
        pos = m.index + t.length;
      }
      teile.push(rest.slice(pos));
    }
    return (
      <span key={i}>
        {teile}
        {i < zeilen.length - 1 ? "\n" : ""}
      </span>
    );
  });
}

interface CodeBlockProps {
  code: string;
  /** Dateiname oder Kontext, z. B. "main.typ" oder "Terminal" */
  datei?: string;
}

export default function CodeBlock({ code, datei }: CodeBlockProps) {
  const [kopiert, setKopiert] = useState(false);

  async function kopieren() {
    try {
      await navigator.clipboard.writeText(code);
      setKopiert(true);
      setTimeout(() => setKopiert(false), 2000);
    } catch {
      // Zwischenablage nicht verfügbar (z. B. unsicherer Kontext) – still bleiben
    }
  }

  return (
    <div className="group relative my-5 overflow-hidden rounded-lg border border-tinte-hell bg-tinte text-[13px] leading-relaxed">
      {datei && (
        <div className="flex items-center justify-between border-b border-tinte-hell px-4 py-2">
          <span className="font-mono text-xs text-[#8fa5a2]">{datei}</span>
        </div>
      )}
      <button
        type="button"
        onClick={kopieren}
        className="absolute top-2 right-2 rounded-md border border-tinte-hell bg-tinte-hell/80 px-2.5 py-1 font-sans text-xs text-[#c2d1cf] opacity-0 transition-opacity duration-150 group-hover:opacity-100 focus-visible:opacity-100 hover:text-white"
        aria-label="Code kopieren"
      >
        {kopiert ? "Kopiert ✓" : "Kopieren"}
      </button>
      <pre className="overflow-x-auto p-4 text-[#e8efee]">
        <code className="font-mono">{hervorheben(code)}</code>
      </pre>
    </div>
  );
}
