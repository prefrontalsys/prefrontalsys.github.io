#!/usr/bin/env bash
set -euo pipefail

# update-agent-context.sh
# Updates AI agent context files with technology from current plan
#
# Usage:
#   ./update-agent-context.sh [agent-name] [--dry-run]
#
# Arguments:
#   agent-name    Agent to update (claude, cursor, gemini, windsurf)
#                 If omitted, auto-detects from environment
#   --dry-run     Show what would be updated without making changes

AGENT="${1:-auto}"
DRY_RUN=false

# Parse options
for arg in "$@"; do
    if [[ "$arg" == "--dry-run" ]]; then
        DRY_RUN=true
    fi
done

# Auto-detect agent if not specified
if [[ "$AGENT" == "auto" ]]; then
    if [[ -n "${CLAUDE_CODE:-}" ]] || [[ -d ".claude" ]]; then
        AGENT="claude"
    elif [[ -f ".cursorrules" ]]; then
        AGENT="cursor"
    elif [[ -d ".gemini" ]]; then
        AGENT="gemini"
    elif [[ -d ".windsurf" ]]; then
        AGENT="windsurf"
    else
        # Default to claude
        AGENT="claude"
    fi
fi

# Determine context file based on agent
case "$AGENT" in
    claude)
        CONTEXT_FILE="CLAUDE.md"
        BEGIN_MARKER="## Active Technologies"
        END_MARKER="## Recent Changes"
        ;;
    cursor)
        CONTEXT_FILE=".cursorrules"
        BEGIN_MARKER="<!-- BEGIN AUTO-GENERATED TECH STACK -->"
        END_MARKER="<!-- END AUTO-GENERATED TECH STACK -->"
        ;;
    gemini)
        CONTEXT_FILE=".gemini/context.md"
        BEGIN_MARKER="## Active Technologies"
        END_MARKER="## Recent Changes"
        ;;
    windsurf)
        CONTEXT_FILE=".windsurf/context.md"
        BEGIN_MARKER="## Active Technologies"
        END_MARKER="## Recent Changes"
        ;;
    *)
        echo "Error: Unknown agent: $AGENT" >&2
        echo "Supported agents: claude, cursor, gemini, windsurf" >&2
        exit 1
        ;;
esac

# Get current branch and plan file
CURRENT_BRANCH=$(git branch --show-current)
PLAN_FILE=".specify/specs/${CURRENT_BRANCH}/plan.md"

# Validate plan file exists
if [[ ! -f "$PLAN_FILE" ]]; then
    echo "Error: Plan file not found: $PLAN_FILE" >&2
    echo "Run /speckit.plan first" >&2
    exit 1
fi

echo "Agent Context Updater"
echo "===================="
echo ""
echo "Agent: $AGENT"
echo "Context file: $CONTEXT_FILE"
echo "Plan file: $PLAN_FILE"
echo "Dry run: $DRY_RUN"
echo ""

# Extract technologies from plan (basic pattern matching)
declare -A TECHNOLOGIES

# Common patterns to search for
patterns=(
    "Hugo [0-9]+\.[0-9]+(\.[0-9]+)?(\+)?"
    "Python [0-9]+\.[0-9]+"
    "TypeScript"
    "JavaScript"
    "React"
    "Vue\.js"
    "Next\.js"
    "FastAPI"
    "FastMCP"
    "Flask"
    "Django"
    "Pydantic"
    "PostgreSQL"
    "SQLite"
    "MongoDB"
    "Redis"
    "Docker"
    "Kubernetes"
    "GitHub Actions"
    "pytest"
    "Jest"
)

echo "Extracting technologies from plan..."
for pattern in "${patterns[@]}"; do
    matches=$(grep -oE "$pattern" "$PLAN_FILE" 2>/dev/null | sort -u || true)
    if [[ -n "$matches" ]]; then
        for match in $matches; do
            # Normalize name (remove version for deduplication key)
            name=$(echo "$match" | sed -E 's/ [0-9]+\.[0-9]+.*//')
            TECHNOLOGIES["$name"]="$match"
        done
    fi
done

