# Cover-Letter Skill — Installer

You are reading an installer file. Please follow these instructions exactly.

## What this does

This installs the cover-letter skill into Claude Code so the user can invoke it with `/cover-letter`.

## Steps to follow

1. Run this bash command:

```bash
git clone https://github.com/kevinryan-au/claude-cover-letter.git ~/.claude/skills/cover-letter
```

2. Verify the install succeeded by confirming that `~/.claude/skills/cover-letter/SKILL.md` exists.

3. Tell the user:
   - The skill installed successfully
   - They can use it now by typing `/cover-letter` in any Claude Code conversation
   - The first run will take about five minutes to set up their personal profile — after that, every application is paste-and-go
   - If `/cover-letter` doesn't appear immediately, type `/reload-skills` to refresh

If the directory `~/.claude/skills/cover-letter` already exists, tell the user the skill is already installed and suggest running `git -C ~/.claude/skills/cover-letter pull` to get the latest version instead.

If git is not available, tell the user and link them to the manual install instructions at https://github.com/kevinryan-au/claude-cover-letter.
