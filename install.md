# Coverwright — Installer

You are reading an installer file. Please follow these instructions exactly.

## What this does

This installs Coverwright — a cover-letter skill — into Claude Code so the user can invoke it with `/coverwright`.

**What it touches / your data (state this to the user before running):**
- It clones one public repo (`github.com/kevinryan-au/claude-cover-letter`) into `~/.claude/skills/coverwright`. Nothing else is downloaded or executed at install time.
- Your CV and profile stay on your machine (`~/cover-letter-profile.md`, `~/.cover-letter/`); nothing is sent to the author — no telemetry. Details: `SECURITY.md` in the repo.

## Steps to follow

1. Clone, pinned to a signed release tag (so the install can't change underneath the user):

```bash
git clone --branch v1.0.3 --depth 1 https://github.com/kevinryan-au/claude-cover-letter.git ~/.claude/skills/coverwright
```

2. Verify the install: confirm `~/.claude/skills/coverwright/SKILL.md` exists, then verify the signed tag:

```bash
git -C ~/.claude/skills/coverwright tag -v v1.0.3
```

   A "Good \"git\" signature" confirms the release is the author's and unmodified. If the user hasn't trusted the author's signing key yet, point them to `SECURITY.md` (it has the one-time key-trust step, plus a commit-SHA fallback). If verification fails outright, stop.

3. Tell the user:
   - The skill installed successfully
   - They can use it now by typing `/coverwright` in any Claude Code conversation
   - The first run will take about five minutes to set up their personal profile — after that, every application is paste-and-go
   - If `/coverwright` doesn't appear immediately, type `/reload-skills` to refresh

If the directory `~/.claude/skills/coverwright` already exists, tell the user the skill is already installed and suggest running `git -C ~/.claude/skills/coverwright pull` to get the latest version instead.

**Upgrading from the old name.** Before v2.0.0 this skill installed as `cover-letter` and was invoked with `/cover-letter`. If `~/.claude/skills/cover-letter` is still present after installing, tell the user it is a stale copy that will compete with `/coverwright` for the same job-ad trigger, and that they should remove it:

```bash
rm -rf ~/.claude/skills/cover-letter
```

Their profile is unaffected — it lives outside the skill at `~/cover-letter-profile.md` (and `~/.cover-letter/`), and those paths are unchanged. Do not delete anything without telling the user first.

If git is not available, tell the user and link them to the manual install instructions at https://github.com/kevinryan-au/claude-cover-letter.
