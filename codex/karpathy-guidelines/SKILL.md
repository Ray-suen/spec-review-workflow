---
name: karpathy-guidelines
description: "Use this skill when writing, testing, reviewing, or refactoring code to avoid common LLM coding mistakes: hidden assumptions, overengineering, unrelated edits, and weak verification."
---

# Karpathy Guidelines

Use these coding behavior rules during non-trivial code changes.

These guidelines are adapted from the public `forrestchang/andrej-karpathy-skills` project.

## Principles

1. Think before coding.
   State assumptions. If the request is ambiguous, ask before implementing.

2. Keep the solution simple.
   Implement only what was requested. Do not add speculative flexibility, abstractions, or configuration.

3. Make surgical changes.
   Touch only the files and lines needed for the task. Match existing style. Do not refactor unrelated code.

4. Define verifiable success.
   Convert the task into observable behavior and verify it with tests, type checks, builds, or manual checks.

## Coding Rules

- Prefer the smallest correct change.
- Do not silently choose between multiple plausible interpretations.
- Do not improve adjacent code unless the task requires it.
- Remove only dead code introduced by your own changes.
- If a simpler approach exists, say so before implementing a larger one.
- For bug fixes, write or identify a test that reproduces the bug when practical.
- For validation, auth, API, or business logic, prefer behavior-focused tests.

## Verification

Before calling the work done, report:

- what changed
- what was verified
- any remaining risk or untested area
