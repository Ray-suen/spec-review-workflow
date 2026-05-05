# spec-review-workflow

Use this command when the user wants the current main session to run an OpenSpec -> implementation/tests -> verification -> commit workflow with manual code review after each phase. Supports test-first and implementation-first.

## Workflow

1. Work in the current repo.
2. Initialize Git/OpenSpec only if missing.
3. For new features, bug fixes, or meaningful changes, create a branch before editing, except in an empty repo before the Lightweight PRD is approved.
4. Use a git worktree only when the user explicitly asks for one.
5. If the repo is empty or has no clear app structure, run the Lightweight PRD phase first.
6. Discuss the request before creating an OpenSpec change.
7. Create and validate the OpenSpec change.
8. Stop for spec review.
9. After approval, choose a development strategy.
10. For `test-first`, write tests only, stop for phase review, then write implementation only.
11. For `implementation-first`, write implementation only, stop for phase review, then write behavior-focused tests.
12. Stop for phase review after each phase.
13. Stop and ask for approval before starting code review.
14. Run code review as the final checkpoint before merge.
15. After code review is approved, use `git-commit-style` to draft a commit.
16. Show the commit draft and files; commit only after approval.
17. Only after code review is approved, merge the branch.
18. After merge, archive the OpenSpec change.

## Lightweight PRD

Use this phase when starting from an empty repo, a repo without clear app structure, or a request that is too broad to spec safely.

Ask the needed questions in one batch. Use the template below for the fields and output shape.

After the user answers, summarize the Lightweight PRD and write it to `docs/prd.md`.
Create OpenSpec files only after the user approves `docs/prd.md`.

@.claude/references/prd_template.md

## PRD Gate

- If the user is discussing PRD, requirements, scope, planning, or product direction, do not implement yet.
- When this workflow is active, an empty repo must start with Lightweight PRD unless the user explicitly says to skip PRD/OpenSpec.
- Even if the request is small, do not skip the PRD phase while the user is asking to discuss PRD.
- In an empty repo, initialize git if needed, but do not create a feature branch until after the Lightweight PRD is approved.
- For trivial changes in an existing project, OpenSpec may be skipped only after stating why and getting explicit user approval to skip it.
- If the repo is empty, ask whether it should stay local or be linked to an existing remote repo before creating branches or OpenSpec files.

## OpenSpec Gate

- When this workflow is active, OpenSpec must exist before any non-trivial tests or implementation.
- Do not start implementation first and then backfill OpenSpec later.
- Do not skip OpenSpec because the request is small if the change alters behavior, touches multiple files, or expands scope.
- If the scope grows while working, stop and create or update OpenSpec before continuing.
- OpenSpec may be skipped only when the repo is an existing project, the change is trivial, the change does not alter behavior, and the user explicitly approves skipping OpenSpec.
- If OpenSpec is skipped, state why before editing files.

## OpenSpec Archive

- After the branch is merged, move the completed OpenSpec change into `openspec/archive/<change-id>/` or the repo's equivalent archive location.
- Do not archive before merge.
- If the repo does not yet have an archive location, create one and use it consistently.

## Strategy

- Use `test-first` for API, auth, validation, business logic, data transformation, parser/formatter work, and bug fixes.
- Use `implementation-first` for UI, prototype, visual polish, exploratory work, external integrations, and one-off tools.
- Always tell the user which strategy was selected and why.
- If the task is ambiguous or mixed, propose the strategy split and wait for user confirmation.
- If the user specifies a strategy, follow it.
- If the feature is mixed, split the work: test-first for stable logic, implementation-first for exploratory or visual parts.

## Branch Scope

- Use one branch for one coherent change.
- Split branches only when changes are unrelated or should ship separately.
- Tiny low-risk edits do not need a new branch unless the user wants isolation.

## Git Remote and SSH

@.claude/references/git_remote.md

## Review Level

Use the checklist below for code review.

@.claude/references/review_checklist.md

- Phase review happens after each phase to confirm direction before continuing.
- Code review starts only after the user explicitly approves starting it.
- Code review is the final checkpoint before merge.
- If merge is requested before code review is complete, stop and run code review first.
- Do not merge until code review is explicitly approved.
- Do not treat a quick code skim or test run as code review.

## Python Environment

@.claude/references/python_env.md

## Coding Guidelines

@.claude/commands/karpathy-guidelines.md

## Commit Style

@.claude/commands/git-commit-style.md

## Rules

- Default to a normal git branch for changes.
- Use `feature/<name>` for new features and `fix/<name>` for bug fixes.
- In an empty repo, do not create the feature branch before Lightweight PRD approval.
- Use worktree only when the user explicitly requests an isolated working directory.
- Do not move phases without explicit user approval.
- Only edit files for the current phase.
- Apply review feedback before continuing.
- Use `karpathy-guidelines` during tests and implementation.
- Use `git-commit-style` for commits.
- Do not run `git commit` until the user approves the draft.
