# Document styling

Load before generating any `.docx`. The cover letter is produced as a Word document, and it should look like it belongs with the CV. The visual **style tokens** (font, colour, sizes) live in the profile file; this file says **how to build the document** and the few things that trip people up — independent of which tool you use.

> **Template note:** the build guidance here is tool-agnostic; the per-user values it references (`FONT`, `ACCENT_HEX`, the sizes) come from the profile file. (This file borrows the CV's *look*, not its *content* — hence `styling.md` rather than `cv_styling.md`.)

## When this file is canonical

These specs override any defaults from the docx skill or general assumptions. Your visual reference of truth is your CV (in `assets/`, if it's a styled document) and your most recent finalised cover letter — compare against them before delivering (render a preview with `scripts/visual_qa.sh` if the tooling is available — see *QA and delivery*).

## Style tokens — in the profile

The per-user visual values live in the profile file (default `~/cover-letter-profile.md`), under **Matched from your CV → Style tokens**: `FONT`, `ACCENT_HEX`, `BODY_SIZE`, `HEADING_SIZE`, `PAGE_SIZE`, `MARGINS`, `LINE_SPACING`, `PARA_SPACING_AFTER`, `BODY_COLOUR`. They're matched from the CV once at setup (see *First-time setup* in `SKILL.md`), then frozen so output doesn't drift. If the CV wasn't a styled document (e.g. plain text or a paste), these are sensible defaults the user confirmed at setup.

Headings (H2, e.g. "Why [company], why now") use `FONT` at `HEADING_SIZE` in `ACCENT_HEX`, with ~280 twips before and 160 after.

## Building it

Generate the `.docx` with **python-docx** — Python is almost always available, so reach for it first; **don't try Node.** If python-docx isn't present and can't be installed, hand-build minimal OOXML directly. Use the profile's style tokens **as-is** — don't re-derive styling from the CV or prior letters at build time (that's setup's job); a quick glance at a recent letter for reference is fine, but don't rabbit-hole. Work quietly: produce the file, confirm it opens, report the result — not the build steps.

Build to the style tokens, and watch the few things that trip up *any* tool:

- **Bold lead-ins on career-context bullets** — the first phrase is bold, then a normal-weight space, then the rest. Put the trailing space **inside** the bold run, or Word renders no gap ("teamsTwice").
- **Headings** — `FONT` at `HEADING_SIZE` in `ACCENT_HEX`; ~280 twips before / 160 after.
- **Bullets** — a bullet character, indent ~720 twips left / 360 hanging, ~200 after each.
- **Body** — `FONT` at `BODY_SIZE`, with `LINE_SPACING` and `PARA_SPACING_AFTER`, in `BODY_COLOUR`.
- **Borders** (only if the letter uses a rule) — choose a visible weight and *confirm it renders*; border-size units differ by library, so don't trust a raw number.
- **Links** (rare) — if one's included, render a real hyperlink in the accent / Hyperlink style.

## QA and delivery

1. **Validate** the file is a well-formed `.docx` that opens cleanly.
2. **Render a preview** with `scripts/visual_qa.sh` to compare against the CV / last letter — **only if** LibreOffice + poppler are installed. If they're not, skip the render: do a structural + text-readback check instead, and tell the user to eyeball it in Word. **Don't try to compute page length without a renderer** — no text-wrap maths or estimator calibration; draft tight, state that exact length is unverified, and offer to adjust. A missing renderer is an expected fallback, not a problem to debug.
3. **Name** the file `[Your_Name]_-_Cover_Letter_-_<Company>_<Role>.docx` — underscores for spaces, hyphens-with-spaces between segments.
4. **Deliver** with a one-line note of any genuine caveat (e.g. "no preview on this machine — check it in Word").
