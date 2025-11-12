# Speckit Changelog

All notable changes to the speckit workflow system.

---

## [1.1.0] - 2025-11-11

### Added - Three New Enhancement Scripts

#### 1. Link Checker (`check-links.sh`)
- ✅ Validates internal markdown links (relative and absolute paths)
- ✅ Validates external HTTP/HTTPS links with curl
- ✅ Supports `--skip-external` for faster checks
- ✅ Supports `--json` output format
- ✅ Reports broken links with file location and reason
- 🎯 **Use case:** Constitution audit Phase 3 (Technical Validation)

**Example:**
```bash
.specify/scripts/bash/check-links.sh content/
# Internal Links: 45 total, 2 broken
# External Links: 12 total, 1 broken
```

#### 2. Agent Context Auto-Updater (`update-agent-context.sh`)
- ✅ Extracts technologies from feature plans
- ✅ Pattern matching for 20+ common technologies (Hugo, Python, React, etc.)
- ✅ Merges with existing technologies in CLAUDE.md (or .cursorrules, etc.)
- ✅ Preserves manual additions outside markers
- ✅ Supports `--dry-run` to preview changes
- ✅ Auto-detects agent type (claude, cursor, gemini, windsurf)
- 🎯 **Use case:** Keep AI assistant aware of evolving tech stack

**Example:**
```bash
.specify/scripts/bash/update-agent-context.sh claude --dry-run
# Found technologies: Hugo 0.152.2+, Python 3.10+
# + Adding: Python 3.10+ (001-constitution-audit)
```

**Setup required:** Add markers to CLAUDE.md:
```markdown
## Active Technologies
<!-- Technologies auto-updated by speckit workflow -->

## Recent Changes
```

#### 3. Dashboard (`dashboard.sh`)
- ✅ Visual progress tracking across all features
- ✅ Shows spec/plan/tasks completion status
- ✅ Emoji indicators (✅ Complete, 🔄 In Progress, ❌ Not Started)
- ✅ Task completion percentage tracking
- ✅ Three output formats: table (default), json, summary
- ✅ Calculates overall project statistics
- 🎯 **Use case:** Daily standup, project status reports

**Example:**
```bash
.specify/scripts/bash/dashboard.sh
# Num | Feature              | Spec | Plan | Tasks      | Status
# 001 | constitution-audit   | ✅   | ✅   | 🔄 (45%)   | In Progress
#
# Summary: 1/1 specs, 1/1 plans, 0/1 implemented
```

### Modified

- **`update-agent-context.sh`** - Complete rewrite from placeholder to functional implementation
  - Old: Just reported technologies found
  - New: Actually updates CLAUDE.md with smart merging

### Documentation

- ✅ **ENHANCEMENTS.md** - Comprehensive 400+ line guide for all three enhancements
- ✅ **CHANGELOG.md** - This file
- ✅ Updated **scripts/README.md** - References to new scripts
- ✅ Updated **CLAUDE.md** - Added technology tracking markers

### Configuration

- ✅ Added markers to `CLAUDE.md` for auto-updating:
  - `## Active Technologies` (begin marker)
  - `## Recent Changes` (end marker)

---

## [1.0.0] - 2025-11-11

### Added - Initial Infrastructure

#### Constitution & Governance
- ✅ `.specify/memory/constitution.md` - 7 core principles (v1.0.0)
- ✅ Principles: Cognitive Accessibility, Evidence-Based, Open Research, Technical Excellence, Brand Consistency, Deployment Safety, Content-First

#### Templates
- ✅ `spec-template.md` - Feature specifications with constitutional compliance checklist
- ✅ `plan-template.md` - Implementation planning with 6-phase structure
- ✅ `tasks-template.md` - Task breakdown with dependencies and priorities
- ✅ `checklist-template.md` - Comprehensive compliance verification

#### Core Scripts
- ✅ `create-new-feature.sh` - Feature branch and directory initialization
- ✅ `setup-plan.sh` - Planning phase setup
- ✅ `setup-tasks.sh` - Task generation phase setup
- ✅ `update-agent-context.sh` - Agent context placeholder (enhanced in v1.1.0)
- ✅ `validate-spec.sh` - Specification quality validation
- ✅ `archive-feature.sh` - Archive completed features

#### Documentation
- ✅ `.specify/README.md` - Workflow overview (191 lines)
- ✅ `.specify/scripts/README.md` - Script documentation (400+ lines)
- ✅ `.specify/INSTALLATION.md` - Complete installation guide

