#!/bin/sh

set -eu

export PATH="$HOME/.local/bin:$PATH"

echo 'Please install and manage mise manually. Installing tools through mise can take a while, so it is not run automatically during chezmoi apply.'

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

# Install tools first; a failed tool update should not block an available Codex.
status=0
"$HOME/.local/bin/update_tools" || status=1
if command -v codex >/dev/null 2>&1; then
    install_ponytail || status=1
else
    echo 'Codex is unavailable; cannot install Ponytail.' >&2
    status=1
fi
exit "$status"
