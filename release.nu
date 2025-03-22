#!/usr/bin/env nu

echo "Building project"
^bun run build

# 2. Crea lo zip con PowerShell
echo "Creating ZIP file"
^powershell Compress-Archive -Path dist,'src/locales','src/fxmanifest.lua','src/config.json' -DestinationPath release.zip -Force

echo "Process completed"
