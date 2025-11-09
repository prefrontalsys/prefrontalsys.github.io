---
description: Write a post at formality level 1 (text message style)
---

# Post Writer - Level 1: Text Messages

Write content at **Formality Level 1** - casual, fragmented, text message style.

## Level 1 Characteristics

- Fragments and abbreviations acceptable
- Casual slang, emojis OK
- No formal structure required
- Example: "btw the deploy worked 🎉"

## Usage Note

This formality level is typically NOT used for prefrontal.systems blog posts. It's included for completeness and potential informal communications.

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking
   - Common tags and categories
   - Prefrontal Systems terminology (STOPPER, PrefrontalOS, CortexGraph, computational therapeutics)
4. **Write content** in Level 1 style
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
