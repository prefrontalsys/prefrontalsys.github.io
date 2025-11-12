# Feature Checklist: [FEATURE_NAME]

**Created:** [YYYY-MM-DD]
**Feature Spec:** [Link to spec]
**Status:** [In Progress | Complete]

---

## Pre-Implementation Checklist

### Requirements & Planning
- [ ] Feature specification completed and reviewed
- [ ] Implementation plan created with clear phases
- [ ] Task breakdown completed with dependencies identified
- [ ] Constitution compliance reviewed for all 7 principles
- [ ] Success metrics defined and measurable
- [ ] Timeline estimated and approved

### Prerequisites
- [ ] Required content drafted (if content feature)
- [ ] Required assets prepared (images, logos, etc.)
- [ ] External dependencies confirmed (APIs, services)
- [ ] Theme submodules up to date: `git submodule update --init --recursive`
- [ ] Hugo version verified: `hugo version` (should be 0.152.2+ extended)

---

## Constitution Compliance Checklist

### Principle 1: Cognitive Accessibility
- [ ] Content uses clear, direct language (no corporate speak)
- [ ] Typography uses Atkinson Hyperlegible font
- [ ] Navigation is intuitive and consistent
- [ ] Color contrast meets WCAG AA minimum (use browser dev tools)
- [ ] Information architecture supports both graph-based and sequential thinking

### Principle 2: Evidence-Based Communication
- [ ] All technical claims are verifiable with linked sources
- [ ] DOI/arXiv/GitHub links included where applicable
- [ ] Limitations and uncertainties documented honestly
- [ ] Distinction made between validated findings and active experiments
- [ ] No hyperbole or unsubstantiated claims

### Principle 3: Open Research Commitment
- [ ] Links to open source repositories included
- [ ] References to preprints/publications with DOIs
- [ ] Content uses CC BY-SA 4.0 license (attribution + share-alike)
- [ ] Code uses AGPL-3.0 license
- [ ] Implementation details documented, not just outcomes

### Principle 4: Technical Excellence
- [ ] Hugo Extended 0.152.2+ used
- [ ] Theme managed correctly (no direct edits to submodules)
- [ ] Clean separation: content/ (markdown), layouts/ (templates), assets/ (processed), static/ (as-is)
- [ ] Build succeeds: `hugo --gc --minify` runs without errors
- [ ] Local testing: `hugo server -D` renders correctly
- [ ] Optimized for performance (minified CSS/JS, optimized images)

