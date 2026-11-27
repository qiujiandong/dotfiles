#!/bin/sh

set -eu

export PATH="$HOME/.local/bin:$PATH"

echo 'Install and manage mise manually, then run `mise doctor` to check your setup.'

# Run outside the source checkout so Codex uses the user's global setup.
cd "$HOME"

install_ponytail() {
    marketplaces="$(codex plugin marketplace list)" || return 1
    if ! printf '%s\n' "$marketplaces" | awk '$1 == "ponytail" { found = 1 } END { exit !found }'; then
        codex plugin marketplace add DietrichGebert/ponytail || return 1
    fi

    plugins="$(codex plugin list --marketplace ponytail)" || return 1
    if ! printf '%s\n' "$plugins" | awk '$1 == "ponytail@ponytail" && $2 == "installed," { found = 1 } END { exit !found }'; then
        codex plugin add ponytail@ponytail
    fi
}

if command -v codex >/dev/null 2>&1; then
    install_ponytail
else
    echo 'Codex is unavailable; skipping Ponytail installation. Run update_local manually to install or update tools.'
fi
