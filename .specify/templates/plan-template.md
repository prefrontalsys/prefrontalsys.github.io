# Implementation Plan: [FEATURE_NAME]

**Feature Spec:** [Link to spec-template.md or specific spec]
**Created:** [YYYY-MM-DD]
**Status:** [Planning | Ready | In Progress | Complete]

---

## Planning Overview

### Objectives
[High-level goals from the specification]

### Scope
[What's included in this implementation]

### Constraints
- **Time:** [Estimated completion timeframe]
- **Technical:** [Hugo version, theme limitations, external dependencies]
- **Resources:** [Who's working on this, what tools are available]

---

## Constitution Check

Before proceeding, verify alignment with [constitution principles](../memory/constitution.md):

**Principle Review:**
- **Cognitive Accessibility:** [How does this implementation ensure clarity and cognitive ease?]
- **Evidence-Based:** [What sources/research support this approach?]
- **Open Research:** [What will be published/shared openly?]
- **Technical Excellence:** [How does this follow Hugo best practices?]
- **Brand Consistency:** [How does this maintain brand guidelines?]
- **Deployment Safety:** [What testing gates are in place?]
- **Content-First:** [Does content drive design, or vice versa?]

---

## Architecture & Approach

### Technical Approach
[High-level technical strategy]

**Content Changes:**
- Files to create/modify in `content/`
- Frontmatter structure
- Taxonomy/categorization

**Layout/Template Changes:**
- Files to create/modify in `layouts/`
- Shortcodes needed
- Partial overrides

**Asset Changes:**
- Files in `assets/` (processed by Hugo Pipes)
- Files in `static/` (copied as-is)
- CSS/JS additions or modifications

**Configuration Changes:**
- Updates to `hugo.toml`
- Theme submodule updates (if needed)

### Design Decisions

**Decision 1: [Description]**
- **Options considered:** [A, B, C]
- **Choice:** [Selected option]
- **Rationale:** [Why this choice aligns with constitution principles]

**Decision 2: [Description]**
- **Options considered:** [A, B, C]
- **Choice:** [Selected option]
- **Rationale:** [Why this choice aligns with constitution principles]

---

## Implementation Phases

### Phase 1: [Phase Name]
**Goal:** [What this phase accomplishes]

**Tasks:**
1. [Task description]
2. [Task description]

**Validation:**
- [ ] [How to verify this phase is complete]

### Phase 2: [Phase Name]
**Goal:** [What this phase accomplishes]

**Tasks:**
1. [Task description]
2. [Task description]

**Validation:**
- [ ] [How to verify this phase is complete]

### Phase 3: [Phase Name]
**Goal:** [What this phase accomplishes]

**Tasks:**
1. [Task description]
2. [Task description]

**Validation:**
- [ ] [How to verify this phase is complete]

---

## Dependencies & Prerequisites

### Required Before Starting
- [ ] [Prerequisite 1: e.g., theme update completed]
- [ ] [Prerequisite 2: e.g., content drafted and approved]
- [ ] [Prerequisite 3: e.g., external API access confirmed]

### External Dependencies
- [Service/tool/person needed]
- [Expected availability]

### Risk Mitigation
[If dependencies fail, what's the fallback?]

---

## Testing Strategy

### Local Testing Checklist
- [ ] Run `hugo server -D` - verify changes render correctly
- [ ] Run `hugo --gc --minify` - confirm build succeeds
- [ ] Test all interactive elements (forms, navigation, links)
- [ ] Verify mobile/responsive display at 320px, 768px, 1024px, 1920px
- [ ] Check color contrast with browser dev tools (WCAG AA minimum)
- [ ] Test keyboard navigation (tab through all interactive elements)
- [ ] Verify with screen reader if significant content/layout changes

### Content Validation
- [ ] All links functional (internal and external)
- [ ] Verify technical claims with sources
- [ ] Check for typos/grammar
- [ ] Ensure brand voice consistency

### Pre-Deployment
- [ ] Review `public/` output for unexpected files
- [ ] Confirm git submodules are updated (`git submodule status`)
- [ ] Verify no secrets or API keys in committed code

---

## Deployment Plan

### Deployment Steps
1. **Local testing complete** (all checklist items above)
2. **Commit to main branch** with clear commit message
3. **Monitor GitHub Actions** - verify workflow succeeds
4. **Verify live site** at https://prefrontal.systems within 5 minutes
5. **Smoke test production** - check key pages and functionality
6. **Monitor for 24 hours** - watch for broken links, errors, user reports

### Rollback Plan
If deployment fails or critical issues discovered:
1. Identify problematic commit via GitHub Actions logs
2. Create fix commit OR revert: `git revert <commit-hash>`
3. Push to main to trigger re-deployment
4. Document what went wrong and how to prevent recurrence

---

## Success Metrics

### Immediate Success Criteria
- [ ] Feature deployed without errors
- [ ] All acceptance criteria from spec met
- [ ] No regression in existing functionality
- [ ] Performance maintained (page load times)

### Long-Term Success Criteria
- [ ] [Metric 1: e.g., increased engagement on new content]
- [ ] [Metric 2: e.g., reduced bounce rate on updated pages]
- [ ] [Metric 3: e.g., positive user feedback]

**Measurement Plan:**
[How and when will these be measured?]

---

## Post-Implementation

### Documentation Updates
- [ ] Update CLAUDE.md if new workflows introduced
- [ ] Update README.md if user-facing changes
- [ ] Document any new patterns for future reference

### Lessons Learned
[After implementation, document:]
- What went well
- What could be improved
- What would we do differently next time

### Follow-Up Tasks
[Any items deferred or discovered during implementation]

---

## References

- **Feature Spec:** [Link]
- **Constitution:** [.specify/memory/constitution.md](../memory/constitution.md)
- **Brand Guidelines:** [brand/brand.md](../../brand/brand.md)
- **Hugo Documentation:** [gohugo.io](https://gohugo.io)
- **Theme Docs:** [github.com/luizdepra/hugo-coder](https://github.com/luizdepra/hugo-coder)

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [YYYY-MM-DD] | Initial plan | [Name] |