### Principle 5: Brand Consistency
- [ ] Color palette adhered to (Synapse Blue #1976D2, Cortex Gray #37474F, etc.)
- [ ] Atkinson Hyperlegible typography used
- [ ] Tagline consistent: "Cognitive architecture for reliable AI systems"
- [ ] Tone: direct, technical, first-principles (no corporate speak)
- [ ] Scale honesty: "independent researcher" or "small specialized team"

### Principle 6: Deployment Safety
- [ ] Tested locally: `hugo server -D` verified in browser
- [ ] Build tested: `hugo --gc --minify` succeeded
- [ ] Public/ output reviewed if non-obvious changes
- [ ] Commit message clear and descriptive
- [ ] No force push to main
- [ ] Theme submodules updated before deployment

### Principle 7: Content-First Development
- [ ] Content accuracy verified (information correct and current)
- [ ] Clarity confirmed (target audience can understand)
- [ ] Accessibility ensured (cognitive and visual differences accommodated)
- [ ] Performance acceptable (page loads quickly)
- [ ] No broken links (existing URLs preserved or redirected)

---

## Implementation Checklist

### Content Changes
- [ ] Create/modify files in `content/`
- [ ] Frontmatter complete and correct (title, date, draft, description, tags)
- [ ] Markdown formatting correct (headings, lists, links)
- [ ] Internal links use relative paths or Hugo refs
- [ ] External links verified functional

### Layout/Template Changes
- [ ] Create/modify files in `layouts/`
- [ ] Theme overrides placed in correct path structure (not in themes/ submodule)
- [ ] Shortcodes tested with actual content
- [ ] Partials integrated correctly
- [ ] No hardcoded content in templates (use params or data files)

### Asset Changes
- [ ] Processed assets in `assets/` (CSS, JS, SCSS processed by Hugo Pipes)
- [ ] Static assets in `static/` (images, fonts, manifest, favicons)
- [ ] Images optimized (compressed, appropriate dimensions)
- [ ] CSS minified via Hugo build process
- [ ] JS minified via Hugo build process

### Configuration Changes
- [ ] `hugo.toml` updated correctly
- [ ] No syntax errors in TOML
- [ ] Params scoped appropriately
- [ ] Menu structure correct
- [ ] BaseURL remains `https://prefrontal.systems/`

---

## Testing Checklist

### Local Development Testing
- [ ] Start server: `hugo server -D`
- [ ] Verify all changed pages render correctly
- [ ] Test navigation (all menu items work)
- [ ] Click all links (internal and external)
- [ ] Test interactive elements (forms, buttons, etc.)
- [ ] Check browser console for errors (F12 > Console tab)

### Responsive/Mobile Testing
- [ ] Test at 320px width (small mobile)
- [ ] Test at 768px width (tablet)
- [ ] Test at 1024px width (laptop)
- [ ] Test at 1920px width (desktop)
- [ ] Navigation works on mobile (hamburger menu if applicable)
- [ ] Images scale appropriately

### Accessibility Testing
- [ ] Color contrast checked (browser dev tools or online tool)
- [ ] Keyboard navigation tested (tab through all interactive elements)
- [ ] Headings in logical order (h1 → h2 → h3, no skips)
- [ ] Images have alt text
- [ ] Links have descriptive text (no "click here")
- [ ] Screen reader test (if major content/layout changes)

### Build Testing
- [ ] Clean build: `hugo --gc --minify`
- [ ] No errors in build output
- [ ] No warnings (or warnings documented as expected)
- [ ] Review `public/` directory for unexpected files
- [ ] Check file sizes (CSS/JS not excessively large)

### Content Validation
- [ ] Spell check and grammar review
- [ ] Technical accuracy verified with sources
- [ ] Brand voice consistent throughout
- [ ] No placeholder text (Lorem ipsum, [TODO], etc.)
- [ ] Dates and version numbers correct

---

## Pre-Deployment Checklist

### Final Verification
- [ ] All implementation tasks complete
- [ ] All testing checklist items passed
- [ ] Constitution compliance verified
- [ ] No known issues or acceptable issues documented
- [ ] Commit message drafted and clear

### Git Hygiene
- [ ] Working tree clean (no uncommitted changes): `git status`
- [ ] Submodules at correct commit: `git submodule status`
- [ ] No sensitive data in commit (API keys, secrets, personal info)
- [ ] .gitignore covers generated files (public/, resources/)
- [ ] Commit message follows convention (feat:, fix:, docs:, etc.)

### Documentation
- [ ] CLAUDE.md updated if new workflows introduced
- [ ] README.md updated if user-facing changes
- [ ] Inline code comments added for complex logic
- [ ] Constitution updates if principles learned/refined

---

## Deployment Checklist

### Deploy to Production
- [ ] Commit changes: `git add . && git commit -m "feat: [description]"`
- [ ] Push to main: `git push origin main`
- [ ] Monitor GitHub Actions: Visit Actions tab, watch workflow
- [ ] Workflow completes successfully (green checkmark)
- [ ] Wait 5 minutes for deployment

### Post-Deployment Verification
- [ ] Visit https://prefrontal.systems
- [ ] Verify changes visible in production
- [ ] Test key pages (homepage, changed pages, navigation)
- [ ] Check for 404 errors or broken links
- [ ] Forms/interactive elements functional (if applicable)
- [ ] No console errors in browser dev tools
- [ ] Page load performance acceptable (< 3 seconds)

### Monitoring
- [ ] Monitor for 1 hour: Check for immediate issues
- [ ] Monitor for 24 hours: Watch for error reports, user feedback
- [ ] Analytics tracking confirmed (if applicable)
- [ ] Search console: Check for crawl errors (if major structural changes)

---

## Post-Implementation Checklist

### Documentation & Cleanup
- [ ] Update feature status to "Complete"
- [ ] Document lessons learned in plan/tasks files
- [ ] Archive work-in-progress notes if no longer needed
- [ ] Create follow-up tasks for deferred items

### Retrospective
- [ ] What went well?
- [ ] What could be improved?
- [ ] Were time estimates accurate?
- [ ] Any constitution principles unclear or conflicting?
- [ ] Process improvements for next feature?

### Success Validation
- [ ] All acceptance criteria from spec met
- [ ] Success metrics baseline captured (for future comparison)
- [ ] No regression in existing functionality
- [ ] Performance maintained or improved

---

## Rollback Plan (If Needed)

### If Critical Issues Discovered
1. [ ] Identify problematic commit via GitHub Actions logs
2. [ ] Assess: Can this be fixed forward quickly (< 30 min) or needs rollback?
3. [ ] If rollback needed: `git revert <commit-hash>`
4. [ ] Push revert: `git push origin main`
5. [ ] Monitor deployment of reverted state
6. [ ] Document what went wrong and prevention plan

### If Deployment Fails
1. [ ] Check GitHub Actions logs for error details
2. [ ] Common issues: Build errors, submodule problems, config syntax errors
3. [ ] Fix locally, test with `hugo --gc --minify`
4. [ ] Commit fix and push again
5. [ ] Document issue and prevention steps

---

## References

- **Constitution:** [.specify/memory/constitution.md](../memory/constitution.md)
- **Feature Spec:** [Link]
- **Implementation Plan:** [Link]
- **Tasks:** [Link]
- **CLAUDE.md:** [../../CLAUDE.md](../../CLAUDE.md)
- **Brand Guidelines:** [../../brand/brand.md](../../brand/brand.md)

---

## Completion Sign-Off

- [ ] **All checklists completed**
- [ ] **Feature deployed successfully**
- [ ] **Post-deployment monitoring complete (24 hours)**
- [ ] **Documentation updated**
- [ ] **Retrospective completed**

**Completed by:** [Name]
**Completion date:** [YYYY-MM-DD]
**Final status:** [Success | Success with notes | Partial (deferred items documented)]

---

*This checklist ensures systematic compliance with project constitution and development standards.*
