# Claude Entry

This folder packages the workflow for Claude Code.

## Files

- `commands/spec-review-workflow.md` — slash command with the full workflow rules (self-contained)
- `commands/git-commit-style.md` — slash command for commit style
- `commands/karpathy-guidelines.md` — slash command for coding guidelines

## Usage

Copy the commands into the target Claude project:

- `claude/commands/spec-review-workflow.md` -> project root `.claude/commands/spec-review-workflow.md`
- `claude/commands/git-commit-style.md` -> project root `.claude/commands/git-commit-style.md`
- `claude/commands/karpathy-guidelines.md` -> project root `.claude/commands/karpathy-guidelines.md`

Then type `/spec-review-workflow` inside Claude Code when you want the workflow to start.
