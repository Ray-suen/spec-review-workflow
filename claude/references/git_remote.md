# Git Remote and SSH

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
