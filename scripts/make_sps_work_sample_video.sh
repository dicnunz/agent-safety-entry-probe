#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VOICE="$ROOT/build/work_sample/sps_fellowship_work_sample_voiceover.aiff"
OUT="$ROOT/media/sps-fellowship-work-sample-2026-05-20.mp4"
FRAME="$ROOT/build/work_sample/sps_fellowship_work_sample_frame.png"
SLIDE="$ROOT/docs/sps_fellowship_work_sample_slide.html"
SCRIPT_TEXT="$ROOT/docs/sps_fellowship_work_sample_voiceover.txt"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p "$ROOT/build/work_sample" "$ROOT/media"

say -v Samantha -f "$SCRIPT_TEXT" -o "$VOICE"

"$CHROME" --headless=new --disable-gpu --hide-scrollbars --window-size=1920,1080 --screenshot="$FRAME" "file://$SLIDE"

ffmpeg -y \
  -loop 1 -i "$FRAME" \
  -i "$VOICE" \
  -c:v libx264 -tune stillimage -pix_fmt yuv420p -preset veryfast -crf 23 \
  -c:a aac -b:a 128k \
  -shortest "$OUT"

printf '%s\n' "$OUT"
