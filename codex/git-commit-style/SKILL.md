---
name: git-commit-style
description: Use this skill when preparing git commits, writing commit messages, deciding commit scope/type, or creating PR descriptions. Always show the commit draft to the user and wait for explicit approval before running git commit.
---

# Git Commit Style

Use this skill whenever a commit is being prepared.

## Hard Rules

- Always draft the commit message first.
- Always show the draft to the user before committing.
- Do not run `git commit` until the user explicitly approves the draft.
- Do not include unrelated changes in the same commit.
- Do not amend commits unless the user explicitly asks.
- Do not add `Co-Authored-By` for AI.

## Commit Format

```text
<type>(<scope>): <subject>

<body>
```

Required:

- `type`
- `subject`

Optional:

- `scope`
- `body`

## Types

- `feat`: new feature
- `fix`: bug fix
- `chore`: setup, deployment, config, or non-functional work
- `refactor`: structure change without behavior change
- `docs`: documentation
- `test`: tests
- `style`: formatting only
- `perf`: performance improvement

Most common:

- `feat`
- `fix`
- `chore`

## Scope

Use a scope when it clarifies the affected module.

Examples:

- `algo`
- `backend`
- `frontend`
- `deploy`
- `pallet`
- `solver`
- `ect`

Omit scope if it does not add clarity.

## Subject

- Start with a lowercase verb.
- Describe what changed, not which file changed.
- Keep it short, ideally 30 to 50 characters.
- Do not end with a period.

Good examples:

```text
feat(pallet): add interleaved arrangement
fix(solver): correct phase 2 bonus calculation
chore(deploy): use external postgresql
```

Bad examples:

```text
update files
Fixed bug.
modified solver.py
```

## Body

Use a body for larger changes.

Rules:

- Leave one blank line after the subject.
- Use `-` bullet points.
- Keep each line under 72 characters when practical.
- Do not put test instructions in the commit body.

Example:

```text
feat(frontend): single-page calculator ui v3

- Replace multi-page workflow with single-page calculator
- Add pdf report download with embedded 3d images
- Sort eligible cartons by volume ratio first
```

## One Commit, One Purpose

Each commit should represent one logical change.

Good split:

```text
feat(pallet): add interleaved arrangement
fix(solver): correct ratio threshold check
docs: update readme
```

Bad:

```text
update multiple files and fix bugs
```

## Do Not Include

- test method details
- raw file names as the main subject
- timestamps
- author names
- AI co-author trailers

## Branch Names

Use lowercase words joined by `-`.

Patterns:

- `feature/<name>`
- `fix/<name>`
- `release/<version>`
- `chore/<name>`

Examples:

```text
feature/pallet-rotation
fix/volume-ratio-rounding
release/demo-v2
chore/sub-path-deploy
```

## PR Description

PR descriptions can include testing details. Use:

```text
## Summary
- Explain what changed and why

## Changes
- List affected modules when useful

## Test
- Explain how the change was verified
```

## Required Commit Approval Flow

Before committing, present:

```text
Proposed commit:

<commit message>

Files to include:
- <path>
- <path>

Please confirm before I run git commit.
```

Only after approval, stage the intended files and run `git commit`.

