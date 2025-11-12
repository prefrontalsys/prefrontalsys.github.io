# Speckit Enhancements

**Created:** 2025-11-11
**Version:** 1.1.0
**Status:** Beta

---

## Overview

Three new enhancement scripts added to improve the speckit workflow:

1. **Link Checker** - Validates internal and external links in markdown files
2. **Agent Context Auto-Updater** - Automatically updates CLAUDE.md with technologies from features
3. **Dashboard** - Visual progress tracking across all features

---

## 1. Link Checker

### Purpose

Validates all markdown links (internal and external) to catch broken links before deployment.

### Usage

```bash
# Check all content files
.specify/scripts/bash/check-links.sh content/

# Check specific file
.specify/scripts/bash/check-links.sh content/about.md

# Skip external link checking (faster)
.specify/scripts/bash/check-links.sh --skip-external content/

# JSON output
.specify/scripts/bash/check-links.sh --json content/
```

### What It Checks

**Internal Links:**
- `[text](/path)` - Absolute paths from content root
- `[text](../relative/path)` - Relative paths
- `[text](./sibling)` - Same-directory links
- Validates target file exists (checks .md extensions)

**External Links:**
- `[text](https://example.com)` - HTTP/HTTPS URLs
- Performs HEAD request with 10-second timeout
- Follows redirects (up to default limit)
- Reports HTTP errors (404, 500, timeout, etc.)

**Skips:**
- Anchor links (`#section`)
- Mailto links (`mailto:email@example.com`)

### Output Example

```
Link Check Results
==================

Internal Links: 45 total, 2 broken
External Links: 12 total, 1 broken

Broken Links:
=============

[INTERNAL] content/projects/stopper.md:78
  URL: /about-us
  Reason: File not found: content/about-us.md

[INTERNAL] content/posts/example.md:34
  URL: ../projects/missing
  Reason: File not found: content/projects/missing.md

[EXTERNAL] content/publications.md:45
  URL: https://example.com/paper.pdf
  Reason: Failed to fetch

✗ Link check FAILED - 3 broken links found
```

### Integration

**In Constitution Audit** (Phase 3: Technical Validation):
```bash
.specify/scripts/bash/check-links.sh content/ > audit-links.txt
```

**Pre-Deployment Check:**
```bash
# Check all content before deploying
.specify/scripts/bash/check-links.sh content/ && echo "✓ All links valid"
```

**CI/CD Integration** (future):
```yaml
# .github/workflows/link-check.yml
- name: Check links
  run: .specify/scripts/bash/check-links.sh --json content/ > links-report.json
```

---

## 2. Agent Context Auto-Updater

### Purpose

Automatically extracts technologies from feature plans and adds them to CLAUDE.md (or other agent context files), keeping your AI assistant aware of the project's evolving tech stack.

### Usage

```bash
# Auto-detect agent and update context
.specify/scripts/bash/update-agent-context.sh

# Specify agent explicitly
.specify/scripts/bash/update-agent-context.sh claude

# Dry run (show what would change without applying)
.specify/scripts/bash/update-agent-context.sh claude --dry-run
```

### How It Works

1. **Detects current feature branch** (e.g., `001-constitution-audit`)
2. **Reads plan.md** from that feature
3. **Extracts technologies** using pattern matching:
   - Hugo 0.152.2+
   - Python 3.10+
   - React, Vue.js, Next.js
   - FastAPI, Flask, Django
   - PostgreSQL, MongoDB, Redis
   - And 15+ more common patterns
4. **Merges with existing** technologies in CLAUDE.md
5. **Preserves manual additions** outside the auto-generated section

### Setup Required

Add markers to your CLAUDE.md:

```markdown
## Active Technologies
<!-- Technologies auto-updated by speckit workflow -->
- Hugo 0.152.2+ (static site generator)
- Markdown (content format)
- Bash (scripting and automation)

## Recent Changes
<!-- Track technology additions from features -->
```

The script updates content **between** these markers while preserving everything else.

### Output Example

```
Agent Context Updater
====================

Agent: claude
Context file: CLAUDE.md
Plan file: .specify/specs/001-constitution-audit/plan.md
Dry run: false

Extracting technologies from plan...
Found technologies:
  - Hugo 0.152.2+
  - Python 3.10+
  - FastMCP

  Already present: Hugo 0.152.2+
  + Adding: Python 3.10+ (001-constitution-audit)
  + Adding: FastMCP (001-constitution-audit)

✓ Updated CLAUDE.md with 2 new technologies
```

### Supported Agents

- **Claude** - Updates `CLAUDE.md` (markers: `## Active Technologies` ... `## Recent Changes`)
- **Cursor** - Updates `.cursorrules` (markers: `<!-- BEGIN AUTO-GENERATED TECH STACK -->` ... `<!-- END -->`)
- **Gemini** - Updates `.gemini/context.md` (markers: `## Active Technologies` ... `## Recent Changes`)
- **Windsurf** - Updates `.windsurf/context.md` (same markers as Gemini)

