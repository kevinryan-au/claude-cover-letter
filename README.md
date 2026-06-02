# claude-cover-letter

A Claude skill that turns a pasted job ad into a tailored, one-page cover letter — as a `.docx` styled to match your CV.

## How it works

Paste a job ad → answer a couple of questions about why the role interests you → review the outline section by section → get the `.docx`.

The skill handles:
- Mapping the JD to your career anchors and substantiated claims
- Building the outline one section at a time (opener → experience bullets → skills framework)
- Producing a Word document styled to match your CV (font, colours, spacing)
- Phrasing passes, cross-document repetition checks, and a one-page fit check

Your personal data (CV, career anchors, skills voice, vocabulary, phrasing preferences) lives in a **profile file outside the skill** — so the skill itself stays clean, shareable, and read-only.

## Install

Copy the skill directory into your Claude skills folder:

```bash
cp -r claude-cover-letter ~/.claude/skills/cover-letter-tailoring
```

Then invoke it in Claude Code:

```
/cover-letter-tailoring
```

On first run it will guide you through a one-time setup (~5 minutes): read your CV, interview you for a few details, and write your profile file to `~/cover-letter-profile.md`. Every application after that is paste-and-go.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (CLI)
- Python 3 + `python-docx` (installed automatically if missing)
- Your CV in any common format: Word, PDF, plain text, or paste

## What's in the repo

```
SKILL.md                        — the skill instructions Claude follows
templates/profile_template.md   — your personal profile (filled at setup, lives at ~/cover-letter-profile.md)
references/
  tone_and_phrasing.md          — house style and phrasing-pass checklist
  styling.md                    — .docx build spec
  worked_examples.md            — application log format
scripts/visual_qa.sh            — optional preview render (requires LibreOffice + poppler)
assets/README.md                — where to put your CV for setup
```

## Profile file

All personal data lives in `~/cover-letter-profile.md` (or wherever you prefer) — never in this repo. It holds your career anchors, skills framework, substantiated claims, style tokens matched from your CV, and a log of phrasing preferences that grows over time.

See `templates/profile_template.md` for the format.
