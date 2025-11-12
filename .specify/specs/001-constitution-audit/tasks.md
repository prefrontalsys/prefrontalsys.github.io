# Implementation Tasks: Constitution Compliance Audit

**Feature Spec:** [spec.md](./spec.md)
**Implementation Plan:** [plan.md](./plan.md)
**Created:** 2025-11-11
**Last Updated:** 2025-11-11

---

## Task Overview

**Total Tasks:** 44
**Estimated Effort:** 6-10 hours
**Current Status:** Not Started

### Progress Summary
- [ ] Phase 1: Setup & Content Inventory - 0/6 tasks complete
- [ ] Phase 2: Constitutional Principle Audit - 0/12 tasks complete
- [ ] Phase 3: Technical Validation - 0/6 tasks complete
- [ ] Phase 4: Report Generation - 0/6 tasks complete
- [ ] Phase 5: Content Remediation - 0/10 tasks complete
- [ ] Phase 6: Testing & Deployment - 0/4 tasks complete

---

## Task Dependency Graph

```
Phase 1 (Setup):
[T001] → [T002] → [T003]
      ↓
    [T004] → [T005] → [T006]

Phase 2 (Audit):
[T001-T006] → [T007-T018 can run in parallel]

Phase 3 (Technical):
[T007-T018] → [T019-T024 can run in parallel]

Phase 4 (Reports):
[T019-T024] → [T025] → [T026-T028 in parallel] → [T029] → [T030]

Phase 5 (Remediation):
[T030] → [T031-T040 prioritized by severity]

Phase 6 (Testing):
[T031-T040] → [T041] → [T042] → [T043] → [T044]
```

**Legend:**
- `→` : Task dependency (must complete before next)
- Tasks on same level can be done in parallel
- `[P]` marker indicates parallel-safe tasks

---

## Phase 1: Setup & Content Inventory

### Task 1.1: Create Audit Checklist Template

**Status:** [ ] Not Started

**Description:**
Verify or create the audit checklist template for per-file constitutional principle audits.

**Acceptance Criteria:**
- [ ] File exists at `.specify/specs/001-constitution-audit/audit-checklist-template.md`
- [ ] Template includes sections for all 7 constitutional principles
- [ ] Each principle section has specific checks derived from constitution.md
- [ ] Template includes scoring mechanism (Compliant | Minor Issues | Major Issues | Non-Compliant)
- [ ] Template includes violation documentation fields

**Dependencies:**
- Requires: None
- Blocks: Task 1.3, Phase 2 (audit tasks)

**Estimated Effort:** 5-10 minutes (verify existing or create)

**Implementation Notes:**
Template already created during planning phase - verify it's complete. Should include:
- Principle 1: Cognitive Accessibility (Atkinson Hyperlegible, WCAG AA, clear navigation)
- Principle 2: Evidence-Based (citations, sources, verifiability)
- Principle 3: Open Research (GitHub links, DOIs, license clarity)
- Principle 4: Technical Excellence (frontmatter, Hugo best practices)
- Principle 5: Brand Consistency (color codes, tagline, messaging)
- Principle 6: Deployment Safety (N/A for content audit)
- Principle 7: Content-First (clarity, directness, no corporate speak)

**Constitution Alignment:**
- All 7 principles (checklist validates compliance)

---

### Task 1.2: Generate Content Inventory

**Status:** [ ] Not Started

**Description:**
Create comprehensive list of all markdown content files in the Hugo site.

**Acceptance Criteria:**
- [ ] File created at `.specify/specs/001-constitution-audit/content-inventory.txt`
- [ ] List includes all `.md` files in `content/` directory (recursive)
- [ ] Files sorted alphabetically
- [ ] Count matches expected pages (cross-check with site navigation)

**Dependencies:**
- Requires: None (can run in parallel with Task 1.1)
- Blocks: Task 1.3, Phase 2 (audit tasks)

**Estimated Effort:** 2-5 minutes

**Implementation Notes:**
```bash
# Run from repo root
find content -name "*.md" -type f | sort > .specify/specs/001-constitution-audit/content-inventory.txt

# Count files
wc -l .specify/specs/001-constitution-audit/content-inventory.txt

# Expected sections: _index.md, about.md, contact.md, publications.md, services.md, posts/*, projects/*
```

**Constitution Alignment:**
- Principle 7 (Content-First): Ensures complete coverage of all content

---

### Task 1.3: Extract Frontmatter Metadata

**Status:** [ ] Not Started

**Description:**
Parse frontmatter from all content files to create structured metadata inventory.

**Acceptance Criteria:**
- [ ] Spreadsheet/CSV created at `.specify/specs/001-constitution-audit/content-metadata.csv`
- [ ] Columns: File Path, Title, Date, Draft Status, Description, Tags, Categories
- [ ] All files from content-inventory.txt processed
- [ ] Missing/incomplete frontmatter flagged

**Dependencies:**
- Requires: Task 1.2 (content inventory)
- Blocks: Phase 2 (audit tasks)

**Estimated Effort:** 15-30 minutes

**Implementation Notes:**
Can use bash script with `sed`/`awk` or simple Python script:
```bash
#!/usr/bin/env bash
# For each file in content-inventory.txt
while IFS= read -r file; do
    title=$(grep '^title:' "$file" | sed 's/title: *//')
    date=$(grep '^date:' "$file" | sed 's/date: *//')
    draft=$(grep '^draft:' "$file" | sed 's/draft: *//')
    # ... extract other fields
    echo "$file,$title,$date,$draft,..." >> content-metadata.csv
done < content-inventory.txt
```

**Constitution Alignment:**
- Principle 4 (Technical Excellence): Validates frontmatter completeness
- Principle 7 (Content-First): Ensures metadata supports discoverability

---

### Task 1.4: Set Up Audit Report Template

**Status:** [ ] Not Started

**Description:**
Verify or create the compliance report template structure.

**Acceptance Criteria:**
- [ ] File exists at `.specify/specs/001-constitution-audit/audit-report.md`
- [ ] Template includes executive summary section
- [ ] Template includes sections for each of 7 principles
- [ ] Template includes statistics section (compliance percentages)
- [ ] Template includes detailed findings table structure

**Dependencies:**
- Requires: None (can run in parallel with Tasks 1.1-1.3)
- Blocks: Phase 4 (report generation)