### When to Run

- **After `/speckit.plan`** - Automatically called by plan workflow (Phase 1)
- **Manually** - When you add technologies to a feature
- **Periodic** - Run across all features to consolidate tech stack

---

## 3. Dashboard

### Purpose

Provides a visual overview of all speckit features showing progress through specification, planning, task generation, and implementation phases.

### Usage

```bash
# Table format (default)
.specify/scripts/bash/dashboard.sh

# JSON format
.specify/scripts/bash/dashboard.sh --format json

# Summary only
.specify/scripts/bash/dashboard.sh --format summary
```

### Output Example

**Table Format:**
```
Speckit Features Dashboard
==========================

Legend:
  ✅ = Complete    ✅✅ = Approved/Done    🔄 = In Progress
  📝 = Draft       ❌ = Not Started

Num   | Feature                   | Title (abbrev)  | Spec     | Plan     | Tasks        | Status
------+---------------------------+-----------------+----------+----------+--------------+----------------
001   | constitution-audit        | Constitution... | ✅       | ✅       | 🔄 (45%)     | In Progress
002   | landing-redesign          | Landing Page... | ✅✅     | ✅       | ✅           | Ready
003   | projects-update           | Update Proje... | ✅       | 📝       | ❌           | Specified

Summary
-------
Total features: 3
  Specs: 3/3 complete
  Plans: 2/3 complete
  Tasks: 1/3 generated
  Implemented: 0/3 complete

To view a feature:
  cat .specify/specs/NNN-feature-name/spec.md

To start a new feature:
  /speckit.specify <description>
```

**Summary Format:**
```
Speckit Dashboard Summary
========================

Total features: 3
  Specs complete: 3 (100%)
  Plans complete: 2 (67%)
  Tasks generated: 1 (33%)
  Implemented: 0 (0%)
```

### Status Indicators

**Spec Column:**
- ✅ = Spec complete (>50 lines, filled out)
- ✅✅ = Spec approved (status: Approved)
- 📝 = Draft (spec exists but minimal content)
- ❌ = Not started

**Plan Column:**
- ✅ = Plan complete (>50 lines)
- ✅✅ = Planning done (status: Complete)
- 🔄 = Planning in progress (status: In Progress)
- 📝 = Draft
- ❌ = Not started

**Tasks Column:**
- ✅✅ (100%) = All tasks complete
- 🔄 (45%) = Tasks in progress (45% complete)
- ✅ (0%) = Tasks generated but not started
- 📝 = Draft
- ❌ = Not generated

**Overall Status:**
- **Implemented** - Feature deployed and marked complete
- **Complete** - All tasks done, ready for deployment
- **In Progress** - Actively working on tasks
- **Ready** - Tasks generated, ready to implement
- **Planned** - Plan complete, need to generate tasks
- **Specified** - Spec complete, need to plan
- **Planning** - Working on specification

### JSON Output

For programmatic access or external dashboards:

```json
{
  "summary": {
    "total_features": 3,
    "spec_complete": 3,
    "plan_complete": 2,
    "tasks_complete": 1,
    "implemented": 0
  },
  "features": [
    {
      "number": "001",
      "name": "constitution-audit",
      "title": "Constitution Compliance Audit",
      "spec": "✅",
      "plan": "✅",
      "tasks": "🔄 (45%)",
      "status": "In Progress"
    }
  ]
}
```

### Integration

**Daily standup:**
```bash
.specify/scripts/bash/dashboard.sh --format summary
```

**Project status report:**
```bash
.specify/scripts/bash/dashboard.sh > status-report.txt
```

**CI/CD status badge:**
```bash
.specify/scripts/bash/dashboard.sh --format json | jq '.summary.implemented'
```

---

## Common Workflows

### Pre-Deployment Checklist

```bash
# 1. Validate all specs
for spec in .specify/specs/*/spec.md; do
  .specify/scripts/bash/validate-spec.sh "$spec" || exit 1
done

# 2. Check all links
.specify/scripts/bash/check-links.sh content/ || exit 1

# 3. Verify Hugo build
hugo --gc --minify || exit 1

# 4. Review dashboard
.specify/scripts/bash/dashboard.sh --format summary

echo "✓ All checks passed - ready to deploy"
```

### Constitution Audit (Feature 001)

**Phase 3: Technical Validation** uses link checker:
```bash
# Check all content links
.specify/scripts/bash/check-links.sh content/ > \
  .specify/specs/001-constitution-audit/link-check-report.txt

# Broken links become High priority remediation tasks
```

### Feature Completion

```bash
# 1. Check feature status
.specify/scripts/bash/dashboard.sh

# 2. Update agent context
.specify/scripts/bash/update-agent-context.sh claude

# 3. Archive feature
.specify/scripts/bash/archive-feature.sh 001-constitution-audit

# 4. View updated dashboard
.specify/scripts/bash/dashboard.sh
```

