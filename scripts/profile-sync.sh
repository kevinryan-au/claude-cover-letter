#!/usr/bin/env bash
# profile-sync.sh — durability for your cover-letter profile.
#
#   B  · timestamped local snapshots  (~/.cover-letter/backups/)
#   A1 · local git history            (~/.cover-letter/, commit per change)
#   A2 · optional push to YOUR OWN private remote, if one is configured
#
# Safe to run anytime; the skill runs it automatically after writing your profile.
# It never touches the public skill repo — only your private ~/.cover-letter data home.
#
# Usage: scripts/profile-sync.sh [path-to-profile]   (default: ~/cover-letter-profile.md)
set -euo pipefail

PROFILE="${1:-$HOME/cover-letter-profile.md}"
DATA_HOME="$HOME/.cover-letter"
BACKUPS="$DATA_HOME/backups"
KEEP=10

# Nothing to protect yet (e.g. before first-run setup).
if [ ! -f "$PROFILE" ]; then
  echo "profile-sync: no profile at $PROFILE yet — nothing to do."
  exit 0
fi

# Refuse to snapshot a clearly broken/empty profile (don't poison the history).
if [ ! -s "$PROFILE" ] || ! grep -q "## About you" "$PROFILE"; then
  echo "profile-sync: $PROFILE looks empty or malformed — skipping to protect good history."
  exit 0
fi

mkdir -p "$BACKUPS"
TS="$(date +%Y%m%d-%H%M%S)"

# --- B: snapshot, keep the most recent $KEEP ---
cp "$PROFILE" "$BACKUPS/cover-letter-profile.$TS.md"
ls -1t "$BACKUPS"/cover-letter-profile.*.md 2>/dev/null | tail -n +$((KEEP + 1)) | xargs -r rm -f

# --- A1: local git history ---
if [ ! -d "$DATA_HOME/.git" ]; then
  git -C "$DATA_HOME" init -q -b main 2>/dev/null || git -C "$DATA_HOME" init -q
  printf '%s\n' "backups/" > "$DATA_HOME/.gitignore"
fi
cp "$PROFILE" "$DATA_HOME/cover-letter-profile.md"
git -C "$DATA_HOME" add -A
if git -C "$DATA_HOME" diff --cached --quiet; then
  echo "profile-sync: no changes since last sync."
  exit 0
fi
git -C "$DATA_HOME" -c user.name="cover-letter" -c user.email="cover-letter@local" \
    commit -q -m "profile update $TS"
echo "profile-sync: snapshot + committed ($TS)."

# --- A2: push only if YOU configured a private remote ---
if git -C "$DATA_HOME" remote | grep -q .; then
  if git -C "$DATA_HOME" push -q 2>/dev/null; then
    echo "profile-sync: pushed to your private remote."
  else
    echo "profile-sync: remote set but push needs a one-time upstream — run:"
    echo "    git -C ~/.cover-letter push -u origin main"
  fi
fi
