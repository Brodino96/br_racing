import { defineConfig } from "rolldown"

export default defineConfig([
    {
        input: "src/client/index.ts",
        output: {
            file: "dist/client.js",
            target: "esnext", // FiveM should use es2017
        }
    },
    {
        input: "src/server/index.ts",
        platform: "node",
        output: {
            file: "dist/server.js",
            target: "esnext",
            format: "cjs",
        }
    }
])