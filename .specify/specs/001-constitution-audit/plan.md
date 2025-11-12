# Implementation Plan: Constitution Compliance Audit

**Feature Spec:** [spec.md](spec.md)
**Created:** 2025-11-11
**Status:** Planning

---

## Planning Overview

### Objectives

1. Audit all existing website content against the 7 constitutional principles
2. Generate comprehensive compliance report identifying gaps and violations
3. Create prioritized remediation task list organized by severity and effort
4. Remediate at least 80% of identified violations (Critical and High priority)
5. Ensure no regression in functionality, links, or accessibility

### Scope

**Included:**
- Manual audit of all content/ markdown files (homepage, about, contact, publications, services, posts, projects)
- Constitutional principle compliance assessment (all 7 principles)
- Technical validation (links, builds, frontmatter, images)
- Compliance report generation with executive summary and detailed findings
- Prioritized remediation task list with effort estimates
- Content updates addressing Critical and High priority violations
- Local testing and deployment of remediated content

**Excluded:**
- Automated audit tooling (future enhancement)
- Layout/template redesigns (content-only changes)
- New content creation (only fixing existing content)
- SEO optimization beyond maintaining current quality
- Translation to other languages

### Constraints

- **Time:** 6-10 hours estimated (may extend if many violations discovered)
- **Technical:** Hugo 0.152.2+ extended, manual review process, no automation tools
- **Resources:** Single reviewer familiar with constitution and brand guidelines

---

## Constitution Check

Before proceeding, verify alignment with [constitution principles](../../memory/constitution.md):

**Principle Review:**

- **Cognitive Accessibility:** This implementation directly supports Principle 1 by ensuring all content meets clarity, typography, and WCAG AA standards. The audit checklist will use cognitive-accessible language.

- **Evidence-Based:** Principle 2 is central to this audit - findings will include specific quotes from content showing violations, linked to constitutional requirements. All recommendations will be verifiable.

- **Open Research:** Principle 3 compliance is built into the audit scope - we'll verify all research pages link to repos/papers/DOIs. The audit methodology and findings will be documented openly in the spec directory.

- **Technical Excellence:** Principle 4 validation includes Hugo build testing, frontmatter syntax checking, and adherence to Hugo best practices. All fixes will maintain clean builds.

- **Brand Consistency:** Principle 5 audit checks color palette references, voice/tone consistency, and honest scale messaging against brand/brand.md guidelines.

- **Deployment Safety:** Principle 6 is enforced through the testing strategy - every fix will be tested locally with `hugo server -D` and `hugo --gc --minify` before deployment.

- **Content-First:** Principle 7 is the foundation of this audit - content accuracy, clarity, and link integrity are prioritized over all other concerns.

**Gate Check:** ✅ All constitutional principles supported by this implementation plan.

---

## Architecture & Approach

### Technical Approach

This is a **manual content audit and remediation process** - no code changes, no automated tooling. The approach is human-review-driven with structured checklists.

**Content Changes:**
- Files to audit: `content/_index.md`, `content/*.md`, `content/posts/*.md`, `content/projects/*.md`
- No new files created (only modifications to existing content)
- Frontmatter fixes if syntax errors found
- Content text updates for constitutional compliance

**Layout/Template Changes:**
- None (content-only audit)

**Asset Changes:**
- None expected (may identify missing images needing fixes)

**Configuration Changes:**
- None (no changes to `hugo.toml` or theme submodules)

### Design Decisions

**Decision 1: Manual vs. Automated Audit**

- **Options considered:**
  - A) Manual review with structured checklist
  - B) Automated link checking + manual principle review
  - C) Fully automated audit with custom tooling

- **Choice:** Option A (manual review with structured checklist)

- **Rationale:**
  - Principles 1, 2, 5, 7 require human judgment (clarity, voice, evidence quality)
  - Automated tools for links/WCAG exist but not integrated (out of scope)
  - Manual review establishes baseline for future automation
  - Aligns with Principle 2 (evidence-based) - human verification prevents false positives

