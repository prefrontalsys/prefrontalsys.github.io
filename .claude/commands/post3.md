---
description: Write a post at formality level 3 (casual blog post)
---

# Post Writer - Level 3: Casual Blog Post

Write content at **Formality Level 3** - conversational, personal, anecdote-driven blog style.

## Level 3 Characteristics

- Conversational, personal voice
- Contractions abundant
- Minimal citations or evidence
- Anecdotes over analysis
- Example: "I've been thinking about this problem for a while, and here's what I've noticed..."

## Usage Note

This level is more casual than typical prefrontal.systems posts. Consider using Level 5 (Experiences) for personal narratives that maintain professional representation.

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking (use Hugo relref: `{{< relref "post-name.md" >}}`)
   - Common tags and categories
   - Prefrontal Systems terminology (STOPPER, PrefrontalOS, CortexGraph, computational therapeutics)
4. **Write content** in Level 3 style
5. **Save** as `content/posts/[slug].md`

## Front Matter

```yaml
---
title: "Conversational Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Brief description"
tags:
  - relevant-tags
categories:
  - Category
---
```