**Estimated Effort:** 5 minutes (verify existing template)

**Implementation Notes:**
Template already created during planning phase - verify structure includes:
- Executive Summary (overview, key findings, recommendations)
- Compliance by Principle (7 sections)
- Statistics (compliance percentages, violation counts)
- Detailed Findings (table with File, Principle, Severity, Issue, Recommendation)
- Recommendations (prioritized action items)

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Report structure supports verifiable findings

---

### Task 1.5: Set Up Remediation Task List Template

**Status:** [ ] Not Started

**Description:**
Verify or create the remediation task list template.

**Acceptance Criteria:**
- [ ] File exists at `.specify/specs/001-constitution-audit/remediation-tasks.md`
- [ ] Template includes priority sections (Critical, High, Medium, Low)
- [ ] Template includes task format: checkbox, file, issue, fix, effort estimate
- [ ] Template includes summary statistics section

**Dependencies:**
- Requires: None (can run in parallel with Tasks 1.1-1.4)
- Blocks: Phase 4 (report generation), Phase 5 (remediation)

**Estimated Effort:** 5 minutes (verify existing template)

**Implementation Notes:**
Template already created during planning phase - verify structure.

**Constitution Alignment:**
- Principle 7 (Content-First): Actionable tasks support clear execution

---

### Task 1.6: Create Audit Working Directory

**Status:** [ ] Not Started

**Description:**
Set up directory structure for audit artifacts (checklists, notes, evidence).

**Acceptance Criteria:**
- [ ] Directory created at `.specify/specs/001-constitution-audit/audit-working/`
- [ ] Subdirectories: `checklists/`, `screenshots/`, `notes/`
- [ ] README.md in audit-working/ explaining structure

**Dependencies:**
- Requires: None (can run in parallel with Tasks 1.1-1.5)
- Blocks: Phase 2 (audit tasks need working directory)

**Estimated Effort:** 5 minutes

**Implementation Notes:**
```bash
mkdir -p .specify/specs/001-constitution-audit/audit-working/{checklists,screenshots,notes}

# Create README
cat > .specify/specs/001-constitution-audit/audit-working/README.md << 'EOF'
# Audit Working Directory

## Structure

- **checklists/** - Completed audit checklists for each content file
- **screenshots/** - Evidence screenshots (accessibility, color contrast, etc.)
- **notes/** - Reviewer notes and observations during audit

## Naming Convention

- Checklists: `{filename-without-extension}-checklist.md`
- Screenshots: `{filename}-{principle}-{issue-description}.png`
- Notes: Free-form
EOF
```

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Organized evidence supports verifiable findings

---

## Phase 2: Constitutional Principle Audit

### Task 2.1: Audit Homepage (_index.md)

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on homepage content against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/index-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Use audit-checklist-template.md. Focus areas:
- Principle 1: Font usage (should be Atkinson Hyperlegible), color contrast
- Principle 2: Any claims must have citations
- Principle 3: Links to GitHub, papers
- Principle 5: Tagline ("Cognitive architecture for reliable AI systems"), brand colors
- Principle 7: Clarity, directness, no buzzwords

**Constitution Alignment:**
- All 7 principles (comprehensive audit)

---

### Task 2.2: Audit About Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on about.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/about-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Focus on:
- Research philosophy descriptions (Evidence-Based, Verify-first principles)
- Links to CV, ORCID, publications
- Brand consistency (independent researcher scale, honest positioning)

**Constitution Alignment:**
- All 7 principles (comprehensive audit)

---

### Task 2.3: Audit Publications Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on publications.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/publications-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Violations documented with specific examples
- [ ] All publication links verified (DOI, arXiv, Zenodo)
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 25-35 minutes

**Implementation Notes:**
Critical page for Principle 2 (Evidence-Based) and Principle 3 (Open Research).
- Every publication must have DOI or arXiv link
- CC-BY 4.0 licensing noted
- Paper descriptions accurate and verifiable
- Links functional (will be validated in Phase 3)

**Constitution Alignment:**
- Principles 2, 3 (primary), all others (secondary)

---

### Task 2.4: Audit Services Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on services.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/services-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Focus on:
- Clear, direct service descriptions (no corporate speak)
- Evidence-based value propositions
- Honest scale ("independent researcher" vs inflated claims)
- Brand consistency

**Constitution Alignment:**
- Principles 2, 5, 7 (primary), all others (secondary)

---

### Task 2.5: Audit Contact Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on contact.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/contact-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Form accessibility verified (keyboard navigation, labels)
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Focus on:
- Principle 1: Form accessibility (labels, keyboard nav, WCAG AA)
- Principle 4: w3forms integration correct, error handling
- Principle 7: Clear instructions, no unnecessary fields

**Constitution Alignment:**
- Principles 1, 4 (primary), all others (secondary)

---

### Task 2.6: Audit All Blog Posts (posts/*)

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on all blog posts against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed for EACH post at `audit-working/checklists/{post-slug}-checklist.md`
- [ ] All 7 principles assessed with scores for each post
- [ ] Common patterns documented (applies to multiple posts)
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 1-2 hours (depends on post count, estimate 15-20 min/post)

**Implementation Notes:**
Batch process for efficiency:
1. List all posts from content-inventory.txt
2. For each post, create checklist from template
3. Look for common patterns (e.g., all posts missing citations)
4. Document pattern-based findings separately

Focus on:
- Technical claims must have citations (Principle 2)
- Code examples follow best practices (Principle 4)
- Clear, direct writing (Principle 7)

**Constitution Alignment:**
- All 7 principles (comprehensive audit per post)

---

### Task 2.7: Audit STOPPER Project Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on projects/stopper.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/stopper-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] STOPPER paper citation verified (Zenodo DOI 10.5281/zenodo.14487847)
- [ ] Convergent evolution claims supported by evidence
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 25-35 minutes

**Implementation Notes:**
High-profile project page - critical for Principles 2 and 3:
- Paper link must be functional
- DBT STOP convergence claim must cite Linehan 1993
- Timing windows (0-10s, 10-30s, 30+s) explained clearly
- GitHub repo linked

**Constitution Alignment:**
- Principles 2, 3 (primary), all others (secondary)

---

### Task 2.8: Audit PrefrontalOS Project Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on projects/prefrontalos.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/prefrontalos-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Three-tier architecture description verified (Traffic Analysis, Task Agent, Infrastructure)
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 25-35 minutes

