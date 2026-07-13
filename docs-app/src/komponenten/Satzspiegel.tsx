/**
 * Signatur-Element der Dokumentation: eine DIN-A4-Miniatur mit den echten
 * Proportionen des FOM-Satzspiegels (Ränder oben 4 cm, unten 2 cm,
 * links 4 cm, rechts 2 cm). Der Leitfaden, als Bild gesetzt.
 */
export default function Satzspiegel() {
  // A4: 21,0 × 29,7 cm -> Faktor 10 px pro cm
  const f = 10;
  return (
    <figure aria-hidden className="relative mx-auto w-fit select-none">
      <div
        className="relative rounded-sm border border-blattgrau bg-white shadow-[0_20px_50px_-24px_rgba(28,43,42,0.45)]"
        style={{ width: 21 * f, height: 29.7 * f }}
      >
        {/* Satzspiegel */}
        <div
          className="absolute border border-dashed border-petrol/60 bg-petrol-hauch/50"
          style={{ top: 4 * f, bottom: 2 * f, left: 4 * f, right: 2 * f }}
        >
          {/* angedeutete Zeilen, 1,5-zeilig */}
          <div className="flex h-full flex-col gap-[7px] overflow-hidden p-2 pt-3">
            {Array.from({ length: 14 }).map((_, i) => (
              <div
                key={i}
                className="h-[3px] rounded-full bg-tinte/15"
                style={{ width: `${i % 7 === 6 ? 62 : 88 + (i % 3) * 4}%` }}
              />
            ))}
            <div className="mt-auto border-t border-tinte/20 pt-[5px]">
              <div className="h-[2px] w-2/5 rounded-full bg-tinte/10" />
            </div>
          </div>
        </div>
        {/* Seitenzahl in der Kopfzeile */}
        <div className="absolute top-[13px] left-1/2 -translate-x-1/2 font-mono text-[8px] text-marginalie">
          1
        </div>
        {/* Maßangaben */}
        <span className="absolute top-[6px] right-[70px] font-mono text-[9px] text-petrol-dunkel">
          4 cm
        </span>
        <span className="absolute bottom-[4px] right-[70px] font-mono text-[9px] text-petrol-dunkel">
          2 cm
        </span>
        <span className="absolute top-[140px] left-[5px] font-mono text-[9px] text-petrol-dunkel">
          4 cm
        </span>
        <span className="absolute top-[140px] right-[1px] font-mono text-[9px] text-petrol-dunkel">
          2 cm
        </span>
      </div>
      <figcaption className="mt-3 text-center font-mono text-xs text-marginalie">
        DIN A4 · Times New Roman 12 pt · 1,5-zeilig
      </figcaption>
    </figure>
  );
}
