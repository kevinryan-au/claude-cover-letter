# Cover letter profile

> This file holds everything personal to you. It lives **outside** the skill, so the skill itself stays clean, shareable, and works even when installed read-only. The skill reads this file at the start of every run.
>
> **Default location:** `~/cover-letter-profile.md`. Keep it wherever you like — just tell the skill the path.
>
> You don't have to fill this in by hand: on first use the skill interviews you for the "About you" parts and reads your CV to fill the "Matched from your CV" parts. Replace every `[BRACKET]`. The "Logs" sections start empty and grow over time.

## About you

- **Name:** [YOUR NAME]
- **Current / target level:** [e.g. Head of Product / VP Product]
- **One-line positioning:** [the sentence that sums up your edge]

### Career anchors

The 2–4 recurring threads that carry most of your applications. For each: the kind of story it tells and the headline outcomes.

- **[ANCHOR 1]** — [e.g. commercial outcomes, P&L ownership, a turnaround]
- **[ANCHOR 2]** — [e.g. platform/scale, team building, technical depth]
- **[ANCHOR 3]** — [e.g. first hire into a function, building from scratch, a new domain]

### Signature framework

The repeatable device for showing you have the right skills (see *Cover letter structure* in `SKILL.md`). You don't author this from scratch — at setup the skill reads your **profession** and **seniority** from your CV and proposes a standard competency framework for that role and level, personalised to you. Accept, tweak, or swap it; then reorder the dimensions per role when drafting.

- **Profession / level:** [read from your CV at setup — keys the framework]
- **Dimensions:** [proposed at setup — e.g. for a senior product leader: Strategy, Leadership, Execution, Storytelling, Domain Knowledge]
- **Default order:** [your usual ordering, before role-specific reshuffling]

### Skills — who you are as a [profession]

The content of the cover letter's **skills** section: your capabilities and character per framework dimension — in the **register the role calls for**. Technical/IC roles lean **tangible** (concrete competencies, methods, tools); leadership/senior roles lean **soft** (disposition, philosophy, working style); most strong versions blend both. **Not** a re-told single win — those are the experience bullets, drawn from *Substantiated claims*. The skill helps flesh these out at setup: it drafts the tangible ones from your CV and **asks you** for the soft/dispositional ones (rarely in a CV); you refine. Tweaked per job; the core stays stable. **Strength** = how strongly this defines you / how much you'd lead with it.

| Dimension | Strength | Statement (capability or disposition — not a single win) |
|---|---|---|
| [Dimension 1] | [strong / solid / thin] | [tangible example: "I design for failure first — distributed systems that degrade gracefully; comfortable from API contracts to storage internals."] |
| [Dimension 2] | [strong / solid / thin] | [soft example: "I lead through outcomes and intent — set direction, then leave space for the team to own the how."] |
| [Dimension 3] | … | … |

## Matched from your CV — set once at setup

Read once from your CV. These are facts about you; sanity-check them, since extraction is only as clean as the CV's own formatting. Re-check if your CV changes.

### Style tokens

The cover letter should look like it belongs with your CV. Inherit its *typography and palette*, not its layout. If your CV isn't a styled document (e.g. plain text), these start as sensible defaults — adjust to taste.

| Token | Value | Notes |
|---|---|---|
| `FONT` | [e.g. Arial] | The CV's body/heading font |
| `ACCENT_HEX` | [e.g. 1F4E79 — a navy blue] | The CV's accent colour |
| `BODY_SIZE` | 22 half-points (11pt) | Match the CV |
| `HEADING_SIZE` | 28 half-points (14pt), bold | Match the CV |
| `PAGE_SIZE` | [A4: 11906 × 16838 twips, or US Letter] | Match the CV |
| `MARGINS` | 1440 twips (1 inch) all sides | Match the CV |
| `LINE_SPACING` | 300 (1.25× line height) | |
| `PARA_SPACING_AFTER` | 160 twips body; 200 bullets | |
| `BODY_COLOUR` | default black | Rarely changes |

### Role vocabulary

Keeps language accurate to each employer — vocabulary from one type of company must not bleed into another.

| Employer | Type | Native vocabulary | Don't borrow |
|---|---|---|---|
| [Employer A] | [e.g. energy retailer] | [its native terms — e.g. pricing changes, go-to-market] | [terms to avoid — e.g. shipping features, release cadence] |
| [Employer B] | [e.g. software platform] | [e.g. shipping, technical debt, modernisation] | — |
| [Employer C] | [e.g. marketplace] | [e.g. two-sided dynamics, supply/demand, matching] | — |

### Substantiated claims

The metrics and outcomes your CV can prove. The draft draws **only** from this list; anything beyond it gets a `[placeholder]` rather than being invented.

- [e.g. turned a loss-making line into record profit]
- [e.g. led 7 teams / ~70 people across a platform with millions of users]
- [e.g. +50% completion on a key conversion flow]
- [ … pull the real, provable numbers from your CV … ]

## Logs — grow over time

These start empty and accumulate as you complete applications (see *Capturing new lessons* in `SKILL.md`).

### Phrasing log

Your idiosyncratic word choices — the things only you know you prefer. Add a row whenever a correction is worth keeping.

| Avoid | Prefer |
|---|---|
| *(example)* "responsible for the product roadmap" | "owned the product roadmap" |
|  |  |

### Worked-examples log

A pattern library of completed applications. Copy the skeleton in `references/worked_examples.md` for each new one. Records the role's emphasis, the career-context bullets and which JD priority each mapped to, the framework ordering, and any corrections that landed.

*(empty — fills as you apply)*
