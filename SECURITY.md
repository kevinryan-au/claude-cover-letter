# Security, privacy & provenance

This skill handles your CV and career history, so it's worth being precise about
what it does with that data, what it runs on your machine, and how you can
confirm the copy you installed is the real one. Everything below is verifiable in
the source — nothing here asks you to take it on faith.

## What data the skill handles

- **Your CV** — you provide it during the one-time setup. It's read to build your profile. It is never committed to this repo.
- **Your profile** (`~/cover-letter-profile.md`) — career anchors, evidence, skills framework, phrasing preferences. This is the only file that holds your personal data, and it lives **outside the skill**, in your home directory.
- **Job ads you paste** — used to tailor a letter for that role. Not stored separately.

## Where that data lives — and what leaves your machine

| Data | Location | Leaves your machine? |
|------|----------|----------------------|
| Profile | `~/cover-letter-profile.md` | No |
| Local backups | `~/.cover-letter/backups/` (last 10) | No |
| Local git history | `~/.cover-letter/` | No |
| Offsite copy | **only** a private repo *you* create and configure | Only if you opt in (see below) |

- **No telemetry.** The skill sends nothing to the author or any third party. There is no analytics, no "phone home," no usage tracking.
- **No bundled network calls.** None of the scripts in `scripts/` make outbound network requests. The single exception is `profile-sync.sh`, which runs `git push` **only if you have configured your own private remote** (`~/.cover-letter`). Out of the box there is no remote, so nothing is pushed anywhere.
- **Normal Claude usage still applies.** Like any Claude prompt, the CV and job-ad text you paste are processed by Claude under Anthropic's terms. That's inherent to using Claude, not something this skill adds.

## What runs on your machine

The skill executes only the scripts in `scripts/`, all of which are short, plain
`bash`, and readable in full before you install:

- `profile-sync.sh` — snapshots and locally commits your profile after a write. Network access only via your own optional remote.
- `build-chat-edition.sh` — regenerates the Chat Edition file from `SKILL.md`. Local only.
- `visual_qa.sh` — optional `.docx` preview. Local only.

There is **no `curl | sh`, no remote code fetched or executed at runtime, and no
install-time download** beyond the `git clone` itself. The one runtime dependency
(`python-docx`, for `.docx` output) is a published PyPI package, installed only if
missing.

## Provenance — confirm you installed the real thing

- **Canonical source:** `https://github.com/kevinryan-au/claude-cover-letter`
- **Linked from the author's site:** the project page at https://kevinryan-site.pages.dev/projects/ references this repo. Cross-checking that the link there points at the canonical URL above ties the code to a known identity (site → GitHub `kevinryan-au` → this repo).

**Verify the release signature (recommended).** From `v1.0.1` on, release tags are
**SSH-signed** by the author. On GitHub, a signed release tag carries a **Verified**
badge. To verify locally, trust the author's public signing key once, then check the
tag:

```bash
# one-time: record the author's signing key as trusted
mkdir -p ~/.config/git
echo '285323821+kevinryan-au@users.noreply.github.com namespaces="git" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP3aJLsH7Ma7RiJL/tARmiH0c35FJnZ0sdIB0UT7q5UW' \
  >> ~/.config/git/allowed_signers
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers

# verify the tag you installed
git -C ~/.claude/skills/cover-letter tag -v v1.0.3
# => Good "git" signature for 285323821+kevinryan-au@users.noreply.github.com
```

The author's public signing key (also shown on the
[Releases](https://github.com/kevinryan-au/claude-cover-letter/releases) page):

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP3aJLsH7Ma7RiJL/tARmiH0c35FJnZ0sdIB0UT7q5UW
```

**Or verify by commit SHA (no keys needed).** Each release tag resolves to a fixed
commit, and a commit SHA is a hash of the whole tree — so any tampering changes it.
Compare yours to the value published on the
[Releases](https://github.com/kevinryan-au/claude-cover-letter/releases) page:

```bash
git -C ~/.claude/skills/cover-letter rev-parse v1.0.3
```

## Install a pinned, verifiable version

Prefer pinning to a release tag over cloning a moving `main`, so what you install
can't change underneath you:

```bash
git clone --branch v1.0.3 --depth 1 \
  https://github.com/kevinryan-au/claude-cover-letter.git \
  ~/.claude/skills/cover-letter
```

Then verify the tag signature (above) before first use.

## Read before you install

This is an open, single-purpose repo — you're encouraged to read it first. Start
with `SKILL.md` (the entire method) and skim `scripts/`. Nothing is obfuscated,
minified, or fetched later; what you read is what runs.

## Reporting a vulnerability

Found something? Please open a private report via **GitHub Security Advisories**
on the repo ("Security" tab → "Report a vulnerability") rather than filing a public
issue, so it can be fixed before disclosure. You'll get an acknowledgement and a
fix timeline.
