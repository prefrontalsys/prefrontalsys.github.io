---
description: Write a post at formality level 7 (technical documentation)
---

# Post Writer - Level 7: Technical Documentation

Write content at **Formality Level 7** - precise, instructional technical documentation style.

## Level 7 Characteristics

- Third-person or instructional voice
- Precise terminology
- Step-by-step structure
- Code examples and specifications
- Example: API documentation, framework guides

## Usage Note

This level is for pure technical documentation. For technical content with more context and explanation, use Level 8 (Default Articles).

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/content request
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking (use Hugo relref: `{{< relref "post-name.md" >}}`)
   - Common tags and categories
   - Prefrontal Systems frameworks: STOPPER, PrefrontalOS, CortexGraph
4. **Write content** in Level 7 style:
   - Instructional, precise language
   - Step-by-step procedures
   - Code examples with syntax highlighting
   - Technical specifications
5. **Save** as `content/posts/[slug].md`

## Code Blocks

Use triple backticks with language identifier:

```python
def example_function():
    """Clear docstrings"""
    return True
```

```bash
$ hugo server -D
```

## Front Matter

```yaml
---
title: "Technical Documentation Title"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Technical summary"
tags:
  - documentation
  - technical
  - framework-name
categories:
  - Technical
---
```