---

## Configuration

### Link Checker

**Timeouts:** 10 seconds per external link (hardcoded)
**Follow redirects:** Yes (default curl behavior)
**Parallel checking:** No (sequential for simplicity)

**To customize:**
Edit `.specify/scripts/bash/check-links.sh`:
```bash
# Change timeout
curl -sSf -I -L --max-time 30 "$link"  # 30 seconds

# Add user agent
curl -sSf -I -L -A "Speckit Link Checker" "$link"
```

### Agent Context Updater

**Technology patterns:** Edit patterns array in `update-agent-context.sh`:
```bash
patterns=(
    "Hugo [0-9]+\.[0-9]+(\.[0-9]+)?(\+)?"
    "Python [0-9]+\.[0-9]+"
    "YourTech [0-9]+\.[0-9]+"  # Add your pattern
)
```

**Context markers:** Customize per agent in script:
```bash
case "$AGENT" in
    claude)
        BEGIN_MARKER="## Active Technologies"
        END_MARKER="## Recent Changes"
        ;;
esac
```

### Dashboard

**Status thresholds:** Edit status determination logic:
```bash
# Consider <50 lines as draft
if [[ $(wc -l < "$spec_file") -gt 50 ]]; then
    spec_status="✅"
```

---

## Limitations

### Link Checker

- **External link checking is slow** - Use `--skip-external` for quick checks
- **No concurrent checking** - Checks links sequentially
- **No caching** - Re-checks same external URL multiple times
- **Basic regex** - May miss complex markdown link formats
- **No anchor validation** - Doesn't verify `#section` targets exist

**Future improvements:**
- Parallel checking with GNU parallel
- Cache external link results for 1 hour
- Validate anchor links against heading IDs
- Support for Hugo `{{< ref >}}` shortcode syntax

### Agent Context Updater

- **Pattern-based extraction** - May miss unconventional technology mentions
- **No semantic understanding** - Can't tell if "React" is the framework or the verb
- **Version conflicts** - Doesn't resolve "Python 3.10" vs "Python 3.11" conflicts
- **Manual deduplication** - "FastAPI" vs "FastAPI framework" treated as different

**Future improvements:**
- Use AST parsing for code mentions
- Semantic analysis to distinguish tech from prose
- Version conflict resolution
- Fuzzy matching for deduplication

### Dashboard

- **Filesystem-based** - Doesn't query git history or deployment status
- **No time tracking** - Can't estimate completion dates
- **Basic heuristics** - Status detection based on simple rules
- **No dependencies** - Doesn't show inter-feature dependencies

**Future improvements:**
- Git integration (commit history, last modified)
- Time estimates based on task effort
- Dependency graph visualization
- Integration with GitHub Issues/Projects

---

## Troubleshooting

### Link Checker Fails

**Problem:** "curl: command not found"
**Solution:** Install curl: `brew install curl` (macOS) or `apt-get install curl` (Linux)

**Problem:** External link check times out
**Solution:** Use `--skip-external` or increase timeout in script

**Problem:** False positives for Hugo-generated URLs
**Solution:** Link checker doesn't understand Hugo's URL generation - ignore false positives or test against running Hugo server

### Agent Context Updater Fails

**Problem:** "Marker not found in CLAUDE.md"
**Solution:** Add markers to CLAUDE.md (see Setup Required section)

**Problem:** Technologies not detected
**Solution:** Add custom patterns to script or manually add to CLAUDE.md

**Problem:** Duplicate technologies
**Solution:** Script uses basic normalization - manually clean up CLAUDE.md between markers

### Dashboard Shows Wrong Status

**Problem:** Feature shows "Draft" but files are complete
**Solution:** Dashboard uses 50-line threshold - increase content or adjust threshold

**Problem:** Tasks show 0% but some are complete
**Solution:** Ensure tasks use `[x] Complete` checkbox format (lowercase x)

---

## Maintenance

### Regular Updates

**Monthly:** Review and update technology patterns in updater
**Quarterly:** Review link checker for new markdown link formats
**Per-feature:** Run dashboard to track progress

### Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.1.0 | 2025-11-11 | Added link checker, agent updater, dashboard |
| 1.0.0 | 2025-11-11 | Initial speckit infrastructure |

---

## See Also

- **Main Scripts README:** [README.md](README.md)
- **Speckit Overview:** [../.specify/README.md](../.specify/README.md)
- **Installation Guide:** [../.specify/INSTALLATION.md](../.specify/INSTALLATION.md)
- **Constitution:** [../.specify/memory/constitution.md](../.specify/memory/constitution.md)

---

**Enhancements Version:** 1.1.0
**Status:** Beta (production-ready, but still gathering feedback)
**Next Review:** 2025-12-11 or after completing Feature 001
