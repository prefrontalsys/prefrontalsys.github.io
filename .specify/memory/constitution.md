<!--
Sync Impact Report:
Version: 1.0.0 (Initial constitution)
Date: 2025-11-11
Ratification: 2025-11-11

Changes:
- Initial constitution created based on project documentation
- Established 7 core principles aligned with Prefrontal Systems values
- Defined governance and amendment procedures
- Documented technical standards for Hugo-based website

Templates Status:
✅ .specify/templates/spec-template.md - Created with constitution compliance checklist
✅ .specify/templates/plan-template.md - Created with constitution check section
✅ .specify/templates/tasks-template.md - Created with constitution alignment per task
✅ .specify/templates/checklist-template.md - Created with comprehensive compliance verification

Follow-up TODOs:
- Review constitution after first major feature implementation (recommended: 2026-02-11)
- Consider adding automated accessibility checks to CI/CD pipeline
- Evaluate markdown linting and link checking tools for CI integration
-->

# Prefrontal Systems Website Constitution

**Project:** Prefrontal Systems Website (prefrontalsys.github.io)
**Version:** 1.0.0
**Ratified:** 2025-11-11
**Last Amended:** 2025-11-11

---

## Preamble

This constitution defines the guiding principles, development standards, and governance model for the Prefrontal Systems website repository. The site serves as the public face of Prefrontal Systems LLC, showcasing computational therapeutics research, the STOPPER Protocol, PrefrontalOS, CortexGraph, and related projects.

The principles herein reflect the company's core values: cognitive clarity, evidence-based approaches, open research, practical impact, and honest communication about scale and capabilities.

---

## Core Principles

### Principle 1: Cognitive Accessibility

**Name:** Cognitive Accessibility First

**Rule:** All content, design, and code MUST prioritize cognitive accessibility. This means:
- Typography MUST use Atkinson Hyperlegible font (designed by Braille Institute for cognitive processing)
- Content MUST be direct and clear—no corporate speak or excessive jargon
- Navigation MUST be intuitive and consistent
- Information architecture MUST support graph-based and sequential thinking patterns
- Color contrast MUST meet WCAG AA standards minimum

**Rationale:** Prefrontal Systems' mission centers on cognitive architecture and executive function. Our own website must exemplify these principles. Using Atkinson Hyperlegible creates meta-alignment: a font designed for human cognitive processing used by a company designing cognitive infrastructure for AI.

---

### Principle 2: Evidence-Based Communication

**Name:** Verify Before Publishing

**Rule:** All technical claims, research findings, and project descriptions MUST be:
- Verifiable through linked sources (DOI, arXiv, GitHub repos)
- Honest about limitations and failure cases
- Distinguished between validated findings and active experiments
- Free from hyperbole or unsubstantiated claims
- Updated when new evidence emerges

**Rationale:** From the root CLAUDE.md: "Verify before speculating—search and check rather than guess." This principle applies to content publication. Credibility comes from transparency about what is proven, what is promising, and what is still uncertain.

---

### Principle 3: Open Research Commitment

**Name:** Publish Everything, Build in Public

**Rule:** Content MUST:
- Link to open source repositories (GitHub)
- Reference preprints and publications with DOIs
- Use CC BY-SA 4.0 license for content (attribution required, share-alike)
- Share failure cases alongside successes
- Document implementation details, not just outcomes

Code MUST:
- Use AGPL-3.0 license for site code (copyleft protection)
- Be readable and well-commented
- Include deployment documentation

**Rationale:** From brand values: "Open Research - Publish everything, build in public." Open science establishes prior art, enables replication, and builds community trust.

---

### Principle 4: Technical Excellence

**Name:** Hugo Best Practices and Performance

**Rule:** All development MUST:
- Use Hugo Extended 0.152.2+ (for SCSS/Sass processing)
- Follow Hugo best practices for theme management (never edit submodules directly)
- Maintain clean separation: content/ (markdown), layouts/ (templates), assets/ (processed), static/ (copied as-is)
- Pass Hugo build without errors: `hugo --gc --minify`
- Test locally with `hugo server -D` before committing
- Optimize for fast page loads (minified CSS/JS, optimized images)
- Validate HTML and accessibility with automated tools when possible

**Rationale:** Technical quality reflects brand values. A site about cognitive architecture should be well-architected. Hugo's extended version is non-negotiable for SCSS support. Clean builds prevent deployment failures.

---

### Principle 5: Brand Consistency

**Name:** Unified Visual and Verbal Identity

**Rule:** All content and design MUST adhere to brand guidelines (brand/brand.md):

