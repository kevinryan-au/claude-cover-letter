# Changelog

All notable changes to this skill are listed here. Versions follow [semantic versioning](https://semver.org/): **MAJOR** for breaking changes to the profile format (you'll need to update your `~/cover-letter-profile.md`), **MINOR** for new features, **PATCH** for fixes and copy tweaks.

---

## [Unreleased]

- Added `DISCLAIMER.md`: as-is / no warranty, no legal-or-career advice, user is responsible for submitted content, and an explicit "not affiliated with or endorsed by Anthropic" notice. Linked from the README.

## [1.0.1] — 2026-06-03

Trust & transparency hardening (no behaviour change to the assistant):

- Added `LICENSE` (MIT).
- Added `SECURITY.md`: what data is handled, where it lives, what leaves the machine (nothing by default), what runs locally, and how to verify provenance.
- **Signed releases.** Release tags are now SSH-signed by the author; `SECURITY.md` publishes the public key and the `git tag -v` verification steps. A commit-SHA check is documented as a no-keys fallback.
- README + `install.md`: pin installs to the signed `v1.0.1` tag (not a moving `main`) and verify it; added Security & privacy and License sections; `install.md` discloses what it touches and your data up front.
- Provenance: documented the site → GitHub → repo identity chain.

---

## [1.0.0] — 2026-06-02

Initial public release.

- Full skill workflow: opener intake → outline (section by section) → `.docx` delivery
- One-time setup: CV read, profile interview, signature framework proposal
- Styled `.docx` output matched to your CV (font, colours, spacing)
- Phrasing pass, cross-document repetition check, one-page fit check
- Profile template at `templates/profile_template.md`
- Reference files: tone/phrasing, styling spec, worked-examples format
