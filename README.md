# claude-cover-letter

A cover-letter assistant that **learns your voice and gets sharper with every role you apply for.** Runs in Claude chat, Claude Projects, or Claude Code.

It isn't a generator. The first time you use it, it reads your CV and interviews you to build a **profile** — your career anchors, your best evidence, your voice. Every letter is drawn from that, and every letter you write makes the profile a little sharper: the phrasings that landed, the framing that worked, the wins worth leading with.

## How it works

1. A one-time setup reads your CV and builds your profile (~5 min).
2. Paste a job ad.
3. It maps your background to the role and walks the outline with you — opener, three evidenced bullets, skills framework — one section at a time.
4. You approve; it hands you the finished letter.

Every letter answers the three questions a recruiter is really asking: why this company, what relevant experience you bring, and whether you have the right skills.

## Three ways to run it

Same assistant, three ways to run it — pick the one that matches where you already use Claude. The big difference between them is **how much it remembers**.

|                | Chat            | Projects          | Claude Code          |
|----------------|-----------------|-------------------|----------------------|
| **Cost**       | Free            | Paid              | Paid                 |
| **Setup**      | None            | Once per Project  | One install          |
| **Per use**    | Drag a file     | Zero              | One command          |
| **Output**     | Text            | Text              | `.docx`              |
| **Remembers you** | No           | Reads only        | **Learns & improves** |
| **On mobile**  | Yes             | Yes               | No                   |

### Claude chat — free, no install

Download [`cover-letter-assistant.md`](cover-letter-assistant.md), drag it into any Claude chat, and paste a job ad. It's a single self-contained file: the method, the reference guidance, and your profile in one place.

- **Memory:** starts fresh each chat — it reads your profile from the file but can't save what it learns. You keep the file current by hand.

### Claude Projects — paid, set up once

1. Create a new Project in Claude.ai.
2. Add to its knowledge: [`SKILL.md`](SKILL.md), your filled-in `cover-letter-profile.md`, and your CV.
3. Paste this into the Project's custom instructions:

   ```
   You are my cover-letter assistant. Follow the method in SKILL.md, and use
   the uploaded cover-letter-profile.md as my profile — read it from there, not
   from any file path the method mentions.

   This is a Claude Project, not Claude Code: you have no terminal and cannot
   create a .docx. Ignore every instruction in SKILL.md about python-docx,
   scripts/, .docx output, assets/, or reading/writing files on disk. Deliver
   the finished letter as clean, formatted text I can copy, kept to a single
   page. If you can't look up the company online, skip that quietly.

   At the end, if anything would sharpen my profile, show me the exact lines
   to paste back into cover-letter-profile.md.
   ```
4. Open a chat in the Project and paste a job ad.

- **Memory:** remembers within the Project — it reads your profile every time, but can't auto-save improvements. It suggests them; you update the file and re-upload.

### Claude Code — paid, full experience

Clone the repo into your skills folder:

```bash
git clone https://github.com/kevinryan-au/claude-cover-letter.git ~/.claude/skills/cover-letter
```

Then type `/cover-letter` in Claude Code. (Or drag [`install.md`](install.md) into a Claude Code session and it installs itself.)

- **Output:** a ready-to-send `.docx`, styled to match your CV.
- **Memory:** the only version that compounds — after each letter it writes back what it learned (phrasing fixes, worked examples, sharper skill lines) automatically.

## Your profile

All your personal data — CV, career anchors, skills framework, substantiated claims, style tokens, phrasing preferences — lives in a profile file **outside the skill** (`~/cover-letter-profile.md` for Claude Code; embedded in the chat file; an uploaded knowledge file in a Project). It's never committed to this repo. See [`templates/profile_template.md`](templates/profile_template.md) for the format.

## One source of truth

Everything derives from **`SKILL.md`**. The chat file is *generated*, never hand-edited:

```bash
scripts/build-chat-edition.sh   # rebuilds cover-letter-assistant.md from SKILL.md + references + template
```

Re-run it after changing `SKILL.md` so the chat version stays in sync. Projects and Claude Code use `SKILL.md` directly.

## What's in the repo

```
SKILL.md                      — the method (one source of truth)
cover-letter-assistant.md     — generated single-file Chat Edition
install.md                    — drag-into-Claude-Code installer
templates/profile_template.md — your profile format
references/                   — tone & phrasing, styling spec, worked-examples format
scripts/build-chat-edition.sh — regenerates the Chat Edition
scripts/visual_qa.sh          — optional .docx preview (Claude Code)
```

## Updating

- **Claude Code:** `git -C ~/.claude/skills/cover-letter pull`
- **Chat / Projects:** re-download `cover-letter-assistant.md` / re-upload `SKILL.md`.

Your profile file lives outside the skill and is never touched by updates.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (for the Claude Code path) + Python 3 with `python-docx` (installed automatically if missing)
- Any Claude account (for chat); a paid plan (for Projects / Claude Code)
- Your CV in any common format: Word, PDF, plain text, or paste
