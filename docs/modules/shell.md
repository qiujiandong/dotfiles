# Shell and Terminal

The terminal workflow is built from `zsh`, `Powerlevel10k`, `tmux`, and
`kitty`.

## zsh

`dot_zshrc` keeps the shell setup intentionally direct:

- `oh-my-zsh` provides the base plugin framework
- `powerlevel10k` provides the prompt theme
- `mise` is activated when available
- `~/.zshrc.local` is sourced for machine-local additions

The enabled plugin set is small: Git integration, autosuggestions, and syntax
highlighting.

## tmux

`dot_tmux.conf` is optimized for interactive use:

- `Ctrl-a` replaces the default prefix
- pane and window indices start at `1`
- mouse support is enabled
- pane navigation uses `h/j/k/l`
- split panes inherit the current working directory

Plugins are managed through TPM and currently include resurrect, CPU/memory
load, and tmux-powerline.

## kitty

Kitty is the terminal emulator layer for the environment. The repository keeps
the full configuration under `dot_config/kitty/kitty.conf`, so terminal
appearance and behavior live alongside the shell and multiplexer setup.

## Customization Notes

The most common changes in this layer are:

- prompt segments and prompt behavior
- aliases and local shell additions
- tmux keybindings and statusline behavior
- terminal font, colors, and padding
