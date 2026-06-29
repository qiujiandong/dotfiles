# Host Specific Behavior

Not every machine should receive the same target files. This repository uses
`chezmoi` conditions to decide what gets rendered or ignored.

## Current Conditions

The repository currently uses host-aware logic in at least these places:

- `dot_gitconfig.tmpl` switches email address based on the detected operating system.
- `dot_config/hypr/hyprland/monitors.lua.tmpl` switches monitor layout based on the kernel release string.
- `.chezmoiignore` skips some desktop-related targets on non-Arch systems.

## Why This Matters

This keeps one repository usable across:

- a main Arch Linux desktop setup
- non-Arch environments that should not receive Hyprland or Quickshell files
- devices with different display topologies

## Maintenance Guidance

When adding a new host-specific rule:

- prefer a narrow condition
- document why the condition exists
- keep the common path as the default behavior
- avoid scattering the same host check across many unrelated files
