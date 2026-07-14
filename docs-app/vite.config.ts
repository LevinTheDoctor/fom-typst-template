import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

// base "./" + Hash-Routing: funktioniert lokal, auf Cloudflare Workers und in
// jedem Unterverzeichnis ohne weitere Konfiguration.
export default defineConfig({
  base: "./",
  plugins: [react(), tailwindcss()],
});
