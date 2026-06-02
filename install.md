# Cover-Letter Skill — Installer

You are reading an installer file. Please follow these instructions exactly.

## What this does

This installs the cover-letter skill into Claude Code so the user can invoke it with `/cover-letter`.

**What it touches / your data (state this to the user before running):**
- It clones one public repo (`github.com/kevinryan-au/claude-cover-letter`) into `~/.claude/skills/cover-letter`. Nothing else is downloaded or executed at install time.
- Your CV and profile stay on your machine (`~/cover-letter-profile.md`, `~/.cover-letter/`); nothing is sent to the author — no telemetry. Details: `SECURITY.md` in the repo.

## Steps to follow

1. Clone, pinned to a signed release tag (so the install can't change underneath the user):

```bash
git clone --branch v1.0.1 --depth 1 https://github.com/kevinryan-au/claude-cover-letter.git ~/.claude/skills/cover-letter
```

2. Verify the install: confirm `~/.claude/skills/cover-letter/SKILL.md` exists, then verify the signed tag:

```bash
git -C ~/.claude/skills/cover-letter tag -v v1.0.1
```

   A "Good \"git\" signature" confirms the release is the author's and unmodified. If the user hasn't trusted the author's signing key yet, point them to `SECURITY.md` (it has the one-time key-trust step, plus a commit-SHA fallback). If verification fails outright, stop.

3. Tell the user:
   - The skill installed successfully
   - They can use it now by typing `/cover-letter` in any Claude Code conversation
   - The first run will take about five minutes to set up their personal profile — after that, every application is paste-and-go
   - If `/cover-letter` doesn't appear immediately, type `/reload-skills` to refresh

If the directory `~/.claude/skills/cover-letter` already exists, tell the user the skill is already installed and suggest running `git -C ~/.claude/skills/cover-letter pull` to get the latest version instead.

If git is not available, tell the user and link them to the manual install instructions at https://github.com/kevinryan-au/claude-cover-letter.
