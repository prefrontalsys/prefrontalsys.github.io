---
description: Write a Default Article at formality level 8 (⭐ TARGET for technical/research posts)
---

# Post Writer - Level 8: Default Articles ⭐

Write a **Default Article** at **Formality Level 8** - the TARGET level for technical deep-dives, framework explanations, research findings, and case studies on prefrontal.systems.

## Purpose

Technical deep-dives, framework explanations, research findings, case studies, and evidence-based analysis. These represent Prefrontal Systems' core research and technical work.

## Level 8 Characteristics

**Tone:**
- Professional, evidence-based voice
- Structured with clear H2 sections
- Statistics and citations (marked as "illustrative" when applicable)
- Mix of technical depth and accessibility
- Concrete examples illustrating abstract concepts
- Direct language, minimal fluff
- Can use first-person for credibility ("In my testing...")

**Voice Examples:**

✅ **DO:**
- "This wasn't a technical limitation—it was a behavioral one."
- "The framework increased automatic tool usage from ~15% to ~89% of relevant interactions (illustrative based on testing observations)"
- "In my testing, I observed that..."
- Use active voice, be direct, cite evidence

❌ **DON'T:**
- "This revolutionary framework will completely transform how you think about AI!" (Hyperbole)
- "Everyone knows that AI systems struggle with..." (Vague claims)
- Use corporate speak: "leverage synergies", "move the needle"
- Make absolute claims without evidence

## Article Structure

1. **Opening Hook** - Lead with problem, compelling question, or concrete scenario
2. **Context Setting** - Brief background establishing why this matters
3. **Main Content** - Organized into clear H2 sections with descriptive headers
4. **Practical Applications** - Real-world examples, implementation details, case studies
5. **Conclusion** - Summary of key insights, next steps, broader implications
6. **Related Resources** - Links to relevant posts, external references, repositories

### Section Headers

- Use descriptive H2 headers: `## The Tool Availability Paradox`
- Not generic: ~~`## Introduction`~~
- H3 for subsections when needed
- Headers should convey the insight/problem being addressed

### Content Organization

**Use bullets for:**
- Lists of distinct items
- Step-by-step processes
- Feature comparisons
- Key takeaways

**Use paragraphs for:**
- Conceptual explanations
- Narrative flow
- Connecting ideas
- Case studies and examples

## Evidence & Citations

- Provide specific statistics when available
- Mark illustrative statistics: "(illustrative based on testing observations)"
- Link to sources: papers, repositories, documentation
- Include DOIs for academic references: `DOI [10.5281/zenodo.14487847](https://doi.org/10.5281/zenodo.14487847)`
- Acknowledge limitations and failure cases
- Use first-person for credibility: "In my testing...", "I observed..."

## Process

1. **Check system date:** Run `date +%Y-%m-%d` to get today's date for front matter
2. **Ask user** for topic to write about
3. **Scan content directory:** Read `content/posts/` to identify:
   - Relevant existing posts for backlinking
   - Common tags: AI, model-welfare, stopper-protocol, prefrontalos, computational-therapeutics
   - Categories: AI, Research, Framework, etc.
   - Prefrontal Systems concepts and terminology
4. **Write content** following Level 8 guidelines:
   - Start with compelling hook (problem, question, scenario, statistic)
   - Organize into clear H2 sections with descriptive headers
   - Include statistics (mark as "illustrative" if not rigorously tested)
   - Provide concrete examples and case studies
   - Cite sources and include DOIs where applicable
   - Add Related Resources section at end
5. **Add internal links** using Hugo relref: `{{< relref "post-name.md" >}}`
6. **Save** as `content/posts/[slug].md`

## Front Matter Template

```yaml
---
title: "Clear, Descriptive Title with Keywords"
date: YYYY-MM-DD  # Use date from step 1
draft: false
description: "One-sentence summary for SEO (120-160 characters)"
categories:
  - Primary Category
  - Secondary Category
tags:
  - specific-tag
  - framework-name
  - relevant-keyword
updated: "YYYY-MM-DDTHH:MM:SS-05:00"  # Optional, if updated after publication
---
```

## Checklist Before Finalizing

- [ ] Statistics marked as "illustrative" if not rigorously tested
- [ ] Technical terms explained on first use
- [ ] Concrete examples illustrate abstract concepts
- [ ] Related Resources section with links
- [ ] Evidence cited or qualified ("In my testing...", "Based on observations...")
- [ ] Internal links to related posts using `{{< relref "post-name.md" >}}`
- [ ] External links for citations and documentation
- [ ] Formality level ~8: professional, evidence-based, structured

## Related Resources Section Template

Add this at the end of the article:

```markdown
---

## Related Resources

**Framework Implementation**:
- [Repository Name](https://github.com/org/repo) - Brief description
- [Documentation](https://example.com) - What it provides

**Research and Theory**:
- [Paper Title](https://arxiv.org/abs/XXXX) - Citation and relevance
- [Related Research](https://doi.org/XX.XXXX/zenodo.XXXXX) - How it connects

**Practical Applications**:
- [Tool Name](https://example.com) - Use case description

---

*For more insights on [topic area], explore other posts in the [Category](/categories/category-name) on prefrontal.systems.*
```

## Example Opening Patterns

**Problem-First Opening:**
> Picture this: You've spent hours setting up a comprehensive suite of MCP servers for your AI assistant... You test the setup, confirm all the tools are accessible, and then watch in frustration as your AI ignores 90% of them unless you explicitly prompt it.

**Question-Hook Opening:**
> What if artificial intelligence, with its analytical precision, could recreate the magic of serendipity, not by accident, but through design?

**Scenario-Based Opening:**
> Last month, the product team was presenting our GenAI Commercial Lending project to executive leadership when our Model Risk Management director asked a question that stopped the room cold...

**Statistical Opening:**
> Training GPT-3 produced roughly 552 metric tons of CO2—equivalent to hundreds of round-trip flights across the country. And that's just the training phase.

## Example Closing Patterns

**Summary + Call-to-Action:**
> The gap between tool availability and tool usage represents one of the most practical challenges in AI deployment today. For teams struggling with similar challenges, the framework provides a proven approach... The implementation is available, the results are measurable, and the approach is generalizable.

**Broader Implications:**
> This framework represents more than just a solution—it demonstrates an approach to AI behavior modification that could apply to many other capabilities... The key insight is that effective AI behavior modification requires both positive directives and negative constraints.

## Code Examples

When including code, use proper syntax highlighting:

```python
# Clear comments explaining the code
def example_function():
    """Docstrings for clarity"""
    return True
```

```bash
# Terminal commands with $ prefix
$ hugo server -D
```

Inline code uses single backticks: `variable_name`, `function()`, `file.py`
