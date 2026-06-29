# Troubleshooting

This page records the most likely failure points in a setup like this one.

## `chezmoi` Did Not Apply What You Expected

Check:

- `chezmoi diff`
- `chezmoi state dump`
- `.chezmoiignore`
- whether the source file is a template and rendered differently on this host

## A Plugin or Theme Is Missing

External repositories such as `oh-my-zsh`, Powerlevel10k, or TPM are managed
through `.chezmoiexternal.toml`. Refresh and re-apply with:

```bash
chezmoi update
```

## Hyprland or Quickshell Should Not Exist On This Host

Review `.chezmoiignore` and host conditions first. This repository intentionally
suppresses some desktop targets on non-Arch systems.

## Mail Sync Or Send Fails

Check:

- account names in `mbsync` and `msmtp`
- OAuth or credential helper state
- local Maildir paths
- file permissions on cached mail metadata
