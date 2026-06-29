# Architecture

The repository is organized by user-facing subsystem rather than by package
manager or operating system.

## Repository Layout

- Top-level `dot_*` files manage classic home-directory configuration such as
  `zsh`, `tmux`, `git`, and mail tools.
- `dot_config/` contains XDG-style application configuration such as Hyprland,
  Quickshell, Neovim, kitty, and systemd user units.
- Template files ending in `.tmpl` are rendered by `chezmoi` at apply time.

## Configuration Layers

There are three layers in practice:

1. Common defaults that should apply everywhere.
2. OS-specific or host-specific conditions implemented with `chezmoi` templates.
3. Manual local state that stays outside the repository, such as secrets or
   one-off shell additions.

## Why `chezmoi`

`chezmoi` is the main orchestration tool here because it provides:

- A clean source-state repository format.
- Template support for host-aware deployment.
- External dependency checkout through `.chezmoiexternal.toml`.
- A reproducible apply/update workflow without writing a custom bootstrap script.

## Documentation Boundary

The documentation in this repository is meant to explain the design and usage of
the setup. It is not intended to duplicate the full upstream manuals for
Hyprland, Quickshell, Neovim, or neomutt.
