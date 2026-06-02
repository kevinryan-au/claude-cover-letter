# Cover-Letter Skill — Installer

You are reading an installer file. Please follow these instructions exactly.

## What this does

This installs the cover-letter skill into Claude Code so the user can invoke it with `/cover-letter`.

**What it touches / your data (state this to the user before running):**
- It clones one public repo (`github.com/kevinryan-au/claude-cover-letter`) into `~/.claude/skills/cover-letter`. Nothing else is downloaded or executed at install time.
- Your CV and profile stay on your machine (`~/cover-letter-profile.md`, `~/.cover-letter/`); nothing is sent to the author — no telemetry. Details: `SECURITY.md` in the repo.

## Steps to follow

1. Clone, pinned to a release tag (so the install can't change underneath the user):

```bash
git clone --branch v1.0.0 --depth 1 https://github.com/kevinryan-au/claude-cover-letter.git ~/.claude/skills/cover-letter
```

2. Verify the install: confirm `~/.claude/skills/cover-letter/SKILL.md` exists, and confirm the code matches the published release:

```bash
git -C ~/.claude/skills/cover-letter rev-parse v1.0.0
# expected: 3b0bbbad9d1103124e25abd2bc35fbc1ea6ea383
```

   A matching SHA means the working copy is bit-for-bit the published v1.0.0 release (a commit SHA hashes the whole tree). If it differs, stop and point the user to `SECURITY.md`.

3. Tell the user:
   - The skill installed successfully
   - They can use it now by typing `/cover-letter` in any Claude Code conversation
   - The first run will take about five minutes to set up their personal profile — after that, every application is paste-and-go
   - If `/cover-letter` doesn't appear immediately, type `/reload-skills` to refresh

If the directory `~/.claude/skills/cover-letter` already exists, tell the user the skill is already installed and suggest running `git -C ~/.claude/skills/cover-letter pull` to get the latest version instead.

If git is not available, tell the user and link them to the manual install instructions at https://github.com/kevinryan-au/claude-cover-letter.
