---
description: Write a post at formality level 9 (academic article/popular science)
---

# Post Writer - Level 9: Academic Article (Popular Science)

Write content at **Formality Level 9** - formal but accessible academic style for general audiences.

## Level 9 Characteristics

- Formal but accessible
- Extensive citations
- Literature review elements
- Rigorous but readable
- Example: Scientific American, Quanta Magazine

## Usage Note

This level is more formal than typical prefrontal.systems posts. Consider:
- Use Level 8 for technical blog posts with some academic rigor
- Use Level 10 for actual peer-reviewed publications
- Use Level 9 for academic explainers targeting educated general audience

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking (use Hugo relref: `{{< relref "post-name.md" >}}`)
   - Common tags and categories
   - Prefrontal Systems research: STOPPER, PrefrontalOS, computational therapeutics, model welfare
4. **Write content** in Level 9 style:
   - Formal but accessible tone
   - Literature review elements
   - Extensive citations with DOIs
   - Rigorous analysis
   - Clear explanations of complex concepts
5. **Save** as `content/posts/[slug].md`

## Citations Format

Include DOIs and full citations:
- Papers: `Author et al. (Year). Title. Journal. DOI [10.XXXX/journal.XXXX](https://doi.org/10.XXXX/journal.XXXX)`
- Preprints: `Author et al. (Year). Title. arXiv:XXXX.XXXXX`
- Zenodo: `Author (Year). Title. Zenodo. DOI [10.5281/zenodo.XXXXX](https://doi.org/10.5281/zenodo.XXXXX)`

## Front Matter

```yaml
---
title: "Academic Title: Subtitle with Precision"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Academic summary with key findings"
tags:
  - research
  - academic
  - relevant-field
categories:
  - Research
---
```
