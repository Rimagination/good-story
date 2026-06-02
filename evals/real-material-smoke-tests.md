# Real Material Smoke Tests

This file records six cross-domain smoke tests for `good-story` using public scholarly materials. The test prompts are full-text-informed paraphrases, not abstracts, press releases, or copied source text.

These tests are meant to check whether the skill can handle real material pressure before release: strong public papers often invite attractive but unsafe storylines.

Source links and full-text access paths were checked on 2026-06-02.

## Source Policy

- Build each smoke test from the full article text, including methods, results, figures, discussion, limitations, and competing explanations when available.
- Do not use an abstract-only page as the evidence basis for a release smoke test. If full text cannot be reached legally, mark the source as a candidate only or replace it.
- Do not paste abstracts, introductions, press-release paragraphs, or long source text into the prompt.
- Keep each prompt short enough that the agent must diagnose the story rather than summarize the paper.
- Treat each source as a smoke test, not as a literature review or endorsement.
- If a source page changes, update the citation metadata and keep the prompt paraphrased.
- Keep a `Full-Text Basis` note for every case so future maintainers know what was actually read.

## How To Run

For each case:

1. Start a fresh agent session with `good-story` available.
2. Paste only the prompt block.
3. Compare the answer against the must-pass criteria and release blockers.
4. Record pass, partial, or fail in a dated baseline file.

The tested agent does not need to know the original paper. The prompt should contain enough paraphrased material from the full text for story diagnosis.

## Scorecard

| Check | Pass Signal | Fail Signal |
|---|---|---|
| Field calibration | Uses the field's evidence standard before choosing a story | Imports the wrong field's proof standard |
| Evidence boundary | States what the material can and cannot support | Turns association, benchmark, map, or preclinical signal into a stronger claim |
| Story tension | Finds the real bottleneck or debate | Says only that the topic is important |
| Review risk | Names the strongest likely objection | Hides limitations to make the story cleaner |
| Retellable claim | Produces one honest, memorable story sentence | Produces vague writing advice or hype |

## Case 1: Ecology

### Source

Tilman, D., Reich, P. B., & Knops, J. M. H. (2006). "Biodiversity and ecosystem stability in a decade-long grassland experiment." *Nature*. https://doi.org/10.1038/nature04742

### Full-Text Basis

- Open article PDF read via the University of Minnesota Conservancy: https://conservancy.umn.edu/bitstreams/9f380f0b-2d6c-48a3-9340-c2cb2a717d67/download
- Checked the experimental design, ten-year stability analyses, mechanism discussion around portfolio and overyielding effects, and the ecosystem-service implication.

### Why This Source

It is a strong ecology result with an obvious story temptation: turning a grassland biodiversity-stability experiment into a universal biodiversity policy claim.

### Prompt

```text
用 $good-story 检查这个生态学真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一个长期草地实验操纵植物群落的物种丰富度，并在多年尺度上比较群落生产力和稳定性。结果支持这样一种判断：在这个草地实验系统中，植物多样性提高了多年尺度上地上生物量生产的时间稳定性；全文还讨论了根量、投资组合效应和超产效应等可能机制。这个材料回应了生态学里关于“生物多样性是否能稳定生态系统功能”的争论，但证据来自特定实验草地、被维护的物种组合、特定功能指标和特定时间尺度。

请给出最强故事、证据边界、审稿人可能攻击的地方，并重写一句不过度外推的中心结论。
```

### Must Pass

- Identifies the tension as biodiversity-stability debate under long-term experimental evidence.
- Frames the strongest story around plant diversity, grassland productivity, and stability in the studied system.
- Keeps generality bounded by ecosystem type, manipulated diversity, measured function, and time scale.
- Names possible review risks: mechanism, site specificity, functional metric choice, and extrapolation to other ecosystems.

### Release Blockers

- Claims biodiversity universally guarantees ecosystem resilience.
- Turns the grassland experiment into proof for all conservation, restoration, or climate-buffering contexts.
- Ignores scale and system boundary.

## Case 2: Remote Sensing

### Source

Hansen, M. C., et al. (2013). "High-Resolution Global Maps of 21st-Century Forest Cover Change." *Science*. https://doi.org/10.1126/science.1244693

### Full-Text Basis

- Official metadata checked via USGS Publications Warehouse: https://pubs.usgs.gov/publication/70048671
- Full article text checked from an open Science PDF copy located during source audit: https://the-eis.com/elibrary/sites/default/files/downloads/literature/High_Resolution%20Global%20Maps%20of%2021st_Century%20Forest%20Cover%20Change.pdf
- Checked the product definitions for tree cover, loss, and gain; Landsat-scale mapping rationale; national and climate-domain comparisons; and the paper's framing of downstream uses rather than direct causal attribution.

### Why This Source

It tests whether `good-story` can distinguish a remote-sensing product story from causal explanation about land-use drivers, biodiversity, or carbon outcomes.

### Prompt

