# Final Code Review Checklist

Use this checklist as the final checkpoint before merge, after the user explicitly approves starting code review.
It does not replace the phase review that happens after each phase.

## Basic Sanity Check

Use this for every change.

- Changed files match the request.
- Unrelated changes are excluded.
- Syntax, build, or test status is reasonable for the repo.
- The main affected flow still works at a basic level.
- No secrets or local-only paths are included.

## Full Code Review

Use this for auth, permissions, API behavior, validation, data persistence, migrations, payment, security, shared utilities, multi-module changes, significantly changed tests, or when the user asks for review.

Check:

- Requirements and acceptance criteria are covered.
- Edge cases and failure paths are handled.
- Tests cover the important behavior.
- The implementation is not overbuilt.
- No unrelated files were changed.
- The diff is coherent and ready for the next step.
