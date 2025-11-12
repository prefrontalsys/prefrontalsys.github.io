#!/usr/bin/env bash
set -euo pipefail

# validate-spec.sh
# Validates specification quality against checklist criteria
#
# Usage:
#   ./validate-spec.sh [spec-file]
#
# Arguments:
#   spec-file    Path to spec.md (optional, auto-detects from current branch)

SPEC_FILE="${1:-}"

# Auto-detect spec file if not provided
if [[ -z "$SPEC_FILE" ]]; then
    CURRENT_BRANCH=$(git branch --show-current)

    if ! [[ "$CURRENT_BRANCH" =~ ^[0-9]{3}- ]]; then
        echo "Error: Not on a feature branch and no spec file provided" >&2
        exit 1
    fi

    SPEC_FILE=".specify/specs/${CURRENT_BRANCH}/spec.md"
fi

# Validate spec file exists
if [[ ! -f "$SPEC_FILE" ]]; then
    echo "Error: Spec file not found: $SPEC_FILE" >&2
    exit 1
fi

echo "Validating specification: $SPEC_FILE"
echo ""

# Quality checks
ERRORS=0
WARNINGS=0

# Check 1: No implementation details (languages, frameworks, APIs)
echo "✓ Checking for implementation details..."
if grep -iE "(python|javascript|react|vue|django|flask|express)" "$SPEC_FILE" | grep -v "^#" | grep -v "Example:" >/dev/null 2>&1; then
    echo "  ⚠ Warning: Possible implementation details found (languages/frameworks)"
    WARNINGS=$((WARNINGS + 1))
fi

# Check 2: Success criteria present
echo "✓ Checking for success criteria..."
if ! grep -q "Success Criteria" "$SPEC_FILE"; then
    echo "  ✗ Error: No 'Success Criteria' section found"
    ERRORS=$((ERRORS + 1))
fi

# Check 3: No [NEEDS CLARIFICATION] markers
echo "✓ Checking for clarification markers..."
if grep -q "\[NEEDS CLARIFICATION" "$SPEC_FILE"; then
    echo "  ⚠ Warning: [NEEDS CLARIFICATION] markers found - resolve before planning"
    WARNINGS=$((WARNINGS + 1))
fi

# Check 4: Functional requirements present
echo "✓ Checking for functional requirements..."
if ! grep -q "Functional Requirements" "$SPEC_FILE"; then
    echo "  ✗ Error: No 'Functional Requirements' section found"
    ERRORS=$((ERRORS + 1))
fi

# Check 5: User stories present
echo "✓ Checking for user stories..."
if ! grep -q "User Stor" "$SPEC_FILE"; then
    echo "  ⚠ Warning: No user stories found"
    WARNINGS=$((WARNINGS + 1))
fi

# Check 6: Out of scope section present
echo "✓ Checking for out of scope section..."
if ! grep -q "Out of Scope" "$SPEC_FILE"; then
    echo "  ⚠ Warning: No 'Out of Scope' section (helps prevent scope creep)"
    WARNINGS=$((WARNINGS + 1))
fi

# Check 7: Constitution compliance section
echo "✓ Checking for constitution compliance..."
if ! grep -q "Constitution Compliance" "$SPEC_FILE"; then
    echo "  ✗ Error: No 'Constitution Compliance' section found"
    ERRORS=$((ERRORS + 1))
fi

echo ""
echo "Validation complete:"
echo "  Errors: $ERRORS"
echo "  Warnings: $WARNINGS"

if [[ $ERRORS -gt 0 ]]; then
    echo ""
    echo "✗ Specification validation FAILED"
    echo "  Fix errors before proceeding to planning phase"
    exit 1
elif [[ $WARNINGS -gt 0 ]]; then
    echo ""
    echo "⚠ Specification validation PASSED with warnings"
    echo "  Consider addressing warnings for better quality"
    exit 0
else
    echo ""
    echo "✓ Specification validation PASSED"
    exit 0
fi
