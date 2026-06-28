#!/usr/bin/env python3
"""Collect staged diff context and recent commit subjects for commit drafting."""

from __future__ import annotations

import argparse
import subprocess
import sys


def run_git(args: list[str], check: bool = True) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["git", *args],
        check=check,
        text=True,
        capture_output=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Print staged-change context for drafting a commit message."
    )
    parser.add_argument(
        "--history",
        type=int,
        default=12,
        help="number of recent commit subjects to print",
    )
    args = parser.parse_args()

    try:
        repo_root = run_git(["rev-parse", "--show-toplevel"]).stdout.strip()
    except subprocess.CalledProcessError:
        print("Not inside a Git repository.", file=sys.stderr)
        return 1

    staged_name_only = run_git(["diff", "--cached", "--name-only"]).stdout.strip()
    staged_stat = run_git(["diff", "--cached", "--stat"]).stdout.strip()
    history = run_git(
        ["log", f"-n{args.history}", "--pretty=format:%h %s"]
    ).stdout.strip()
    staged_diff = run_git(["diff", "--cached"]).stdout.rstrip()

    print(f"Repository: {repo_root}")
    print()
    print("Staged files:")
    print(staged_name_only or "(none)")
    print()
    print("Staged diff stat:")
    print(staged_stat or "(none)")
    print()
    print(f"Recent commit subjects ({args.history}):")
    print(history or "(none)")
    print()
    print("Staged diff:")
    print(staged_diff or "(none)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
