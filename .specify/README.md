# Speckit Workflow System

**Project:** Prefrontal Systems Website
**Created:** 2025-11-11
**Constitution Version:** 1.0.0

---

## Overview

This directory contains the Speckit workflow system for structured feature development. Speckit ensures that all changes to the website follow the project's constitutional principles, maintain brand consistency, and meet technical excellence standards.

## Directory Structure

```
.specify/
├── README.md                          # This file
├── memory/
│   └── constitution.md                # Project constitution (v1.0.0)
└── templates/
    ├── spec-template.md               # Feature specifications
    ├── plan-template.md               # Implementation planning
    ├── tasks-template.md              # Task breakdown with dependencies
    └── checklist-template.md          # Comprehensive compliance checklist
```

## Constitution Principles

The [constitution.md](memory/constitution.md) defines 7 core principles:

1. **Cognitive Accessibility First** - Typography, clarity, WCAG compliance
2. **Evidence-Based Communication** - Verifiable claims, honest limitations
3. **Open Research Commitment** - CC BY-SA 4.0 content, AGPL-3.0 code
4. **Technical Excellence** - Hugo best practices, clean builds
5. **Brand Consistency** - Color palette, voice, honest scale
6. **Deployment Safety** - Test locally, deploy atomically, monitor
7. **Content-First Development** - Function over form, content over code

## Workflow

### 1. Specification Phase

Use `spec-template.md` to document:
- Feature purpose and success criteria
- Constitution compliance checklist
- Functional and non-functional requirements
- User stories
- Out of scope items
- Testing plan

### 2. Planning Phase

Use `plan-template.md` to detail:
- Constitution check (how does implementation align with principles?)
- Technical approach and architecture
- Design decisions with rationale
- Implementation phases
- Testing strategy
- Deployment plan

### 3. Task Breakdown

Use `tasks-template.md` to create:
- Dependency-ordered task list
- Per-task acceptance criteria
- Constitution alignment notes
- Effort estimates
- Testing and deployment tasks

### 4. Implementation

Use `checklist-template.md` throughout:
- Pre-implementation verification
- Constitution compliance per principle
- Implementation progress tracking
- Testing checklist (local, responsive, accessibility, build)
- Deployment and post-deployment verification
- Retrospective and lessons learned

## Quick Start

### For New Features

1. **Copy templates to working directory:**
   ```bash
   cp .specify/templates/spec-template.md .specify/specs/my-feature/spec.md
   cp .specify/templates/plan-template.md .specify/specs/my-feature/plan.md
   cp .specify/templates/tasks-template.md .specify/specs/my-feature/tasks.md
   cp .specify/templates/checklist-template.md .specify/specs/my-feature/checklist.md
   ```

2. **Fill out specification first** - Define what you're building and why

3. **Create implementation plan** - Detail how you'll build it

4. **Break down into tasks** - Create actionable, dependency-ordered work items

5. **Use checklist during implementation** - Verify compliance at each stage

### For Quick Changes

For small changes (typo fixes, minor content updates), you can:
- Skip formal spec/plan/tasks
- Still review constitution principles (especially 1, 2, 5, 6)
- Test locally: `hugo server -D`
- Build test: `hugo --gc --minify`
- Deploy with clear commit message

## Testing Commands

```bash
# Start local development server with drafts
hugo server -D

# Build for production (must succeed)
hugo --gc --minify

# Check theme submodules status
git submodule status

# Update theme submodules
git submodule update --init --recursive

# Check Hugo version (must be 0.152.2+ extended)
hugo version
```

## Deployment Workflow

1. **Local testing complete** (all checklist items)
2. **Commit with clear message:**
   ```bash
   git add .
   git commit -m "feat: brief description
   
   Detailed description of changes.
   
   Constitution compliance:
   - Principle 1: [How addressed]
   - Principle 6: Local testing complete
   "
   ```
3. **Push to main:** `git push origin main`
4. **Monitor GitHub Actions:** Visit Actions tab
5. **Verify live site:** https://prefrontal.systems (wait ~5 minutes)
6. **Smoke test:** Check key pages, no 404s, no console errors

## Constitution Compliance

Every feature MUST be reviewed against all 7 principles. The templates include specific checkpoints for:

- **Pre-implementation:** Constitution check in plan
- **Per-task:** Constitution alignment notes
- **Pre-deployment:** Full compliance checklist
- **Post-deployment:** Verify principles upheld in production

## Amending the Constitution

Constitution updates follow semantic versioning:
- **MAJOR** (x.0.0): Backward incompatible changes, principle removals
- **MINOR** (0.x.0): New principles, materially expanded guidance
- **PATCH** (0.0.x): Clarifications, typos, non-semantic refinements

Process:
1. Edit `memory/constitution.md`
2. Update version number
3. Update Sync Impact Report (HTML comment at top)
4. Document rationale in commit message
5. Review dependent templates for consistency

## Resources

- **Constitution:** [memory/constitution.md](memory/constitution.md)
- **CLAUDE.md:** [../CLAUDE.md](../CLAUDE.md)
- **Brand Guidelines:** [../brand/brand.md](../brand/brand.md)
- **Hugo Docs:** [gohugo.io](https://gohugo.io)
- **Theme Docs:** [github.com/luizdepra/hugo-coder](https://github.com/luizdepra/hugo-coder)

## Questions?

If workflow is unclear:
1. Review constitution's "Interpretation" section
2. Consult CLAUDE.md for project-specific guidance
3. Ask: "What serves the mission?" (communicating computational therapeutics research)
4. Default to Principles 1 (Cognitive Accessibility) and 2 (Evidence-Based)

---

**Version:** 1.0.0
**Last Updated:** 2025-11-11
**Next Review:** 2026-02-11 (quarterly) or upon major feature addition
