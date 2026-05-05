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

## Security

Check when the change touches auth, permissions, user input, data storage, or external APIs.

- No SQL injection, XSS, or CSRF vulnerabilities introduced.
- Authorization checks are in place — one user cannot access another user's data.
- Sensitive data (passwords, tokens, PII) is not logged or exposed in responses.

## Breaking Changes

Check when the change modifies existing APIs, DB schema, or shared interfaces.

- Existing API contracts are not broken for current clients.
- DB migrations are safe to run without locking tables or dropping data.
- Backward-incompatible changes are intentional and communicated.

## Performance

Check when the change touches database queries, loops over large datasets, or hot paths.

- No N+1 queries introduced.
- No unnecessary repeated computation inside loops.
- Large dataset scenarios have been considered.

## Observability

Check when the change introduces new operations, error paths, or integrations.

- Important operations and state changes are logged.
- Errors are recorded with enough context to debug.
