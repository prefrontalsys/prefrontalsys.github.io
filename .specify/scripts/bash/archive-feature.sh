#!/usr/bin/env bash
set -euo pipefail

# archive-feature.sh
# Archives a completed feature's documentation
#
# Usage:
#   ./archive-feature.sh [branch-name]
#
# Arguments:
#   branch-name    Feature branch to archive (optional, uses current branch)

BRANCH="${1:-}"

# Auto-detect branch if not provided
if [[ -z "$BRANCH" ]]; then
    BRANCH=$(git branch --show-current)
fi

# Validate branch name format (NNN-name)
if ! [[ "$BRANCH" =~ ^[0-9]{3}- ]]; then
    echo "Error: Not a feature branch (expected format: 001-feature-name)" >&2
    exit 1
fi

SPECS_DIR=".specify/specs/${BRANCH}"
ARCHIVE_DIR=".specify/archive/${BRANCH}"

# Validate specs directory exists
if [[ ! -d "$SPECS_DIR" ]]; then
    echo "Error: Spec directory not found: $SPECS_DIR" >&2
    exit 1
fi

# Create archive directory
mkdir -p .specify/archive

# Archive the specs
echo "Archiving feature: $BRANCH"
echo "  From: $SPECS_DIR"
echo "  To: $ARCHIVE_DIR"

# Move specs to archive
mv "$SPECS_DIR" "$ARCHIVE_DIR"

# Add archive timestamp
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
cat >> "${ARCHIVE_DIR}/ARCHIVED.txt" <<EOF
Archived: $TIMESTAMP
Branch: $BRANCH
EOF

echo ""
echo "✓ Feature archived successfully"
echo ""
echo "To restore:"
echo "  mv '$ARCHIVE_DIR' '$SPECS_DIR'"
echo ""
echo "To delete feature branch:"
echo "  git branch -d $BRANCH"
echo "  git push origin --delete $BRANCH  # if pushed to remote"
