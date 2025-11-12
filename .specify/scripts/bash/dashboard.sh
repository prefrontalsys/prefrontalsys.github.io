#!/usr/bin/env bash
set -euo pipefail

# dashboard.sh
# Shows progress dashboard for all speckit features
#
# Usage:
#   ./dashboard.sh [--format format]
#
# Options:
#   --format table    Table format (default)
#   --format json     JSON format
#   --format summary  Brief summary only

FORMAT="table"

# Parse options
while [[ $# -gt 0 ]]; do
    case $1 in
        --format)
            FORMAT="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

SPECS_DIR=".specify/specs"

# Check if specs directory exists
if [[ ! -d "$SPECS_DIR" ]]; then
    echo "No features found (specs directory doesn't exist)" >&2
    exit 0
fi

# Find all feature directories
FEATURES=$(find "$SPECS_DIR" -maxdepth 1 -type d -name '[0-9][0-9][0-9]-*' | sort)

if [[ -z "$FEATURES" ]]; then
    echo "No features found" >&2
    exit 0
fi

# Parse each feature
declare -a FEATURE_DATA

TOTAL_FEATURES=0
TOTAL_SPEC_COMPLETE=0
TOTAL_PLAN_COMPLETE=0
TOTAL_TASKS_COMPLETE=0
TOTAL_IMPLEMENTED=0

for feature_dir in $FEATURES; do
    TOTAL_FEATURES=$((TOTAL_FEATURES + 1))

    feature_name=$(basename "$feature_dir")
    feature_number="${feature_name:0:3}"

    spec_file="$feature_dir/spec.md"
    plan_file="$feature_dir/plan.md"
    tasks_file="$feature_dir/tasks.md"

    # Check file existence and status
    spec_status="❌"
    plan_status="❌"
    tasks_status="❌"
    impl_status="❌"

    if [[ -f "$spec_file" ]]; then
        # Check if spec has content (not just template)
        if [[ $(wc -l < "$spec_file") -gt 50 ]]; then
            spec_status="✅"
            TOTAL_SPEC_COMPLETE=$((TOTAL_SPEC_COMPLETE + 1))

            # Check spec status field
            if grep -q "^\*\*Status:\*\* Implemented" "$spec_file"; then
                impl_status="✅"
                TOTAL_IMPLEMENTED=$((TOTAL_IMPLEMENTED + 1))
            elif grep -q "^\*\*Status:\*\* Approved" "$spec_file"; then
                spec_status="✅✅"
            fi
        else
            spec_status="📝"  # Draft/empty
        fi
    fi

    if [[ -f "$plan_file" ]]; then
        if [[ $(wc -l < "$plan_file") -gt 50 ]]; then
            plan_status="✅"
            TOTAL_PLAN_COMPLETE=$((TOTAL_PLAN_COMPLETE + 1))

            # Check plan status
            if grep -q "^\*\*Status:\*\* Complete" "$plan_file"; then
                plan_status="✅✅"
            elif grep -q "^\*\*Status:\*\* In Progress" "$plan_file"; then
                plan_status="🔄"
            fi
        else
            plan_status="📝"
        fi
    fi

    if [[ -f "$tasks_file" ]]; then
        if [[ $(wc -l < "$tasks_file") -gt 50 ]]; then
            tasks_status="✅"
            TOTAL_TASKS_COMPLETE=$((TOTAL_TASKS_COMPLETE + 1))

            # Count task completion
            total_tasks=$(grep -c "^### Task" "$tasks_file" || echo "0")
            completed_tasks=$(grep -c "\[x\] Complete" "$tasks_file" || echo "0")

            if [[ $total_tasks -gt 0 ]]; then
                completion_pct=$((completed_tasks * 100 / total_tasks))
                if [[ $completion_pct -eq 100 ]]; then
                    tasks_status="✅✅ (100%)"
                elif [[ $completion_pct -gt 0 ]]; then
                    tasks_status="🔄 ($completion_pct%)"
                else
                    tasks_status="✅ (0%)"
                fi
            fi
        else
            tasks_status="📝"
        fi
    fi

    # Determine overall status
    overall_status="Planning"
    if [[ "$impl_status" == "✅" ]]; then
        overall_status="Implemented"
    elif [[ "$tasks_status" =~ ^✅✅ ]]; then
        overall_status="Complete"
    elif [[ "$tasks_status" =~ ^🔄 ]]; then
        overall_status="In Progress"
    elif [[ "$tasks_status" == "✅"* ]]; then
        overall_status="Ready"
    elif [[ "$plan_status" =~ ^✅ ]]; then
        overall_status="Planned"
    elif [[ "$spec_status" =~ ^✅ ]]; then
        overall_status="Specified"
    fi

    # Get feature title from spec
    title="(No title)"
    if [[ -f "$spec_file" ]]; then
        title_line=$(grep "^# Feature Specification:" "$spec_file" || true)
        if [[ -n "$title_line" ]]; then
            title=$(echo "$title_line" | sed 's/# Feature Specification: //')
        fi
    fi

    # Store feature data
    FEATURE_DATA+=("$feature_number|$feature_name|$title|$spec_status|$plan_status|$tasks_status|$overall_status")
done

# Output based on format
case "$FORMAT" in
    json)
        # JSON output
        echo "{"
        echo "  \"summary\": {"
        echo "    \"total_features\": $TOTAL_FEATURES,"
        echo "    \"spec_complete\": $TOTAL_SPEC_COMPLETE,"
        echo "    \"plan_complete\": $TOTAL_PLAN_COMPLETE,"
        echo "    \"tasks_complete\": $TOTAL_TASKS_COMPLETE,"
        echo "    \"implemented\": $TOTAL_IMPLEMENTED"
        echo "  },"
        echo "  \"features\": ["

        first=true
        for feature in "${FEATURE_DATA[@]}"; do
            IFS='|' read -r num name title spec plan tasks status <<< "$feature"

            if [[ "$first" == false ]]; then
                echo ","
            fi
            first=false

            cat <<EOF
    {
      "number": "$num",
      "name": "$name",
      "title": "$title",
      "spec": "$spec",
      "plan": "$plan",
      "tasks": "$tasks",
      "status": "$status"
    }