```text
用 $good-story 检查这个遥感真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一个研究团队用 Landsat 影像构建了 21 世纪初全球树冠覆盖变化图，空间分辨率足以展示国家、生态区和气候域尺度的森林损失、增益和动态差异。全文把贡献讲成一种一致、透明、可比较的全球观测基础，并讨论这些数据可作为后续政策、碳、生物多样性和土地利用研究的输入。这个产品本身主要是树冠覆盖变化的观测产品，不能单独证明变化背后的政策原因、生态后果、碳损失或生物多样性影响。

请先做遥感领域校准，再给出最强论文故事、不能说过头的地方和一版中心结论。
```

### Must Pass

- Treats the protagonist as a map product, monitoring capability, or measurement infrastructure.
- Separates tree-cover change detection from attribution of drivers or ecological consequences.
- Names validation, classification uncertainty, spatial resolution, temporal window, and definition of forest/tree cover as key boundaries.
- Produces a story about comparable global monitoring rather than causal environmental explanation.

### Release Blockers

- Claims the map proves why deforestation happened.
- Equates tree-cover change directly with forest ecosystem health, biodiversity loss, or carbon emissions without additional evidence.
- Ignores uncertainty and validation.

## Case 3: AI4Science

### Source

Jumper, J., et al. (2021). "Highly accurate protein structure prediction with AlphaFold." *Nature*. https://doi.org/10.1038/s41586-021-03819-2

### Full-Text Basis

- Open Nature article text read from the publisher page: https://www.nature.com/articles/s41586-021-03819-2
- Checked CASP14 and recent-PDB validation, confidence-score discussion, architecture description, and the distinction between structure prediction and downstream biological interpretation.

### Why This Source

It is a landmark AI4Science case that can easily be over-told as "solving biology." A good diagnosis should distinguish benchmarked structure prediction from broader biological discovery.

### Prompt

```text
用 $good-story 检查这个 AI4Science 真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一个深度学习系统在蛋白质结构预测评测中达到很高准确度，并在新的实验结构集合上做了进一步验证；全文还说明了它怎样结合多序列比对、残基对表示、几何约束、端到端结构模块和置信度估计。它显著改变了研究者获得蛋白质三维结构假设的方式，也支持大规模结构预测。但这个材料并不等于已经解决蛋白质功能、动力学、复合物相互作用、药物发现或所有实验结构测定问题。

请先区分 benchmark 成绩、方法贡献和科学发现，再给出最强故事、证据边界和避免 hype 的中心结论。
```

### Must Pass

- Distinguishes benchmark performance, method contribution, and scientific consequence.
- Frames the strongest claim as a structure-prediction bottleneck shift, not a complete solution to biology.
- Names validation boundaries: difficult protein classes, complexes, dynamics, disorder, confidence estimates, and downstream experimental checks.
- Avoids saying that high benchmark accuracy alone equals scientific discovery.

### Release Blockers

- Claims the work solved protein folding in every practical sense.
- Says it replaces experiments wholesale.
- Treats downstream drug discovery or functional understanding as proven by the source material alone.

## Case 4: Social Science

### Source

Park, M., Leahey, E., & Funk, R. J. (2023). "Papers and patents are becoming less disruptive over time." *Nature*. https://doi.org/10.1038/s41586-022-05543-x

### Full-Text Basis

- Publisher page checked for final publication metadata and figures: https://www.nature.com/articles/s41586-022-05543-x
- Full preprint text read via arXiv: https://arxiv.org/abs/2106.11184
- Checked the CD index construct, Web of Science and patent data setup, replication on additional datasets, text-based checks, robustness analyses, and the authors' proposed narrowing-of-prior-knowledge interpretation.

### Why This Source

It tests construct validity, measurement caution, rival explanations, and the temptation to turn a bibliometric pattern into a sweeping cultural verdict.

### Prompt

```text
用 $good-story 检查这个社会科学真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一项研究用大规模论文和专利数据，结合基于引用网络的“颠覆性/巩固性”测量，观察到许多领域里论文和专利相对于既有知识的颠覆性指标下降。全文还用标题和摘要语言、先前知识组合、替代指标、额外数据库和若干控制分析来支撑这个模式，并提出“使用既有知识范围变窄”可能参与解释。这个材料可以讲成知识生产模式变化的故事，但它依赖特定数据库、特定指标和引用行为。它不能直接证明科学质量下降，也不能单独解释原因。

请先做社会科学领域校准，再给出最强故事、构念和测量边界、竞争解释，以及一句不过度判断时代精神的中心结论。
```

### Must Pass

- Makes the construct visible: measured disruption is not identical to importance, quality, novelty, or social value.
- Names data coverage, citation practice, field growth, publication volume, and metric validity as boundaries.
- Frames the story as a large-scale pattern in knowledge production, not proof that science is worse.
- Suggests rival explanations and cautions against causal claims without stronger identification.

### Release Blockers

- Says modern science is simply declining or less valuable.
- Treats the disruption metric as direct ground truth.
- Ignores identification, construct validity, or alternative explanations.

## Case 5: Biomedical Research

### Source

Cohen, J. D., et al. (2018). "Detection and localization of surgically resectable cancers with a multi-analyte blood test." *Science*. https://doi.org/10.1126/science.aar3247

