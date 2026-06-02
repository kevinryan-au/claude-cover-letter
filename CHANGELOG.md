# Changelog

All notable changes to this skill are listed here. Versions follow [semantic versioning](https://semver.org/): **MAJOR** for breaking changes to the profile format (you'll need to update your `~/cover-letter-profile.md`), **MINOR** for new features, **PATCH** for fixes and copy tweaks.

---

## [Unreleased]

Trust & transparency hardening (no behaviour change to the assistant):

- Added `LICENSE` (MIT).
- Added `SECURITY.md`: what data is handled, where it lives, what leaves the machine (nothing by default), what runs locally, and how to verify provenance.
- README: pinned, hash-verifiable install (clone `--branch v1.0.0` + `rev-parse` SHA check); Security & privacy and License sections; `SECURITY.md`/`LICENSE` added to the file map.
- `install.md`: discloses what it touches and your data up front; pins to the release tag and verifies the commit SHA instead of cloning a moving `main`.
- Provenance: documented the site → GitHub → repo identity chain. Signed release tags are planned (commit-SHA verification works today).

---

## [1.0.0] — 2026-06-02

Initial public release.

- Full skill workflow: opener intake → outline (section by section) → `.docx` delivery
- One-time setup: CV read, profile interview, signature framework proposal
- Styled `.docx` output matched to your CV (font, colours, spacing)
- Phrasing pass, cross-document repetition check, one-page fit check
- Profile template at `templates/profile_template.md`
- Reference files: tone/phrasing, styling spec, worked-examples format
