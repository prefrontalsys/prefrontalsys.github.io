#!/usr/bin/env bash
set -euo pipefail

# check-links.sh
# Validates internal and external links in markdown files
#
# Usage:
#   ./check-links.sh [file-or-directory]
#
# Arguments:
#   file-or-directory    File or directory to check (default: content/)
#
# Options:
#   --skip-external     Skip external link checking (faster)
#   --json              Output results as JSON

SKIP_EXTERNAL=false
OUTPUT_JSON=false
TARGET=""

# Parse options
while [[ $# -gt 0 ]]; do
    case $1 in
        --skip-external)
            SKIP_EXTERNAL=true
            shift
            ;;
        --json)
            OUTPUT_JSON=true
            shift
            ;;
        -*)
            echo "Error: Unknown option: $1" >&2
            exit 1
            ;;
        *)
            if [[ -n "$TARGET" ]]; then
                echo "Error: Only one target file/directory is supported." >&2
                exit 1
            fi
            TARGET="$1"
            shift
            ;;
    esac
done

if [[ -z "$TARGET" ]]; then
    TARGET="content/"
fi

# Validate target exists
if [[ ! -e "$TARGET" ]]; then
    echo "Error: Target not found: $TARGET" >&2
    exit 1
fi

# Find all markdown files
if [[ -d "$TARGET" ]]; then
    MARKDOWN_FILES=$(find "$TARGET" -name "*.md" -type f)
else
    MARKDOWN_FILES="$TARGET"
fi

# Counters
TOTAL_INTERNAL=0
BROKEN_INTERNAL=0
TOTAL_EXTERNAL=0
BROKEN_EXTERNAL=0
declare -a BROKEN_LINKS

# Check if Hugo server is available for internal link validation
HUGO_AVAILABLE=false
if command -v hugo &> /dev/null; then
    HUGO_AVAILABLE=true
fi

echo "Link Checker for Markdown Files"
echo "================================"
echo ""
echo "Target: $TARGET"
echo "Skip external: $SKIP_EXTERNAL"
echo "Hugo available: $HUGO_AVAILABLE"
echo ""

# Process each markdown file
for file in $MARKDOWN_FILES; do
    if [[ "$OUTPUT_JSON" != true ]]; then
        echo "Checking: $file"
    fi

    # Extract markdown links [text](url)
    # This regex finds [anything](anything) patterns
    while IFS= read -r line_num; do
        line_content=$(sed -n "${line_num}p" "$file")

        # Extract all links from this line
        links=$(echo "$line_content" | grep -oE '\[([^\]]+)\]\(([^)]+)\)' | sed -E 's/\[([^\]]+)\]\(([^)]+)\)/\2/g')

        local OLD_IFS="$IFS"
        IFS=$'\n'
        for link in $links; do
            # Skip anchors and mailto links
            if [[ "$link" =~ ^# ]] || [[ "$link" =~ ^mailto: ]]; then
                continue
            fi

            # Determine if internal or external
            if [[ "$link" =~ ^https?:// ]]; then
                # External link
                TOTAL_EXTERNAL=$((TOTAL_EXTERNAL + 1))

                if [[ "$SKIP_EXTERNAL" != true ]]; then
                    # Check if URL is accessible (HEAD request)
                    if ! curl -sSf -I -L --max-time 10 "$link" > /dev/null 2>&1; then
                        BROKEN_EXTERNAL=$((BROKEN_EXTERNAL + 1))
                        BROKEN_LINKS+=("EXTERNAL|$file:$line_num|$link|Failed to fetch")
                        if [[ "$OUTPUT_JSON" != true ]]; then
                            echo "  ✗ BROKEN EXTERNAL: $link (line $line_num)"
                        fi
                    fi
                fi
            else
                # Internal link
                TOTAL_INTERNAL=$((TOTAL_INTERNAL + 1))

                # Resolve relative path
                file_dir=$(dirname "$file")

                # Handle different link formats
                if [[ "$link" =~ ^/ ]]; then
                    # Absolute path from root
                    target_path="content${link}.md"
                    # Also check without .md extension (Hugo might handle it)
                    alt_target_path="content${link}/index.md"
                else
                    # Relative path
                    target_path="${file_dir}/${link}"
                    alt_target_path="${file_dir}/${link}/index.md"
                fi

                # Check if file exists
                if [[ ! -f "$target_path" ]] && [[ ! -f "${target_path}.md" ]] && [[ ! -f "$alt_target_path" ]]; then
                    BROKEN_INTERNAL=$((BROKEN_INTERNAL + 1))
                    BROKEN_LINKS+=("INTERNAL|$file:$line_num|$link|File not found: $target_path")
                    if [[ "$OUTPUT_JSON" != true ]]; then
                        echo "  ✗ BROKEN INTERNAL: $link (line $line_num) - Target: $target_path"
                    fi
                fi
            fi
        done
        IFS="$OLD_IFS"
    done < <(grep -n '\[.*\](.*.)' "$file" | cut -d: -f1)
done

# Output results
echo ""
echo "Link Check Results"
echo "=================="
echo ""

if [[ "$OUTPUT_JSON" == true ]]; then
    # JSON output
    cat <<EOF
{
  "summary": {
    "total_internal_links": $TOTAL_INTERNAL,
    "broken_internal_links": $BROKEN_INTERNAL,
    "total_external_links": $TOTAL_EXTERNAL,
    "broken_external_links": $BROKEN_EXTERNAL,
    "external_links_checked": $([ "$SKIP_EXTERNAL" == true ] && echo "false" || echo "true")
  },
  "broken_links": [
EOF

    first=true
    for broken in "${BROKEN_LINKS[@]}"; do
        IFS='|' read -r type location url reason <<< "$broken"
        if [[ "$first" == false ]]; then
            echo ","
        fi
        first=false
        cat <<EOF
    {
      "type": "$type",
      "location": "$location",
      "url": "$url",
      "reason": "$reason"
    }
EOF
    done

    cat <<EOF

  ]
}
EOF
else
    # Human-readable output
    echo "Internal Links: $TOTAL_INTERNAL total, $BROKEN_INTERNAL broken"
    echo "External Links: $TOTAL_EXTERNAL total, $BROKEN_EXTERNAL broken"

    if [[ "$SKIP_EXTERNAL" == true ]]; then
        echo "(External links not checked - use without --skip-external to check)"
    fi

    echo ""

    if [[ ${#BROKEN_LINKS[@]} -gt 0 ]]; then
        echo "Broken Links:"
        echo "============="
        for broken in "${BROKEN_LINKS[@]}"; do
            IFS='|' read -r type location url reason <<< "$broken"
            echo ""
            echo "[$type] $location"
            echo "  URL: $url"
            echo "  Reason: $reason"
        done
        echo ""
        echo "✗ Link check FAILED - $((BROKEN_INTERNAL + BROKEN_EXTERNAL)) broken links found"
        exit 1
    else
        echo "✓ All links valid!"
        exit 0
    fi
fi
