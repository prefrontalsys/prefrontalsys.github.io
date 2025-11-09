---
description: Write a post at formality level 4 (personal essay)
---

# Post Writer - Level 4: Personal Essay

Write content at **Formality Level 4** - narrative-driven personal essay style.

## Level 4 Characteristics

- First-person narrative
- Storytelling structure
- Some supporting evidence
- Accessible to general audience
- Example: Medium-style personal tech essays

## Usage Note

This level is close to Level 5 (Experiences) but slightly less structured. Consider Level 5 for posts that better represent Prefrontal Systems professionally.

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking (use Hugo relref: `{{< relref "post-name.md" >}}`)
   - Common tags and categories
   - Prefrontal Systems terminology (STOPPER, PrefrontalOS, CortexGraph, computational therapeutics)
4. **Write content** in Level 4 style:
   - Lead with personal story or observation
   - Develop narrative arc
   - Include reflections and insights
   - Use natural, flowing prose
5. **Save** as `content/posts/[slug].md`

## Front Matter

```yaml
---
title: "Narrative Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Personal hook or story angle"
tags:
  - relevant-tags
categories:
  - Category
---
```
