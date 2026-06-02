#!/usr/bin/env bash
# visual_qa.sh — Render a generated .docx to JPEG for visual comparison against a reference.
#
# Usage:
#   ./visual_qa.sh <new.docx> [reference.docx]
#
# If a reference is provided, both are converted and the JPEG paths are printed
# for side-by-side visual comparison. If no reference is given, the most recent
# .docx in $REF_DIR is used (defaults to the current directory).
#
# Requires: soffice (LibreOffice) and pdftoppm (poppler).

set -euo pipefail

# Folder to search for a reference doc when none is passed. Override by exporting
# REF_DIR, e.g.  REF_DIR=~/Documents/applications ./visual_qa.sh new.docx
REF_DIR="${REF_DIR:-.}"

NEW="${1:-}"
REF="${2:-}"

if [[ -z "$NEW" ]]; then
  echo "Usage: $0 <new.docx> [reference.docx]" >&2
  exit 1
fi

if [[ ! -f "$NEW" ]]; then
  echo "File not found: $NEW" >&2
  exit 1
fi

if [[ -z "$REF" ]]; then
  REF=$(ls -t "$REF_DIR"/*.docx 2>/dev/null | head -1 || true)
  if [[ -n "$REF" ]]; then
    echo "Using most recent reference: $REF"
  fi
fi

WORK=$(mktemp -d)
echo "Working dir: $WORK"

render() {
  local docx="$1"
  local label="$2"
  local base
  base=$(basename "$docx" .docx)
  echo "Rendering $label: $docx"
  soffice --headless --convert-to pdf --outdir "$WORK" "$docx" >/dev/null
  pdftoppm -jpeg -r 100 "$WORK/$base.pdf" "$WORK/${label}_page"
  ls "$WORK"/${label}_page*.jpg
}

echo "---"
render "$NEW" "new"

if [[ -n "$REF" && -f "$REF" ]]; then
  echo "---"
  render "$REF" "ref"
  echo "---"
  echo "Visual compare ready. Open the JPEGs above and compare side-by-side."
else
  echo "---"
  echo "No reference provided — JPEGs of the new doc are above for inspection."
fi
