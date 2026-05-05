#!/usr/bin/env bash
# Sync source files to installed Claude and Codex paths.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
CODEX_DIR="$HOME/.codex/skills"

echo "Syncing from $REPO_DIR"

# Claude: commands and references
mkdir -p "$CLAUDE_DIR/commands" "$CLAUDE_DIR/references"
cp "$REPO_DIR/claude/commands/"*.md "$CLAUDE_DIR/commands/"
cp "$REPO_DIR/claude/references/"*.md "$CLAUDE_DIR/references/"
echo "  claude: commands + references synced to $CLAUDE_DIR"

# Codex: each skill directory
mkdir -p "$CODEX_DIR"
for skill in spec-review-workflow git-commit-style karpathy-guidelines; do
  src="$REPO_DIR/codex/$skill"
  dst="$CODEX_DIR/$skill"
  if [[ -d "$src" ]]; then
    rm -rf "$dst"
    cp -r "$src" "$dst"
    echo "  codex: $skill synced to $dst"
  fi
done

echo "Done."
