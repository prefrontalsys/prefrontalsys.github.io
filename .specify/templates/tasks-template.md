# Implementation Tasks: [FEATURE_NAME]

**Feature Spec:** [Link to spec]
**Implementation Plan:** [Link to plan]
**Created:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]

---

## Task Overview

**Total Tasks:** [Number]
**Estimated Effort:** [Hours/days]
**Current Status:** [Not Started | In Progress | Blocked | Complete]

### Progress Summary
- [ ] Phase 1: [Phase name] - [X/Y tasks complete]
- [ ] Phase 2: [Phase name] - [X/Y tasks complete]
- [ ] Phase 3: [Phase name] - [X/Y tasks complete]

---

## Task Dependency Graph

```
[Task 1] → [Task 2] → [Task 5]
         ↓
       [Task 3] → [Task 4] → [Task 6]
                            ↓
                          [Task 7]
```

**Legend:**
- `→` : Task dependency (must complete before next)
- Tasks on same level can be done in parallel

---

## Phase 1: [Phase Name]

### Task 1.1: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
[What needs to be done]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Dependencies:**
- Requires: [None | Task X.X]
- Blocks: [Task Y.Y]

**Estimated Effort:** [Minutes/hours]

**Implementation Notes:**
[Specific commands, file paths, or technical details]

**Constitution Alignment:**
[Which principle(s) does this task support?]

---

### Task 1.2: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
[What needs to be done]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Dependencies:**
- Requires: [None | Task X.X]
- Blocks: [Task Y.Y]

**Estimated Effort:** [Minutes/hours]

**Implementation Notes:**
[Specific commands, file paths, or technical details]

**Constitution Alignment:**
[Which principle(s) does this task support?]

---

## Phase 2: [Phase Name]

### Task 2.1: [Task Title]

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
[What needs to be done]

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Dependencies:**
- Requires: [Task 1.1, Task 1.2]
- Blocks: [Task Y.Y]

**Estimated Effort:** [Minutes/hours]

**Implementation Notes:**
[Specific commands, file paths, or technical details]

**Constitution Alignment:**
[Which principle(s) does this task support?]

---

## Phase 3: Testing & Deployment

### Task 3.1: Local Testing

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
Execute full local testing checklist before deployment

**Acceptance Criteria:**
- [ ] `hugo server -D` renders correctly (test all changed pages)
- [ ] `hugo --gc --minify` builds without errors
- [ ] All links functional (use browser dev tools network tab)
- [ ] Mobile responsive at 320px, 768px, 1024px viewports
- [ ] Color contrast meets WCAG AA (check with browser tools)
- [ ] Keyboard navigation works (tab through all interactive elements)
- [ ] No console errors in browser dev tools

**Dependencies:**
- Requires: All implementation tasks complete
- Blocks: Task 3.2 (Deployment)

**Estimated Effort:** 30-60 minutes

**Constitution Alignment:**
- Principle 1 (Cognitive Accessibility): Verify WCAG compliance, readability
- Principle 4 (Technical Excellence): Clean builds, best practices
- Principle 6 (Deployment Safety): Test before deploy

---

### Task 3.2: Deployment

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
Deploy to production via GitHub

**Acceptance Criteria:**
- [ ] Commit message clearly describes changes
- [ ] Changes pushed to main branch
- [ ] GitHub Actions workflow completes successfully
- [ ] Live site updated at https://prefrontal.systems within 5 minutes
- [ ] Smoke test: verify key pages load correctly
- [ ] No 404 errors or broken links in production

**Dependencies:**
- Requires: Task 3.1 (Local Testing complete)
- Blocks: None

**Estimated Effort:** 10-15 minutes (plus monitoring time)

**Implementation Notes:**
```bash
# Verify clean working tree
git status

# Commit changes
git add .
git commit -m "feat: [brief description]

[Detailed description of changes]

Constitution compliance:
- [Principle 1]: [How addressed]
- [Principle 6]: Local testing complete
"

# Push to main (triggers deployment)
git push origin main

# Monitor GitHub Actions
# Visit: https://github.com/prefrontalsys/prefrontalsys.github.io/actions

# After deployment, verify live site
open https://prefrontal.systems
```

**Constitution Alignment:**
- Principle 6 (Deployment Safety): Follow deployment workflow
- All principles: Final verification in production

---

### Task 3.3: Post-Deployment Verification

**Status:** [ ] Not Started | [ ] In Progress | [ ] Blocked | [x] Complete

**Description:**
Verify deployment success and monitor for issues

**Acceptance Criteria:**
- [ ] All acceptance criteria from spec met in production
- [ ] No regression in existing functionality
- [ ] Performance acceptable (page load < 3 seconds)
- [ ] Forms/interactive elements functional (if applicable)
- [ ] Analytics tracking working (if applicable)
- [ ] No error reports for 24 hours

**Dependencies:**
- Requires: Task 3.2 (Deployment complete)
- Blocks: None

**Estimated Effort:** 15 minutes initial, then passive monitoring

**Implementation Notes:**
- Use browser dev tools network tab to check load times
- Test from different devices/browsers if possible
- Check GitHub Issues for any user reports

**Constitution Alignment:**
- Principle 6 (Deployment Safety): Verify and monitor
- Principle 7 (Content-First): Confirm content accessible and accurate

---

## Blocked Tasks

[If any tasks are blocked, list them here with:]
- **Task:** [ID and title]
- **Blocked by:** [What's preventing progress]
- **Resolution plan:** [How to unblock]
- **Owner:** [Who's responsible for unblocking]

---

## Completed Tasks

[As tasks complete, move them here with completion date]

| Task ID | Title | Completed | Notes |
|---------|-------|-----------|-------|
| 1.1 | [Task title] | [YYYY-MM-DD] | [Any relevant notes] |

---

## Task Categories

[Optional: Group tasks by type for better organization]

### Content Tasks
- [Task X.X]: [Brief description]

### Layout/Template Tasks
- [Task X.X]: [Brief description]

### Asset Tasks
- [Task X.X]: [Brief description]

### Testing Tasks
- [Task X.X]: [Brief description]

### Documentation Tasks
- [Task X.X]: [Brief description]

---

## Notes & Learnings

[As work progresses, document:]
- Unexpected challenges encountered
- Helpful resources discovered
- Time estimates (were they accurate?)
- Process improvements for next time

---

## References

- **Feature Spec:** [Link]
- **Implementation Plan:** [Link]
- **Constitution:** [.specify/memory/constitution.md](../memory/constitution.md)
- **CLAUDE.md:** [../../CLAUDE.md](../../CLAUDE.md)

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [YYYY-MM-DD] | Initial task breakdown | [Name] |
| 1.1 | [YYYY-MM-DD] | [Updated after Task X discovery] | [Name] |
