---
name: git-commit-staged
description: Generate a Git commit message from the current staged changes and create the commit only when something is staged. Use when Codex should inspect `git diff --cached` plus recent commit history, write an 80-character-or-shorter one-line summary, add either a single concise body line or concise `- ` bullet details depending on how many change points exist, and run `git commit -S --signoff` without including unstaged changes.
---

# Git Commit Staged

## Overview

Generate a commit message from staged changes only. Match the repository's recent commit style where it is useful, skip the commit when nothing is staged, and keep the final message concise and reviewable.

## Workflow

1. Verify that the current directory is inside a Git repository.
2. Check whether anything is staged before spending effort on the message.
3. Gather staged-change context and recent commit subjects.
4. Draft a subject line and a concise body from staged changes only.
5. Create the commit with `git commit -S --signoff -F` so the exact message is preserved and the commit carries both GPG signing and signoff.
6. Report the created commit SHA and subject, or report that nothing was committed.

## Guardrails

- Run `git diff --cached --quiet` first. If it exits `0`, stop and say that no staged changes exist, so no commit was created.
- Never include unstaged or untracked changes in the description.
- Treat recent history as style guidance, not as text to copy.
- Keep the subject line to 80 characters or fewer.
- Use a single plain body line when there is only one meaningful change point.
- Use a flat list of concise `- ` bullets when there are multiple change points.
- Omit the body entirely only if the staged change is trivial and even a single body line would add no signal.
- Always create the commit with both `--signoff` and `-S`. Do not silently drop either flag.

## Collect Context

Prefer the helper script first:

```bash
python3 scripts/collect_commit_context.py
```

The script prints:

- repository root
- staged file list
- staged diff stat
- recent commit subjects
- full staged diff

If the script is unavailable or needs adjustment, collect the same context manually:

```bash
git status --short
git diff --cached --stat
git log --oneline -n 12
git diff --cached
```

## Write The Message

Use this structure:

```text
subject line under 80 chars

single concise detail
```

or:

```text
subject line under 80 chars

- first concise detail
- second concise detail
```

Write the subject as a summary of the staged change set, not as a file list. Reuse useful patterns from recent history when they clearly fit, such as subsystem prefixes or imperative verbs, but do not force a pattern that the staged diff does not support.

When there is only one meaningful change point, write one plain sentence fragment or short line as the body.

When there are multiple change points, write bullet items as precise change highlights:

- mention behavior, API, or documentation changes
- mention tests when tests were added or updated
- group related edits instead of narrating the patch line by line

Avoid:

- generic bullets like `- update code`
- generic one-line bodies like `update code`
- repeating the subject
- mentioning unstaged work or future follow-ups

## Create The Commit

Write the message to a temporary file, then commit with it:

```bash
git commit -S --signoff -F /tmp/commit-message.txt
```

Using `-F` avoids shell-escaping mistakes and preserves multi-line formatting. Using
`-S --signoff` ensures every commit created by this skill is GPG-signed and includes a
Developer Certificate of Origin signoff line.

## Report Back

After committing, show:

- the new short SHA
- the final subject line

If no staged changes were present, state that explicitly and do not create an empty commit.
