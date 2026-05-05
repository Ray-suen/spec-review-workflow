# Lightweight PRD Template

Use this when starting from an empty repo, a repo without clear app structure, or a request that is too broad to spec safely.

Ask the needed questions in one batch.

Fields:

- Problem / goal: what problem the project solves and what outcome is desired
- Target users: who will use it and in what context
- Core user flows: the main user actions from start to finish
- MVP scope: what the first version must include
- MVP non-goals: what the first version explicitly will not include; do not treat these as permanent product decisions unless the user says so
- Functional requirements: concrete capabilities and rules
- UX constraints, if relevant: layout, interaction, responsive, accessibility, and visual expectations
- Data and persistence needs: what data exists and where/how it is stored
- Auth / permissions needs: login, roles, ownership, and access control
- External integrations: third-party services, APIs, payments, email, OAuth, or none
- Acceptance criteria: observable conditions that define done
- Open questions: unresolved decisions that need user input

Output:

- Summarize the PRD.
- Write it to `docs/prd.md`.
- Stop for approval before creating OpenSpec files.
