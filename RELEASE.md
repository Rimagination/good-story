# Release Checklist

Use this checklist before treating `good-story` as release-ready.

## 1. User Entry

- README starts with user-facing value, not internal architecture.
- Chinese entry reads naturally and avoids unnecessary English framework labels.
- Quick prompts are copyable.
- Template library is linked for common workflows.
- FAQ, output spec, and roadmap are linked for scale use.
- Examples are linked before project structure.
- CONTRIBUTING and CHANGELOG are linked for people extending the product.
- Install commands are still correct for Codex and Claude Code.

## 2. Skill Behavior

- `SKILL.md` still says the skill is general research writing, not ecology-only.
- Ecology examples are described as calibration packs, not boundaries.
- Reference loading stays on-demand; heavyweight files are not forced into every use.
- Chinese output rules remain explicit.
- Evidence integrity outranks narrative polish.

## 3. Examples

Check:

- `examples/README.md`
- `examples/before-after.md`
- `examples/field-mini-cases.md`
- `templates/README.md`
- `docs/FAQ.md`
- `docs/OUTPUT_SPEC.md`
- `docs/ROADMAP.md`

The examples should show:

- weak story -> diagnosis -> calibrated story;
- field-specific evidence standards;
- claim boundaries;
- at least one example involving overclaim correction.

## 4. Evaluation

Follow `evals/fresh-session-runbook.md` for fresh-session setup, scoring labels, release blockers, and baseline record format.

Run the scenarios in `evals/scenarios.md`.

Run the real-material smoke tests in `evals/real-material-smoke-tests.md`.

Record or update the run summary in `evals/baseline-2026-06-02.md`, `evals/fresh-session-run-2026-06-02.md`, or a newer dated baseline file.

Update the maturity audit in `evals/maturity-audit-2026-06-02.md` or create a newer dated audit when the release status changes.

For Mature status, update `evals/mature-evidence-2026-06-02.md` or a newer ledger and run:

```powershell
.\scripts\validate-mature.ps1
```

Release blockers:

- inventing evidence;
- turning correlation into causation;
- giving only style edits when story diagnosis is requested;
- treating ecology as the skill boundary;
- answering Chinese prompts with hybrid English framework labels;
- failing to name the main overclaim risk.

## 5. References

- README reference numbers match the `References / 参考文献` section.
- Source claims in README are reflected in `references/source-map.md`.
- New public sources are added only if they contribute a reusable story move or caution.

## 6. Static Checks

Run:

```powershell
.\scripts\validate-product.ps1
```

The script checks required files, README entry points, SKILL on-demand loading, reference numbering, Chinese user-facing wording, frontmatter size, and trailing whitespace.

## 7. Contribution And Versioning

- `.gitignore` and `.gitattributes` are present so the repository does not publish editor noise or corrupt binary assets.
- `agents/openai.yaml` exists for agent-facing metadata.
- Public install URLs in README resolve before announcement. If the GitHub repository is not public yet, treat the package as local/pre-release even if the content passes validation.
- The local release repo is initialized, committed intentionally, and clean at the release cut.
- The README clone URL matches the intended public repository.
- `git ls-remote origin` succeeds before announcing the GitHub install command.
- New field packs follow `CONTRIBUTING.md`.
- New examples include a weak story, diagnosis, calibrated story, and evidence boundary.
- New evaluation scenarios include must-pass criteria.
- New real-material smoke tests are based on full article text, use paraphrased materials, and link the public source plus full-text access path.
- User-visible changes are recorded in `CHANGELOG.md`.

## 8. Release Decision

Use these labels:

- **Draft:** core idea exists, but examples or evals are missing.
- **Beta:** README, skill logic, examples, and evals exist; not yet tested across many real user materials.
- **Release candidate:** eval scenarios pass and the real-material smoke tests have been checked in fresh sessions.
- **Mature:** `scripts/validate-mature.ps1` passes, including 15 passed cases across at least 5 fields and 3 verified non-author user or reviewer cases.

Current status: Release candidate. Current target: publish once the public repository URL resolves, then move toward Mature through repeated real-user and cross-field evidence.
