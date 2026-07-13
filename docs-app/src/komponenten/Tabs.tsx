import { useState, type ReactNode } from "react";

interface Tab {
  titel: string;
  inhalt: ReactNode;
}

/** Umschaltbare Reiter, z. B. für Windows / macOS / Linux. */
export default function Tabs({ tabs }: { tabs: Tab[] }) {
  const [aktiv, setAktiv] = useState(0);

  return (
    <div className="my-5">
      <div role="tablist" className="flex gap-1 border-b border-blattgrau">
        {tabs.map((tab, i) => (
          <button
            key={tab.titel}
            role="tab"
            aria-selected={i === aktiv}
            onClick={() => setAktiv(i)}
            className={`-mb-px rounded-t-md border border-b-0 px-4 py-2 text-sm font-medium transition-colors ${
              i === aktiv
                ? "border-blattgrau bg-white text-petrol-dunkel"
                : "border-transparent text-marginalie hover:text-tinte"
            }`}
          >
            {tab.titel}
          </button>
        ))}
      </div>
      <div className="rounded-b-md border border-t-0 border-blattgrau bg-white px-4 pt-1 pb-2">
        {tabs[aktiv].inhalt}
      </div>
    </div>
  );
}
