# Customization

This setup is meant to be changed, but some layers are safer to customize than
others.

## Common Customization Points

- Shell aliases and personal exports: `~/.zshrc.local`
- Monitor layout: Hyprland monitor template
- Git identity: `dot_gitconfig.tmpl`
- Editor behavior: Neovim core and plugin modules
- Mail account details: neomutt, mbsync, and msmtp configuration

## Recommended Workflow

When changing the configuration:

1. Edit the `chezmoi` source state.
2. Inspect the rendered diff with `chezmoi diff`.
3. Apply with `chezmoi apply`.
4. Reload or restart only the subsystem you changed.

## What Should Stay Local

Keep these outside the repository unless you are intentionally templating them:

- secrets
- machine-only shell exports
- one-off debugging flags
- temporary experimental overrides
