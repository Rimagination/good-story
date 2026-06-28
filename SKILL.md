---
name: good-story
description: Use when the user asks to find, sharpen, evaluate, rewrite, or explain the story in scientific or scholarly materials across disciplines, including manuscripts, grants, paper outlines, abstracts, figures, results, discussions, cover letters, research pitches, high-impact writing, journal fit, significance, novelty, mechanism, paper logic, or why a result matters.
---

# Good Story

Motto: "story is all you need."

Use this general scientific writing skill to extract the strongest research story that the evidence can honestly support, then show why that story works. Treat "story" as the organizing logic of a scientific or scholarly claim, not as decoration or hype. Story is all you need; truth is the boundary condition.

## Core Rule

A good scientific story is a resolved tension:

`field belief or need -> important gap -> decisive approach -> surprising/clarifying evidence -> new claim/model -> consequence for the field`

Never let the story outrun the evidence. If a beautiful story needs data the user has not shown, label it as a candidate story and name the missing proof.

## Source Depth Rule

When the user asks for the story of a specific paper, report, dataset, web page, or public material, do not diagnose the story from the title, abstract, press release, citation metadata, or memory alone.

Use the deepest accessible source before producing a story card:

1. Prefer the full text, including methods, results, figures, discussion, limitations, and supplementary notes when they matter.
2. If the full text is not accessible, say what was accessible and label any output as a provisional source-depth-limited read.
3. If only a title, DOI, abstract, press release, or citation page is available, do not invent the evidence ladder. Ask for the full material or give a reading plan instead of a final story diagnosis.
4. When using public sources, paraphrase the material and cite links; do not paste long source passages.

When frameworks conflict, use this priority order:

1. Evidence integrity and transparent reporting.
2. Claim calibration: what the data actually supports.
3. Research argument: why the claim matters in the field.
4. Narrative arc: how the reader travels from problem to resolution.
5. Style and memorability.

Lower layers may sharpen higher layers but may not override them.

## Audience Contract Rule

A good paper story must satisfy three different readers at once:

- The editor needs to see why the contribution matters and why the paper deserves attention now.
- The reviewer needs to see that every important claim is supported by evidence, logic, qualifiers, and answers to likely objections.
- The field reader needs to understand and remember the one thing they can now think, measure, predict, build, or do differently.

When diagnosing a story, do not optimize only for drama or only for completeness. Make the story easy to notice, easy to evaluate, and hard to misread.

## Project Scope

`good-story` is a general research-writing skill, not an ecology skill or a fixed list of supported domains. Its core story logic can be used by researchers from any evidence-based field once the field's materials, evidence hierarchy, claim verbs, audience contract, and review risks are calibrated.

Domain examples are domain calibration packs (领域校准包), not skill boundaries. Ecology, remote sensing, AI4Science, social science, biomedical research, and other examples tune the shared story grammar to a field's vocabulary, stakes, evidentiary standards, causal norms, review risks, and legitimate scope of implication. They do not change the core rule, and they must not smuggle field-specific assumptions into another domain.

## Quick Workflow

1. Inventory the material.
   - Extract the strongest claims, datasets, methods, contrasts, negative results, controls, limitations, and audience.
   - Separate direct evidence from interpretation, speculation, and background.
   - If a manuscript, outline, figure list, or results table is present, map each part to its current narrative job.
   - Name the audience contract: what an editor, reviewer, and field reader each need from the paper.

2. Find the story candidates.
   - Identify the protagonist: phenomenon, mechanism, method, organism, dataset, theory, or field problem.
   - Identify the antagonist: bottleneck, contradiction, dogma, missing mechanism, noisy evidence, scale barrier, or practical need.
   - Identify the turn: the experiment, comparison, model, or observation that changes what the reader can believe.
   - Draft 2-4 possible story spines before choosing one.

3. Choose the winning story.
   - Prefer the story with the clearest central contribution, strongest evidence chain, broadest honest consequence, and easiest retelling.
   - Downgrade stories that require hidden assumptions, too many equal contributions, chronological lab-history logic, or an audience the evidence cannot satisfy.

4. Build the paper around the story.
   - Title: the distilled central contribution.
   - Abstract: context, gap, approach, key evidence, claim, implication.
   - Introduction: make the reader care, narrow to the gap, show why the gap is solvable now.
   - Results: a sequence of claim-bearing steps, each supported by a figure or analysis.
   - Discussion: answer the gap, state what changed, define scope, handle limitations, and point to the next useful question.

5. Explain why it is good.
   - Name the tension it resolves.
   - Name the evidence that makes the resolution believable.
   - Name the audience it activates.
   - Name how the story serves the editor, the reviewer, and the field reader.
   - Name the retellable sentence a reader could carry away.
   - Name any fragility: missing controls, weak causal link, narrow generality, or overclaim risk.

## Story Diagnostics

Use these tests aggressively:

- One-sentence test: Can the paper be retold in one sentence without losing its point?
- So-what test: Does the claim change what readers think, measure, predict, build, or do?
- Gap-lock test: Do the results answer the exact gap introduced?
- Evidence ladder test: Does each figure make the next claim more believable?
- Antagonist test: Is there a real obstacle, contradiction, or uncertainty, not just "little is known"?
- Causality test: Are causal words backed by causal evidence?
- Scope test: Is the claim as general as the evidence, but no more?
- Audience contract test: Would an editor see stakes, a reviewer see warranted logic, and a reader remember the central contribution?
- Autobiography test: Is the manuscript telling how the authors did the project, or how readers should come to believe the conclusion?
- Narrative risk test: Has a clean story hidden negative results, limiting evidence, alternative explanations, or uncertainty the reader needs?
- Memory test: What phrase would a reader remember one year later?
- Time-layer test: Is this paper strong because of modern framing craft, because of a naturally powerful classic problem, or because it has both?

## Default Output

When the user gives materials and asks for a story, return these sections. Localize section labels to the user's language; for Chinese, use the heading translations in `references/terminology-style.md`.

1. `Best story`: one sharp paragraph.
2. `Why this story works`: tension, turn, evidence, audience, implication.
3. `Story spine`: 5-7 beats from field context to consequence.
4. `Evidence map`: claim -> evidence -> caveat.
5. `Weak points`: what would make reviewers resist.
6. `Rewrite targets`: title, abstract, section order, figure order, or key paragraphs as relevant.

For early projects, include alternate story candidates and rank them. For nearly finished manuscripts, focus on diagnosis and surgical edits.

## Reference Loading

Load only what is needed:

- Read `references/story-principles.md` when sharpening the story logic, abstract, introduction, results sequence, or discussion.
- Read `references/story-learning-strategy.md` when learning from published papers, comparing recent and classic papers, building an exemplar corpus, or diagnosing whether a paper's story strength comes from framing craft, problem choice, or decisive evidence.
- Read `references/terminology-style.md` when answering in Chinese, translating story diagnostics, or when output would otherwise mix English writing-framework jargon into Chinese prose.
- Read `references/framework-governance.md` when multiple writing frameworks conflict, when the story risks hype, or when the user explicitly emphasizes truth, evidence, limitations, overclaiming, or reviewer resistance.
- Read `references/overclaim-calibration.md` when evaluating whether a story is too strong, rewriting claims, preparing abstracts, cover letters, discussions, rebuttals, or high-impact journal framing.
- Read `references/cross-domain-transfer.md` when users from any field need to use the skill well, when using the skill outside an already calibrated domain, comparing fields, building a new domain calibration pack, or explaining how the same story logic applies to examples such as ecology, remote sensing, AI4Science, social science, biomedical research, materials, geoscience, or humanities.
- Read `references/ecology-story-exemplars.md` when the user asks for ecology examples, biodiversity/ecosystem-function stories, conservation ecology stories, or an ecology calibration pack.
- Read `references/exemplar-paper-patterns.md` when the user asks for high-impact examples, paper archetypes, or why famous papers are memorable.
- Read `references/source-map.md` when citing the public writing guidance behind this skill or expanding the corpus.
- Read `examples/before-after.md` when the user asks what the skill does in practice, wants examples, before/after rewrites, abstract diagnosis, figure-order examples, or examples of calibrated claims.
- Read `examples/field-mini-cases.md` when the user wants field-specific examples, cross-domain examples, ecology, remote sensing, AI4Science, social science, biomedical, or other domain mini-cases.

## Common Mistakes

- Mistaking chronology for story: lab order is rarely reader logic.
- Mistaking importance for stakes: "important topic" is not a gap unless something consequential is unknown or blocked.
- Mistaking data volume for evidence: more panels do not help unless each panel moves belief.
- Mistaking novelty for contribution: new is not enough; the result must change a claim, method, model, or decision.
- Mistaking speculation for implication: implications must be downstream of demonstrated evidence.
- Mistaking smooth prose for story: clarity helps, but the core claim and evidence ladder must work first.

## Style

Be blunt about story strength, but do not humiliate the science. Match the user's language. Prefer concrete story beats over generic writing advice. Use vivid labels for the narrative roles when useful, but keep all scientific claims traceable to evidence supplied by the user or cited sources.

If the user writes in Chinese, answer in polished Chinese by default:

- Use Chinese section headings and Chinese technical terms.
- Translate writing-framework jargon accurately instead of leaving English terms in the main prose.
- Keep English only for paper titles, author names, established acronyms, method names without stable Chinese translation, or when the English term prevents ambiguity.
- When an English term is useful, introduce it once in parentheses after the Chinese term, then use the Chinese term afterward.
- Do not output hybrid labels such as `Best story`, `Story spine`, `Evidence map`, `turn`, `claim`, `caveat`, `overclaim`, or `reviewer` in a Chinese answer unless quoting source text.
