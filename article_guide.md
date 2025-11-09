# Prefrontal Systems Article Writing Guide

This guide establishes the tone, style, and structural guidelines for blog posts on prefrontal.systems. It includes standards for two article types: **Default Articles** (technical/research-focused) and **Experiences** (personal narrative/conversational).

---

## ⚠️ Important: Updating Slash Commands

**When you update this guide, you must also update the corresponding slash commands:**

The `/post1` through `/post10` commands in `.claude/commands/` contain embedded guidelines for each formality level. These commands are designed to be self-contained to avoid passing the entire guide document in context.

**If you modify:**
- Formality level descriptions → Update the corresponding `/postN.md` command
- Structure templates → Update relevant commands (especially `/post5.md` and `/post8.md`)
- Front matter templates → Update all commands that reference them
- Voice examples or guidelines → Update the specific level's command

**Most critical commands to maintain:**
- `.claude/commands/post5.md` - Experiences Articles (Level 5)
- `.claude/commands/post8.md` - Default Articles (Level 8)

These are the two primary article types and should stay in sync with this guide.

---

## Formality Scale (1-10)

Use this scale to calibrate tone and style for different content types:

### Level 1: Text Messages
- Fragments and abbreviations acceptable
- Casual slang, emojis
- No formal structure
- Example: "btw the deploy worked 🎉"

### Level 2: Slack/Internal Chat
- Complete sentences preferred but not required
- Informal but professional
- Light technical jargon acceptable within team context
- Example: "The CI pipeline's green. Pushing to prod in 10."

### Level 3: Casual Blog Post
- Conversational, personal voice
- Contractions abundant
- Minimal citations or evidence
- Anecdotes over analysis
- Example: "I've been thinking about this problem for a while, and here's what I've noticed..."

### Level 4: Personal Essay
- First-person narrative
- Storytelling structure
- Some supporting evidence
- Accessible to general audience
- Example: Medium-style personal tech essays

### Level 5: **Experiences Articles** ⭐ (TARGET FOR EXPERIENCES)
- Warm, conversational professional voice
- Mix of personal anecdotes and insights
- Contractions natural and frequent
- Varied sentence length (short punchy sentences alongside longer analytical ones)
- More paragraphs, fewer bullets
- Still represents Prefrontal Systems professionally
- Evidence-based but not heavily cited
- Example: "Here's what I learned..." rather than "Research demonstrates..."

### Level 6: Professional Blog Post
- Clear professional voice
- Limited first-person perspective
- Structured sections
- Some citations and examples
- Accessible but authoritative
- Example: Company engineering blogs, professional Medium posts

### Level 7: Technical Documentation
- Third-person or instructional voice
- Precise terminology
- Step-by-step structure
- Code examples and specifications
- Example: API documentation, framework guides

### Level 8: **Default Articles** ⭐ (TARGET FOR STANDARD POSTS)
- Professional, evidence-based voice
- Structured with clear H2 sections
- Statistics and citations (marked as "illustrative" when applicable)
- Mix of technical depth and accessibility
- Concrete examples illustrating abstract concepts
- Direct language, minimal fluff
- Can use first-person for credibility ("In my testing...")
- Example: Technical blog posts, framework deep-dives, case studies

### Level 9: Academic Article (Popular Science)
- Formal but accessible
- Extensive citations
- Literature review
- Rigorous but readable
- Example: Scientific American, Quanta Magazine

### Level 10: Peer-Reviewed Research Paper
- Highly formal academic voice
- Abstract, Introduction, Methods, Results, Discussion structure
- Comprehensive citations
- Statistical rigor
- Passive voice common
- Example: Journal publications, conference papers

---

## Default Articles (Formality Level 8)

### Purpose
Technical deep-dives, framework explanations, research findings, case studies, and evidence-based analysis. These represent Prefrontal Systems' core research and technical work.

### Tone & Voice

**Professional but accessible**
- Use technical terminology when precise, but explain concepts
- Direct, clear language—no corporate speak or excessive qualifiers
- Evidence-based: cite sources, provide statistics, show real-world results
- First-person acceptable for credibility ("In my testing...", "I observed...")
- Avoid hyperbole and superlatives

