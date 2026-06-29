# Jiandong's Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), centered on
Arch Linux, [Hyprland](https://hypr.land/), and
[Quickshell](https://quickshell.org/).

This repository is organized as a practical daily-driver setup rather than a
generic starter kit. The main areas are:

- Desktop: Hyprland, Quickshell, systemd user services
- Terminal: [zsh](https://www.zsh.org/), [Powerlevel10k](https://github.com/romkatv/powerlevel10k),
  [tmux](https://github.com/tmux/tmux/wiki), [kitty](https://sw.kovidgoyal.net/kitty/)
- Editor: [Neovim](https://neovim.io/) with [zpack.nvim](https://github.com/zuqini/zpack.nvim)
- Mail: [neomutt](https://neomutt.org/), [mbsync](https://isync.sourceforge.io/mbsync.html),
  [msmtp](https://marlam.de/msmtp/), [w3m](https://w3m.sourceforge.net/)

## Quick Start

Install `chezmoi`, clone the source state, and apply it:

```bash
chezmoi init --apply qiujiandong
```

For update workflows and module-level documentation, see the documentation
site:

- Source: [`docs/`](docs/index.md)
- Published site: [https://qiujiandong.github.io/dotfiles/](https://qiujiandong.github.io/dotfiles/)
