#!/usr/bin/env bash
set -euo pipefail

# create-new-feature.sh
# Creates a new feature branch and directory structure for speckit workflow
#
# Usage:
#   ./create-new-feature.sh --json --number 1 --short-name "my-feature" "Feature description"
#
# Options:
#   --json              Output results as JSON
#   --number N          Feature number (e.g., 1 for 001-my-feature)
#   --short-name NAME   Short hyphenated name for feature
#
# Remaining arguments are treated as the feature description

# Default values
OUTPUT_JSON=false
FEATURE_NUMBER=""
SHORT_NAME=""
DESCRIPTION=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --json)
            OUTPUT_JSON=true
            shift
            ;;
        --number)
            FEATURE_NUMBER="$2"
            shift 2
            ;;
        --short-name)
            SHORT_NAME="$2"
            shift 2
            ;;
        -*)
            echo "Error: Unknown option $1" >&2
            exit 1
            ;;
        *)
            # Stop parsing options, the rest is the description
            break
            ;;
    esac
done

DESCRIPTION="$*"

# Validate required arguments
if [[ -z "$FEATURE_NUMBER" ]]; then
    echo "Error: --number is required" >&2
    exit 1
fi

if [[ -z "$SHORT_NAME" ]]; then
    echo "Error: --short-name is required" >&2
    exit 1
fi

if [[ -z "$DESCRIPTION" ]]; then
    echo "Error: Feature description is required" >&2
    exit 1
fi

# Pad feature number to 3 digits
PADDED_NUMBER=$(printf "%03d" "$FEATURE_NUMBER")

# Construct names
BRANCH_NAME="${PADDED_NUMBER}-${SHORT_NAME}"
SPECS_DIR=".specify/specs/${BRANCH_NAME}"
SPEC_FILE="${SPECS_DIR}/spec.md"
PLAN_FILE="${SPECS_DIR}/plan.md"
TASKS_FILE="${SPECS_DIR}/tasks.md"

# Create branch
if git rev-parse --verify "$BRANCH_NAME" >/dev/null 2>&1; then
    # Branch exists, check it out
    git checkout "$BRANCH_NAME" >/dev/null 2>&1
else
    # Create new branch
    git checkout -b "$BRANCH_NAME" >/dev/null 2>&1
fi

# Create directory structure
mkdir -p "${SPECS_DIR}/checklists"
mkdir -p "${SPECS_DIR}/contracts"
mkdir -p "${SPECS_DIR}/artifacts"

# Initialize spec.md if it doesn't exist
if [[ ! -f "$SPEC_FILE" ]]; then
    touch "$SPEC_FILE"
fi

# Output results
if [[ "$OUTPUT_JSON" == true ]]; then
    cat <<EOF
{
  "BRANCH_NAME": "$BRANCH_NAME",
  "FEATURE_NUMBER": "$PADDED_NUMBER",
  "SHORT_NAME": "$SHORT_NAME",
  "DESCRIPTION": "$DESCRIPTION",
  "SPEC_FILE": "$SPEC_FILE",
  "PLAN_FILE": "$PLAN_FILE",
  "TASKS_FILE": "$TASKS_FILE",
  "SPECS_DIR": "$SPECS_DIR"
}
EOF
else
    echo "Created feature: $BRANCH_NAME"
    echo "Branch: $BRANCH_NAME"
    echo "Spec directory: $SPECS_DIR"
    echo "Spec file: $SPEC_FILE"
fi
