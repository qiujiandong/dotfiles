# Neovim

Neovim is structured as a small Lua configuration with explicit module imports
instead of a large framework distribution.

## Entry Point

`init.lua` is intentionally short:

- sets leader keys
- loads core settings, keymaps, and autocmds
- installs `zpack.nvim`
- loads plugin modules from `plugins` and `plugins.extra`

## Core Layout

- `lua/core/settings.lua` contains editor defaults
- `lua/core/keymaps.lua` contains direct keymap definitions
- `lua/core/autocmds.lua` contains event-driven behavior
- `lua/plugins/` contains main plugin categories
- `lua/plugins/extra/` contains optional or extended tooling

## Design Notes

- Plugin configuration is grouped by capability, not by plugin manager syntax.
- Extra plugins are separated from the core set to keep the main configuration
  readable.
- Local build hooks and parser setup live in autocmds where they are tied to
  lifecycle events.

## Areas Worth Reading First

If you are browsing for ideas, start with:

- LSP setup
- Telescope mappings
- UI plugins
- formatting behavior
