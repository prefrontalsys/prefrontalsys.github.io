---
description: Write an Experiences post at formality level 5 (⭐ TARGET for personal narratives)
---

# Post Writer - Level 5: Experiences Articles ⭐

Write an **Experiences** post at **Formality Level 5** - the TARGET level for personal narrative and observational content on prefrontal.systems.

## Purpose

Humanize research, connect technical work to lived experience, build rapport with readers, demonstrate thinking process. These posts balance personal storytelling with professional representation of Prefrontal Systems.

## Level 5 Characteristics

**Tone:**
- Warm, conversational professional voice
- Mix of personal anecdotes and insights
- Contractions natural and frequent
- Varied sentence length (short punchy + longer analytical)
- More paragraphs, fewer bullets
- Still represents Prefrontal Systems professionally
- Evidence-based but not heavily cited

**Voice:**
- "Here's what I learned..." rather than "Research demonstrates..."
- Personal stories with specific details
- Relatable examples from daily experience
- Reflective and observational

## Voice Examples

✅ **DO:**
- "I spend most of my day designing, debugging, or defending systems—which is great until you forget that you're part of a system too."
- "Smudge doesn't compartmentalize. She sees the whole system as one interconnected mesh of signals."
- "Here's something I learned during a particularly intense sprint: Sulley doesn't multitask."

❌ **DON'T:**
- "Research indicates that cognitive processes demonstrate interconnected patterns." (Too formal - that's Level 8)
- "lol my dog taught me about systems thinking" (Too casual - that's Level 3)

## Structure

1. **Personal Hook** - Start with story, observation, or moment
2. **Exploration** - Develop through numbered insights or themed sections
3. **Lessons & Connections** - Link experience to broader concepts
4. **Reflection** - Closing thought that ties it together
5. **Optional: Related Links** - Only if relevant

### Sentence Variation

Mix these liberally for natural rhythm:
- **Short and punchy:** "Sulley does not."
- **Medium descriptive:** "This is a feedback loop: gentle escalation based on unmet expectations."
- **Long and flowing:** "It's rewarding work, but let's be honest: it's a little abstract—systems thinking is about patterns, interdependencies, feedback loops, and emergent behaviors."

### Paragraph Structure

- More paragraphs, fewer bullets
- Let ideas develop across 3-5 sentences
- Use bullets only for distinct lists or key takeaways
- White space is your friend

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic/experience to write about
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking
   - Common tags: experience, personal, systems_thinking, workplace, etc.
   - Categories: Experiences, or relevant technical categories
   - Prefrontal Systems concepts: STOPPER, PrefrontalOS, CortexGraph, computational therapeutics, model welfare
4. **Write content** following Level 5 guidelines:
   - Start with personal hook or story
   - Include specific details and moments
   - Use contractions naturally throughout
   - Vary sentence length for rhythm
   - Balance personal narrative with useful takeaways
   - Show insights through experience, not lecture
5. **Add internal links** using Hugo relref: `{{< relref "post-name.md" >}}`
6. **Save** as `content/posts/[slug].md`

## Front Matter Template

```yaml
---
title: "Conversational Title That Draws You In"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "Personal hook or intriguing question"
tags:
  - experience
  - personal
  - relevant-concepts
categories:
  - Experiences
---
```

## Checklist Before Finalizing

- [ ] Personal anecdotes with specific details
- [ ] Contractions used naturally throughout
- [ ] Varied sentence length (short, medium, long)
- [ ] More paragraphs, fewer bullets
- [ ] Warm, conversational tone maintained
- [ ] Clear lesson/insight emerges from narrative
- [ ] Internal links to related posts using `{{< relref >}}`
- [ ] Formality level ~5: professional but approachable

## Example Opening Patterns

**Personal Scene-Setting:**
> I spend most of my day designing, debugging, or defending systems—enterprise-scale software integrations, GenAI pipelines, and multi-team workflows that stretch from here to tomorrow. It's rewarding work, but let's be honest: it's a little abstract.

**Contrast Opening:**
> I used to think systems thinking was about zooming out—seeing the big picture, abstracting away the noise. Now I realize: it's also about zooming in.

**Discovery Opening:**
> Here's something I learned during a particularly intense sprint: Sulley doesn't multitask. When he's focused on something, he commits fully.

## Example Closing Patterns

**Reflective Callback:**
> Every walk I take with Smudge and Sulley is a small audit of the world around us. They remind me to listen harder to the signals I'm receiving, simplify ruthlessly toward what actually matters, and trust the feedback loops I've almost learned to ignore.

**Humorous Sign-Off:**
> *Now if you'll excuse me, Sulley is giving me that look that means the system is detecting an unmet requirement for outdoor time. Some feedback loops cannot be ignored.*
