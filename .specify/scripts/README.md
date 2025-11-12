# Speckit Scripts

**Created:** 2025-11-11
**Purpose:** Supporting scripts for speckit workflow system

---

## Overview

This directory contains bash scripts that support the speckit workflow commands (`/speckit.specify`, `/speckit.plan`, `/speckit.tasks`, etc.). These scripts handle feature branch management, directory structure creation, and workflow automation.

## Available Scripts

### Core Workflow Scripts

#### 1. `create-new-feature.sh`

**Called by:** `/speckit.specify`

**Purpose:** Creates feature branch and directory structure for new features

**Usage:**
```bash
./create-new-feature.sh --json --number 1 --short-name "my-feature" "Feature description"
```

**Options:**
- `--json` - Output results as JSON (required for speckit commands)
- `--number N` - Feature number (e.g., 1 produces 001-my-feature)
- `--short-name NAME` - Short hyphenated feature name

**What it does:**
1. Creates branch `NNN-short-name` (e.g., `001-constitution-audit`)
2. Creates directory `.specify/specs/NNN-short-name/`
3. Creates subdirectories: `checklists/`, `contracts/`, `artifacts/`
4. Initializes empty `spec.md`
5. Outputs JSON with all paths

**Example:**
```bash
./create-new-feature.sh --json --number 1 --short-name "landing-redesign" "Redesign landing page"
```

**Output (JSON):**
```json
{
  "BRANCH_NAME": "001-landing-redesign",
  "FEATURE_NUMBER": "001",
  "SHORT_NAME": "landing-redesign",
  "DESCRIPTION": "Redesign landing page",
  "SPEC_FILE": ".specify/specs/001-landing-redesign/spec.md",
  "PLAN_FILE": ".specify/specs/001-landing-redesign/plan.md",
  "TASKS_FILE": ".specify/specs/001-landing-redesign/tasks.md",
  "SPECS_DIR": ".specify/specs/001-landing-redesign"
}
```

---

#### 2. `setup-plan.sh`

**Called by:** `/speckit.plan`

**Purpose:** Sets up planning phase for current feature

**Usage:**
```bash
./setup-plan.sh --json
```

**What it does:**
1. Detects current feature branch
2. Validates spec directory and spec.md exist
3. Copies `plan-template.md` to `plan.md` (if not exists)
4. Outputs JSON with all paths

**Example:**
```bash
# Must be on a feature branch (e.g., 001-my-feature)
./setup-plan.sh --json
```

**Output (JSON):**
```json
{
  "BRANCH": "001-my-feature",
  "FEATURE_NUMBER": "001",
  "SPECS_DIR": ".specify/specs/001-my-feature",
  "FEATURE_SPEC": ".specify/specs/001-my-feature/spec.md",
  "IMPL_PLAN": ".specify/specs/001-my-feature/plan.md",
  "TASKS_FILE": ".specify/specs/001-my-feature/tasks.md"
}
```

---

#### 3. `setup-tasks.sh`

**Called by:** `/speckit.tasks`

**Purpose:** Sets up task generation phase

**Usage:**
```bash
./setup-tasks.sh --json
```

**What it does:**
1. Detects current feature branch
2. Validates plan.md exists
3. Copies `tasks-template.md` to `tasks.md` (if not exists)
4. Outputs JSON with all paths

---

#### 4. `update-agent-context.sh`

**Called by:** `/speckit.plan` (Phase 1)

**Purpose:** Updates AI agent context files with technologies from current plan

**Usage:**
```bash
./update-agent-context.sh [agent-name]
```

**Arguments:**
- `agent-name` - Agent to update: `claude`, `cursor`, `gemini`, `windsurf` (auto-detects if omitted)

**What it does:**
1. Detects which AI agent is in use
2. Reads current `plan.md` to extract technologies
3. Identifies appropriate context file:
   - Claude: `CLAUDE.md`
   - Cursor: `.cursorrules`
   - Gemini: `.gemini/context.md`
   - Windsurf: `.windsurf/context.md`
4. Reports technologies found and automatically updates context file

**Note:** This script automatically extracts technologies from the current feature's plan and merges them into the detected agent's context file.

---

### Helper Scripts

#### 5. `validate-spec.sh`

**Purpose:** Validates specification quality before planning

**Usage:**
```bash
./validate-spec.sh [spec-file]
```

**What it checks:**
- ✓ No implementation details (languages, frameworks)
- ✓ Success criteria present
- ✓ No [NEEDS CLARIFICATION] markers remaining
- ✓ Functional requirements present
- ✓ User stories included
- ✓ Out of scope section defined
- ✓ Constitution compliance section exists

**Exit codes:**
- `0` - Validation passed
- `1` - Validation failed (errors found)

**Example:**
```bash
# Validate current feature's spec
./validate-spec.sh

# Validate specific spec
./validate-spec.sh .specify/specs/001-my-feature/spec.md
```

---

#### 6. `archive-feature.sh`

**Purpose:** Archives completed feature documentation

**Usage:**
```bash
./archive-feature.sh [branch-name]
```

