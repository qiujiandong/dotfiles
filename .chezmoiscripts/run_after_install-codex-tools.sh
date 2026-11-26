#!/bin/sh

set -eu

export PATH="$PATH:$HOME/.local/bin"
command -v codex >/dev/null 2>&1 || exit 0

# Run outside the source checkout so Codex uses the user's global setup.
cd "$HOME"

install_codebase_memory() {
    if command -v codebase-memory-mcp >/dev/null 2>&1; then
        if [ -f "$HOME/.agents/skills/codebase-memory/SKILL.md" ] &&
            codex mcp get codebase-memory-mcp >/dev/null 2>&1; then
            return
        fi
        codebase-memory-mcp install -y --clients=codex
    else
        case "$(uname -s):$(uname -m)" in
            Linux:x86_64|Linux:aarch64|Darwin:x86_64|Darwin:arm64)
                installer="$(mktemp)" || return 1
                trap 'rm -f "$installer"' EXIT
                curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh > "$installer" || return 1
                bash "$installer" --clients=codex
                ;;
            *)
                echo "Codebase Memory MCP: no upstream binary for this platform." >&2
                ;;
        esac
    fi
}

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

# Run each installer so one upstream failure does not block the other.
status=0
(install_codebase_memory) || status=1
install_ponytail || status=1
exit "$status"