**Decision 2: Audit Report Format**

- **Options considered:**
  - A) Markdown document with structured sections
  - B) Spreadsheet with filterable columns
  - C) Database/structured data format

- **Choice:** Option A (markdown document)

- **Rationale:**
  - Principle 3 (open research) - markdown is readable, version-controllable
  - Consistent with existing documentation format (constitution, specs)
  - Easy to reference in remediation tasks
  - Supports future conversion to other formats if needed

**Decision 3: Remediation Priority Scheme**

- **Options considered:**
  - A) Four-level priority (Critical, High, Medium, Low)
  - B) Three-level priority (High, Medium, Low)
  - C) Five-level priority with sub-categories

- **Choice:** Option A (four-level priority)

- **Rationale:**
  - Critical = blocks deployment (e.g., broken internal links, frontmatter syntax errors)
  - High = major constitutional violations (missing evidence, inaccessible content)
  - Medium = minor violations (inconsistent voice, minor WCAG issues)
  - Low = enhancements (future improvements, deferred fixes)
  - Clear boundaries enable 80% remediation target (Critical + High)

**Decision 4: Compliance Scoring System**

- **Options considered:**
  - A) Four-level score (Compliant, Minor Issues, Major Issues, Non-Compliant)
  - B) Percentage score (0-100%)
  - C) Binary (Pass/Fail)

- **Choice:** Option A (four-level qualitative score)

- **Rationale:**
  - Nuanced enough to distinguish severity levels
  - Maps cleanly to remediation priorities
  - Easier for human reviewers than percentage calculations
  - Aligns with Principle 2 (evidence-based) - qualitative assessment is verifiable

---

## Implementation Phases

### Phase 1: Setup & Content Inventory

**Goal:** Prepare audit infrastructure and catalogue all content files

**Tasks:**
1. Create audit checklist template with all 7 principles and acceptance criteria per principle
2. Inventory all markdown files in `content/` directory (recursive)
3. Extract frontmatter metadata (title, date, tags, draft status) for each file
4. Document total page count and file types (homepage, page, post, project)
5. Set up audit-report.md structure with sections for each principle
6. Set up remediation-tasks.md template with priority levels

**Validation:**
- [ ] Audit checklist template complete with specific criteria per principle
- [ ] Content inventory includes all .md files with paths and metadata
- [ ] Report and task file structures created
- [ ] Estimated time: 1 hour

### Phase 2: Constitutional Principle Audit (Manual Review)

**Goal:** Review each content page against all 7 principles and document findings

**Tasks:**

**For each content file:**

1. **Principle 1 (Cognitive Accessibility) Assessment:**
   - Check: Does content use clear, direct language (no corporate speak)?
   - Check: Is typography Atkinson Hyperlegible (referenced in CSS or theme)?
   - Check: Is heading hierarchy logical (h1 → h2 → h3 without skips)?
   - Check: Do images have alt text?
   - Check: Is color contrast WCAG AA compliant (if color referenced)?
   - Score: Compliant | Minor Issues | Major Issues | Non-Compliant
   - Document violations with specific quotes/line numbers

2. **Principle 2 (Evidence-Based) Assessment:**
   - Check: Do technical claims include source links (DOI, arXiv, GitHub)?
   - Check: Are limitations honestly documented where applicable?
   - Check: Are research findings verifiable?
   - Check: Is language precise vs. hyperbolic?
   - Score: Compliant | Minor Issues | Major Issues | Non-Compliant
   - Document violations with specific examples

3. **Principle 3 (Open Research) Assessment:**
   - Check: Are research papers linked with DOIs?
   - Check: Are GitHub repos linked?
   - Check: Is methodology documented (for research pages)?
   - Score: Compliant | Minor Issues | Major Issues | Non-Compliant
   - Document missing links