**Implementation Notes:**
Verify technical architecture description is accurate and supported by references.

**Constitution Alignment:**
- Principles 2, 4 (primary), all others (secondary)

---

### Task 2.9: Audit CortexGraph Project Page

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on projects/cortexgraph.md against all 7 principles.

**Acceptance Criteria:**
- [ ] Checklist completed at `audit-working/checklists/cortexgraph-checklist.md`
- [ ] All 7 principles assessed with scores
- [ ] Temporal memory system description verified (hippocampus-cortex model)
- [ ] PyPI link verified (if published)
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 25-35 minutes

**Implementation Notes:**
Verify:
- Spaced repetition algorithm description accurate
- GitHub repo linked
- Installation instructions correct

**Constitution Alignment:**
- Principles 2, 3, 4 (primary), all others (secondary)

---

### Task 2.10: Audit Remaining Project Pages

**Status:** [ ] Not Started

**Description:**
Perform constitutional compliance audit on any remaining project pages not covered in Tasks 2.7-2.9.

**Acceptance Criteria:**
- [ ] Checklist completed for EACH remaining project at `audit-working/checklists/{project-slug}-checklist.md`
- [ ] All 7 principles assessed with scores for each project
- [ ] Violations documented with specific examples
- [ ] Evidence captured (screenshots if needed)
- [ ] Recommendations drafted for any issues

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** Variable (20-30 min per project)

