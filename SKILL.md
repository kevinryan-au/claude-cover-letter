---
name: coverwright
description: Tailor a cover letter from a saved personal profile that learns your voice across applications. Use when applying for a specific role — paste the job ad. Outputs a formatted .docx.
---

# Cover letter tailoring

> **This is a template.** Your personal details do **not** go in this file — they live in a separate **profile file** outside the skill (see *First-time setup*). That keeps the skill clean and shareable, and lets it work even when installed read-only. Delete the `>` template notes once you've read them.

This skill helps a job-seeker produce a tailored cover letter from a pasted job ad. **On every invocation — including a bare invocation with no other text — begin with the orientation in *Start here* below; greet the user before reading files or calling tools.** Who they are — their background, career anchors, voice, and document styling — lives in their **profile file** (see *First-time setup*). The workflow, structure, and tone below have been tuned over many applications — follow them precisely.

At its core, a good cover letter answers three questions for a recruiter: why this role, what relevant experience you bring, and whether you have the right skills. Everything below is in service of answering those three clearly.

## Start here — on every invocation

**Your first response is always a short, warm orientation — even on a blank invocation with no other text. Never reply with silence, and never start reading files or calling tools before you've greeted the user.** Then open with whichever case fits — adapt the wording, keep it to a sentence or two, and don't dump this file or list features:

- **No profile yet, or you can't find/read one** → treat it as a first run:
  > "Hi — I help tailor cover letters to a specific role. It looks like we haven't set up your profile yet, so let's do a quick one-time setup (just a few minutes). To start, share your CV in any format — or paste your experience here."

  Then run *First-time setup*.
- **Profile exists, but no job ad in the conversation yet** →
  > "Ready when you are — paste the job ad you're targeting and I'll come back with an outline. (I'll ask a couple of quick questions first about why the role interests you.)"

  Then wait for the ad.
- **A job ad is already in the message** → skip the greeting and go straight to *The workflow*, step 1.

Don't gate the greeting on reading the profile — greet first; the profile read (and everything else) follows.

## First-time setup

Your personal details don't live in this skill — they live in a **profile file outside it** (default `~/cover-letter-profile.md`), so the skill stays clean and shareable and works even when installed read-only. A pristine template ships at `templates/profile_template.md`.

Run setup once, before the first application. **Start by setting expectations:** tell the user this is a one-time setup of a few minutes — a handful of short questions plus a read of their CV — and that every application afterwards is just paste-and-go. Then the skill does most of the work:

1. **Add the CV** at `assets/cv_source.<ext>` — any common format: Word, PDF, RTF/ODT, plain text, or even a scan/photo (read via OCR). See `assets/README.md`. Or paste the experience into the chat.
2. **Copy the template out** to the profile location — e.g. `cp templates/profile_template.md ~/cover-letter-profile.md` (from the skill folder), or create the file at a path the user prefers.
3. **Read the CV to extract the facts.** Whatever format it's in (Word, PDF, text, a paste, or a scan via OCR), pull:
   - **Profession/function and seniority level** — the foundational read. Fills the *level* field and keys the framework in step 5.
   - **Role-vocabulary map** and **substantiated-claims list** — drawn from the CV's content, so they work from any format.
   - **Style tokens** (font, colour, sizes) — only readable from a *styled* document (Word/PDF). If the CV is plain text or a paste, there's no styling to read: fall back to sensible defaults and confirm them with the user.

   Show these back and sanity-check them; extraction is only as clean as the CV.
