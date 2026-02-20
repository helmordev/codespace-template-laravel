import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import tailwindcss from "@tailwindcss/vite";

const codespace = process.env.CODESPACE_NAME;
const codespaceDomain = process.env.GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN;

export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
        tailwindcss(),
    ],
    server: codespace
        ? {
              hmr: {
                  host: `${codespace}-5173.${codespaceDomain}`,
                  protocol: "wss",
                  clientPort: 443,
              },
          }
        : {},
});
