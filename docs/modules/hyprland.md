# Hyprland

The Hyprland configuration is split into focused Lua modules and assembled from
`dot_config/hypr/hyprland.lua`.

## Structure

The main entry point loads separate modules for:

- monitors
- environment variables
- general settings
- autostart
- keybindings
- workspaces
- window rules
- animations

This keeps the compositor configuration readable and makes it easier to document
changes by behavior instead of by one large monolithic file.

## Key Behavior

- Monitor layout is templated through `monitors.lua.tmpl`.
- Session startup is handled as a dedicated module instead of embedding long
  `exec` lists into one file.
- Input, workspace, and window behavior are grouped by concern.

## Why Templates Are Used Here

Monitor configuration is one of the clearest machine-specific parts of a desktop
setup. This repository uses `chezmoi` templating so a Yoga Book device and a
desktop with external monitors can share the same source tree without keeping
two independent Hyprland configurations.

## Customization Notes

If you want to adapt this module for another machine, start with:

- monitor outputs and geometry
- keybindings
- autostart applications
- workspace layout assumptions