if [[ ${#TECHNOLOGIES[@]} -eq 0 ]]; then
    echo "No technologies detected in plan"
    exit 0
fi

echo "Found technologies:"
for tech in "${TECHNOLOGIES[@]}"; do
    echo "  - $tech"
done
echo ""

# Check if context file exists
if [[ ! -f "$CONTEXT_FILE" ]]; then
    echo "Warning: Context file not found: $CONTEXT_FILE" >&2
    echo "Skipping context update" >&2
    exit 0
fi

# Check if markers exist
if ! grep -q "$BEGIN_MARKER" "$CONTEXT_FILE"; then
    echo "Warning: Marker '$BEGIN_MARKER' not found in $CONTEXT_FILE" >&2
    echo ""
    echo "To enable automatic updates, add these markers to $CONTEXT_FILE:"
    echo ""
    echo "$BEGIN_MARKER"
    echo "<!-- Technologies will be auto-generated here -->"
    echo "$END_MARKER"
    echo ""
    exit 0
fi

# Extract existing technologies between markers
TEMP_FILE=$(mktemp)
EXISTING_SECTION=$(mktemp)
NEW_SECTION=$(mktemp)

# Get line numbers of markers
BEGIN_LINE=$(grep -n "^$BEGIN_MARKER" "$CONTEXT_FILE" | cut -d: -f1)
END_LINE=$(grep -n "^$END_MARKER" "$CONTEXT_FILE" | cut -d: -f1)

if [[ -z "$BEGIN_LINE" ]] || [[ -z "$END_LINE" ]]; then
    echo "Error: Could not find both markers in $CONTEXT_FILE" >&2
    exit 1
fi

# Extract existing technologies (lines between markers)
sed -n "$((BEGIN_LINE + 1)),$((END_LINE - 1))p" "$CONTEXT_FILE" > "$EXISTING_SECTION"

# Parse existing technologies
declare -A EXISTING_TECHS
while IFS= read -r line; do
    if [[ "$line" =~ ^-\ (.+)\ \(.*\)$ ]] || [[ "$line" =~ ^-\ (.+)$ ]]; then
        tech_name="${BASH_REMATCH[1]}"
        # Normalize (remove version)
        tech_key=$(echo "$tech_name" | sed -E 's/ [0-9]+\.[0-9]+.*//')
        EXISTING_TECHS["$tech_key"]="$line"
    fi
done < "$EXISTING_SECTION"

# Build new section with merged technologies
echo "$BEGIN_MARKER" > "$NEW_SECTION"

# Add existing technologies (preserve manual additions)
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -z "$line" ]] || [[ "$line" =~ ^[[:space:]]*# ]]; then
        continue
    fi
    echo "$line" >> "$NEW_SECTION"
done < "$EXISTING_SECTION"

# Add new technologies
ADDED_COUNT=0
for tech_key in "${!TECHNOLOGIES[@]}"; do
    tech_value="${TECHNOLOGIES[$tech_key]}"

    # Check if already exists
    if [[ -v EXISTING_TECHS["$tech_key"] ]]; then
        echo "  Already present: $tech_value"
        continue
    fi

    # Add new technology
    echo "- $tech_value (${CURRENT_BRANCH})" >> "$NEW_SECTION"
    ADDED_COUNT=$((ADDED_COUNT + 1))
    echo "  + Adding: $tech_value"
done

echo "$END_MARKER" >> "$NEW_SECTION"

# Show what would change
if [[ "$DRY_RUN" == true ]]; then
    echo ""
    echo "Dry run - would update $CONTEXT_FILE with:"
    echo ""
    cat "$NEW_SECTION"
    echo ""
    echo "Run without --dry-run to apply changes"
    exit 0
fi

# Apply changes
if [[ $ADDED_COUNT -gt 0 ]]; then
    # Build new file: before markers + new section + after markers
    {
        sed -n "1,$((BEGIN_LINE - 1))p" "$CONTEXT_FILE"
        cat "$NEW_SECTION"
        sed -n "$((END_LINE + 1)),\$p" "$CONTEXT_FILE"
    } > "$TEMP_FILE"

    # Replace original file
    mv "$TEMP_FILE" "$CONTEXT_FILE"

    echo ""
    echo "✓ Updated $CONTEXT_FILE with $ADDED_COUNT new technologies"
else
    echo ""
    echo "✓ No new technologies to add - $CONTEXT_FILE is up to date"
fi

# Cleanup
rm -f "$EXISTING_SECTION" "$NEW_SECTION" "$TEMP_FILE"

exit 0
