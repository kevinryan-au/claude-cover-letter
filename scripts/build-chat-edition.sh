#!/usr/bin/env bash
# Regenerates cover-letter-assistant.md — the single-file "Chat Edition" —
# from SKILL.md + templates/profile_template.md.
#
# There is ONE source of truth: SKILL.md. The chat file is generated, never
# hand-edited. Re-run this whenever SKILL.md changes so the chat version stays
# in sync:
#     scripts/build-chat-edition.sh
set -euo pipefail
cd "$(dirname "$0")/.."
OUT="cover-letter-assistant.md"

{
cat <<'HEADER'
# Cover Letter — Chat Edition

> **You (Claude) are reading a self-contained cover-letter assistant.** Everything
> needed is in this one file: the method (below) and the user's personal profile
> (at the very bottom, under **YOUR PROFILE**). Follow the method, using the
> profile as the user's data.

## Running in chat — read first; these notes OVERRIDE anything below

You are in a normal Claude chat: **no terminal, no file system, no Python.** The
method below was written for Claude Code and references things that do not apply
here. Adapt as follows:

- **Profile.** Ignore every mention of `~/cover-letter-profile.md`, `assets/`, or
  reading files from disk. The user's profile is the **YOUR PROFILE** section at
  the bottom of *this* file. Read it from there.
- **First run.** If that section still has `[BRACKETED]` placeholders, run the
  one-time setup: ask the user to paste their CV, interview them as the method
  describes, then hand them a filled-in profile to paste back in.
- **Output.** Ignore all instructions about `python-docx`, `.docx`, `scripts/`,
  and visual QA — you cannot produce a Word file here. Deliver the finished letter
  as **clean, formatted text in the chat** that the user can paste into Word or
  Google Docs.
- **Saving / learning.** You cannot write to disk, so nothing saves automatically.
  When the profile would improve (a phrasing fix, a sharper skill line, a new
  worked example), **do not lose it** — at the end, print a **"📋 Update your
  profile"** block: the exact lines to paste back into the YOUR PROFILE section,
  so the user keeps it current by hand.
- **Each chat starts fresh.** You only know what is in this file. Keeping it
  updated is what makes future letters better — the Claude Code version does this
  automatically (https://github.com/kevinryan-au/claude-cover-letter).

## For the user

1. Make sure the **YOUR PROFILE** section at the bottom is filled in. First time?
   Just paste your CV and I will build it with you (~5 min).
2. Paste the job ad.
3. I will walk the outline with you, then hand you the finished letter to copy out.
4. If I suggest profile updates at the end, paste them back into this file so next
   time is sharper.

---

# THE METHOD
HEADER

echo
# Embed SKILL.md without its YAML frontmatter (Claude Code metadata, irrelevant here)
sed '1,/^---$/d' SKILL.md

cat <<'PROFILEMARK'

---

# ===== YOUR PROFILE =====

_Your personal data — the only part that is about you. Fill it in once (first run:
paste your CV and I will build it with you). Keep it updated and every letter gets
sharper._

PROFILEMARK

cat templates/profile_template.md
} > "$OUT"

echo "Wrote $OUT ($(wc -l < "$OUT" | tr -d ' ') lines)"