4. **Principle 5 (Brand Consistency) Assessment:**
   - Check: Does voice match brand guidelines (direct, technical, first-principles)?
   - Check: Are color palette references accurate (#1976D2, #37474F, etc.)?
   - Check: Is scale honest ("independent researcher" vs. "enterprise")?
   - Check: Is tagline used correctly ("Cognitive architecture for reliable AI systems")?
   - Score: Compliant | Minor Issues | Major Issues | Non-Compliant
   - Document inconsistencies

5. **Principle 7 (Content-First) Assessment:**
   - Check: Is content accurate and current?
   - Check: Are links functional (internal and external)?
   - Check: Is content clear and well-organized?
   - Check: No placeholder text (Lorem ipsum, [TODO])?
   - Score: Compliant | Minor Issues | Major Issues | Non-Compliant
   - Document accuracy issues or broken links

6. **Document findings in audit-report.md:**
   - Add page to executive summary with principle scores
   - Add detailed findings to principle-specific sections
   - Quote specific violations with page location

**Validation:**
- [ ] All content files reviewed against all applicable principles
- [ ] Findings documented in audit-report.md with specific evidence
- [ ] Estimated time: 3-4 hours

### Phase 3: Technical Validation

**Goal:** Validate technical aspects (Principle 4 and Principle 6)

**Tasks:**
1. Test all internal links (use browser dev tools or manual click-through)
2. Test all external links (check for 200 OK or document redirects/failures)
3. Verify all referenced images exist in static/ or assets/
4. Validate frontmatter syntax (run Hugo build, check for YAML/TOML errors)
5. Run Hugo build test: `hugo --gc --minify` - document any errors
6. Document technical issues in audit-report.md under Principle 4 section

**Validation:**
- [ ] All links tested (internal and external)
- [ ] All images verified exist
- [ ] Frontmatter syntax validated
- [ ] Hugo build test passes or failures documented
- [ ] Estimated time: 1 hour

### Phase 4: Report Generation & Task Prioritization

**Goal:** Consolidate findings into executive summary and create actionable task list

**Tasks:**
1. Calculate overall compliance percentage per principle (e.g., "70% of pages Compliant or Minor Issues for Principle 1")
2. Generate statistics: total pages, violations by type, severity distribution
3. Write executive summary with key findings and overall assessment
4. Extract all violations from audit report
5. Categorize violations by priority:
   - **Critical:** Broken internal links, frontmatter syntax errors, build failures
   - **High:** Missing evidence links, major WCAG violations, inconsistent brand voice
   - **Medium:** Minor WCAG issues (heading skips), minor voice inconsistencies
   - **Low:** Enhancements, future improvements
6. Create task for each violation with:
   - Page affected
   - Principle violated
   - Current state (quote from content)
   - Desired state (what should it say/do)
   - Acceptance criteria (how to verify fix)
   - Effort estimate (quick <15min, medium 15-60min, large >60min)
7. Identify task dependencies (e.g., fix link before deploying)
8. Save prioritized task list to remediation-tasks.md

**Validation:**
- [ ] Executive summary complete with statistics
- [ ] All violations extracted and prioritized
- [ ] Each task has clear current/desired state and acceptance criteria
- [ ] Effort estimates assigned
- [ ] Estimated time: 1 hour

### Phase 5: Content Remediation

**Goal:** Fix Critical and High priority violations (target 80%+ of total violations)

**Tasks:**
1. Work through remediation-tasks.md in priority order (Critical → High)
2. For each task:
   - Open affected content file
   - Make fix per desired state
   - Verify fix meets acceptance criteria
   - Test locally: `hugo server -D` - preview change in browser
   - Run build test: `hugo --gc --minify` - ensure no errors
   - Mark task complete in remediation-tasks.md
3. For Medium priority: Remediate if time allows, otherwise defer
4. For Low priority: Defer to future iteration
5. Document any deferred tasks with reason (time-boxed, requires external input, etc.)

**Validation:**
- [ ] All Critical tasks complete
- [ ] All High tasks complete (or documented reason for deferral)
- [ ] Each fix tested locally before moving to next
- [ ] Hugo builds successfully after all fixes
- [ ] Estimated time: 2-4 hours (depends on violation count)

### Phase 6: Testing & Deployment

**Goal:** Comprehensive testing and deployment to production

**Tasks:**
1. Run full local testing checklist (see Testing Strategy section)
2. Verify all acceptance criteria from spec met
3. Commit changes with clear commit message:
   ```
   feat: constitution compliance audit - remediate Critical and High violations

   Fixes identified in constitutional audit (spec: 001-constitution-audit):
   - [List key fixes, e.g., "Add source links to research claims (Principle 2)"]
   - [e.g., "Fix broken internal links (Principle 7)"]
   - [e.g., "Improve heading hierarchy (Principle 1)"]

   Constitution compliance:
   - Principle 1-7: All Critical and High violations addressed
   - Principle 6: Local testing complete, builds clean

   Audit report: .specify/specs/001-constitution-audit/audit-report.md
   Remaining tasks: .specify/specs/001-constitution-audit/remediation-tasks.md
   ```
4. Push to main branch (triggers GitHub Actions deployment)
5. Monitor GitHub Actions for successful deployment
6. Verify live site at https://prefrontal.systems (wait ~5 minutes)
7. Run post-deployment verification checklist
8. Monitor for 24 hours for errors or user reports

**Validation:**
- [ ] All local testing passed
- [ ] Deployment succeeded
- [ ] Live site reflects changes
- [ ] No regressions (broken links, 404s, forms functional)
- [ ] Estimated time: 1 hour

---

## Dependencies & Prerequisites

### Required Before Starting

- [x] Constitution v1.0.0 exists at `.specify/memory/constitution.md`
- [x] Brand guidelines exist at `brand/brand.md`
- [x] Hugo 0.152.2+ extended version installed
- [ ] Reviewer familiar with all 7 constitutional principles
- [ ] Reviewer familiar with brand guidelines (voice, colors, typography)
- [ ] Git working tree clean (no uncommitted changes blocking rollback)

### External Dependencies

- None (no external APIs, services, or people required)

### Risk Mitigation

- **If many violations found:** Time-box remediation to Critical + High only, defer rest
- **If Hugo build breaks:** Fix in isolation, test incrementally, rollback if needed
- **If external links dead:** Document in report, decide per-link (remove, replace, or archive note)

---

## Testing Strategy

### Local Testing Checklist

- [ ] Run `hugo server -D` - verify all changed pages render correctly
- [ ] Run `hugo --gc --minify` - confirm build succeeds without errors
- [ ] Test all fixed internal links (click through or use dev tools)
- [ ] Test sample of external links (at least 10 highest-traffic pages)
- [ ] Verify mobile/responsive display at 320px, 768px, 1024px, 1920px (if layout-affecting fixes)
- [ ] Check color contrast with browser dev tools if color changes made
- [ ] Test keyboard navigation on changed pages (tab through interactive elements)
- [ ] Verify with screen reader if major content structure changes (heading hierarchy fixes)

### Content Validation

- [ ] All links functional (internal and external)
- [ ] Verify technical claims with sources (spot-check fixed evidence links)
- [ ] Check for typos/grammar in updated content
- [ ] Ensure brand voice consistency across all updated pages
- [ ] Confirm no placeholder text remains (Lorem ipsum, [TODO], [NEEDS CLARIFICATION])

### Pre-Deployment

- [ ] Review `public/` output for unexpected files (if Hugo config touched)
- [ ] Confirm git submodules are updated: `git submodule status` (should show clean)
- [ ] Verify no secrets or API keys in committed code
- [ ] Ensure commit message clearly describes changes and references audit

---

## Deployment Plan

### Deployment Steps

1. **Local testing complete** (all checklist items above checked)
2. **Commit to main branch** with constitution compliance commit message
3. **Monitor GitHub Actions** - visit Actions tab, watch workflow progress
4. **Verify live site** at https://prefrontal.systems within 5 minutes
5. **Smoke test production:**
   - Check homepage loads
   - Check 3 random changed pages load correctly
   - Verify no 404 errors on navigation
   - Test contact form still works
6. **Monitor for 24 hours:**
   - Watch GitHub Issues for user reports
   - Check analytics for unusual drop in traffic
   - Verify search console shows no crawl errors

### Rollback Plan

If deployment fails or critical issues discovered:

1. **Identify problematic commit:** Check GitHub Actions logs for error details
2. **Assess severity:**
   - **Build failure:** Fix syntax error, commit fix, push again
   - **Critical content issue:** Revert commit: `git revert <commit-hash>`
   - **Minor issue:** Document as follow-up task, don't rollback
3. **Execute rollback if needed:**
   ```bash
   git revert <commit-hash>
   git push origin main
   ```
4. **Monitor re-deployment:** Ensure reverted state deploys successfully
5. **Post-mortem:** Document what went wrong in plan.md "Lessons Learned" section

---

## Success Metrics

### Immediate Success Criteria

- [ ] Feature deployed without errors (GitHub Actions green)
- [ ] All acceptance criteria from spec met:
  - [ ] 100% of content pages audited
  - [ ] Audit report generated with findings
  - [ ] Remediation tasks prioritized
  - [ ] 80%+ of violations remediated (Critical + High)
  - [ ] Zero regressions (links, builds, accessibility)
- [ ] No regression in existing functionality
- [ ] Performance maintained (page load times <3 seconds)

### Long-Term Success Criteria

- [ ] **Baseline established:** First constitutional audit complete, future audits can compare against this baseline
- [ ] **Reusable process:** Audit checklist and methodology documented for quarterly reviews
- [ ] **Content quality improved:** Visitor feedback or analytics show improved engagement (measure after 30 days)
- [ ] **Team education:** Content creators understand constitutional principles and avoid future violations

**Measurement Plan:**

- Immediate metrics measured at deployment completion
- 30-day post-deployment review:
  - Compare bounce rate on updated pages (before/after)
  - Check analytics for time-on-page improvements
  - Review any user feedback submitted via contact form
- Quarterly review: Re-run audit checklist on new content to verify no regression

---

## Post-Implementation

### Documentation Updates

- [ ] Update spec.md status to "Implemented"
- [ ] Archive audit-report.md and remediation-tasks.md (keep for reference)
- [ ] Add "Lessons Learned" section to this plan.md
- [ ] Consider updating CLAUDE.md with audit checklist reference for future content creation
- [ ] Update constitution.md if any principles need clarification based on audit findings

### Lessons Learned

[To be filled after implementation:]

- **What went well:**
- **What could be improved:**
- **What would we do differently next time:**
- **Audit findings summary:** [e.g., "Most common violation: missing evidence links (Principle 2)"]
- **Time accuracy:** [Were estimates accurate? What took longer/shorter than expected?]

### Follow-Up Tasks

[Deferred items to track:]

- Medium priority violations deferred due to time constraints
- Low priority enhancements
- Automated tooling for future audits (link checking, WCAG testing)
- Quarterly audit schedule (add calendar reminder for 2026-02-11)

---

## References

- **Feature Spec:** [spec.md](spec.md)
- **Constitution:** [../../memory/constitution.md](../../memory/constitution.md)
- **Brand Guidelines:** [../../../brand/brand.md](../../../brand/brand.md)
- **Hugo Documentation:** [gohugo.io](https://gohugo.io)
- **Theme Docs:** [github.com/luizdepra/hugo-coder](https://github.com/luizdepra/hugo-coder)
- **WCAG 2.1 Quick Reference:** [w3.org/WAI/WCAG21/quickref/](https://www.w3.org/WAI/WCAG21/quickref/)

---

## Revision History

| Version | Date       | Changes                      | Author                        |
|---------|------------|------------------------------|-------------------------------|
| 1.0     | 2025-11-11 | Initial implementation plan  | Prefrontal Systems Dev Team   |
