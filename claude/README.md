# Claude Entry

This folder packages the workflow for Claude Code.

## Files

- `commands/spec-review-workflow.md` — main slash command, embeds references via `@`
- `commands/git-commit-style.md` — slash command for commit style
- `commands/karpathy-guidelines.md` — slash command for coding guidelines
- `references/` — markdown files included by `spec-review-workflow.md` via `@.claude/references/...`

## Usage

Copy into the target Claude project:

- `claude/commands/` -> project root `.claude/commands/`
- `claude/references/` -> project root `.claude/references/`

Then type `/spec-review-workflow` inside Claude Code when you want the workflow to start.
