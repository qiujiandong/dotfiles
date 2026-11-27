[![Docs](https://img.shields.io/github/actions/workflow/status/qiujiandong/dotfiles/docs.yml?label=docs)](https://github.com/qiujiandong/dotfiles/actions/workflows/docs.yml)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-online-222?logo=githubpages)](https://qiujiandong.github.io/dotfiles/)
[![Platform](https://img.shields.io/badge/platform-Arch%20Linux-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Managed by chezmoi](https://img.shields.io/badge/managed%20by-chezmoi-40A02B)](https://www.chezmoi.io/)
[![License](https://img.shields.io/github/license/qiujiandong/dotfiles)](LICENSE)

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

Run `~/.local/bin/update_local` manually to install or update Neovim, Codex,
Codebase Memory MCP, and Maple Mono NF CN fonts. These downloads are not run
during `chezmoi apply`. Use `update_local maple-font` to update only the fonts,
or `update_local --check` to check versions without installing.
The install hook installs the Ponytail plugin only when Codex is available.

Install and manage mise manually. Installing tools through mise can take a
while, so it is not run automatically during `chezmoi apply`.
