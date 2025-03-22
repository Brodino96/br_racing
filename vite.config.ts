import { defineConfig } from "vite"
import { resolve } from "path"

export default defineConfig({
    root: "src/ui",
    build: {
        outDir: resolve(__dirname, "dist/ui"),
        rollupOptions: {
            input: {
                app: resolve(__dirname, "src/ui/index.html")
            }
        }
    }
})