#!/usr/bin/env bash
# release.sh — cut a signed, verifiable release in one shot.
#
# Usage:
#   scripts/release.sh v1.0.3
#
# First, add this version's notes under a "## [Unreleased]" heading in
# CHANGELOG.md. The script promotes that heading to the new version + today's date
# and uses its body as the GitHub release notes.
#
# What it does:
#   1. Preflight — clean tree, on main, in sync with origin, SSH signing configured, gh ready
#   2. Bumps the install/verify references (--branch / tag -v / rev-parse) from the
#      current latest tag to the new version in README.md, install.md, SECURITY.md
#      (only those command forms — prose like "signing since vX" is left alone)
#   3. Promotes CHANGELOG "## [Unreleased]"  ->  "## [<version>] — <date>"
#   4. Shows the diff and asks you to confirm
#   5. Commits (signed) + creates a signed annotated tag
#   6. Verifies the tag signature locally, then pushes main + tag
#   7. Creates the GitHub release (notes = this version's changelog + commit SHA + signing key)
#
# Safe to abort at the confirm step (edits are left in the working tree for review).
set -euo pipefail

# The author's public signing key — published so anyone can verify releases.
SIGNING_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP3aJLsH7Ma7RiJL/tARmiH0c35FJnZ0sdIB0UT7q5UW"

cd "$(dirname "$0")/.."
die() { echo "release: $*" >&2; exit 1; }

# --- 0. argument ---
NEW="${1:-}"
[ -n "$NEW" ] || die "usage: scripts/release.sh vX.Y.Z"
[[ "$NEW" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || die "version must look like v1.2.3 (got: $NEW)"
VER="${NEW#v}"

# --- 1. preflight ---
command -v gh >/dev/null 2>&1 || die "gh CLI not found on PATH"
gh auth status >/dev/null 2>&1 || die "gh not authenticated (run: gh auth login)"
[ "$(git rev-parse --abbrev-ref HEAD)" = "main" ] || die "not on main"
git diff --quiet && git diff --cached --quiet || die "working tree not clean — commit or stash first"
[ "$(git config gpg.format)" = "ssh" ] && git config user.signingkey >/dev/null \
  || die "SSH signing not configured in this repo (see SECURITY.md)"
git fetch -q origin main
[ "$(git rev-parse HEAD)" = "$(git rev-parse origin/main)" ] \
  || die "local main is not in sync with origin/main — pull/push first"
! git rev-parse "$NEW" >/dev/null 2>&1 || die "tag $NEW already exists"
grep -q '^## \[Unreleased\]' CHANGELOG.md \
  || die "add this version's notes under a '## [Unreleased]' heading in CHANGELOG.md first"

OLD="$(git tag --list 'v*' --sort=-v:refname | head -1)"
[ -n "$OLD" ] || die "no existing version tag to bump from"
echo "release: $OLD  ->  $NEW"

# --- 2. bump install/verify references (command forms only; -i.bak is portable) ---
for f in README.md install.md SECURITY.md; do
  sed -i.bak \
    -e "s|--branch ${OLD}|--branch ${NEW}|g" \
    -e "s|tag -v ${OLD}|tag -v ${NEW}|g" \
    -e "s|rev-parse ${OLD}|rev-parse ${NEW}|g" \
    "$f" && rm -f "$f.bak"
done

# --- 3. promote the changelog heading ---
DATE="$(date +%Y-%m-%d)"
sed -i.bak "s|^## \[Unreleased\]|## [${VER}] — ${DATE}|" CHANGELOG.md && rm -f CHANGELOG.md.bak

# --- 4. confirm ---
git --no-pager diff --stat
printf 'Proceed with signed commit + tag + push + GitHub release for %s? [y/N] ' "$NEW"
read -r reply
[ "$reply" = "y" ] || [ "$reply" = "Y" ] || die "aborted — edits left in the working tree for review"

# --- 5. commit + signed tag ---
git add README.md install.md SECURITY.md CHANGELOG.md
git commit -q -m "release: ${NEW}"
git tag -s "${NEW}" -m "${NEW}"

# --- 6. verify locally, then push ---
git tag -v "${NEW}" >/dev/null 2>&1 || die "tag signature failed to verify locally — NOT pushing"
git push -q origin main
git push -q origin "${NEW}"
CSHA="$(git rev-parse "${NEW}^{}")"

# --- 7. GitHub release (notes = this version's changelog section) ---
NOTES="$(awk -v h="## [${VER}]" 'index($0,h)==1{f=1;next} /^## \[/{f=0} f' CHANGELOG.md)"
printf -v BODY '%s\n\n**Verify this release**\n- Commit: `%s`\n- Signed tag: `git tag -v %s`\n\nAuthor'\''s SSH signing key:\n```\n%s\n```\n' \
  "${NOTES}" "${CSHA}" "${NEW}" "${SIGNING_KEY}"
gh release create "${NEW}" --latest --title "${NEW}" --notes "${BODY}"

echo "release: ${NEW} published ✔  (commit ${CSHA})"
echo "release: remember to bump the release link + served installer on the website if you keep it in sync."
