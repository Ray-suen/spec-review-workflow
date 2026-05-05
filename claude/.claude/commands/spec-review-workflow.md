# spec-review-workflow

Use this command to run the current session through the workflow defined in this repository.

Follow these rules:

1. Discuss the request before editing anything.
2. If the repo is empty or the structure is unclear, start with Lightweight PRD and write `docs/prd.md`.
3. Create OpenSpec before any non-trivial implementation or tests.
4. If the scope grows while working, stop and update OpenSpec before continuing.
5. Stop after each phase for phase review.
6. Choose `test-first` or `implementation-first` and explain why.
7. Run tests only after the relevant phase review is approved.
8. Start code review only after explicit approval.
9. Treat code review as the final checkpoint before merge.
10. After code review is approved, draft the commit message and show it to the user.
11. Do not merge until the commit is approved.
12. After merge, archive the OpenSpec change.

Prefer the repository's shared templates and checklists under `core/`.