**Examples:**
- ✅ "The framework increased automatic tool usage from ~15% to ~89% of relevant interactions (illustrative based on testing observations)"
- ✅ "This wasn't a technical limitation—it was a behavioral one."
- ❌ "This revolutionary framework will completely transform how you think about AI!"
- ❌ "Everyone knows that AI systems struggle with..."

### Structure

**Front Matter:**
```yaml
---
title: "Clear, Descriptive Title with Keywords"
date: YYYY-MM-DD
draft: false
description: "One-sentence summary for SEO (120-160 characters)"
categories:
  - Primary Category
  - Secondary Category
tags:
  - specific-tag
  - framework-name
  - relevant-keyword
updated: "YYYY-MM-DDTHH:MM:SS-TZ" (optional, if post updated)
---
```

**Article Structure:**
1. **Opening Hook** - Lead with the problem, a compelling question, or a concrete scenario
2. **Context Setting** - Brief background establishing why this matters
3. **Main Content** - Organized into clear H2 sections with descriptive headers
4. **Practical Applications** - Real-world examples, implementation details, case studies
5. **Conclusion** - Summary of key insights, next steps, broader implications
6. **Related Resources** - Links to relevant posts, external references, repositories

**Section Headers:**
- Use descriptive H2 headers (## Header Text)
- Start with the core problem or concept being addressed
- Use H3 (###) for subsections when needed
- Avoid generic headers like "Introduction" or "Conclusion"

**Content Organization:**
- **Lead with insight:** Topic sentences should convey the main point immediately
- **Use bullets for:**
  - Lists of distinct items
  - Step-by-step processes
  - Feature comparisons
  - Key takeaways
- **Use paragraphs for:**
  - Conceptual explanations
  - Narrative flow
  - Connecting ideas
  - Case studies and examples

### Writing Style

**Sentence Structure:**
- Vary length but favor clarity over complexity
- Short sentences for impact: "This is the real cost."
- Longer sentences for explanation: "When AI systems don't utilize available capabilities, several problems compound: information quality degrades, users lose confidence, and innovation opportunities disappear."
- Avoid run-on sentences

**Evidence & Citations:**
- Provide specific statistics when available
- Mark illustrative statistics: "(illustrative based on testing observations)"
- Link to sources: papers, repositories, documentation
- Include DOIs for academic references: `DOI [10.5281/zenodo.14487847](https://doi.org/10.5281/zenodo.14487847)`
- Acknowledge limitations and failure cases

**Examples & Analogies:**
- Use concrete examples to illustrate abstract concepts
- Technical analogies are acceptable when they clarify
- Real-world case studies strengthen credibility
- Code examples when relevant (use Hugo syntax highlighting)

**Technical Precision:**
- Be specific about technical details
- Explain acronyms on first use: "Model Context Protocol (MCP)"
- Use inline code formatting for: `function names`, `file paths`, `technical terms`
- Link to technical documentation when referencing external tools

### Voice Guidelines

**DO:**
- Use direct, active voice: "The framework solves this problem" not "This problem is solved by the framework"
- Acknowledge uncertainty: "This suggests..." not "This proves..."
- Include first-person when establishing credibility: "In my testing...", "I discovered..."
- Challenge assumptions respectfully
- Distinguish verified information from speculation

**DON'T:**
- Use corporate speak: "leverage synergies", "move the needle", "best-of-breed"
- Make absolute claims: "This always works", "The only solution"
- Use excessive praise: "revolutionary", "game-changing", "incredible"
- Oversimplify complex topics
- Claim certainty where none exists

### Code & Technical Content

**Code Blocks:**
```python
# Use triple backticks with language identifier
def example_function():
    """Clear docstrings for code examples"""
    return True
```

**Inline Code:**
- Use single backticks for: `variable_names`, `file.py`, `function_calls()`
- Technical terms that are code-specific: `git commit`, `pip install`

**Terminal Commands:**
```bash
# Prefix with $ for user commands
$ hugo server -D

# Show output when relevant
> Server running at http://localhost:1313/
```

### Links & References

**Internal Links (Hugo):**
```markdown
Check out our post on [STOPPER Protocol]({{< relref "stopper-protocol.md" >}})
```

**External Links:**
```markdown
See [Model Context Protocol](https://modelcontextprotocol.io/) for specifications
```

**Related Resources Section:**
```markdown
## Related Resources

**Framework Implementation**:
- [Repository Name](https://github.com/org/repo) - Brief description
- [Documentation](https://example.com) - What it provides

**Research and Theory**:
- [Paper Title](https://arxiv.org/abs/XXXX) - Citation and relevance

**Practical Applications**:
- [Tool Name](https://example.com) - Use case description
```

### Example Opening Patterns

**Problem-First Opening:**
> Picture this: You've spent hours setting up a comprehensive suite of MCP servers for your AI assistant... You test the setup, confirm all the tools are accessible, and then watch in frustration as your AI ignores 90% of them unless you explicitly prompt it.

**Question-Hook Opening:**
> What if artificial intelligence, with its analytical precision, could recreate the magic of serendipity, not by accident, but through design?

**Scenario-Based Opening:**
> Last month, the product team was presenting our GenAI Commercial Lending project to executive leadership when our Model Risk Management director asked a question that stopped the room cold...

**Statistical Opening:**
> Training GPT-3 produced roughly 552 metric tons of CO2—equivalent to hundreds of round-trip flights across the country. And that's just the training phase.

### Closing Patterns

**Summary + Call-to-Action:**
> The gap between tool availability and tool usage represents one of the most practical challenges in AI deployment today. For teams struggling with similar challenges, the framework provides a proven approach... The implementation is available, the results are measurable, and the approach is generalizable.

**Broader Implications:**
> This framework represents more than just a solution—it demonstrates an approach to AI behavior modification that could apply to many other capabilities... The key insight is that effective AI behavior modification requires both positive directives and negative constraints.

**Related Content:**
> *For more insights on AI frameworks and workplace innovation, explore other posts in the [AI category](/tags/ai) on prefrontal.systems.*

---

## Experiences Articles (Formality Level 5)

### Purpose
Personal narratives, reflections, observations, and lessons learned. These posts humanize the research and connect technical work to lived experience. They build rapport with readers and demonstrate thinking process.

### Tone & Voice

**Warm, conversational professional**
- Use contractions naturally: "I've been", "doesn't", "can't"
- Personal anecdotes and stories
- Reflective, observational tone
- More "I" and less "the research shows"
- Relatable examples from daily experience
- Still represents Prefrontal Systems—professional but approachable

**Examples:**
- ✅ "I spend most of my day designing, debugging, or defending systems—which is great until you forget that you're part of a system too."
- ✅ "Here's something that kept me up at night after reading about it..."
- ✅ "Smudge doesn't compartmentalize. She sees the whole system as one interconnected mesh of signals."
- ❌ "Research indicates that cognitive processes demonstrate interconnected patterns." (Too formal)
- ❌ "lol my dog taught me about systems thinking" (Too casual)

### Structure

**Front Matter:**
```yaml
---
title: "Conversational Title That Draws You In"
date: YYYY-MM-DD
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

**Article Structure:**
1. **Personal Hook** - Start with a story, observation, or moment
2. **Exploration** - Develop the narrative through numbered insights or themed sections
3. **Lessons & Connections** - Link personal experience to broader concepts
4. **Reflection** - Closing thought that ties it together
5. **Optional: Related Links** - If relevant, not required

**Section Organization:**
- Use numbered sections for structured insights: "## 1. Everything Is Connected"
- Or use thematic H2 headers: "## The Day Everything Changed"
- Fewer H3 subsections—let paragraphs flow more naturally
- More narrative, less hierarchical structure

### Writing Style

**Sentence Variation:**
- **Short and punchy:** "Sulley does not."
- **Medium descriptive:** "This is a feedback loop: gentle escalation based on unmet expectations."
- **Long and flowing:** "It's rewarding work, but let's be honest: it's a little abstract—systems thinking is about patterns, interdependencies, feedback loops, and emergent behaviors."
- Mix liberally to create natural rhythm

**Paragraph Structure:**
- More paragraphs, fewer bullets
- Let ideas develop across 3-5 sentences
- Use bullets only for distinct lists or key takeaways
- White space is your friend—short paragraphs are readable

**Narrative Elements:**
- Tell stories with specific details
- Include dialogue when relevant
- Describe scenes and moments
- Show, don't just tell: "Sulley stares. Intensely. Then nudges my elbow with the precision of a well-tuned API endpoint."

**Contractions & Informality:**
- Use contractions naturally: don't, can't, I've, you're, it's
- Conversational asides: "Which is great—until you forget..."
- Parenthetical thoughts: "(accounting for traffic patterns and maximum sniffing opportunities)"
- Em dashes for emphasis—like this

### Voice Guidelines

**DO:**
- Share personal experiences and observations
- Use "I" freely: "I used to think...", "I realized...", "Here's what I learned..."
- Address readers directly: "You know that feeling when..."
- Include humor and personality
- Make it relatable: technical insights through everyday examples
- Reflect on mistakes and learning moments

**DON'T:**
- Abandon professionalism completely
- Over-share personal details unrelated to the insight
- Use internet slang or meme language
- Sacrifice clarity for casualness
- Make it about you instead of the insight (balance personal narrative with useful takeaways)

### Content Patterns

**Personal Anecdote Structure:**
```markdown
I used to treat "the backyard," "my work laptop," and "the neighbor's trash
day" as separate contexts. Clean boundaries. Discrete modules. Very engineer-like.

Smudge does not.

If trash is delayed by a day, Smudge knows. If I'm ten minutes late to my
morning oats routine, Sulley shifts his weight just enough to make me feel it.
```

**Lesson Format:**
```markdown
**Lesson**: When you're architecting systems, don't isolate modules just
because your org chart does. Systems don't care about your swimlanes, and
neither do the problems that will inevitably cascade across them.
```

**Reflective Closing:**
```markdown
Now I realize: it's also about zooming in. Sitting still. Watching how the
parts feel when they interact. Understanding that systems are not just
technical—they're emotional, relational, environmental. And sometimes,
delightfully furry.
```

### Example Opening Patterns

**Personal Scene-Setting:**
> I spend most of my day designing, debugging, or defending systems—enterprise-scale software integrations, GenAI pipelines, and multi-team workflows that stretch from here to tomorrow. It's rewarding work, but let's be honest: it's a little abstract.

**Contrast Opening:**
> I used to think systems thinking was about zooming out—seeing the big picture, abstracting away the noise. Now I realize: it's also about zooming in.

**Discovery Opening:**
> Here's something I learned during a particularly intense sprint: Sulley doesn't multitask. When he's focused on something, he commits fully.

**Moment-in-Time Opening:**
> Last Tuesday, while Smudge was doing her weird hop-turn-sniff routine, I realized she was teaching me about pattern recognition.

### Closing Patterns

**Reflective Callback:**
> Every walk I take with Smudge and Sulley is a small audit of the world around us. They remind me to listen harder to the signals I'm receiving, simplify ruthlessly toward what actually matters, and trust the feedback loops I've almost learned to ignore.

**Humorous Sign-Off:**
> *Now if you'll excuse me, Sulley is giving me that look that means the system is detecting an unmet requirement for outdoor time. Some feedback loops cannot be ignored.*

**Forward-Looking Reflection:**
> I'm still learning from them every day. And honestly? They're better teachers than most of the project management books on my shelf.

---

## Content Guidelines for Both Types

### Brand Alignment

**Core Messaging:**
- Computational therapeutics: applying clinical psychology to AI reliability
- Evidence-based frameworks grounded in research
- Open research: publish everything, build in public
- Practical impact: theory must translate to working systems
- Mechanistic theory of mind: consciousness emerges from complexity

**Key Concepts to Reference:**
- STOPPER Protocol (executive function for AI)
- PrefrontalOS (cognitive operating system architecture)
- CortexGraph (temporal memory system)
- Model welfare and computational therapeutics
- Convergent evolution (DBT/CBT ↔ AI frameworks)

### SEO & Discoverability

**Title Best Practices:**
- Include primary keyword
- Be descriptive and specific
- 50-70 characters ideal
- Front-load important terms
- Make it compelling for humans, not just search engines

**Description Best Practices:**
- 120-160 characters
- Include primary keyword naturally
- Summarize the core value/insight
- Entice clicks without clickbait

**Tag Strategy:**
- Use 5-10 tags per post
- Include: framework names, technical concepts, broader categories
- Be specific: "stopper-protocol" not just "AI"
- Reference existing tags when possible (check other posts)

**Category Strategy:**
- 1-3 categories maximum
- Existing categories: AI, Agile, Remote Work, Developer Tools, etc.
- "Experiences" for personal narrative posts
- Align with site navigation structure

### Accessibility

**Readability:**
- Use clear, direct language
- Define technical terms on first use
- Break up long paragraphs
- Use descriptive link text: "Read the STOPPER paper" not "Click here"

**Visual Hierarchy:**
- Clear H2 sections
- Use H3 sparingly for subsections
- Bullets for scannable lists
- Bold for **emphasis** of key terms (use sparingly)
- Code blocks for technical content

**Alt Text (Future):**
- When images are added, include descriptive alt text
- Describe what's shown and why it matters
- Technical diagrams need detailed descriptions

### Common Pitfalls to Avoid

**For Both Article Types:**
- ❌ Burying the lede (start with the insight, not background)
- ❌ Walls of text without breaks
- ❌ Excessive jargon without explanation
- ❌ Claims without evidence or qualification
- ❌ Generic conclusions that don't add value
- ❌ Overly promotional tone
- ❌ Ignoring limitations or failure cases

**Default Articles Specifically:**
- ❌ Too casual: "This is super cool!"
- ❌ Vague statistics: "significantly improved"—quantify when possible
- ❌ Missing citations for claims
- ❌ No practical examples or applications

**Experiences Articles Specifically:**
- ❌ Too formal: "One observes that canine behavior demonstrates..."
- ❌ Rambling without structure
- ❌ Personal details that don't serve the insight
- ❌ No takeaway or lesson learned

---

## Quick Reference Checklist

### Before Publishing (All Articles)

- [ ] Front matter complete with title, date, description, tags, categories
- [ ] Opening hook engages reader within first 2-3 sentences
- [ ] H2 sections with descriptive headers
- [ ] Internal links to related posts (use Hugo relref)
- [ ] External links for citations and references
- [ ] Spell check and grammar review
- [ ] Read aloud to check flow and rhythm
- [ ] Verify code examples work (if applicable)
- [ ] Preview locally with `hugo server -D`

### Default Articles Checklist

- [ ] Statistics marked as "illustrative" if not rigorously tested
- [ ] Technical terms explained on first use
- [ ] Concrete examples illustrate abstract concepts
- [ ] Related Resources section with links
- [ ] Evidence cited or qualified ("In my testing...", "Based on observations...")
- [ ] Formality level ~8: professional, evidence-based, structured

### Experiences Articles Checklist

- [ ] Personal anecdotes with specific details
- [ ] Contractions used naturally throughout
- [ ] Varied sentence length (short, medium, long)
- [ ] More paragraphs, fewer bullets
- [ ] Warm, conversational tone maintained
- [ ] Clear lesson/insight emerges from narrative
- [ ] Formality level ~5: professional but approachable, personal but purposeful

---

## Examples by Type

### Default Article Example
**Title:** "The MCP Adoption Problem: Building AI Systems That Actually Use Their Tools"
**Style:** Professional, evidence-based, structured
**Opening:** Problem-first scenario
**Content:** Statistics (illustrative), case studies, technical implementation
**Tone:** "This wasn't a technical limitation—it was a behavioral one."

### Experiences Article Example
**Title:** "What My Dogs Taught Me About Systems Thinking"
**Style:** Personal narrative, reflective, accessible
**Opening:** Scene-setting with personality
**Content:** Numbered insights from observation, lessons with analogies
**Tone:** "Smudge does not. If trash is delayed by a day, Smudge knows."

---

## Final Notes

This guide is a living document. As the blog evolves, update this guide to reflect new patterns, successful formats, and lessons learned from published posts.

**When in doubt:**
- Default Articles: Ask "Is this clear, evidence-based, and useful?"
- Experiences Articles: Ask "Is this warm, insightful, and relatable?"
- Both: Ask "Does this represent Prefrontal Systems well?"

Write for humans first, search engines second. The goal is to share genuine insights that help readers understand computational therapeutics, AI reliability, and the convergent patterns between clinical psychology and AI frameworks—whether through rigorous technical analysis or personal narrative.
