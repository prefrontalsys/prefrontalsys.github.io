#!/usr/bin/env bash
set -euo pipefail

# setup-plan.sh
# Sets up planning phase for current feature branch
#
# Usage:
#   ./setup-plan.sh --json
#
# Options:
#   --json    Output results as JSON

OUTPUT_JSON=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            OUTPUT_JSON=true
            shift
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

# Validate branch name format (NNN-name)
if ! [[ "$CURRENT_BRANCH" =~ ^[0-9]{3}- ]]; then
    echo "Error: Not on a feature branch (expected format: 001-feature-name)" >&2
    exit 1
fi

# Extract feature number
FEATURE_NUMBER="${CURRENT_BRANCH:0:3}"

# Construct paths
SPECS_DIR=".specify/specs/${CURRENT_BRANCH}"
SPEC_FILE="${SPECS_DIR}/spec.md"
PLAN_FILE="${SPECS_DIR}/plan.md"
TASKS_FILE="${SPECS_DIR}/tasks.md"
PLAN_TEMPLATE=".specify/templates/plan-template.md"

# Validate spec directory exists
if [[ ! -d "$SPECS_DIR" ]]; then
    echo "Error: Spec directory not found: $SPECS_DIR" >&2
    echo "Run create-new-feature.sh first" >&2
    exit 1
fi

# Validate spec file exists
if [[ ! -f "$SPEC_FILE" ]]; then
    echo "Error: Spec file not found: $SPEC_FILE" >&2
    echo "Run /speckit.specify first" >&2
    exit 1
fi

# Copy plan template if plan doesn't exist
if [[ ! -f "$PLAN_FILE" ]] && [[ -f "$PLAN_TEMPLATE" ]]; then
    cp "$PLAN_TEMPLATE" "$PLAN_FILE"
fi

# Output results
if [[ "$OUTPUT_JSON" == true ]]; then
    cat <<EOF
{
  "BRANCH": "$CURRENT_BRANCH",
  "FEATURE_NUMBER": "$FEATURE_NUMBER",
  "SPECS_DIR": "$SPECS_DIR",
  "FEATURE_SPEC": "$SPEC_FILE",
  "IMPL_PLAN": "$PLAN_FILE",
  "TASKS_FILE": "$TASKS_FILE"
}
EOF
else
    echo "Planning setup complete"
    echo "Branch: $CURRENT_BRANCH"
    echo "Spec: $SPEC_FILE"
    echo "Plan: $PLAN_FILE"
fi