**Implementation Notes:**
Check content-inventory.txt for any projects/* files not explicitly covered above.

**Constitution Alignment:**
- All 7 principles (comprehensive audit per project)

---

### Task 2.11: Audit Custom Layouts/Shortcodes

**Status:** [ ] Not Started

**Description:**
Audit custom Hugo layouts and shortcodes for constitutional compliance.

**Acceptance Criteria:**
- [ ] Checklist created for `layouts/shortcodes/contact-form.html`
- [ ] Custom CSS files audited (`assets/css/contact-form.css`, `sticky-nav.css`)
- [ ] Custom JS audited (`assets/js/email-obfuscate.js`)
- [ ] Accessibility issues identified (WCAG AA)
- [ ] Brand consistency verified (color codes)
- [ ] Violations documented

**Dependencies:**
- Requires: Phase 1 complete (Tasks 1.1-1.6)
- Blocks: Task 4.1 (report aggregation)

**Estimated Effort:** 30-45 minutes

**Implementation Notes:**
Check:
- Contact form: labels, ARIA attributes, keyboard navigation
- CSS: Color contrast ratios (use browser dev tools)
- JS: Email obfuscation doesn't break accessibility
- All custom code follows Hugo best practices

**Constitution Alignment:**
- Principles 1, 4 (primary), all others (secondary)

---

### Task 2.12: Document Audit Patterns & Common Issues

**Status:** [ ] Not Started

**Description:**
Synthesize audit findings into pattern document identifying common/systemic issues.

**Acceptance Criteria:**
- [ ] Document created at `audit-working/notes/common-patterns.md`
- [ ] Patterns categorized by principle
- [ ] Frequency/impact noted for each pattern
- [ ] Root causes identified (e.g., "All posts lack citations" → "No citation requirement in template")
- [ ] Systemic fixes proposed

**Dependencies:**
- Requires: Tasks 2.1-2.11 (all content audited)
- Blocks: Phase 4 (report generation benefits from patterns)

**Estimated Effort:** 30-45 minutes

**Implementation Notes:**
Look for:
- Repeated violations across multiple pages (indicates systemic issue)
- Template-level problems (fix once, applies to all)
- Configuration issues (frontmatter defaults, Hugo config)

Examples:
- "12 of 15 blog posts lack citations" → Pattern: Citation requirement not enforced
- "Contact form and homepage both fail WCAG color contrast" → Pattern: Color palette needs adjustment

**Constitution Alignment:**
- All 7 principles (synthesis identifies systemic compliance gaps)

---

## Phase 3: Technical Validation

### Task 3.1: Run Link Checker on All Content

**Status:** [ ] Not Started

**Description:**
Execute check-links.sh script to validate all internal and external links.

**Acceptance Criteria:**
- [ ] Script executed: `.specify/scripts/bash/check-links.sh content/`
- [ ] Results saved to `audit-working/link-check-report.txt`
- [ ] All broken links documented with file location
- [ ] Internal vs external link breakage categorized
- [ ] Findings added to remediation task list

**Dependencies:**
- Requires: Phase 1 complete (content inventory)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 10-15 minutes (script runtime + review)

**Implementation Notes:**
```bash
# Run from repo root
.specify/scripts/bash/check-links.sh content/ > .specify/specs/001-constitution-audit/audit-working/link-check-report.txt

# Review output
cat .specify/specs/001-constitution-audit/audit-working/link-check-report.txt

# Broken links become High priority remediation tasks
```

**Constitution Alignment:**
- Principle 4 (Technical Excellence): No broken links
- Principle 6 (Deployment Safety): Verify integrity before deploy

---

### Task 3.2: Verify Hugo Build (Production Mode)

**Status:** [ ] Not Started

**Description:**
Build site in production mode and verify no errors or warnings.

**Acceptance Criteria:**
- [ ] Command executed: `hugo --gc --minify`
- [ ] Build completes with exit code 0
- [ ] No error messages in output
- [ ] No warning messages about missing files, invalid frontmatter, etc.
- [ ] public/ directory created successfully
- [ ] Build log saved to `audit-working/hugo-build.log`

**Dependencies:**
- Requires: None (can run in parallel with Phase 2)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 5 minutes

**Implementation Notes:**
```bash
# Clean previous build
rm -rf public/ resources/

# Build production mode
hugo --gc --minify 2>&1 | tee .specify/specs/001-constitution-audit/audit-working/hugo-build.log

# Check exit code
echo $?  # Should be 0

# Verify public/ exists and has content
ls -lh public/
```

Any errors/warnings become High priority remediation tasks.

**Constitution Alignment:**
- Principle 4 (Technical Excellence): Clean builds
- Principle 6 (Deployment Safety): Verify build before deploy

---

### Task 3.3: Validate Frontmatter Completeness

**Status:** [ ] Not Started

**Description:**
Check all content files for required frontmatter fields (title, date, description).

**Acceptance Criteria:**
- [ ] Script/manual check of all files in content-metadata.csv (from Task 1.3)
- [ ] Missing fields documented per file
- [ ] Recommendations for default values or additions
- [ ] Findings added to remediation task list

**Dependencies:**
- Requires: Task 1.3 (frontmatter metadata extraction)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 15-20 minutes

**Implementation Notes:**
Review content-metadata.csv:
- Every file should have: title, date, draft status
- Public pages should have: description (for SEO)
- Blog posts should have: tags, categories

Missing fields = Medium priority remediation (not broken, but suboptimal).

**Constitution Alignment:**
- Principle 4 (Technical Excellence): Complete metadata
- Principle 7 (Content-First): Discoverability via descriptions

---

### Task 3.4: Test Color Contrast (WCAG AA)

**Status:** [ ] Not Started

**Description:**
Verify all color combinations meet WCAG AA contrast ratios (4.5:1 normal text, 3:1 large text).

**Acceptance Criteria:**
- [ ] Homepage color contrast checked (browser dev tools or online tool)
- [ ] All brand colors tested against white and gray backgrounds
- [ ] Failing combinations documented
- [ ] Screenshots saved to `audit-working/screenshots/`
- [ ] Findings added to remediation task list

**Dependencies:**
- Requires: None (can run in parallel with Phase 2)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 15-20 minutes

**Implementation Notes:**
Test brand colors from brand.md:
- Synapse Blue (#1976D2) on Dendron White (#FAFAFA)
- Cortex Gray (#37474F) on Dendron White
- All text combinations

Use browser dev tools (Chrome DevTools has built-in contrast checker) or online tool:
- https://webaim.org/resources/contrastchecker/

Failing combinations = High priority (accessibility violation).

**Constitution Alignment:**
- Principle 1 (Cognitive Accessibility): WCAG AA compliance required

---

### Task 3.5: Verify Font Loading (Atkinson Hyperlegible)

**Status:** [ ] Not Started

**Description:**
Confirm Atkinson Hyperlegible font loads correctly on all pages.

**Acceptance Criteria:**
- [ ] Homepage inspected (browser dev tools → Computed → font-family)
- [ ] Font files present in `static/fonts/` or CDN configured
- [ ] Fallback fonts specified in CSS
- [ ] No FOUT (Flash of Unstyled Text) or FOIT (Flash of Invisible Text)
- [ ] Findings documented

**Dependencies:**
- Requires: None (can run in parallel with Phase 2)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 10 minutes

**Implementation Notes:**
Check:
1. `hugo.toml` or theme CSS for font-family declaration
2. Font files in static/fonts/ or link to Google Fonts/CDN
3. Browser dev tools → Network tab → filter "font" → verify load
4. Computed style on body element shows Atkinson Hyperlegible

If not using Atkinson Hyperlegible = Critical violation (Principle 1 core requirement).

**Constitution Alignment:**
- Principle 1 (Cognitive Accessibility): Atkinson Hyperlegible required

---

### Task 3.6: Test Keyboard Navigation

**Status:** [ ] Not Started

**Description:**
Verify all interactive elements accessible via keyboard (tab, enter, arrow keys).

**Acceptance Criteria:**
- [ ] Homepage navigation tested (tab through all links)
- [ ] Contact form tested (tab order logical, submit with enter)
- [ ] All interactive elements have visible focus indicators
- [ ] No keyboard traps (can tab forward and backward)
- [ ] Findings documented

**Dependencies:**
- Requires: None (can run in parallel with Phase 2)
- Blocks: Task 4.2 (technical findings in report)

**Estimated Effort:** 15-20 minutes

**Implementation Notes:**
Test procedure:
1. Open homepage in browser
2. Press Tab key repeatedly, verify:
   - Tabbing through all navigation links
   - Visible focus outline on each element
   - Logical tab order (top to bottom, left to right)
3. Test contact form:
   - Tab through all fields
   - Enter submits form
   - Error messages keyboard-accessible
4. Test other interactive elements (buttons, links, accordions)

Missing focus indicators or broken tab order = High priority (accessibility violation).

**Constitution Alignment:**
- Principle 1 (Cognitive Accessibility): Keyboard accessibility required

---

## Phase 4: Report Generation

### Task 4.1: Aggregate Audit Findings into Report

**Status:** [ ] Not Started

**Description:**
Compile all audit checklists into the compliance report using audit-report.md template.

**Acceptance Criteria:**
- [ ] File updated at `.specify/specs/001-constitution-audit/audit-report.md`
- [ ] Executive summary written (2-3 paragraphs)
- [ ] Each principle section populated with findings
- [ ] Statistics calculated (compliance percentages per principle)
- [ ] Detailed findings table complete (File, Principle, Severity, Issue, Recommendation)
- [ ] Report reviewed for clarity and accuracy

**Dependencies:**
- Requires: Phase 2 complete (Tasks 2.1-2.12), Task 3.1-3.6 (technical validation)
- Blocks: Task 4.4 (final review)

**Estimated Effort:** 1-1.5 hours

**Implementation Notes:**
Process:
1. Review all completed checklists in `audit-working/checklists/`
2. For each principle, summarize compliance across all content
3. Calculate percentages: (compliant files / total files) * 100
4. Populate detailed findings table with most critical issues first
5. Write executive summary highlighting key patterns from Task 2.12

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Verifiable, documented findings

---

### Task 4.2: Aggregate Technical Validation Findings

**Status:** [ ] Not Started

**Description:**
Add technical validation findings to compliance report.

**Acceptance Criteria:**
- [ ] Link check results added to report
- [ ] Hugo build status documented
- [ ] Frontmatter completeness findings added
- [ ] Color contrast violations listed
- [ ] Font loading status documented
- [ ] Keyboard navigation issues listed
- [ ] All technical issues prioritized (Critical/High/Medium/Low)

**Dependencies:**
- Requires: Phase 3 complete (Tasks 3.1-3.6)
- Blocks: Task 4.3 (remediation task list)

**Estimated Effort:** 30 minutes

**Implementation Notes:**
Add technical findings to dedicated section in audit-report.md:
- Link Check Results: X broken internal links, Y broken external links
- Build Status: Clean build OR errors/warnings listed
- Frontmatter: X files missing required fields
- WCAG AA: X color combinations fail contrast
- Font Loading: Verified OR issues listed
- Keyboard Nav: Verified OR issues listed

**Constitution Alignment:**
- Principles 1, 4, 6 (Technical Excellence, Accessibility, Deployment Safety)

---

### Task 4.3: Generate Prioritized Remediation Task List

**Status:** [ ] Not Started

**Description:**
Create prioritized, actionable task list from all audit findings using remediation-tasks.md template.

**Acceptance Criteria:**
- [ ] File updated at `.specify/specs/001-constitution-audit/remediation-tasks.md`
- [ ] Tasks organized by priority (Critical, High, Medium, Low)
- [ ] Each task includes: checkbox, file path, issue, fix, effort estimate
- [ ] Tasks numbered/IDs for tracking
- [ ] Summary statistics (total tasks, total effort, 80% target)

**Dependencies:**
- Requires: Tasks 4.1, 4.2 (all findings aggregated)
- Blocks: Phase 5 (remediation execution)

**Estimated Effort:** 45-60 minutes

**Implementation Notes:**
Priority definitions:
- **Critical**: Breaks functionality, major accessibility violation, core principle violated (Principle 1 font, WCAG failures)
- **High**: Significant compliance issue, broken links, missing citations for claims
- **Medium**: Incomplete frontmatter, minor brand inconsistencies, style issues
- **Low**: Nice-to-have improvements, typos, cosmetic issues

Format:
```markdown
### Critical Priority (X tasks, Y hours)

- [ ] C001: Fix color contrast in navigation - homepage (`_index.md`)
  - Issue: Navigation text (#1976D2) on white background fails WCAG AA (3.2:1 ratio, need 4.5:1)
  - Fix: Darken text color to #0D47A1 or add white background behind navigation
  - Effort: 15 minutes
```

**Constitution Alignment:**
- All 7 principles (prioritization ensures critical issues fixed first)

---

### Task 4.4: Review and Finalize Report

**Status:** [ ] Not Started

**Description:**
Conduct final review of compliance report and remediation task list.

**Acceptance Criteria:**
- [ ] Report reviewed for clarity, completeness, accuracy
- [ ] All findings traceable to audit checklists (evidence)
- [ ] Statistics double-checked
- [ ] Recommendations actionable and specific
- [ ] No grammatical/formatting errors
- [ ] Report ready for stakeholder review

**Dependencies:**
- Requires: Tasks 4.1-4.3 (all report sections complete)
- Blocks: Phase 5 (remediation begins)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Review checklist:
- Executive summary accurately reflects findings
- Principle sections complete (all 7)
- Statistics add up correctly
- Detailed findings table has file paths and recommendations
- Remediation task list prioritized logically
- No placeholders or incomplete sections

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Final verification of verifiable findings

---

### Task 4.5: Document Audit Methodology

**Status:** [ ] Not Started

**Description:**
Create methodology document explaining audit process for reproducibility and future audits.

**Acceptance Criteria:**
- [ ] Document created at `audit-working/notes/audit-methodology.md`
- [ ] Process steps documented (setup, audit, validation, reporting)
- [ ] Tools used listed (scripts, browser dev tools, online validators)
- [ ] Time estimates documented (actual vs planned)
- [ ] Lessons learned noted
- [ ] Recommendations for next audit

**Dependencies:**
- Requires: Tasks 4.1-4.4 (audit complete)
- Blocks: None (documentation task)

**Estimated Effort:** 30 minutes

**Implementation Notes:**
Document should enable someone else to:
1. Understand how audit was conducted
2. Reproduce results independently
3. Conduct future audits more efficiently

Include:
- Audit checklist usage
- Script commands run
- Browser tools/settings used
- Challenges encountered and solutions
- Improvements for next time

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Reproducible methodology

---

### Task 4.6: Present Findings (Optional)

**Status:** [ ] Not Started

**Description:**
Create presentation or summary for stakeholder review if needed.

**Acceptance Criteria:**
- [ ] Presentation format chosen (slides, doc, verbal)
- [ ] Key findings highlighted (top 5 critical issues)
- [ ] Remediation plan summarized (priorities, timeline, effort)
- [ ] Stakeholder questions addressed

**Dependencies:**
- Requires: Task 4.4 (final report ready)
- Blocks: None (optional task)

**Estimated Effort:** 30-45 minutes (if needed)

**Implementation Notes:**
For independent researcher (Scot), this may be internal review only. If presenting to collaborators or for blog post, create:
- Executive summary (1 page)
- Top 5 findings with examples
- Remediation roadmap

**Constitution Alignment:**
- Principle 7 (Content-First): Clear communication of findings

---

## Phase 5: Content Remediation

### Task 5.1: Fix Critical Priority Issues

**Status:** [ ] Not Started

**Description:**
Address all Critical priority tasks from remediation-tasks.md.

**Acceptance Criteria:**
- [ ] All Critical tasks completed (checked off in remediation-tasks.md)
- [ ] Changes verified in local Hugo server (`hugo server -D`)
- [ ] No regressions introduced
- [ ] Evidence of fixes captured (before/after screenshots if applicable)

**Dependencies:**
- Requires: Task 4.3 (remediation task list)
- Blocks: Task 5.3 (verification), Phase 6 (testing)

**Estimated Effort:** Variable (see remediation-tasks.md, typically 1-2 hours for Critical)

**Implementation Notes:**
Focus on:
- Accessibility violations (color contrast, font, keyboard nav)
- Broken functionality (contact form, navigation)
- Core principle violations (Principle 1 requirements)

Work systematically through Critical section of remediation-tasks.md, checking off each task as completed.

**Constitution Alignment:**
- Principles 1, 4, 6 (Cognitive Accessibility, Technical Excellence, Deployment Safety)

---

### Task 5.2: Fix High Priority Issues

**Status:** [ ] Not Started

**Description:**
Address all High priority tasks from remediation-tasks.md.

**Acceptance Criteria:**
- [ ] All High tasks completed (checked off in remediation-tasks.md)
- [ ] Changes verified in local Hugo server
- [ ] No regressions introduced
- [ ] 80% compliance target achieved (Critical + High complete)

**Dependencies:**
- Requires: Task 5.1 (Critical issues fixed)
- Blocks: Task 5.3 (verification), Phase 6 (testing)

**Estimated Effort:** Variable (see remediation-tasks.md, typically 2-3 hours for High)

**Implementation Notes:**
Focus on:
- Broken links (internal and external)
- Missing citations for technical claims
- Brand consistency issues (tagline, colors, messaging)
- Incomplete frontmatter affecting SEO

Work systematically through High section of remediation-tasks.md.

**Constitution Alignment:**
- Principles 2, 3, 5 (Evidence-Based, Open Research, Brand Consistency)

---

### Task 5.3: Verify Critical & High Fixes

**Status:** [ ] Not Started

**Description:**
Re-audit fixed pages to confirm Critical and High issues resolved.

**Acceptance Criteria:**
- [ ] All Critical fixes verified (run relevant checks again)
- [ ] All High fixes verified
- [ ] No new issues introduced (spot-check surrounding content)
- [ ] Compliance percentages recalculated (should show improvement)

**Dependencies:**
- Requires: Tasks 5.1, 5.2 (Critical and High issues fixed)
- Blocks: Phase 6 (testing)

**Estimated Effort:** 30-45 minutes

**Implementation Notes:**
Verification methods:
- Broken links: Re-run check-links.sh
- Color contrast: Re-test in browser dev tools
- Citations: Spot-check fixed pages
- Frontmatter: Re-check content-metadata.csv

If any fixes failed or incomplete, return to Tasks 5.1/5.2.

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Verify fixes are effective

---

### Task 5.4: Fix Medium Priority Issues (Optional)

**Status:** [ ] Not Started

**Description:**
Address Medium priority tasks if time allows.

**Acceptance Criteria:**
- [ ] Medium tasks completed (as many as time allows)
- [ ] Changes verified in local Hugo server
- [ ] No regressions introduced

**Dependencies:**
- Requires: Task 5.3 (Critical and High verified)
- Blocks: None (optional optimization)

**Estimated Effort:** Variable (1-2 hours for Medium tasks)

**Implementation Notes:**
Medium priority includes:
- Incomplete frontmatter (non-critical fields)
- Minor brand inconsistencies
- Style improvements
- Nice-to-have enhancements

**Constitution Alignment:**
- All principles (incremental improvement)

---

### Task 5.5: Fix Low Priority Issues (Optional)

**Status:** [ ] Not Started

**Description:**
Address Low priority tasks if time allows.

**Acceptance Criteria:**
- [ ] Low tasks completed (as many as time allows)
- [ ] Changes verified in local Hugo server
- [ ] No regressions introduced

**Dependencies:**
- Requires: Task 5.4 (Medium complete or skipped)
- Blocks: None (optional optimization)

**Estimated Effort:** Variable (30-60 minutes for Low tasks)

**Implementation Notes:**
Low priority includes:
- Typos and grammatical errors
- Cosmetic improvements
- Micro-optimizations

**Constitution Alignment:**
- Principle 7 (Content-First): Polish and clarity

---

### Task 5.6: Update Compliance Report with Remediation Results

**Status:** [ ] Not Started

**Description:**
Update audit-report.md with post-remediation compliance statistics.

**Acceptance Criteria:**
- [ ] Compliance percentages recalculated per principle
- [ ] Before/after comparison added to executive summary
- [ ] Remaining open issues documented (if Medium/Low not fully addressed)
- [ ] Report marked as final

**Dependencies:**
- Requires: Tasks 5.1-5.5 (remediation complete)
- Blocks: None (documentation task)

**Estimated Effort:** 15-20 minutes

**Implementation Notes:**
Add section to audit-report.md:
```markdown
## Post-Remediation Results

### Compliance Improvement

| Principle | Before | After | Change |
|-----------|--------|-------|--------|
| Principle 1 (Cognitive Accessibility) | 67% | 95% | +28% |
| Principle 2 (Evidence-Based) | 55% | 88% | +33% |
| ... | ... | ... | ... |

### Critical & High Issues

- Total Critical issues: 8
- Total High issues: 15
- Remediated: 23/23 (100%)

### Outstanding Issues

- Total Medium issues: 12
- Remediated: 8/12 (67%)
- Total Low issues: 5
- Remediated: 2/5 (40%)
```

**Constitution Alignment:**
- Principle 2 (Evidence-Based): Document measurable improvement

---

### Task 5.7: Update CLAUDE.md with Audit Learnings

**Status:** [ ] Not Started

**Description:**
Add audit findings and compliance guidance to CLAUDE.md for future content creation.

**Acceptance Criteria:**
- [ ] CLAUDE.md updated with "Constitutional Compliance Guidelines" section
- [ ] Common pitfalls documented (from Task 2.12 patterns)
- [ ] Best practices added (citation format, frontmatter requirements, etc.)
- [ ] Link to constitution.md and audit-report.md added

**Dependencies:**
- Requires: Task 5.6 (final report)
- Blocks: None (documentation task)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Add section to CLAUDE.md:
```markdown
## Constitutional Compliance Guidelines

Based on 001-constitution-audit findings, follow these guidelines when creating/editing content:

### Evidence-Based Claims (Principle 2)
- All technical claims MUST have citations (DOI, arXiv, GitHub link)
- Format: "As demonstrated in [Author et al., 2024](DOI link)..."
- See `.specify/memory/constitution.md` for full requirements

### Common Pitfalls
- Missing citations for research claims (found in 12/15 blog posts)
- Incomplete frontmatter (description field often omitted)
- Color contrast violations in custom CSS

### Quick Checklist Before Committing
- [ ] Citations present for all claims
- [ ] Frontmatter complete (title, date, description, tags)
- [ ] Atkinson Hyperlegible font used
- [ ] Links functional (run check-links.sh)

See full audit report: `.specify/specs/001-constitution-audit/audit-report.md`
```

**Constitution Alignment:**
- All 7 principles (guidance prevents future violations)

---

### Task 5.8: Create Content Style Guide

**Status:** [ ] Not Started

**Description:**
Create or update content style guide incorporating constitutional principles.

**Acceptance Criteria:**
- [ ] Style guide created at `content/docs/style-guide.md` (or similar location)
- [ ] Writing guidelines derived from Principle 7 (Content-First)
- [ ] Citation format specified (Principle 2)
- [ ] Brand voice examples (Principle 5)
- [ ] Technical standards (Principle 4)
- [ ] Accessibility requirements (Principle 1)

**Dependencies:**
- Requires: Task 5.6 (audit complete)
- Blocks: None (documentation task)

**Estimated Effort:** 45-60 minutes

**Implementation Notes:**
Structure:
1. Voice and Tone (direct, technical, honest, no corporate speak)
2. Writing Standards (clarity, evidence, citations)
3. Formatting (frontmatter, headings, lists)
4. Brand Usage (tagline, colors, terminology)
5. Accessibility (font, contrast, alt text)
6. Technical Requirements (Hugo best practices)

Reference constitution.md throughout.

**Constitution Alignment:**
- All 7 principles (codified into practical style guide)

---

### Task 5.9: Create Pre-Commit Checklist

**Status:** [ ] Not Started

**Description:**
Create quick checklist for content authors to verify constitutional compliance before committing.

**Acceptance Criteria:**
- [ ] Checklist created at `.github/CONTENT_CHECKLIST.md` or similar
- [ ] Short (10-15 items max)
- [ ] Actionable and specific
- [ ] References constitution.md and style guide
- [ ] Linked from CLAUDE.md

**Dependencies:**
- Requires: Task 5.8 (style guide)
- Blocks: None (documentation task)

**Estimated Effort:** 15-20 minutes

**Implementation Notes:**
Example items:
- [ ] Title, date, description in frontmatter
- [ ] All technical claims have citations
- [ ] Links tested (run check-links.sh on file)
- [ ] Images have alt text
- [ ] No corporate buzzwords (use direct language)
- [ ] Atkinson Hyperlegible font specified in custom CSS (if any)

Keep it short enough to actually use.

**Constitution Alignment:**
- All 7 principles (lightweight compliance check)

---

### Task 5.10: Update Hugo Templates (if needed)

**Status:** [ ] Not Started

**Description:**
Update Hugo templates/archetypes to enforce constitutional requirements by default.

**Acceptance Criteria:**
- [ ] Post archetype updated with required frontmatter fields
- [ ] Project archetype updated with citation reminder
- [ ] Default CSS ensures Atkinson Hyperlegible
- [ ] Contact form template includes WCAG AA markup
- [ ] Changes tested with `hugo new`

**Dependencies:**
- Requires: Task 5.8 (style guide defines requirements)
- Blocks: None (preventative improvement)

**Estimated Effort:** 30-45 minutes

**Implementation Notes:**
Update archetypes:
```markdown
# archetypes/posts.md
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
description: "[Brief SEO-friendly description]"
tags: ["tag1", "tag2"]
categories: ["category"]
draft: true
---

<!-- Remember: All technical claims need citations (DOI, arXiv, GitHub) -->
<!-- See: .specify/memory/constitution.md Principle 2 (Evidence-Based) -->

## Introduction

[Content here...]
```

**Constitution Alignment:**
- All principles (templates enforce compliance by default)

---

## Phase 6: Testing & Deployment

### Task 6.1: Full Local Testing

**Status:** [ ] Not Started

**Description:**
Execute comprehensive local testing of all changes before deployment.

**Acceptance Criteria:**
- [ ] `hugo server -D` runs without errors
- [ ] All remediated pages load correctly
- [ ] Links functional (visual spot-check + check-links.sh)
- [ ] Mobile responsive (test 320px, 768px, 1024px viewports)
- [ ] Color contrast verified (browser dev tools)
- [ ] Keyboard navigation works (tab through all pages)
- [ ] No console errors in browser dev tools
- [ ] Forms functional (contact form submission test)

**Dependencies:**
- Requires: Phase 5 complete (all remediation done)
- Blocks: Task 6.2 (production build)

**Estimated Effort:** 45-60 minutes

**Implementation Notes:**
Testing checklist:
1. Start Hugo server: `hugo server -D`
2. Open http://localhost:1313 in browser
3. Navigate to all changed pages
4. Test each checklist item above
5. Document any issues found → return to Phase 5 if needed

**Constitution Alignment:**
- Principles 1, 4, 6 (Cognitive Accessibility, Technical Excellence, Deployment Safety)

---

### Task 6.2: Production Build & Validation

**Status:** [ ] Not Started

**Description:**
Build site in production mode and validate output.

**Acceptance Criteria:**
- [ ] `hugo --gc --minify` completes with exit code 0
- [ ] No errors or warnings in build output
- [ ] public/ directory created successfully
- [ ] File sizes reasonable (minification worked)
- [ ] HTML validates (optional: run validator on public/*.html)

**Dependencies:**
- Requires: Task 6.1 (local testing complete)
- Blocks: Task 6.3 (deployment)

**Estimated Effort:** 10 minutes

**Implementation Notes:**
```bash
# Clean previous build
rm -rf public/ resources/

# Build production
hugo --gc --minify

# Verify output
echo $?  # Should be 0
ls -lh public/
du -sh public/  # Check total size

# Optional: Validate HTML
# Use online validator or local tool
```

**Constitution Alignment:**
- Principles 4, 6 (Technical Excellence, Deployment Safety)

---

### Task 6.3: Deploy to GitHub Pages

**Status:** [ ] Not Started

**Description:**
Deploy changes to production via git push to main branch (triggers GitHub Actions).

**Acceptance Criteria:**
- [ ] Changes committed with clear, constitutional commit message
- [ ] Pushed to main branch
- [ ] GitHub Actions workflow completes successfully
- [ ] Live site updated at https://prefrontal.systems within 5 minutes
- [ ] No deployment errors

**Dependencies:**
- Requires: Task 6.2 (production build validated)
- Blocks: Task 6.4 (post-deployment verification)

**Estimated Effort:** 10-15 minutes (plus monitoring)

**Implementation Notes:**
```bash
# Verify clean working tree
git status

# Stage all changes
git add .

# Commit with constitutional compliance note
git commit -m "feat(audit): Complete constitutional compliance audit

Addresses 001-constitution-audit findings:
- Fixed Critical and High priority issues (23 total)
- Improved WCAG AA color contrast (navigation, forms)
- Added citations for all technical claims
- Completed frontmatter for all content
- Fixed broken links (8 internal, 3 external)

Constitution compliance:
- Principle 1 (Cognitive Accessibility): 95% → WCAG AA verified
- Principle 2 (Evidence-Based): 88% → All claims cited
- Principle 4 (Technical Excellence): Clean build, no errors
- Principle 6 (Deployment Safety): Local testing complete

See: .specify/specs/001-constitution-audit/audit-report.md"

# Push to main (triggers GitHub Actions deployment)
git push origin main

# Monitor deployment
# Visit: https://github.com/prefrontalsys/prefrontalsys.github.io/actions
```

**Constitution Alignment:**
- Principle 6 (Deployment Safety): Controlled deployment process
- All principles: Changes implement constitutional compliance

---

### Task 6.4: Post-Deployment Verification

**Status:** [ ] Not Started

**Description:**
Verify deployment success and all changes live in production.

**Acceptance Criteria:**
- [ ] Live site loads at https://prefrontal.systems
- [ ] All changed pages accessible
- [ ] Links functional in production (spot-check critical links)
- [ ] Forms functional (submit test message via contact form)
- [ ] Mobile responsive in production (test on phone or browser dev tools)
- [ ] No 404 errors or broken pages
- [ ] Performance acceptable (page load < 3 seconds)

**Dependencies:**
- Requires: Task 6.3 (deployment complete)
- Blocks: None (final verification)

**Estimated Effort:** 20-30 minutes

**Implementation Notes:**
Production testing checklist:
1. Open https://prefrontal.systems in browser
2. Navigate to all changed pages
3. Click several links (internal and external)
4. Test contact form (send test message)
5. Use browser dev tools responsive mode (test 320px, 768px, 1024px)
6. Check Network tab for load times
7. Verify no console errors

If issues found: Document in GitHub Issues, create follow-up tasks.

**Constitution Alignment:**
- Principle 6 (Deployment Safety): Final production verification
- All principles: Confirm constitutional compliance live

---

## Blocked Tasks

None currently. If any tasks become blocked during execution, document here:

**Format:**
- **Task:** [ID and title]
- **Blocked by:** [What's preventing progress]
- **Resolution plan:** [How to unblock]
- **Owner:** [Who's responsible]

---

## Completed Tasks

As tasks complete, they'll be moved here with completion date:

| Task ID | Title | Completed | Notes |
|---------|-------|-----------|-------|
| - | - | - | - |

---

## Task Categories

### Setup & Inventory Tasks
- Task 1.1: Create audit checklist template
- Task 1.2: Generate content inventory
- Task 1.3: Extract frontmatter metadata
- Task 1.4: Set up audit report template
- Task 1.5: Set up remediation task list template
- Task 1.6: Create audit working directory

### Content Audit Tasks
- Tasks 2.1-2.10: Audit all content pages
- Task 2.11: Audit custom layouts/shortcodes
- Task 2.12: Document audit patterns

### Technical Validation Tasks
- Task 3.1: Run link checker
- Task 3.2: Verify Hugo build
- Task 3.3: Validate frontmatter completeness
- Task 3.4: Test color contrast (WCAG AA)
- Task 3.5: Verify font loading (Atkinson Hyperlegible)
- Task 3.6: Test keyboard navigation

### Reporting Tasks
- Task 4.1: Aggregate audit findings
- Task 4.2: Aggregate technical validation findings
- Task 4.3: Generate prioritized remediation task list
- Task 4.4: Review and finalize report
- Task 4.5: Document audit methodology
- Task 4.6: Present findings (optional)

### Remediation Tasks
- Task 5.1: Fix Critical priority issues
- Task 5.2: Fix High priority issues
- Task 5.3: Verify Critical & High fixes
- Task 5.4: Fix Medium priority issues (optional)
- Task 5.5: Fix Low priority issues (optional)
- Task 5.6: Update compliance report with results
- Task 5.7: Update CLAUDE.md with learnings
- Task 5.8: Create content style guide
- Task 5.9: Create pre-commit checklist
- Task 5.10: Update Hugo templates (if needed)

### Testing & Deployment Tasks
- Task 6.1: Full local testing
- Task 6.2: Production build & validation
- Task 6.3: Deploy to GitHub Pages
- Task 6.4: Post-deployment verification

---

## Notes & Learnings

[To be filled during execution]

### Time Tracking
- Estimated total effort: 6-10 hours
- Actual time: [TBD]
- Variance: [TBD]

### Challenges Encountered
[Document unexpected issues, how resolved]

### Process Improvements
[Note what worked well, what could be improved for next audit]

---

## References

- **Feature Spec:** [spec.md](./spec.md)
- **Implementation Plan:** [plan.md](./plan.md)
- **Constitution:** [../../memory/constitution.md](../../memory/constitution.md)
- **Project CLAUDE.md:** [../../../CLAUDE.md](../../../CLAUDE.md)
- **Link Checker Script:** [../../../.specify/scripts/bash/check-links.sh](../../../.specify/scripts/bash/check-links.sh)
- **Dashboard Script:** [../../../.specify/scripts/bash/dashboard.sh](../../../.specify/scripts/bash/dashboard.sh)

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | 2025-11-11 | Initial task breakdown from plan.md | Claude Code |

---

## Implementation Strategy

### Parallel Opportunities

Tasks that can be executed in parallel:
- **Phase 1**: Tasks 1.1, 1.2, 1.4, 1.5, 1.6 can all run concurrently (only Task 1.3 depends on 1.2)
- **Phase 2**: Tasks 2.1-2.11 (all content audits) can run in parallel after Phase 1 complete
- **Phase 3**: Tasks 3.1-3.6 (all technical validation) can run in parallel
- **Phase 4**: Tasks 4.2 can run parallel with 4.1 (different data sources)

### Critical Path

The critical path (longest dependency chain):
```
Setup (1.1-1.6) → Audit (2.1-2.12) → Technical (3.1-3.6) →
Report (4.1-4.4) → Remediation (5.1-5.3) → Testing (6.1-6.2) →
Deploy (6.3-6.4)
```

Estimated critical path duration: 6-8 hours

### Risk Mitigation

**Risk:** Content audit takes longer than estimated (15-20 min/file assumed)
**Mitigation:** Phase 2 can be split across multiple work sessions

**Risk:** Critical/High remediation uncovers deeper architectural issues
**Mitigation:** Document as separate feature if too large for this audit scope

**Risk:** Deployment breaks existing functionality
**Mitigation:** Phase 6 testing is comprehensive before deploy

---

**Task Breakdown Complete** - 44 tasks across 6 phases, ready for execution.
