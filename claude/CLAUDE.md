# Claude Project Instructions

Use this project with Claude Code as the Claude-side entry for the same workflow defined in `core/` and `codex/`.
This entry expects the shared `core/` folder to be present in the same project.

## Core rules

- Discuss the request before implementation.
- Use Lightweight PRD first when the repo is empty or the structure is unclear.
- Write `docs/prd.md` before OpenSpec when the scope needs product clarification.
- OpenSpec must exist before any non-trivial implementation or tests.
- Stop after each phase for phase review.
- Start code review only after explicit approval.
- Code review is the final checkpoint before merge.
- If scope grows, stop and update OpenSpec before continuing.
- After code review is approved, draft the commit message and show it before committing.
- After merge, archive the OpenSpec change.

## Source of truth

- `core/` holds shared templates and checklists.
- `codex/` holds the Codex entry.
- `claude/` holds the Claude entry.
