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

Use the **same single file as the chat path** — a Project just keeps it loaded so you never re-drag it.

1. Create a new Project in Claude.ai.
2. Add [`cover-letter-assistant.md`](cover-letter-assistant.md) to its knowledge (method + your profile in one file). First time, add your CV too.
3. Open a chat and paste a job ad. The file directs Claude on its own — no custom instruction needed. (First time: say "set up my profile" — it reads your CV, interviews you, and gives you an updated file to re-upload once.)

> Fallback, rarely needed: if a Project ever doesn't pick up the method from the knowledge file, paste one line into its custom instructions — `Follow the attached cover-letter-assistant.md.`

- **Memory:** remembers within the Project — it reads your profile from the file every time, but can't auto-save improvements. It suggests them; you update the file and re-upload.

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

### Keeping it safe

Your profile is the asset that compounds — losing it means starting the learning over. In the **Claude Code** path it's protected automatically: after every write, the skill runs [`scripts/profile-sync.sh`](scripts/profile-sync.sh), which

- **snapshots** it to `~/.cover-letter/backups/` (last 10 kept), and
- **commits** it to a local git history at `~/.cover-letter/` — so a bad write or an accidental delete is always recoverable.

That's local and account-free by default. To add **offsite backup + sync across machines**, create your **own private repo** (your GitHub account, visible only to you — never this public skill repo) and point the data home at it once:

```bash
gh repo create cover-letter-profile --private
git -C ~/.cover-letter remote add origin https://github.com/<you>/cover-letter-profile.git
git -C ~/.cover-letter push -u origin main
```

After that, every profile update pushes there automatically. Restore after a loss with `cp ~/.cover-letter/cover-letter-profile.md ~/cover-letter-profile.md`, or browse `git -C ~/.cover-letter log`.

(Chat and Projects hold the profile inside the uploaded file, so just keep that file somewhere backed up.)

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