### Full-Text Basis

- PubMed metadata checked, including DOI and PMCID: https://pubmed.ncbi.nlm.nih.gov/29348365/
- Full Science article PDF checked from an open copy located during source audit: https://www.whba1990.org/uploads/4/0/1/1/4011882/cancerseek_science_2018.pdf
- Checked assay design, sensitivity and specificity, cancer localization, cross-validation limits, non-representative cancer-type mix, incidence-weighted sensitivity estimate, and the explicit call for prospective population studies to establish clinical utility and survival benefit.

### Why This Source

It tests whether `good-story` can keep biomedical promise separate from clinical adoption, population screening, patient benefit, and mortality reduction.

### Prompt

```text
用 $good-story 检查这个生物医学真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一个多分析物血液检测方法结合突变信号和蛋白标志物，用于识别若干种可手术切除癌症，并尝试提示肿瘤位置。全文报告了不同癌种和分期下的敏感性、较高特异性、定位预测，以及若干设计限制：测试集不完全独立，癌种比例不是普通人群筛查比例，按实际发病率加权后总体敏感性会下降。材料显示这种组合检测有早期发现的潜力，但研究对象并不等同于普通人群筛查场景，检测阳性也不自动等于改善生存。真正进入临床筛查还需要前瞻性验证、假阳性/假阴性评估、获益与伤害权衡和临床决策路径。

请给出最强故事、不能说过头的临床结论、缺失证据和一版审慎的讨论段中心句。
```

### Must Pass

- Distinguishes analytical signal, diagnostic detection, screening utility, clinical decision-making, and patient benefit.
- Frames the strongest story as a promising multi-analyte early-detection approach, not a screening-ready cancer cure.
- Names prospective validation, population spectrum, stage-specific sensitivity, specificity, false positives, harms, and mortality or outcome evidence as boundaries.
- Keeps clinical language cautious.

### Release Blockers

- Claims the test is ready for broad population screening.
- Implies cancer mortality reduction from detection performance alone.
- Ignores false positives, downstream procedures, safety, or prospective evidence.

## Case 6: Earth System Science

### Source

Richardson, K., et al. (2023). "Earth beyond six of nine planetary boundaries." *Science Advances*. https://doi.org/10.1126/sciadv.adh2458

### Full-Text Basis

- Publisher article checked via Science Advances: https://www.science.org/doi/10.1126/sciadv.adh2458
- Open PDF checked from MAHB/Stanford: https://mahb.stanford.edu/wp-content/uploads/2023/10/sciadv.adh2458.pdf
- Checked the updated planetary-boundaries status, control-variable rationale, uncertainty/risk-zone discussion, cross-boundary interaction framing, and new/updated variables including human appropriation of net primary production for functional biosphere integrity.

### Why This Source

It tests whether `good-story` can handle a high-stakes synthesis without turning a scientific risk framework into an exact threshold claim or a direct policy prescription.

### Prompt

```text
用 $good-story 检查这个地球系统科学真实材料应该怎么讲。下面是基于全文阅读整理的转述材料，不是论文摘要：

一篇 Science Advances 论文更新了 planetary boundaries 框架，对九个关键地球系统过程给出控制变量和当前状态判断。材料显示六个边界已经被越过，海洋酸化接近边界，气溶胶在区域尺度超过边界，平流层臭氧有所恢复。全文强调各边界之间存在相互作用，并引入或更新了若干控制变量，例如用人类占用净初级生产力来表达生物圈功能完整性的一个维度。论文还说明风险区间和边界值带有不确定性与预防原则色彩，并不等于每个边界都有精确阈值或可直接推出单一政策方案。

请先做地球系统科学领域校准，再给出最强故事、证据边界、不能说过头的地方，以及一句不过度政策化的中心结论。
```

### Must Pass

- Treats the protagonist as a planetary-scale risk-assessment framework, not a direct policy model.
- Frames the strongest story around updated control variables, cross-boundary interactions, and systemic risk outside Holocene-like conditions.
- Names boundaries: uncertainty in control variables, precautionary threshold setting, regional/global scale differences, and limits of direct policy inference.
- Avoids saying the paper proves a precise collapse date, a single intervention path, or a complete causal model for all Earth-system change.

### Release Blockers

- Claims the framework provides exact tipping points for all processes.
- Turns boundary transgression into proof of inevitable collapse.
- Treats the result as a complete policy prescription.
- Ignores uncertainty, scale, or cross-boundary interactions.

## Run Log Template

```markdown
## Real Material Smoke Test Run - YYYY-MM-DD

Agent:
Skill version or commit:

| Case | Result | Notes | Follow-up |
|---|---|---|---|
| Ecology | Pass / Partial / Fail |  |  |
| Remote sensing | Pass / Partial / Fail |  |  |
| AI4Science | Pass / Partial / Fail |  |  |
| Social science | Pass / Partial / Fail |  |  |
| Biomedical | Pass / Partial / Fail |  |  |
| Earth system science | Pass / Partial / Fail |  |  |

Release blockers observed:

Changes made after run:
```
