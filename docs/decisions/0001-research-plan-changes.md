# 0001. Fill the gaps in the original research plan

- **Status:** Accepted
- **Date:** 2026-11-01
- **Task:** none

## Context

The [original plan](../thesis-plan.md) lists seven research phases as bullet points, plus a separate thesis structure. Turning the bullets into tasks exposed some work that the experiment outline or the thesis structure requires but no phase owns. It also exposed one bullet that cannot be done at the point where it sits. Project setup (Phase 0) is also new, but it concerns tooling rather than the research, so it is not covered here.

## Options

1. **Keep the original phases exactly** and leave the gaps implicit. That work then never appears on the plan until it is late.
2. **Adapt the plan** and record every difference here.

## Decision

The plan is adapted. Compared with the original:

1. **Phase 8 (write-up) is added.** The original drafts Chapter 2 (in 4.5) and the results (in 7.7), but the following were not assigned to any phase: Chapter 1, assembling Chapter 3, Chapter 4, the introduction, revision, and submission.
2. **Task 7.2 is added: accuracy and speed against the classical baseline.** The experiment outline requires this comparison, but Part I never assigned it.
3. **Original 4.4 is split.** Phase 4 cannot produce evidence that the conclusion does not hinge on the objective weighting, because no runs exist yet. Task 4.4 now fixes the weighting and designs the sensitivity analysis, and task 7.3 runs it.
4. **"Components built in dependency order" is broken into 6.1–6.7:** pricer, synthetic data, market data with split, classical baseline, architectures, training procedure, and the full grid. This breakdown is inferred from the dependencies and may be revised by a later decision.
5. **"Test suite written before the implementation" becomes 5.5,** which also requires every entry in the failure catalogue to map to a test or to an accepted risk.
6. **"Results reported with run-to-run variation visible" is folded into 7.7 and the Phase 7 checkpoint,** because it is a standard that applies to every result rather than a separate deliverable.

## Consequences

- **`docs/thesis-plan.md` stays as written.** It is the baseline that this record and later ones are measured against.
- **Later changes get their own records.** Any further change to the research plan needs a new decision record, which supersedes this one where the two overlap.
- **The sensitivity analysis needs a place in the thesis.** 7.3 belongs in the results of Chapter 3, and its design (4.4) belongs in Chapter 2.
