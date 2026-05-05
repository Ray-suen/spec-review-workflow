# git-commit-style

Use this command when preparing git commits, writing commit messages, or creating PR descriptions.

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

Required: `type`, `subject`
Optional: `scope`, `body`

## Types

- `feat`: new feature
- `fix`: bug fix
- `chore`: setup, deployment, config, or non-functional work
- `refactor`: structure change without behavior change
- `docs`: documentation
- `test`: tests
- `style`: formatting only
- `perf`: performance improvement

## Scope

Use a scope when it clarifies the affected module. Omit if it does not add clarity.

## Subject

- Start with a lowercase verb.
- Describe what changed, not which file changed.
- Keep it short, ideally 30 to 50 characters.
- Do not end with a period.

## Body

Use a body for larger changes.

- Leave one blank line after the subject.
- Use `-` bullet points.
- Keep each line under 72 characters when practical.
- Do not put test instructions in the commit body.

## One Commit, One Purpose

Each commit should represent one logical change. Do not mix features, fixes, and docs in a single commit.

## Do Not Include

- test method details
- raw file names as the main subject
- timestamps
- author names
- AI co-author trailers

## Branch Names

Patterns: `feature/<name>`, `fix/<name>`, `release/<version>`, `chore/<name>`

## PR Description

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

Please confirm before I run git commit.
```

Only after approval, stage the intended files and run `git commit`.
