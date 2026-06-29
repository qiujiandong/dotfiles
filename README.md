# Jiandong's Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), centered on
Arch Linux, [Hyprland](https://hypr.land/), and
[Quickshell](https://quickshell.org/).

This repository is organized as a practical daily-driver setup rather than a
generic starter kit. The main areas are:

- Desktop: Hyprland, Quickshell, systemd user services
- Terminal: zsh, Powerlevel10k, tmux, kitty
- Editor: Neovim with `zpack.nvim`
- Mail: neomutt, mbsync, msmtp, w3m

## Quick Start

Install `chezmoi`, clone the source state, and apply it:

```bash
chezmoi init --apply qiujiandong
```

For update workflows and module-level documentation, see the documentation
site:

- Source: [`docs/`](docs/index.md)
- Published site: `https://qiujiandong.github.io/dotfiles/`
