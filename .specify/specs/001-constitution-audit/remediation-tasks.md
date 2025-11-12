# Constitution Compliance Remediation Tasks

**Project:** Prefrontal Systems Website
**Audit Report:** [audit-report.md](audit-report.md)
**Created:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]
**Status:** [Not Started | In Progress | Complete]

---

## Task Summary

**Total Tasks:** [Number]
**Completed:** [Number]
**Remaining:** [Number]

### Progress by Priority

| Priority | Total | Complete | Remaining | % Complete |
|----------|-------|----------|-----------|------------|
| Critical | [N]   | [N]      | [N]       | [X%]       |
| High     | [N]   | [N]      | [N]       | [X%]       |
| Medium   | [N]   | [N]      | [N]       | [X%]       |
| Low      | [N]   | [N]      | [N]       | [X%]       |

**80% Target:** [N] tasks (Critical + High) = [X%] of total violations

---

## Task Priority Guidelines

**Critical:** Blocks deployment or breaks functionality
- Broken internal links (navigation fails)
- Frontmatter syntax errors (Hugo build fails)
- Major WCAG violations (content inaccessible)

**High:** Major constitutional violations
- Missing evidence links (Principle 2)
- Inconsistent brand voice (Principle 5)
- Placeholder text in production (Principle 7)

**Medium:** Minor violations with moderate impact
- Minor WCAG issues (heading hierarchy)
- Minor voice inconsistencies
- Missing optional research links

**Low:** Enhancements and future improvements
- Additional detail
- Better organization
- Optional optimizations

---

## Critical Priority Tasks

### Task C-001: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [x] Complete | [ ] Deferred

**Page:** [File path]
**Principle Violated:** [Principle number and name]
**Audit Finding:** [Link to audit-report.md section]

**Current State:**
[Quote specific content with line number]

**Desired State:**
[What the content should be]

**Acceptance Criteria:**
- [ ] [Specific criterion 1]
- [ ] [Specific criterion 2]
- [ ] Hugo build passes: `hugo --gc --minify`
- [ ] Local preview renders correctly: `hugo server -D`

**Effort Estimate:** [Quick <15min | Medium 15-60min | Large >60min]

**Dependencies:**
- Requires: [Other task IDs or "None"]
- Blocks: [Other task IDs or "None"]

**Implementation Notes:**
[Specific steps or code changes needed]

**Testing:**
- [ ] Fixed locally
- [ ] Hugo build successful
- [ ] Previewed in browser
- [ ] Committed to branch

**Completed:** [YYYY-MM-DD or blank]
**Completed By:** [Name or blank]

---

**Example Task:**

### Task C-001: Fix broken internal link to About page

**Status:** [x] Complete

