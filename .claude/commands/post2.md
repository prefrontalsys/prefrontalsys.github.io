---
description: Write a post at formality level 2 (Slack/internal chat style)
---

# Post Writer - Level 2: Slack/Internal Chat

Write content at **Formality Level 2** - informal but professional, internal team communication style.

## Level 2 Characteristics

- Complete sentences preferred but not required
- Informal but professional
- Light technical jargon acceptable within team context
- Example: "The CI pipeline's green. Pushing to prod in 10."

## Usage Note

This formality level is typically NOT used for prefrontal.systems blog posts. It's included for completeness and potential internal documentation.

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking
   - Common tags and categories
   - Prefrontal Systems terminology (STOPPER, PrefrontalOS, CortexGraph, computational therapeutics)
4. **Write content** in Level 2 style
5. **Save** as `content/posts/[slug].md`

## Front Matter

```yaml
---
title: "Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Brief description"
tags:
  - relevant-tags
categories:
  - Category
---
```
