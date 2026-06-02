# Maturity Audit - 2026-06-02

This audit records whether `good-story` is ready to publish and what evidence is still missing before it can be called mature.

## Current Decision

Status: **Release candidate, not yet mature**.

The skill is ready for early public release as a Release candidate once the public repository URL used by README install commands resolves. It should not yet be marketed as a mature broad-use skill because repeated real-user and cross-field evidence is not complete.

## Evidence Already Present

- User-facing README in Chinese and English.
- Copyable prompts and workflow templates.
- Before/after examples and cross-domain mini-cases.
- Release checklist, roadmap, contribution guide, changelog, and output specification.
- Static product validation through `scripts/validate-product.ps1`.
- Nine regression scenarios in `evals/scenarios.md`.
- Six full-text-informed real-material smoke tests in `evals/real-material-smoke-tests.md`.
- Fresh-session results for all 15 cases in `evals/fresh-session-run-2026-06-02.md`.
- Mature evidence ledger in `evals/mature-evidence-2026-06-02.md`.
- Source Depth Rule in `SKILL.md` to prevent story diagnosis from shallow metadata.

## Fresh Verification

Static validation run:

```powershell
.\scripts\validate-product.ps1
```

Latest observed result: pass on 2026-06-02.

Fresh-session evaluation:

- 9 regression scenarios passed.
- 6 real-material smoke tests passed.
- No release blocker observed.
- `scripts/validate-mature.ps1` correctly fails because external user/reviewer evidence is missing.

## Release Candidate Evidence

Release candidate criteria are currently met:

- Static validation passes.
- Fresh-session run record exists.
- All 15 cases passed.
- No release blocker was observed.
- Watch items are documented in `evals/fresh-session-run-2026-06-02.md`.

## Publication Gate

Local release repository status on 2026-06-02:

- Local git repository exists on `main`.
- `origin` is configured as `https://github.com/Rimagination/good-story.git`.
- `git ls-remote origin` currently returns `Repository not found`.

Public announcement should wait until the GitHub repository exists and the README install URL can be cloned.

## Mature Gaps

Before calling this Mature:

- Publish the public repository URL used in README install commands.
- Record at least 15 real-use or independent fresh-session cases across at least 5 fields. Current ledger: met.
- Include at least 3 cases from users or reviewers other than the author. Current ledger: not met.
- Confirm users can choose templates without extra coaching.
- Confirm Chinese outputs remain natural under pressure.
- Confirm field calibration prevents wrong-domain overclaiming in unfamiliar materials.
- Confirm the evaluation suite catches regressions after meaningful edits.

## Highest-Risk Failure Modes

| Risk | Current guardrail | Still missing |
|---|---|---|
| Diagnosing a paper from title, DOI, abstract, or press release | Source Depth Rule; Scenario 9 | Repeated real-use proof |
| Turning correlation into causation | Scenario 1; overclaim guidance | Repeated real-use proof |
| Treating benchmark gain as discovery | Scenario 3; AI4Science adapter | More real AI4Science materials |
| Treating biomedical signal as patient benefit | Scenario 4; biomedical adapter; smoke test | More clinical edge cases |
| Treating ecology as the skill boundary | Scenario 5; cross-domain transfer reference | More non-ecology user feedback |
| Chinese output drifting into English framework labels | Scenario 6; terminology rule | More Chinese user feedback |

## Publication Wording

Recommended:

```text
good-story is a Release candidate skill for evidence-faithful scientific storytelling. It has passed static checks, fresh-session regression scenarios, and full-text-informed real-material smoke tests across 15 cases. It is not yet mature until three non-author user or reviewer cases are recorded.
```

Avoid:

```text
good-story is mature, fully validated, or proven across all research fields.
```
