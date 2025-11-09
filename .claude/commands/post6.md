---
description: Write a post at formality level 6 (professional blog post)
---

# Post Writer - Level 6: Professional Blog Post

Write content at **Formality Level 6** - clear professional voice, structured but accessible.

## Level 6 Characteristics

- Clear professional voice
- Limited first-person perspective
- Structured sections
- Some citations and examples
- Accessible but authoritative
- Example: Company engineering blogs, professional Medium posts

## Usage Note

This level sits between Level 5 (Experiences) and Level 8 (Default Articles). Consider:
- Use Level 5 for personal narratives
- Use Level 8 for technical deep-dives and research
- Use Level 6 for straightforward professional content

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking (use Hugo relref: `{{< relref "post-name.md" >}}`)
   - Common tags and categories
   - Prefrontal Systems terminology (STOPPER, PrefrontalOS, CortexGraph, computational therapeutics)
4. **Write content** in Level 6 style:
   - Professional but accessible tone
   - Clear section headers (H2)
   - Some evidence and examples
   - Limited but appropriate first-person usage
5. **Save** as `content/posts/[slug].md`

## Front Matter

```yaml
---
title: "Professional Descriptive Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Clear summary (120-160 chars)"
tags:
  - relevant-tags
categories:
  - Category
---
```