**What it does:**
1. Moves `.specify/specs/NNN-feature/` to `.specify/archive/NNN-feature/`
2. Adds `ARCHIVED.txt` with timestamp
3. Provides commands to delete feature branch

**Example:**
```bash
# Archive current feature
./archive-feature.sh

# Archive specific feature
./archive-feature.sh 001-constitution-audit
```

**Follow-up:**
```bash
# Delete feature branch locally
git branch -d 001-constitution-audit

# Delete from remote (if pushed)
git push origin --delete 001-constitution-audit
```

---

## Speckit Workflow Commands

These scripts support the following speckit commands (built into Claude Code):

### Available Commands

| Command | Purpose | Uses Script |
|---------|---------|-------------|
| `/speckit.specify` | Create feature specification | `create-new-feature.sh` |
| `/speckit.clarify` | Ask clarifying questions | - |
| `/speckit.plan` | Create implementation plan | `setup-plan.sh`, `update-agent-context.sh` |
| `/speckit.tasks` | Generate task breakdown | `setup-tasks.sh` |
| `/speckit.implement` | Execute implementation | - |
| `/speckit.analyze` | Cross-artifact analysis | - |
| `/speckit.checklist` | Generate custom checklist | - |
| `/speckit.constitution` | Manage project constitution | - |

### Workflow

```
/speckit.specify          → Creates spec.md with requirements
         ↓
/speckit.clarify (optional) → Resolves ambiguities
         ↓
/speckit.plan            → Creates plan.md with phases
         ↓
/speckit.tasks           → Creates tasks.md with dependencies
         ↓
/speckit.implement       → Executes tasks
         ↓
/speckit.analyze         → Validates consistency
```

---

## Script Locations

All scripts are located in:
```
.specify/scripts/bash/
├── create-new-feature.sh       # Feature initialization
├── setup-plan.sh               # Planning setup
├── setup-tasks.sh              # Task generation setup
├── update-agent-context.sh     # Agent context updates
├── validate-spec.sh            # Spec quality validation
└── archive-feature.sh          # Archive completed features
```

All scripts are executable (`chmod +x *.sh`).

---

## Directory Structure Created

When you run `/speckit.specify`, this structure is created:

```
.specify/specs/NNN-feature-name/
├── spec.md                     # Feature specification
├── plan.md                     # Implementation plan
├── tasks.md                    # Task breakdown
├── checklists/
│   └── requirements.md         # Spec quality checklist
├── contracts/
│   └── api-contracts.yaml      # API specifications (if applicable)
└── artifacts/
    └── *.md                    # Supporting documents
```

---

## Configuration

### Required Templates

Scripts expect these templates to exist:
- `.specify/templates/spec-template.md`
- `.specify/templates/plan-template.md`
- `.specify/templates/tasks-template.md`
- `.specify/templates/checklist-template.md`

All templates are present in this repository.

### Required Directories

- `.specify/` - Root speckit directory
- `.specify/specs/` - Active feature specifications
- `.specify/templates/` - Document templates
- `.specify/memory/` - Constitution and persistent docs
- `.specify/archive/` - Completed feature archive (created on first use)

---

## Troubleshooting

### "Not on a feature branch"

**Problem:** Script requires feature branch but you're on `main`

**Solution:** Run `/speckit.specify` first to create feature branch

### "Spec directory not found"

**Problem:** Directory structure not initialized

**Solution:** Run `create-new-feature.sh` or `/speckit.specify`

### "Plan file not found"

**Problem:** Trying to run `/speckit.tasks` before `/speckit.plan`

**Solution:** Complete planning phase first

### Scripts not executable

**Problem:** Permission denied when running scripts

**Solution:**
```bash
chmod +x .specify/scripts/bash/*.sh
```

---

## Development

### Adding New Scripts

1. Create script in `.specify/scripts/bash/`
2. Make executable: `chmod +x script-name.sh`
3. Follow naming convention: `lowercase-with-hyphens.sh`
4. Add usage documentation to this README
5. Test with various feature branches

### Script Conventions

- **Exit codes:** 0 = success, 1 = error
- **JSON output:** Use `--json` flag for machine-readable output
- **Error messages:** Write to stderr (`>&2`)
- **Validation:** Check prerequisites before executing
- **Documentation:** Include usage comment at top of script

---

## Future Enhancements

**Potential additions:**

1. **Automated link checking** - Validate all links in spec/plan/tasks
2. **Full agent context updates** - Automatically merge technologies into context files
3. **Spec linting** - Enforce style guide and constitution compliance
4. **Progress tracking** - Generate status reports from tasks.md
5. **Branch cleanup** - Auto-archive features after merge
6. **Template versioning** - Support multiple template versions
7. **Cross-feature dependencies** - Detect dependencies between features

---

## References

- **Speckit Documentation:** [../.specify/README.md](../.specify/README.md)
- **Constitution:** [../.specify/memory/constitution.md](../.specify/memory/constitution.md)
- **Templates:** [../.specify/templates/](../.specify/templates/)
- **Parent CLAUDE.md:** [../../CLAUDE.md](../../CLAUDE.md)

---

**Scripts Version:** 1.0.0
**Last Updated:** 2025-11-11
**Maintainer:** Prefrontal Systems Development Team
