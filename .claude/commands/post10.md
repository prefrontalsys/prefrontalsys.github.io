---
description: Write a post at formality level 10 (peer-reviewed research paper)
---

# Post Writer - Level 10: Peer-Reviewed Research Paper

Write content at **Formality Level 10** - highly formal academic voice for peer-reviewed publications.

## Level 10 Characteristics

- Highly formal academic voice
- Abstract, Introduction, Methods, Results, Discussion structure
- Comprehensive citations
- Statistical rigor
- Passive voice common
- Example: Journal publications, conference papers

## Usage Note

This level is for actual research papers, not blog posts. Consider:
- Blog summaries of papers should use Level 8 or 9
- This format is for drafting papers that will be submitted to journals/conferences
- Prefrontal Systems publishes research openly (CC-BY 4.0) via Zenodo/arXiv

## IMRAD Structure

**Abstract** (150-250 words)
- Background, Methods, Results, Conclusions

**Introduction**
- Problem statement
- Literature review
- Research gap
- Objectives and hypotheses

**Methods**
- Study design
- Participants/systems
- Procedures
- Statistical analysis plan

**Results**
- Findings with statistics
- Tables and figures
- Objective reporting

**Discussion**
- Interpretation of results
- Comparison with literature
- Limitations
- Implications
- Future directions

**References**
- Comprehensive bibliography

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for research topic and study details
3. **Confirm** whether this is for:
   - Journal submission (which journal?)
   - Conference proceedings (which conference?)
   - Preprint (arXiv, Zenodo)
4. **Write** in Level 10 academic style
5. **Save** as `content/posts/[slug].md` (for blog) or separate LaTeX document for submission

## Front Matter (if blog post)

```yaml
---
title: "Full Research Paper Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Research summary with key findings"
tags:
  - research
  - academic
  - peer-reviewed
categories:
  - Research
  - Publications
---
```

## Citation Style

Follow APA, AMA, or Vancouver depending on target journal. Include DOIs for all references.

## Statistical Reporting

Report with precision:
- Means and standard deviations: M = 4.52, SD = 0.31
- Test statistics: t(28) = 3.42, p < .01, d = 0.65
- Confidence intervals: 95% CI [2.31, 4.87]
