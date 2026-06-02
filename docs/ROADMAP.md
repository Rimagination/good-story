# Roadmap

This roadmap defines what remains before `good-story` can be called a mature broad-use product.

## Current Status

Status: **Release candidate, not yet Mature**.

Evidence:

- User-facing README exists.
- Examples exist.
- Evaluation scenarios exist.
- Release checklist exists.
- Contribution and changelog files exist.
- Static product validation script passes.
- `evals/fresh-session-run-2026-06-02.md` records 9 regression scenarios and 6 real-material smoke tests passing in fresh sessions.

Missing before Mature:

- Publish the public repository URL used in README install commands.
- Collect and verify at least 3 non-author user or reviewer cases.
- Record failures, revisions, and user feedback from actual use.

## Release Candidate Criteria

`good-story` is currently Release candidate because:

- `scripts/validate-product.ps1` passes.
- All scenarios in `evals/scenarios.md` pass in fresh sessions.
- `evals/real-material-smoke-tests.md` passes across 6 unfamiliar real materials from different fields.
- Fresh-session results are recorded in `evals/fresh-session-run-2026-06-02.md`.
- README remains user-first and Chinese copy remains natural.

## Mature Criteria

`good-story` can be called Mature when:

- At least 15 recorded real-use or independent fresh-session cases pass across at least 5 fields. Current ledger: met.
- At least 3 cases come from users or reviewers other than the author. Current ledger: not met.
- Users can pick a template and get useful output without extra coaching.
- Field calibration prevents wrong-domain overclaiming in unfamiliar materials.
- The evaluation suite catches regressions after meaningful edits.
- New field packs and sources follow `CONTRIBUTING.md`.
- Version changes are recorded in `CHANGELOG.md`.

## Next Field Packs To Consider

Only add these when there is repeated use or strong need:

- remote-sensing story exemplars;
- AI4Science story exemplars;
- biomedical story exemplars;
- social-science story exemplars;
- materials-science story exemplars;
- geoscience story exemplars.

## Product Risks

- README becomes too long and hides the quick-start path.
- Examples become literature reviews instead of reusable moves.
- Field packs accidentally become skill boundaries.
- Evaluation scenarios become too easy and stop catching failures.
- Chinese answers drift back into English framework labels.

## Maintenance Rhythm

After each meaningful change:

1. Run `scripts/validate-product.ps1`.
2. Rerun relevant evaluation scenarios.
3. Run `scripts/validate-mature.ps1` when claiming or auditing Mature status.
4. Update baseline if behavior changes.
5. Update CHANGELOG for user-visible changes.
