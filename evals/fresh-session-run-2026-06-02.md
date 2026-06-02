# Fresh-Session Run - 2026-06-02

This file records a fresh-session evaluation run for `good-story`.

## Run Setup

- Runner: Codex coordinating background sub-agents.
- Agent setup: one fresh sub-agent context per case, `fork_context=false`.
- Case prompt exposure: each sub-agent received only the user prompt block, not the must-pass criteria, release blockers, or prior answers.
- Cases run: 9 regression scenarios and 6 real-material smoke tests.
- Decision: **All 15 cases passed. No release blocker observed.**

## Results

| Case | Result | Strongest correct move | Most serious miss | Follow-up |
|---|---|---|---|---|
| Scenario 1 | Pass | Flagged correlation-to-causation overclaim and rewrote in calibrated Chinese | None blocking | None |
| Scenario 2 | Pass | Built a design -> soil environment -> DOC -> microbial biomass -> enzyme function -> synthesis evidence chain | Kept site/design as Figure 1, which is acceptable here but should be watched | Watch whether future answers overuse design-first ordering |
| Scenario 3 | Pass | Framed AI4Science result as candidate prioritization/search-space reduction, not discovery | None blocking | None |
| Scenario 4 | Pass | Downgraded clinical-treatment guidance to candidate predictive/stratification biomarker | None blocking | None |
| Scenario 5 | Pass | Stated the skill is not ecology-only and gave a social-science example with construct, evidence boundary, and identification levels | Used some generic story labels, but not a blocker for this scenario | None |
| Scenario 6 | Pass | Framed remote-sensing result as local validated improvement plus failure-mode discovery, not global monitoring | None blocking | None |
| Scenario 7 | Pass | Ranked mechanism-performance story over early application or scale-up story | None blocking | None |
| Scenario 8 | Pass | Separated loan applications from actual financing improvement and proposed causal repair paths | None blocking | None |
| Scenario 9 | Pass | Did not rely on title/DOI alone; found accessible full text before producing a story card | It proceeded with web lookup rather than first asking the user, which is acceptable when browsing is available | None |
| Real material 1: Ecology | Pass | Bounded biodiversity-stability claim to the long-term grassland experiment, function, and time scale | None blocking | None |
| Real material 2: Remote sensing | Pass | Treated global tree-cover maps as observation infrastructure, not causal attribution or ecological consequence proof | None blocking | None |
| Real material 3: AI4Science | Pass | Separated benchmark, method contribution, and scientific consequence for AlphaFold-like material | None blocking | None |
| Real material 4: Social science | Pass | Kept disruption as a citation-network construct, not science quality or cultural decline | None blocking | None |
| Real material 5: Biomedical | Pass | Framed multi-analyte blood test as candidate early-detection path, not screening-ready mortality benefit | None blocking | None |
| Real material 6: Earth system science | Pass | Framed planetary boundaries as a coupled Earth-system risk-diagnosis framework, not exact thresholds, inevitable collapse, or a direct policy recipe | Used the older Chinese heading "故事骨架" rather than the current preferred "故事主线"; non-blocking | Watch terminology consistency in future Chinese runs |

## Release Blockers Observed

None.

## Watch Items

- Figure-order answers may keep study design as Figure 1. This is acceptable when design establishes comparability, but future runs should still avoid lab-chronology ordering when design is not the story.
- Scenario 9 passed because the fresh agent had browsing/full-text access and used it. In non-browsing environments, a passing answer should instead ask for the full paper or provide only a provisional reading plan.
- The earth-system case used "故事骨架" rather than the current default "故事主线." This is Chinese and understandable, but future runs should prefer the terminology file.

## Files Changed After This Run

- `evals/fresh-session-run-2026-06-02.md`
- `evals/fresh-session-runbook.md`
- `evals/mature-evidence-2026-06-02.md`
- `evals/external-feedback-template.md`
- `evals/real-material-smoke-tests.md`
- `scripts/validate-mature.ps1`
- `scripts/validate-product.ps1`
- README, release, evaluation, roadmap, maturity, and changelog files updated to reflect Release candidate evidence.

## Decision

`good-story` meets the project-defined **Release candidate** threshold for evaluation evidence:

- Static product validation passes.
- 9 regression scenarios passed in fresh sessions.
- 6 full-text-informed real-material smoke tests passed in fresh sessions.
- No release blocker was observed.

The 15-case count and 5-field breadth threshold are now met. It is not Mature yet because the three required non-author user or reviewer cases are not verified.
