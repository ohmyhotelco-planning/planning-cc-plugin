#!/usr/bin/env bash
# PostToolUse hook: validates spec format after Write/Edit on spec files
# Only runs when the modified file is a spec markdown file under docs/specs/

set -euo pipefail

# Read hook input from stdin
INPUT=$(cat)

# Get the file path that was written/edited
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // ""')

# Only validate spec files
if [[ ! "$FILE_PATH" =~ docs/specs/.*-spec\.md$ ]]; then
  exit 0
fi

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

# Define required sections
REQUIRED_SECTIONS=(
  "## 1. Overview"
  "## 2. User Stories"
  "## 3. Functional Requirements"
  "## 7. Error Handling"
  "## 9. Test Scenarios"
)

MISSING=()

for section in "${REQUIRED_SECTIONS[@]}"; do
  if ! grep -q "$section" "$FILE_PATH"; then
    MISSING+=("$section")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  echo ""
  echo "[Planning Plugin] Spec format warning — missing required sections in $(basename "$FILE_PATH"):"
  for m in "${MISSING[@]}"; do
    echo "  - $m"
  done
  echo ""
  echo "Reference template: templates/functional-spec.md"
  # Exit 0 (warning only, don't block)
  exit 0
fi

exit 0