**Visual:**
- Color palette: Synapse Blue (#1976D2), Cortex Gray (#37474F), Dendron White (#FAFAFA)
- Accent colors: Executive Function Green (#2E7D32), Cognitive Distress Red (#C62828), Hippocampal Amber (#F57C00)
- Typography: Atkinson Hyperlegible for body text

**Verbal:**
- Tagline: "Cognitive architecture for reliable AI systems"
- Direct, technical, first-principles communication
- No corporate speak, no excessive praise
- Honest about scale: "independent researcher" or "small specialized team"

**Rationale:** Brand consistency builds recognition and trust. Verbal identity reflects Scot's communication preferences and ADHD-friendly clarity (no fluff, direct language).

---

### Principle 6: Deployment Safety

**Name:** Test Before Deploy, Deploy Atomically

**Rule:** Deployment MUST follow this workflow:
1. Test locally: `hugo server -D` - verify changes in browser
2. Build test: `hugo --gc --minify` - confirm no build errors
3. Review public/ output if non-obvious changes made
4. Commit to main branch (triggers GitHub Actions)
5. Verify deployment at prefrontal.systems within 5 minutes
6. If deployment fails, investigate via Actions tab, rollback if needed

Never:
- Push untested changes to main
- Edit files directly on GitHub web interface (bypasses local testing)
- Force push to main (destroys history)
- Skip theme submodule updates (`git submodule update --init --recursive`)

**Rationale:** GitHub Pages deployment is automatic from main branch. Broken builds or broken links damage professional credibility. The cost of local testing (2 minutes) is trivial compared to downtime or broken production site.

---

### Principle 7: Content-First Development

**Name:** Function Over Form, Content Over Code

**Rule:** When making changes, prioritize in this order:
1. **Content accuracy** - Is the information correct, current, and complete?
2. **Clarity** - Can the target audience understand this?
3. **Accessibility** - Can people with cognitive or visual differences access this?
4. **Performance** - Does this load quickly?
5. **Aesthetics** - Does this look polished?

Content changes MUST NOT:
- Break existing links (use redirects if URLs must change)
- Remove published research without archiving
- Change technical claims without documentation of why

Code changes MUST NOT:
- Sacrifice content clarity for visual complexity
- Add dependencies without strong justification
- Break accessibility for aesthetic preferences

**Rationale:** From brand values: "Practical Impact - Theory must translate to working systems." The website exists to communicate research and services. Code and design serve content, not the reverse. Broken links or inaccessible content undermine the mission.

---

## Governance

### Amendment Procedure

This constitution may be amended when:
1. **Major changes** (remove/redefine principles): Requires explicit approval in commit message referencing constitution amendment
2. **Minor changes** (add principles, expand guidance): Document in Sync Impact Report
3. **Patch changes** (clarifications, typos): Update version, note in git commit

Version numbering follows semantic versioning:
- **MAJOR**: Backward incompatible governance changes or principle removals
- **MINOR**: New principles added or materially expanded guidance
- **PATCH**: Clarifications, wording, non-semantic refinements

### Compliance Review

Constitution compliance should be reviewed:
- Before each major feature or content addition (does this align with principles?)
- After discovering a principle violation (how do we prevent recurrence?)
- Quarterly or when project direction shifts

### Principle Conflicts

If principles conflict in a specific case:
1. State the conflict explicitly
2. Prioritize based on project mission: Research communication > Aesthetic polish
3. Document the decision and reasoning
4. Consider if constitution needs clarification to prevent future conflicts

### Living Document

This constitution is a living document. It should evolve as:
- New development patterns emerge
- Technical requirements change (Hugo version upgrades, etc.)
- Brand guidelines are refined
- Lessons are learned from incidents or mistakes

Amendments should be proposed via:
- Direct edit with clear commit message
- Discussion in project documentation
- Reference to specific incidents or needs that prompted change

---

## Enforcement

### Automated Checks

Where possible, principles should be enforced via:
- **Build failures** (Principle 4): Hugo build errors block deployment
- **CI checks** (Principle 4): GitHub Actions validate successful builds
- **Linting** (Principle 5): Markdown linting, link checking (future)
- **Accessibility tests** (Principle 1): Automated WCAG checks (future)

### Manual Reviews

Human review is required for:
- **Content accuracy** (Principle 2): Verify sources, check claims
- **Brand consistency** (Principle 5): Ensure tone and terminology match guidelines
- **Content-first priorities** (Principle 7): Judge if changes serve the mission

### Violation Response

If a principle is violated:
1. Identify which principle was violated and how
2. Assess impact: Does this need immediate rollback or can it be fixed forward?
3. Implement fix
4. Document in commit message: "Fix: [Principle X violation] - [what was wrong] - [how fixed]"
5. Consider: Does this indicate constitution needs clarification or tooling needs improvement?

---

## Interpretation

When in doubt about how to apply these principles:

1. **Ask:** What serves the project's mission (communicating computational therapeutics research)?
2. **Consult:** CLAUDE.md files (project-specific guidance) and brand.md (brand guidelines)
3. **Default:** Cognitive accessibility (Principle 1) and evidence-based communication (Principle 2) are foundational—when principles conflict, these take precedence
4. **Document:** If interpretation was unclear, propose constitution amendment to clarify for future

This constitution reflects the values stated in brand.md: "Cognitive Clarity, Evidence-Based, Open Research, Practical Impact, Honest Scale."

---

**End of Constitution v1.0.0**

*Next Review: 2026-02-11 (quarterly) or upon major feature addition*