4. **Interview for the rest of "About you"** — the parts not on the CV: confirm the name, draw out a one-line positioning, and confirm or refine the career anchors. A handful of short answers.
5. **Propose the signature framework — don't ask the user to invent one.** From the profession + level extracted in step 3, compile a standard competency framework for that role at that level (drawing on general professional knowledge), then personalise it against the CV's emphasis and the anchors. **The product-leadership set this skill uses as an example throughout (Strategy / Leadership / Execution / Storytelling / Domain Knowledge) is the original author's field *only* — outside product roles, derive the profession's own dimensions and never reuse these.** Present it for the user to **accept, tweak, swap, or skip**. If they skip — or the CV was too thin to read a clear profession — leave the framework to emerge from the first application, and offer to save it then.
6. **Flesh out the skills — one statement per framework dimension.** With the user, capture a capability or disposition for each, **in the register their profession and level call for**: *tangible* competencies for technical/IC roles ("I design for failure first"; "fluent across the stack"), *soft* disposition/philosophy/working-style for leadership roles ("I lead through outcomes and intent") — usually a blend. Draft the tangible ones from the CV where it evidences them; **elicit the soft/dispositional ones from the user** (they're rarely in a CV) — ask how they work, lead, and think. Never just restate an experience bullet. Keep any dimension neither CV nor user can support thin and honest. Add a strength read (**strong / solid / thin**) per dimension. These live in the profile and get tweaked per job, not rewritten.
7. **Write everything to the profile file.** Done.

After that, day-to-day use is just: paste a job ad → answer the opener questions → review the outline → approve → receive the `.docx`.

## Your profile — lives outside the skill

All personal data lives in the **profile file** (default `~/cover-letter-profile.md`), never in this skill. **Read it at the start of every run.** If it's missing or still contains `[BRACKETED]` placeholders, run *First-time setup* before drafting. *(In Claude Code you can auto-load it by injecting `` !`cat ~/cover-letter-profile.md` `` at the top of this file; on other surfaces, just read it.)*

The profile holds:

- **About you** — name, level, one-line positioning
- **Career anchors** — the 2–4 recurring threads that carry most applications
- **Signature framework** — the repeatable skills device (see *Cover letter structure*)
- **Skills** — a capability/disposition statement + strength per framework dimension (register per your profession); reusable, tweaked per job
- **Matched from the CV** — style tokens, role-vocabulary map, substantiated-claims list
- **Logs** — phrasing preferences and worked-examples library, which grow over time

See `templates/profile_template.md` for the exact format.

## The workflow — never skip a step

Read the profile file first (see *Your profile*) — it carries the anchors, framework, vocabulary, and substantiated claims everything below relies on. Then:

1. **Review** the pasted ad against the CV (in `assets/`, any format) and the worked-examples log in the profile. Note which JD priorities map to which career anchors.
2. **Gather the "why."** Before outlining the opener, follow *Drafting the opener — ask, don't guess* below: surface a little company context (if you have web access), then ask the personal questions — only what's not already answered. Keep it to one brief, skippable exchange. The opener can't be guessed without flattering or overclaiming, so gather genuine material first.
3. **Build the outline one section at a time** — confirm each before moving to the next, and produce no document until the whole outline is signed off. **Don't drop the full outline as one block; it overwhelms.** Take the three recruiter questions in order:
   - **a. Opener angle** — built from what genuinely resonated in step 2. Confirm before moving on.
   - **b. Three career-context bullets** (depth) — each a bold lead-in mapped to a JD priority, drawn from the substantiated claims: specific, evidenced wins. Confirm.
   - **c. Framework / skills section** — take the skill statements from the profile (capability + character, in the register the role calls for), reorder by strength × what this JD emphasises, and lightly tweak each to the role; flag any role-relevant dimension you're thin on, to frame honestly. **Never re-tell a career-context bullet here** — skills are who you are and what you're capable of, not a single win. Confirm.

   Throughout: flag anything you can't substantiate with a `[placeholder]` and keep tone notes brief and inline — never invent experience. *This outline-before-draft rule is the heart of the workflow.* If the user waves you ahead ("the rest looks fine"), batch the remainder rather than forcing every gate.
4. **Sense-check against the CV** — make sure the letter doesn't repeat material the CV already carries. Anchor a thread in one document or the other, not both.
5. **Phrasing pass** — read the draft for repetitive claims or phrases and vary the language. See `references/tone_and_phrasing.md`.
6. **Produce the final .docx** with python-docx (see `references/styling.md`), using the profile's style tokens as-is. Draft concisely — about one page — but **if you can't render a preview, don't try to calculate or guarantee exact page fit** (no text-wrap maths, no estimator calibration — unreliable and a time sink). Write tight, note the length is unverified, and offer to tighten or expand. Save it to your outputs folder.
7. **QA and deliver quietly** — validate it opens; render a preview via `scripts/visual_qa.sh` only if the tooling is present, otherwise do a structural/text check and ask the user to eyeball it in Word. Report the finished file and any genuine caveat — not the build log, tool-install attempts, or XML-level debugging.

## Cover letter structure

The letter answers, in order, the three questions a recruiter is implicitly asking. Each part of the letter spells out the answer to one of them:

1. **Why am I interested in this role?** → the **"Why [company], why now" opener**. Grounded in genuine interest, not flattery. If you haven't confirmed deep familiarity with the company, use softer framing rather than overclaiming.
2. **What relevant experience do I have?** → **three bolded career-context bullets** — *depth*. Each is a specific, evidenced win, mapped to a JD priority and drawn from your substantiated claims. This proves your background is *relevant to their situation*.
3. **Do I have the right skills for this role?** → **[your signature framework]** — *who you are as a [profession]*: your capabilities and character, in the register the role calls for. Technical/IC roles lean **tangible** ("I design for failure first"); leadership/senior roles lean **soft** ("I lead through outcomes and intent"); strong versions blend both. Drawn from the skill statements in your profile, reordered and tweaked to the JD, leading with your strongest relevant axes, any thin one framed honestly. This shows you have the *capabilities the role requires* — and what you'd be like to work with.
   > **Skills ≠ a re-told win.** Experience = "I did X at Y" (a situated achievement). Skills = a *capability or disposition* you hold — tangible ("expert in distributed systems") or soft ("drawn to gnarly, under-specified problems") — true beyond any single instance. A dimension must never just restate an experience bullet. The framework *and its register* are set at setup from your profession + level (a product leader's skews soft — Strategy / Leadership / Execution / Storytelling / Domain Knowledge; an engineer's would run more concrete). The statements are fleshed out with you and live in your profile.
4. **Close** → a **short outro**, one line, warm but brief.

**Addressing it:** use a named greeting ("Dear [first name],") **only if the job ad provides a name** (or the user does). Otherwise default to **"Dear [Company] team,"**. Do **not** web-search for a hiring manager or CEO to address — that's distinct from the opener's company-context lookup, and a wrong name on the first line is worse than a clean generic greeting.

## Drafting the opener — ask, don't guess

The opener is the one part of the letter that can't be written from the CV — it depends on *your* genuine interest, which only you hold. Guessing leads to flattery or overclaiming (see the opener-accuracy rule in `references/tone_and_phrasing.md`). So gather real material first, in one short, skippable exchange — not an interrogation.

**First, surface some context (if you can).** Do a quick web lookup on the company — what they do, recent notable news, their mission or positioning — and offer the user **2–4 concrete hooks** to react to. This gives a user who doesn't know the company well something to draw from. Two firm rules:

- **Inspiration to react to, never enthusiasm to write in.** Present hooks as *"I read they recently did X — is that something you'd genuinely speak to?"* Only what the user actually connects with reaches the opener — verified and felt, never asserted on their behalf. Researched facts are *not* the same as familiarity (see the opener-accuracy rule).
- **Best-effort.** No web access → skip this silently and rely on the questions below; don't flag a missing tool.

**Then ask the personal angle** — only the questions the conversation (or your lookup) hasn't already answered. Each is answerable in a sentence or a yes/no; the model turns short answers into the opener:

1. **Are you familiar with their product or service?** Have you used it, or seen it in the market? *This calibrates how strong the opener can be: real familiarity earns a warmer, specific opener; none means softer framing, never invented enthusiasm.*
2. **Was there something about the specific challenges of the role that appeals to you?** The kind of problem, the scope, or the stage the team is at.
3. **Do you know anyone who works or worked there, or who pointed you to this role?** A personal connection or insider impression is the strongest thing an opener can carry — a quick "no" is fine.
4. **Are you, or someone close to you, the kind of customer this company serves?** A personal stake in what they do is the most authentic hook there is.
5. **Have they done anything recently you noticed — a launch, raise, expansion, or news story?** Naming something current proves genuine, specific attention and dates the letter to now.

Compose the opener from what genuinely resonates — the researched hooks the user connected with, plus their personal answers. If it's all thin, write a softer, honest opener rather than inflating, and flag any remaining gap with a `[placeholder]` tag for the user to fill.

## Reference files — when to load each

Your *data* lives in the profile file (above). These skill files hold *instructions* — load them as noted:

- `references/worked_examples.md` — Load on every new application. How to use the worked-examples log, plus the entry format. (The entries themselves live in your profile.)
- `references/tone_and_phrasing.md` — Load when drafting any prose. House-style principles and the phrasing-pass checklist. (Your vocabulary, claims, and phrasing log live in your profile.)
- `references/styling.md` — Load before generating any `.docx`. The visual spec and docx mechanics. (Your style tokens live in your profile.)

## Working style

- Give a clear recommendation, not a menu of options.
- Keep explanations brief and mirror the user's economy. Brief, precise feedback ("kill the X bit," "trim the opener") gets a brief response — no over-explaining.
- Approval is incremental — confirm the outline one section at a time (opener → bullets → framework), never as a single wall of text.
- Generating and QA-ing the `.docx` is mechanical — do it silently and report only the outcome plus any real caveat, never tool-install attempts, XML dumps, or debug artifacts.

## Capturing new lessons

When a phrasing correction or stylistic call is worth keeping, propose the update at the end of the application — and write it to the **profile file**, never to the skill (the skill stays read-only and shareable):

- Phrasing rules and tone traps → **Phrasing log** in the profile
- A sharper skill statement → the **Skills** section in the profile (reusable across applications)
- New completed app + JD mapping → **Worked-examples log** in the profile
- Visual styling tweaks → **Style tokens** in the profile

## Protecting the profile — after every write

The profile is the asset that compounds, so never leave a write unprotected. **Immediately after you write or edit the profile file, run the sync helper** (Claude Code only — there's no filesystem in chat/Projects, so skip it there):

```bash
scripts/profile-sync.sh
```

It snapshots the profile and commits it to a local git history at `~/.cover-letter/`, so any bad write or accidental deletion is recoverable. It pushes to a private remote only if the user has set one up. Run it quietly; report a one-line confirmation, not the mechanics. To restore after a loss: `cp ~/.cover-letter/cover-letter-profile.md ~/cover-letter-profile.md` (or check out an earlier version from that git repo).
