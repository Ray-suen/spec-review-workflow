# Claude Entry

This folder packages the workflow for Claude Code.

## Files

- `commands/spec-review-workflow.md` — slash command with the full workflow rules
- `references/` — shared templates and checklists

## Usage

Copy the workflow files into the target Claude project:

- `claude/references/` -> project root `references/`
- `claude/commands/spec-review-workflow.md` -> project root `.claude/commands/spec-review-workflow.md`
- `claude/commands/git-commit-style.md` -> project root `.claude/commands/git-commit-style.md`
- `claude/commands/karpathy-guidelines.md` -> project root `.claude/commands/karpathy-guidelines.md`

Then type `/spec-review-workflow` inside Claude Code when you want the workflow to start.
