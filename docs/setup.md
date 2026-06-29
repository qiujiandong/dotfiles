# Setup

This repository is stored as a `chezmoi` source state. The intended workflow is
to let `chezmoi` manage deployment into `$HOME` rather than copying files
manually.

## Requirements

Core tools:

- `chezmoi`
- `git`
- `zsh`
- `tmux`
- `kitty`
- `neovim`

Desktop stack:

- `hyprland`, `hyprlaunch`, `hyprlock`, `hyprshutdown`
- `quickshell`, `qt6-wayland`, `upower`
- `uwsm`
- `xdg-desktop-portal`, `xdg-desktop-portal-hyprland`, `xdg-desktop-portal-gtk`
- `networkmanager`, `network-manager-applet`
- `blueman`, `bluez`, `bluez-utils`
- `fcitx5`, `fcitx5-configtool`, `fcitx5-chinese-addons`

Mail stack:

- `neomutt`
- `mbsync`
- `msmtp`
- `w3m`

## Initial Install

Clone and apply in one step:

```bash
chezmoi init --apply qiujiandong
```

If you already initialized the source state:

```bash
chezmoi update
```

## External Repositories

`chezmoi` also pulls a small set of external Git repositories through
`.chezmoiexternal.toml`:

- `oh-my-zsh`
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
- `powerlevel10k`
- `tmux-plugins/tpm`

These are refreshed by `chezmoi` and are not committed into this repository as
normal source files.

## Secrets and Local Overrides

This repository intentionally leaves room for machine-local overrides:

- `~/.zshrc.local` is sourced if present.
- Email, Git identity, and machine-specific display configuration use template
  logic instead of hardcoding one universal target state.

Use `chezmoi diff` before `chezmoi apply` if you want to inspect target changes
first.
