# spec-review-workflow

This setup is a main-session OpenSpec workflow.

The current chat session does the work phase by phase.
It supports both `test-first` and `implementation-first`.

## Flowchart

```mermaid
flowchart TD
    START([Start · discuss scope first]) --> NEED_PRD{Repo empty<br>or unclear?}

    NEED_PRD -->|yes| PRD
    NEED_PRD -->|no| SPEC

    PRD[/"Lightweight PRD"/] --> SPEC
    SPEC["OpenSpec · define scope and acceptance"] --> REVIEW1

    REVIEW1{{"Spec review"}}
    REVIEW1 -->|approved| WORK
    REVIEW1 -->|needs changes| SPEC

    WORK["Work phase · test-first"] --> REVIEW2

    REVIEW2{{"Phase review"}}
    REVIEW2 -->|done| VERIFY
    REVIEW2 -->|needs changes| WORK

    VERIFY["Run tests / verification"] --> CODE_REVIEW

    CODE_REVIEW{{"Code review"}}
    CODE_REVIEW -->|approved| COMMIT
    CODE_REVIEW -->|needs changes| WORK

    COMMIT["Draft commit · wait for approval"] --> MERGE["Merge"]
    MERGE --> ARCHIVE["Archive OpenSpec"]

    classDef start fill:#2d3436,stroke:#1e2527,color:#fff
    classDef plan fill:#6c5ce7,stroke:#5a4bd1,color:#fff
    classDef work fill:#4361ee,stroke:#3451ce,color:#fff
    classDef review fill:#e17055,stroke:#c0604f,color:#fff
    classDef verify fill:#636e72,stroke:#4f595c,color:#fff
    classDef commit fill:#ff8c00,stroke:#e07b00,color:#fff
    classDef done fill:#00b894,stroke:#009975,color:#fff
    classDef archive fill:#8e44ad,stroke:#70368a,color:#fff

    class START start
    class PRD,SPEC plan
    class WORK work
    class REVIEW1,REVIEW2,CODE_REVIEW review
    class VERIFY verify
    class COMMIT commit
    class MERGE done
    class ARCHIVE archive
```

## Intended usage

In a project session, say something like:

```text
請用 spec-review-workflow。
先跟我討論需求，用 openspec 定 spec。
每個階段結束都停下來讓我審查。
```

## How To Edit

Edit this source repo first.

- Codex changes go in `codex/`
- Claude changes go in `claude/`

After editing, run `./sync.sh` to copy everything to:
- `~/.codex/skills/<skill>/` for Codex
- `~/.claude/commands/` and `~/.claude/references/` for Claude

## Workflow

1. Main session discusses the request.
2. Empty repo or unclear structure starts with Lightweight PRD and `docs/prd.md`.
3. After PRD approval, the session creates OpenSpec files and validates them.
4. The session stops for spec review.
5. The session chooses `test-first` or `implementation-first` and explains why.
6. The session stops after each phase for your phase review.
7. The session runs tests.
8. The session drafts the commit message with `git-commit-style`.
9. The session shows the draft and files, then waits for approval before commit.
10. The session stops and asks for approval before starting code review.
11. The session runs code review as the final checkpoint before merge.
12. If merge is requested before code review is complete, the session stops and runs code review first.
13. Only after code review approval, the session merges the branch.
14. After merge, the session archives the OpenSpec change.

## Lightweight PRD

See [codex/spec-review-workflow/references/prd_template.md](codex/spec-review-workflow/references/prd_template.md).

## Development strategy

Use `test-first` for precise logic and `implementation-first` for exploratory work. Explain the choice; ask for approval when the task is ambiguous or mixed.

## Branch Scope

Use one branch for one coherent change. Split branches only when changes are unrelated or should ship separately. Tiny low-risk edits do not need a new branch unless you want isolation.

## GitLab Remote

When you ask for `remote` or `push`, the agent should use the existing local Git auth for the target account if it is already configured. It should not ask for credentials again. If the target repo is not yet known, it should only ask for the repo target before setting the remote or pushing. It should not expose, print, or modify credentials unless you explicitly ask.

## SSH Key Defaults

Use `~/.ssh/id_ed25519` as the company key on this machine unless you say otherwise. Use `~/.ssh/id_ed25519_personal` as the personal GitHub key on this machine unless you say otherwise.

## GitLab Remote Creation

If the GitLab repo does not exist yet, the agent should ask for or infer the target namespace/group, project name, and whether to use the current local repo name. It should use a default company namespace only when you have not specified another target. If the target is still ambiguous, it should stop and ask before creating the remote repo.

## Phase rules

See [codex/spec-review-workflow/references/review_checklist.md](codex/spec-review-workflow/references/review_checklist.md) and [codex/spec-review-workflow/references/python_env.md](codex/spec-review-workflow/references/python_env.md).

## OpenSpec Gate

When this workflow is active, OpenSpec must exist before any non-trivial tests or implementation.
Do not start implementation first and then backfill OpenSpec later.
If the scope grows while working, stop and create or update OpenSpec before continuing.
OpenSpec may be skipped only for a trivial existing-project change that does not alter behavior and only if you explicitly approve skipping it.

## OpenSpec Archive

After merge, archive the completed OpenSpec change into `openspec/archive/<change-id>/` or the repo's equivalent archive location.
Do not archive before merge.

## PRD Gate

If you are discussing PRD, requirements, scope, planning, or product direction, the agent must not implement yet.

If the repo is empty, the agent should ask whether it should stay local or be linked to an existing remote repo before creating branches or OpenSpec files.

## Code Review

Code review here means the local checklist-based check for logic, safety, edge cases, test coverage, and scope. It is not the same as an external PR review.

Code review starts only after you explicitly approve starting it. It is the final checkpoint before merge. If merge is requested before code review is complete, the session must stop and run code review first. Do not merge until code review is explicitly approved. Do not treat a quick code skim or a test run as code review.

## Phase Review

Phase review means the stop after each phase to confirm direction before continuing.
