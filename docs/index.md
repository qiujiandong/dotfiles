# Dotfiles Overview

This repository contains the dotfiles I use on my own machines, managed with
`chezmoi`. The setup is opinionated and optimized for an Arch Linux Wayland
desktop, but it also includes conditional behavior for non-Arch systems and
machine-specific overrides.

## Design Goals

- Keep the desktop stack coherent across Hyprland, Quickshell, terminal, and editor.
- Use `chezmoi` templates only where host differences matter.
- Prefer simple, inspectable configuration over heavy abstraction.
- Keep personal state and secrets outside the repository when possible.

## Main Components

- `hyprland` provides the compositor, monitor layout, keybindings, and session behavior.
- `quickshell` renders the bar UI and supporting QML services.
- `zsh`, `tmux`, and `kitty` define the terminal workflow.
- `nvim` is the editing environment, loaded through `zpack.nvim`.
- `neomutt`, `mbsync`, and `msmtp` provide a plain-text mail workflow.

## Reading Order

If you want to understand the repository quickly:

1. Read [Setup](setup.md) for installation and update flow.
2. Read [Architecture](architecture.md) for the repository layout and `chezmoi` model.
3. Read the module pages for the parts you care about.
4. Read [Host Specific Behavior](host-specific.md) if you need to understand templates and conditional application.
