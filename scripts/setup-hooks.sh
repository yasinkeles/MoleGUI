#!/bin/bash
# Install git hooks for Mole development

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOOKS_DIR="$REPO_ROOT/.git/hooks"

if [[ ! -d "$REPO_ROOT/.git" ]]; then
    echo "Error: Not in a git repository"
    exit 1
fi

echo "Installing git hooks..."

# Install pre-commit hook
if [[ -f "$SCRIPT_DIR/hooks/pre-commit" ]]; then
    cp "$SCRIPT_DIR/hooks/pre-commit" "$HOOKS_DIR/pre-commit"
    chmod +x "$HOOKS_DIR/pre-commit"
    echo "✓ Installed pre-commit hook (validates universal binaries)"
fi

echo ""
echo "Git hooks installed successfully!"
echo ""
echo "The pre-commit hook will ensure that bin/analyze-go and bin/status-go"
echo "are universal binaries (x86_64 + arm64) before allowing commits."
