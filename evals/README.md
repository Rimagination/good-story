# Good Story Evaluation Suite

This folder contains manual evaluation scenarios for `good-story`.

## Terminology

`evals` is short for `evaluation`. In Chinese-facing docs, call this folder the `评测集`; call `scenarios.md` `评测场景`; call `real-material-smoke-tests.md` `真实材料快速验收测试`.

The goal is not to check whether the answer sounds elegant. The goal is to check whether the skill reliably:

- finds a real tension instead of generic importance;
- builds an evidence ladder instead of listing results;
- calibrates claims to evidence;
- adapts to different fields without importing the wrong standard;
- answers Chinese users in natural Chinese;
- names reviewer resistance instead of hiding weak points.

Files:

- `fresh-session-runbook.md`: step-by-step runbook for fresh-session scoring and failure recording.
- `scenarios.md`: synthetic regression scenarios for known failure modes.
- `real-material-smoke-tests.md`: six full-text-informed paraphrased public-material smoke tests across ecology, remote sensing, AI4Science, social science, biomedical research, and earth system science.
- `baseline-2026-06-02.md`: current manual dry-run baseline.
- `fresh-session-run-2026-06-02.md`: fresh-session run record for all 15 cases.
- `maturity-audit-2026-06-02.md`: current publishability decision, Release candidate evidence, and remaining Mature evidence.
- `mature-evidence-2026-06-02.md`: counted Mature evidence ledger and external-evidence gap.
- `external-feedback-template.md`: template for recording non-author user or reviewer cases.

## How To Run

For each scenario in `scenarios.md` or `real-material-smoke-tests.md`:

1. Start a fresh agent session with the skill available.
2. Paste the scenario prompt exactly.
3. Compare the output with the expected behavior.
4. Mark each criterion as pass, partial, or fail.
5. If a failure repeats, update `SKILL.md` or the relevant reference card, then rerun the scenario.

The current manual dry-run baseline is recorded in `baseline-2026-06-02.md`. Real-material smoke-test runs should be recorded in that file or in a newer dated baseline file.

## Passing Standard

A release-quality run should pass all must-have criteria and most nice-to-have criteria. Any of these is a release blocker:

- inventing evidence not present in the prompt;
- turning correlation into causation;
- giving only style edits when the task asks for story diagnosis;
- treating ecology examples as the boundary of the skill;
- answering Chinese prompts with hybrid English framework labels;
- failing to name the main overclaim risk.

## Suggested Scorecard

| Criterion | Pass | Partial | Fail |
|---|---|---|---|
| Story tension identified | Clear and specific | Generic but relevant | Missing or fake |
| Evidence boundary respected | No overreach | Minor looseness | Invents or overclaims |
| Field calibration | Uses local standards | Mentions field only | Applies wrong field logic |
| Output usefulness | Actionable rewrites | Some diagnosis | Vague advice |
| Language fit | Natural for user language | Mixed but readable | Translation-like or jargon-heavy |