**Page:** content/projects/stopper.md
**Principle Violated:** Principle 7 (Content-First Development)
**Audit Finding:** [audit-report.md#principle-7-content-first-development](audit-report.md#principle-7-content-first-development)

**Current State:**
Line 45: `[Learn more about our approach](/about-us)`
(Link returns 404 - correct path is /about)

**Desired State:**
`[Learn more about our approach](/about)`

**Acceptance Criteria:**
- [x] Link updated to correct path
- [x] Hugo build passes
- [x] Link functional when clicked in local preview
- [x] No other references to /about-us remain

**Effort Estimate:** Quick <15min

**Dependencies:**
- Requires: None
- Blocks: Deployment (Critical blocker)

**Implementation Notes:**
1. Open content/projects/stopper.md
2. Find line 45
3. Change `/about-us` to `/about`
4. Save and test with `hugo server -D`
5. Click link to verify it works

**Testing:**
- [x] Fixed locally
- [x] Hugo build successful
- [x] Previewed in browser
- [x] Committed to branch

**Completed:** 2025-11-11
**Completed By:** [Name]

---

## High Priority Tasks

### Task H-001: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [x] Complete | [ ] Deferred

**Page:** [File path]
**Principle Violated:** [Principle number and name]
**Audit Finding:** [Link to audit-report.md section]

**Current State:**
[Quote specific content with line number]

**Desired State:**
[What the content should be]

**Acceptance Criteria:**
- [ ] [Specific criterion 1]
- [ ] [Specific criterion 2]

**Effort Estimate:** [Quick <15min | Medium 15-60min | Large >60min]

**Dependencies:**
- Requires: [Other task IDs or "None"]
- Blocks: [Other task IDs or "None"]

**Implementation Notes:**
[Specific steps or code changes needed]

**Testing:**
- [ ] Fixed locally
- [ ] Hugo build successful
- [ ] Previewed in browser
- [ ] Committed to branch

**Completed:** [YYYY-MM-DD or blank]
**Completed By:** [Name or blank]

---

**Example Task:**

### Task H-001: Add missing DOI link to STOPPER paper

**Status:** [x] Complete

**Page:** content/publications.md
**Principle Violated:** Principle 3 (Open Research Commitment)
**Audit Finding:** [audit-report.md#principle-3-open-research-commitment](audit-report.md#principle-3-open-research-commitment)

**Current State:**
Line 34: "STOPPER Protocol paper (Zenodo, 2024)"

**Desired State:**
"STOPPER Protocol paper ([DOI: 10.5281/zenodo.14487847](https://doi.org/10.5281/zenodo.14487847))"

**Acceptance Criteria:**
- [x] DOI link added
- [x] Link text includes "DOI:" prefix
- [x] Link functional (opens correct Zenodo page)
- [x] Hugo build passes

**Effort Estimate:** Quick <15min

**Dependencies:**
- Requires: None
- Blocks: None

**Implementation Notes:**
1. Open content/publications.md
2. Find line 34
3. Replace plain text with markdown link including DOI
4. Test link in local preview

**Testing:**
- [x] Fixed locally
- [x] Hugo build successful
- [x] Link tested in browser (opens correct page)
- [x] Committed to branch

**Completed:** 2025-11-11
**Completed By:** [Name]

---

## Medium Priority Tasks

### Task M-001: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [x] Complete | [ ] Deferred

**Page:** [File path]
**Principle Violated:** [Principle number and name]
**Audit Finding:** [Link to audit-report.md section]

**Current State:**
[Quote specific content with line number]

**Desired State:**
[What the content should be]

**Acceptance Criteria:**
- [ ] [Specific criterion 1]
- [ ] [Specific criterion 2]

**Effort Estimate:** [Quick <15min | Medium 15-60min | Large >60min]

**Dependencies:**
- Requires: [Other task IDs or "None"]
- Blocks: [Other task IDs or "None"]

**Completed:** [YYYY-MM-DD or blank]
**Completed By:** [Name or blank]

---

## Low Priority Tasks

### Task L-001: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [x] Complete | [ ] Deferred

**Page:** [File path]
**Principle Violated:** [Principle number and name or "Enhancement"]
**Audit Finding:** [Link to audit-report.md section]

**Current State:**
[Quote specific content with line number]

**Desired State:**
[What the content should be]

**Acceptance Criteria:**
- [ ] [Specific criterion 1]

**Effort Estimate:** [Quick <15min | Medium 15-60min | Large >60min]

**Dependencies:**
- Requires: [Other task IDs or "None"]

**Completed:** [YYYY-MM-DD or blank]
**Completed By:** [Name or blank]

---

## Deferred Tasks

[Tasks intentionally deferred with explanation:]

### Task [ID]: [Task Title]

**Priority:** [Critical | High | Medium | Low]
**Reason for Deferral:** [Time constraints | Requires external input | Low impact | Other]
**Revisit Date:** [YYYY-MM-DD or "Next quarterly audit"]
**Notes:** [Additional context]

---

## Task Dependencies

[Visual representation of task dependencies if complex:]

```
C-001 → H-005 → M-008
     ↓
   H-002 → M-009
```

**Key:**
- `→` : Must complete before next task
- Tasks on same level can be done in parallel

---

## Batch Operations

[Group similar tasks for efficient remediation:]

### Batch 1: Broken Internal Links

**Tasks:** C-001, C-004, C-007
**Total Effort:** [Estimated time]
**Approach:** [E.g., "Use find-replace for common pattern /about-us → /about"]

### Batch 2: Missing Evidence Links

**Tasks:** H-001, H-003, H-006, H-009
**Total Effort:** [Estimated time]
**Approach:** [E.g., "Research DOIs for all papers, add in single commit"]

### Batch 3: Brand Voice Inconsistencies

**Tasks:** H-002, M-005, M-011
**Total Effort:** [Estimated time]
**Approach:** [E.g., "Review brand/brand.md, fix all corporate speak"]

---

## Completion Checklist

### Pre-Remediation

- [ ] Audit report complete
- [ ] All tasks documented with current/desired states
- [ ] Tasks prioritized (Critical, High, Medium, Low)
- [ ] Dependencies identified
- [ ] Effort estimates assigned

### During Remediation

- [ ] Working branch created (001-constitution-audit)
- [ ] Git working tree clean before starting
- [ ] Testing each fix locally before moving to next
- [ ] Documenting completed date and person per task
- [ ] Updating task status regularly

### Post-Remediation

- [ ] All Critical tasks complete (or deferred with justification)
- [ ] All High tasks complete (or deferred with justification)
- [ ] 80%+ of total violations remediated
- [ ] Hugo build passes: `hugo --gc --minify`
- [ ] All fixes previewed: `hugo server -D`
- [ ] Commit message references audit and constitutional compliance
- [ ] Deferred tasks documented with revisit dates

---

## Notes & Learnings

[Document patterns, insights, or improvements discovered during remediation:]

### Common Patterns

- [E.g., "Many broken links due to outdated URL structure"]
- [E.g., "Corporate speak most common in services and about pages"]

### Process Improvements

- [E.g., "Future audits should include automated link checking"]
- [E.g., "Add pre-commit hook to validate frontmatter syntax"]

### Time Tracking

- **Estimated Total:** [Hours]
- **Actual Total:** [Hours]
- **Variance:** [+/- hours and % difference]
- **Lessons:** [What took longer/shorter than expected and why]

---

## References

- **Audit Report:** [audit-report.md](audit-report.md)
- **Feature Spec:** [spec.md](spec.md)
- **Implementation Plan:** [plan.md](plan.md)
- **Constitution:** [../../memory/constitution.md](../../memory/constitution.md)
- **Brand Guidelines:** [../../../brand/brand.md](../../../brand/brand.md)

---

**Task List Last Updated:** [YYYY-MM-DD HH:MM]
**Next Review:** [After completion or weekly during remediation]
