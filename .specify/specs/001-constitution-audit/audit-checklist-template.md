# Constitutional Audit Checklist Template

**Purpose:** Use this checklist for each content file during Phase 2 of the audit
**Auditor:** [Name]
**Date:** [YYYY-MM-DD]

---

## Content File Information

**File Path:** [e.g., content/projects/stopper.md]
**File Type:** [Homepage | Page | Post | Project]
**Title:** [From frontmatter]
**Date:** [From frontmatter]
**Draft Status:** [true | false]

---

## Principle 1: Cognitive Accessibility

### Checks

- [ ] **Clear language:** Content uses direct, clear language (no corporate speak, no jargon without explanation)
- [ ] **Typography:** Atkinson Hyperlegible font referenced (check CSS or theme)
- [ ] **Heading hierarchy:** Logical structure (h1 → h2 → h3, no skips)
- [ ] **Alt text:** All images have descriptive alt text
- [ ] **Color contrast:** If colors used, meets WCAG AA (4.5:1 text, 3:1 UI)
- [ ] **Navigation:** Links and navigation intuitive

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant

### Violations Found

[If issues found, document with specific quotes and line numbers:]

**Example:**
- Line 45: Heading skips from h2 to h4 (missing h3)
- Line 78: Image missing alt text: `![](brain-graph.png)`
- Line 120: Corporate speak: "leverage synergies" should be "combine approaches"

### Remediation Priority

[If violations found, assign priority:]
[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Principle 2: Evidence-Based Communication

### Checks

- [ ] **Source links:** Technical claims include verifiable sources (DOI, arXiv, GitHub)
- [ ] **Limitations:** Honest about limitations and uncertainties where applicable
- [ ] **Verifiable findings:** Research findings can be verified through links
- [ ] **Precise language:** Avoids hyperbole ("revolutionary", "groundbreaking" without evidence)
- [ ] **Citations:** Academic claims properly cited

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant

### Violations Found

[Document with specific quotes:]

**Example:**
- Line 34: "STOPPER reduces errors by 90%" - no source link provided
- Line 67: "Our approach is revolutionary" - unsupported hyperbole
- Line 101: Research finding lacks citation/DOI

### Remediation Priority

[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Principle 3: Open Research Commitment

### Checks

- [ ] **Research links:** Papers linked with DOI or arXiv ID
- [ ] **GitHub repos:** Open source code linked
- [ ] **Methodology:** Research methodology documented (for research pages)
- [ ] **License mentioned:** CC BY-SA 4.0 for content noted where appropriate
- [ ] **Replication:** Enough detail for others to understand/replicate work

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant | [ ] N/A (non-research page)

### Violations Found

[Document missing links:]

**Example:**
- Line 45: "STOPPER paper published on Zenodo" - missing DOI link
- Line 89: "Code available on GitHub" - missing GitHub URL
- Line 120: Mentions research finding but no link to paper

### Remediation Priority

[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Principle 4: Technical Excellence

**Note:** Technical validation done in Phase 3 (Hugo build, link checking). Use this section only if obvious technical issues noticed during content review.

### Checks

- [ ] **Frontmatter syntax:** YAML/TOML properly formatted
- [ ] **Hugo shortcodes:** Properly used (if any)
- [ ] **Internal links:** Use proper Hugo ref/relref or relative paths
- [ ] **No hardcoded URLs:** Dynamic references instead of http://localhost:1313

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant

### Violations Found

**Example:**
- Line 12: Frontmatter syntax error - missing closing quote
- Line 78: Hardcoded localhost URL: `http://localhost:1313/about`

### Remediation Priority

[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Principle 5: Brand Consistency

### Checks

- [ ] **Voice:** Direct, technical, first-principles (not corporate, not excessive praise)
- [ ] **Color palette:** If colors mentioned, match brand guidelines (#1976D2, #37474F, #FAFAFA)
- [ ] **Tagline:** If used, matches "Cognitive architecture for reliable AI systems"
- [ ] **Scale honesty:** Uses "independent researcher" or "small specialized team" (not "enterprise")
- [ ] **Terminology:** Consistent use of "computational therapeutics", "model welfare", etc.

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant

### Violations Found

**Example:**
- Line 23: Corporate speak: "best-in-class solutions" should be "effective approaches"
- Line 56: Scale dishonesty: "our large team" - should be "independent researcher"
- Line 89: Color reference #2196F3 doesn't match brand palette (should be #1976D2)

### Remediation Priority

[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Principle 6: Deployment Safety

**Note:** This principle applies to the audit process itself (testing fixes before deploy), not individual content files. No scoring needed per file.

---

## Principle 7: Content-First Development

### Checks

- [ ] **Content accuracy:** Information is correct and current
- [ ] **Link integrity:** No broken links (check in Phase 3, note obvious ones here)
- [ ] **Clarity:** Content is well-organized with clear hierarchy
- [ ] **No placeholders:** No Lorem ipsum, [TODO], [FIXME], [TBD]
- [ ] **URL stability:** Permalink structure maintained

### Score

[ ] Compliant | [ ] Minor Issues | [ ] Major Issues | [ ] Non-Compliant

### Violations Found

**Example:**
- Line 45: Broken internal link: `[About](/about-us)` should be `[About](/about)`
- Line 78: Placeholder text: "[TODO: add project timeline]"
- Line 120: Outdated information: "launching Q3 2024" but it's 2025 now

### Remediation Priority

[ ] Critical | [ ] High | [ ] Medium | [ ] Low

---

## Overall Assessment

### Summary

**Total Violations:** [Count]
**Highest Priority:** [Critical | High | Medium | Low]
**Estimated Fix Time:** [Quick <15min | Medium 15-60min | Large >60min]

### Notes

[Any additional context, patterns noticed, or recommendations:]

---

## Priority Guidelines

**Critical:**
- Broken internal links (blocks navigation)
- Frontmatter syntax errors (breaks Hugo build)
- Major WCAG violations (makes content inaccessible)

**High:**
- Missing evidence links (violates Principle 2)
- Inconsistent brand voice (violates Principle 5)
- Major heading hierarchy issues (violates Principle 1)
- Placeholder text in production (violates Principle 7)

**Medium:**
- Minor WCAG issues (heading skip from h2 to h4)
- Minor voice inconsistencies
- Missing optional research links

**Low:**
- Enhancements (adding more detail)
- Future improvements (better organization)
- Optional optimizations

---

**Audit Complete:** [ ] Yes | [ ] Needs follow-up

**Next Steps:** Transfer findings to audit-report.md and create tasks in remediation-tasks.md
