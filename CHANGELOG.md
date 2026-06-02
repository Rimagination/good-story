# Changelog

All notable changes to `good-story` are tracked here.

## Unreleased

### Added

- `.gitignore` and `.gitattributes` for release repository hygiene and binary asset handling.
- `evals/mature-evidence-2026-06-02.md` to count Mature evidence separately from release-candidate evidence.
- `evals/external-feedback-template.md` for non-author user or reviewer evidence.
- `scripts/validate-mature.ps1` for the stricter Mature gate.
- `evals/fresh-session-runbook.md` with fresh-session setup, scoring labels, release blockers, and baseline record format.
- `evals/fresh-session-run-2026-06-02.md` recording fresh-session results for 9 regression scenarios and 6 real-material smoke tests.
- `evals/real-material-smoke-tests.md` with six full-text-informed paraphrased public-material smoke tests across ecology, remote sensing, AI4Science, social science, biomedical research, and earth system science.
- `evals/maturity-audit-2026-06-02.md` to record current publishability and remaining evidence before Release candidate or Mature status.
- `SKILL.md` Source Depth Rule to prevent paper-level story diagnosis from title, DOI, abstract, press release, or citation metadata alone.
- Scenario 9 in `evals/scenarios.md` to regression-test source-depth behavior.

### Changed

- README, release checklist, roadmap, evaluation guide, and product validation now include the real-material smoke-test file.
- README, release checklist, evaluation guide, and product validation now include the fresh-session runbook.
- README, roadmap, release checklist, evaluation guide, maturity audit, and product validation now reflect Release candidate status.
- Smoke-test source policy now rejects abstract-only evidence and requires a full-text basis note for each case.
- Product validation now checks evaluation coverage, real-material full-text basis notes, the maturity audit file, agent metadata, local markdown links, README assets, release hygiene files, and Chinese terminology consistency.
- Mature criteria now include measurable cross-field and non-author use evidence instead of only a general repeated-use statement.
- Release documentation now treats a failing `git ls-remote origin` as a public-announcement blocker.
- Mature evidence now records 15 passed independent/fresh-session cases across more than 5 fields, while correctly leaving the external user/reviewer gate unmet.

## 0.4.0 - Scale-Use Documentation - 2026-06-02

### Added

- `templates/README.md` template index.
- Copyable templates for story diagnosis, abstract rewrite, figure order, field calibration, and rebuttal preparation.
- `docs/FAQ.md` for common user questions and failure modes.
- `docs/OUTPUT_SPEC.md` for expected story-card, field-calibration, candidate-story, figure-order, and rebuttal outputs.
- `docs/ROADMAP.md` for Release candidate and Mature criteria.
- README "Start Here" navigation in Chinese and English.

### Changed

- README now links users to templates and output specs before deeper maintenance docs.
- `RELEASE.md` now treats templates, FAQ, output spec, and roadmap as release assets.
- `scripts/validate-product.ps1` now verifies templates, docs, and README navigation.

### Validation

- `scripts/validate-product.ps1` passes.
- No trailing whitespace found in markdown or validation scripts.

## 0.3.0 - Productization Baseline - 2026-06-02

### Added

- User-facing README structure with quick prompts, examples, field use, quality checks, and references.
- `examples/README.md` as the examples entry point.
- `examples/before-after.md` with concrete abstract, figure-order, scattered-results, and overclaim examples.
- `examples/field-mini-cases.md` with ecology, remote sensing, AI4Science, social science, and biomedical mini-cases.
- `evals/README.md` evaluation guide.
- `evals/scenarios.md` with 9 regression scenarios.
- `evals/baseline-2026-06-02.md` manual dry-run baseline.
- `RELEASE.md` release checklist and maturity labels.
- `CONTRIBUTING.md` contribution rules for examples, field packs, sources, and evals.
- `scripts/validate-product.ps1` static product validation script.

### Changed

- Clarified that ecology examples are domain calibration packs, not the skill boundary.
- Expanded cross-domain positioning to support researchers from any evidence-based field.
- Improved Chinese README wording to reduce translation-like phrasing.
- Added on-demand loading rules for example files in `SKILL.md`.

### Validation

- `scripts/validate-product.ps1` passes.
- README reference numbering is consistent.
- Required examples, evals, release, and contribution files are present.
- Chinese user-facing copy passes the current untranslated-label check.

### Remaining Before Mature

- Run evaluation scenarios in fresh agent sessions.
- Test at least 5 unfamiliar real materials from different fields.
- Record failures and revisions in `evals/`.
- Add more field calibration packs only when repeated use shows demand.

## 0.2.0 - Cross-Domain Generalization - 2026-06-02

### Added

- `references/cross-domain-transfer.md`.
- Starter field adapters for ecology, remote sensing, AI4Science, social science, and biomedical research.

### Changed

- Reframed ecology exemplars as a calibration pack rather than a skill boundary.
- Updated README and `SKILL.md` to describe `good-story` as general research writing.

## 0.1.0 - Initial Skill - 2026-06-02

### Added

- Core `SKILL.md` workflow for finding, sharpening, evaluating, and rewriting scientific stories.
- Method cards for story principles, framework governance, overclaim calibration, terminology, story learning, exemplar papers, ecology exemplars, and source mapping.
