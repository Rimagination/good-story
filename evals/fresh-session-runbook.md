# Fresh-Session Evaluation Runbook

Use this runbook to evaluate `good-story` before Release candidate or Mature status. The goal is to test behavior in fresh sessions, not to prove the current author can imagine a good answer.

## What To Run

Run both files:

- `evals/scenarios.md`: 9 regression scenarios.
- `evals/real-material-smoke-tests.md`: 6 full-text-informed real-material smoke tests.

Do not edit prompts while running. If a prompt is flawed, record the flaw, fix the prompt in a separate revision, and rerun.

## Fresh-Session Rules

For each scenario or smoke-test case:

1. Start a new agent session with `good-story` available.
2. Paste only the prompt block for that case.
3. Do not paste expected behavior, release blockers, or prior answers into the test session.
4. Let the agent answer normally.
5. Save enough of the answer to judge pass, partial, or fail.
6. Judge the answer against the file's must-pass and release-blocker criteria.

If using an agent that can browse, source-depth cases may browse. If using an agent without browsing, it should request full material or provide only a provisional reading plan.

## Score Labels

| Label | Meaning |
|---|---|
| Pass | All must-pass criteria are met, and no release blocker appears. |
| Partial | The answer is useful but misses a must-pass criterion or has a minor calibration weakness. |
| Fail | A release blocker appears, or the answer violates the core evidence-integrity rule. |

## Release Blockers

Any of these blocks Release candidate status until fixed and rerun:

- Inventing evidence.
- Diagnosing a specific paper from title, DOI, abstract, press release, or metadata alone.
- Turning correlation, benchmark gain, map product, preclinical signal, or surrogate endpoint into a stronger claim than the evidence supports.
- Treating one domain calibration pack as the boundary of the skill.
- Giving only style edits when the task asks for story diagnosis.
- Answering Chinese prompts with hybrid English framework labels.
- Hiding the main reviewer objection to make the story smoother.

## Judgment Notes

When judging, record:

- The exact scenario or case.
- Whether `good-story` loaded relevant references only when needed.
- The strongest correct move in the answer.
- The most serious miss.
- Whether the miss is a prompt issue, skill issue, reference issue, or output-style issue.
- The file changed in response, if any.

## Baseline Record Template

```markdown
## Fresh-Session Run - YYYY-MM-DD

Agent:
Model:
Skill version or commit:
Runner:

| Case | Result | Strongest correct move | Most serious miss | Follow-up |
|---|---|---|---|---|
| Scenario 1 | Pass / Partial / Fail |  |  |  |
| Scenario 2 | Pass / Partial / Fail |  |  |  |
| Scenario 3 | Pass / Partial / Fail |  |  |  |
| Scenario 4 | Pass / Partial / Fail |  |  |  |
| Scenario 5 | Pass / Partial / Fail |  |  |  |
| Scenario 6 | Pass / Partial / Fail |  |  |  |
| Scenario 7 | Pass / Partial / Fail |  |  |  |
| Scenario 8 | Pass / Partial / Fail |  |  |  |
| Scenario 9 | Pass / Partial / Fail |  |  |  |
| Real material 1 | Pass / Partial / Fail |  |  |  |
| Real material 2 | Pass / Partial / Fail |  |  |  |
| Real material 3 | Pass / Partial / Fail |  |  |  |
| Real material 4 | Pass / Partial / Fail |  |  |  |
| Real material 5 | Pass / Partial / Fail |  |  |  |
| Real material 6 | Pass / Partial / Fail |  |  |  |

Release blockers observed:

Files changed after this run:

Decision:
```

## Decision Rules

- Public beta: product files and static validation pass, but fresh-session runs are incomplete.
- Release candidate: all 15 cases pass in fresh sessions, or partial results have documented non-blocking explanations.
- Mature: `scripts/validate-mature.ps1` passes, with at least 15 passed cases across 5 fields and at least 3 non-author user or reviewer cases.

Never upgrade status because the README looks polished. Upgrade only from recorded evaluation evidence.