EOF
        done

        echo ""
        echo "  ]"
        echo "}"
        ;;

    summary)
        # Brief summary
        echo "Speckit Dashboard Summary"
        echo "========================"
        echo ""
        echo "Total features: $TOTAL_FEATURES"
        echo "  Specs complete: $TOTAL_SPEC_COMPLETE ($((TOTAL_SPEC_COMPLETE * 100 / TOTAL_FEATURES))%)"
        echo "  Plans complete: $TOTAL_PLAN_COMPLETE ($((TOTAL_PLAN_COMPLETE * 100 / TOTAL_FEATURES))%)"
        echo "  Tasks generated: $TOTAL_TASKS_COMPLETE ($((TOTAL_TASKS_COMPLETE * 100 / TOTAL_FEATURES))%)"
        echo "  Implemented: $TOTAL_IMPLEMENTED ($((TOTAL_IMPLEMENTED * 100 / TOTAL_FEATURES))%)"
        ;;

    table|*)
        # Table format (default)
        echo "Speckit Features Dashboard"
        echo "=========================="
        echo ""
        echo "Legend:"
        echo "  ✅ = Complete    ✅✅ = Approved/Done    🔄 = In Progress"
        echo "  📝 = Draft       ❌ = Not Started"
        echo ""

        # Print table header
        printf "%-5s | %-25s | %-15s | %-8s | %-8s | %-12s | %-15s\n" \
            "Num" "Feature" "Title (abbrev)" "Spec" "Plan" "Tasks" "Status"
        printf "%.5s-+-%.25s-+-%.15s-+-%.8s-+-%.8s-+-%.12s-+-%.15s\n" \
            "-----" "-------------------------" "---------------" \
            "--------" "--------" "------------" "---------------"

        # Print feature rows
        for feature in "${FEATURE_DATA[@]}"; do
            IFS='|' read -r num name title spec plan tasks status <<< "$feature"

            # Truncate title
            title_short="${title:0:13}"
            if [[ ${#title} -gt 13 ]]; then
                title_short="${title_short}..."
            fi

            printf "%-5s | %-25s | %-15s | %-8s | %-8s | %-12s | %-15s\n" \
                "$num" "${name:4}" "$title_short" "$spec" "$plan" "$tasks" "$status"
        done

        echo ""
        echo "Summary"
        echo "-------"
        echo "Total features: $TOTAL_FEATURES"
        echo "  Specs: $TOTAL_SPEC_COMPLETE/$TOTAL_FEATURES complete"
        echo "  Plans: $TOTAL_PLAN_COMPLETE/$TOTAL_FEATURES complete"
        echo "  Tasks: $TOTAL_TASKS_COMPLETE/$TOTAL_FEATURES generated"
        echo "  Implemented: $TOTAL_IMPLEMENTED/$TOTAL_FEATURES complete"

        echo ""
        echo "To view a feature:"
        echo "  cat .specify/specs/NNN-feature-name/spec.md"
        echo ""
        echo "To start a new feature:"
        echo "  /speckit.specify <description>"
        ;;
esac
