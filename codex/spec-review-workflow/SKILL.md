---
name: spec-review-workflow
description: Use this skill when the user wants the current main session to run an OpenSpec -> implementation/tests -> verification -> commit workflow with manual code review after each phase. Supports test-first and implementation-first.
---

# Spec Review Workflow

Use this when the user wants a main-session OpenSpec workflow with code review checkpoints.

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
13. After tests pass, use `git-commit-style` to draft a commit.
14. Show the commit draft and files; commit only after approval.
15. Run code review as the final checkpoint before merge.
16. Only after code review is approved, merge the branch.

## Lightweight PRD

Use this phase when starting from an empty repo, a repo without clear app structure, or a request that is too broad to spec safely.

Ask the needed questions in one batch. Use [references/prd_template.md](references/prd_template.md) for the fields and output shape.

After the user answers, summarize the Lightweight PRD and write it to `docs/prd.md`.
Create OpenSpec files only after the user approves `docs/prd.md`.

## PRD Gate

- If the user is discussing PRD, requirements, scope, planning, or product direction, do not implement yet.
- When this workflow is active, an empty repo must start with Lightweight PRD unless the user explicitly says to skip PRD/OpenSpec.
- Even if the request is small, do not skip the PRD phase while the user is asking to discuss PRD.
- In an empty repo, initialize git if needed, but do not create a feature branch until after the Lightweight PRD is approved.
- For trivial changes in an existing project, OpenSpec may be skipped only after stating why and getting explicit user approval to skip it.
- If the repo is empty, ask whether it should stay local or be linked to an existing remote repo before creating branches or OpenSpec files.

## OpenSpec Gate

- When this workflow is active, OpenSpec is required before tests or implementation.
- Do not skip OpenSpec because the request is small.
- OpenSpec may be skipped only when the repo is an existing project, the change is trivial, the change does not alter behavior, and the user explicitly approves skipping OpenSpec.
- If OpenSpec is skipped, state why before editing files.

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

## GitLab Remote

- When the user requests `remote` or `push`, use the existing local Git auth for the target account if it is already configured.
- Do not ask for credentials if local auth already exists.
- If the target repo is not yet known, ask only for the repo target before setting the remote or pushing.
- Do not expose, print, or modify credentials unless the user explicitly asks.

## SSH Key Defaults

- Use `~/.ssh/id_ed25519` as the company key on this machine unless the user says otherwise.
- Use `~/.ssh/id_ed25519_personal` as the personal GitHub key on this machine unless the user says otherwise.

## GitLab Remote Creation

- If the GitLab repo does not exist yet, ask for or infer the target namespace/group, project name, and whether to use the current local repo name.
- Use a default company namespace only when the user has not specified another target.
- If the target is still ambiguous, stop and ask before creating the remote repo.

## Review Level

Use [references/review_checklist.md](references/review_checklist.md) for code review.

- Phase review happens after each phase to confirm direction before continuing.
- Code review is the final checkpoint before merge.
- Do not merge until code review is explicitly approved.
- Do not treat a quick code skim or test run as code review.

## Python Environment

Use [references/python_env.md](references/python_env.md) for Python environment handling.

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
