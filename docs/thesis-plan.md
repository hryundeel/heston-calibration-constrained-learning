> Original thesis plan, kept as written on 2026-11-01. The current plan is in the [README](../README.md), and every change from this one is recorded in [decisions](decisions/).

# Constrained learning for parameter estimation: does the training objective matter more than the architecture?

*A study in neural calibration of the Heston model.*

---

## The idea

Calibrating the Heston model means recovering its parameters from an observed market volatility surface. Done classically, this is a slow optimization repeated for every surface, and one that does not always have a unique answer. A neural network can learn the inverse directly, but it needs labelled examples — and real market surfaces come with no parameter labels. The data therefore has to be generated from the model itself, which means the network learns to invert the model rather than to explain the market.

There is another way to supply supervision. The pricing formula can be differentiated, so the network's predicted parameters can be turned back into a surface and compared against a real one, with the error used for training. No labels required, and real data enters the training process for the first time.

That sets up a question about machine learning rather than finance: **at a fixed model size, does putting domain knowledge into the training objective buy more than choosing a better architecture — and does it change which architecture wins?** Existing work varies one or the other, seldom both, and seldom at equal size, so the trade-off has not been measured. Anyone building such a system faces it.

## The experiment in outline

- Two factors, fully crossed: three architecture families × two training objectives (with and without the market-data term)
- Model size held equal across architectures, so the comparison measures design rather than capacity
- Data, training budget, and evaluation identical in every cell
- Every configuration repeated across random seeds, so differences are judged against run-to-run variation
- Tested on market surfaces from a period later than anything seen in training, since consecutive surfaces are nearly identical and a random split would leak
- Measured against a classical optimizer, on accuracy and on speed
- Metrics and baseline fixed in writing before the first run

---

# Part I — Research plan

**1. Domain and literature**
- Working command of the Heston model and its pricing
- Documented account of where Heston fails to match real markets — the gap the market-data term is meant to close
- Settled justification for synthetic training data, and for rejecting the two alternatives
- Position against existing neural calibration work, with one paper identified as the closest precedent
- Annotated bibliography feeding Chapters 1 and 2

**2. Experimental design**
- Architecture set, chosen and justified
- Definition of fairness between architectures — equal size, equal compute, or equal tuning effort, each claiming something different
- Metric set with one designated primary
- Baseline, and the tuning it is entitled to before the comparison stops being fair
- Data splitting rule, and what counts as leakage here
- Seed count, and the threshold separating a real effect from noise
- Written protocol another person could execute unaided

**3. System design**
- Module boundaries, in particular around the objective — its two variants must be settings of one procedure, not two programs that could differ unintentionally
- Shared interface across architectures
- Logging scheme making every reported number traceable to its run
- Skeleton repository running end to end on placeholders

**4. Technical specification**
- Pricing method and its accuracy target
- Cost of using the pricer inside training
- Choice of what the market comparison is made in, and its consequences
- Balance between the two parts of the objective, and evidence the conclusion does not hinge on that one choice
- Specification containing every formula — Chapter 2 in draft

**5. Validation design**
- Catalogue of what could be silently wrong yet still look plausible
- Correctness checks for the pricer and its derivatives
- Round-trip check: parameters → surface → recalibration → parameters recovered
- Proof the data split is clean
- Test suite written before the implementation

**6. Implementation**
- Components built in dependency order, each validated before the next relies on it
- Full set of runs, executed and logged

**7. Analysis**
- Effect of the objective, effect of the architecture, and their interaction
- Results reported with run-to-run variation visible, so a difference inside noise is shown as such
- Separation of cause: whether the market-data term corrects the model's mismatch with reality or simply acts as generic smoothing
- Follow-up experiments resolving whatever the first pass leaves ambiguous
- Stated threats to validity
- Results chapter

---

# Part II — Thesis structure

**Introduction** — the problem, the question, the contribution.

**1. Background** — volatility surfaces, the Heston model and its limits, why calibration is hard, and what has been tried.

**2. Foundations** — how prices are computed and differentiated, the architectures compared, the two objectives, and how everything is measured.

**3. Experiment** — design and data, evidence the implementation is correct, the results, cost against the classical method, and threats to validity.

**4. Conclusions** — what was found, what it means in practice, where it applies beyond this case, and what is left open.
