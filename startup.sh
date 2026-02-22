#!/usr/bin/env bash
set -euo pipefail

SCLANG="/Applications/SuperCollider.app/Contents/MacOS/sclang"
BOOT_FILE="$(cd "$(dirname "$0")" && pwd)/superdirt_startup.scd"

if [[ ! -x "$SCLANG" ]]; then
  echo "Error: sclang not found at $SCLANG"
  echo "Install SuperCollider from https://supercollider.github.io"
  exit 1
fi

if [[ ! -f "$BOOT_FILE" ]]; then
  echo "Error: boot file not found at $BOOT_FILE"
  exit 1
fi

echo "Starting SuperCollider + SuperDirt..."
echo "  sclang:    $SCLANG"
echo "  boot file: $BOOT_FILE"
echo ""
echo "Waiting for 'SuperDirt: ready' in the output below."
echo "Once ready, open says.tidal in your editor and start playing."
echo "Press Ctrl-C to stop."
echo "----------------------------------------"

exec "$SCLANG" "$BOOT_FILE"