#### First Feature
- ✅ Created branch `001-constitution-audit`
- ✅ Complete specification (289 lines, passed validation)
- ✅ Complete implementation plan (6 phases, 220+ lines)
- ✅ Audit templates (checklist, report, tasks)

### Workflow Support

Speckit slash commands now fully supported:
- ✅ `/speckit.constitution` - Create/update constitution
- ✅ `/speckit.specify` - Generate specifications
- ✅ `/speckit.plan` - Create implementation plans
- ⚠️ `/speckit.tasks` - Ready (scripts in place)
- ⚠️ `/speckit.clarify` - Ready
- ⚠️ `/speckit.implement` - Ready
- ⚠️ `/speckit.analyze` - Ready

---

## Roadmap

### [1.2.0] - Planned

**Automated Testing Integration**
- [ ] Pre-commit hooks for spec validation
- [ ] CI/CD link checking
- [ ] Automated WCAG compliance testing
- [ ] Constitution compliance CI checks

**Dashboard Enhancements**
- [ ] Git integration (last modified, commit history)
- [ ] Time tracking and estimates
- [ ] Dependency graph visualization
- [ ] Export to GitHub Projects

**Link Checker Improvements**
- [ ] Parallel link checking
- [ ] External link caching
- [ ] Anchor validation (`#section` links)
- [ ] Hugo `{{< ref >}}` shortcode support

### [1.3.0] - Future

**Agent Context Advanced**
- [ ] Semantic analysis (not just pattern matching)
- [ ] Version conflict resolution
- [ ] AST parsing for code mentions
- [ ] Multi-file format support

**New Scripts**
- [ ] `migrate-feature.sh` - Move feature between repos
- [ ] `clone-feature.sh` - Duplicate feature structure
- [ ] `compare-features.sh` - Diff two features
- [ ] `export-feature.sh` - Export as standalone package

---

## Version Numbering

Following Semantic Versioning (semver.org):

- **MAJOR** (x.0.0): Backward incompatible changes to workflow or file structure
- **MINOR** (0.x.0): New features, new scripts, enhanced functionality
- **PATCH** (0.0.x): Bug fixes, documentation updates, minor improvements

---

## Migration Guide

### Upgrading from 1.0.0 to 1.1.0

**Required:**
1. Add markers to `CLAUDE.md`:
   ```markdown
   ## Active Technologies
   <!-- Technologies auto-updated by speckit workflow -->

   ## Recent Changes
   ```

2. Make new scripts executable:
   ```bash
   chmod +x .specify/scripts/bash/check-links.sh
   chmod +x .specify/scripts/bash/dashboard.sh
   ```

**Optional:**
3. Test new features:
   ```bash
   .specify/scripts/bash/dashboard.sh
   .specify/scripts/bash/check-links.sh --skip-external content/
   .specify/scripts/bash/update-agent-context.sh claude --dry-run
   ```

**No breaking changes** - All v1.0.0 features continue to work.

---

## Statistics

### v1.1.0 Additions

- **Scripts:** 3 new (8 total)
- **Lines of code:** ~500 new bash code
- **Documentation:** ~400 lines (ENHANCEMENTS.md)
- **Total project:** ~3,000 lines (constitution, templates, scripts, docs)

### v1.0.0 Foundation

- **Scripts:** 6 core scripts
- **Templates:** 4 complete templates
- **Documentation:** ~800 lines
- **Constitution:** 266 lines, 7 principles

---

## Contributors

- **Claude Code (Sonnet 4.5)** - Implementation and documentation
- **Scot Campbell** - Project direction, requirements, testing

---

## License

- **Scripts:** MIT License (permissive)
- **Constitution & Templates:** CC BY-SA 4.0 (attribution, share-alike)
- **Documentation:** CC BY-SA 4.0

---

## See Also

- **Installation:** [INSTALLATION.md](INSTALLATION.md)
- **Enhancements Guide:** [scripts/ENHANCEMENTS.md](scripts/ENHANCEMENTS.md)
- **Scripts README:** [scripts/README.md](scripts/README.md)
- **Main README:** [README.md](README.md)
- **Constitution:** [memory/constitution.md](memory/constitution.md)

---

**Current Version:** 1.1.0
**Release Date:** 2025-11-11
**Status:** Beta (production-ready)
