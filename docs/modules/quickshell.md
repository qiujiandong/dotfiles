# Quickshell

Quickshell is used as the shell UI layer for the desktop bar and related small
services.

## Structure

The entry point is intentionally small:

- `shell.qml` loads `Bar.qml`
- `Bar.qml` defines the main bar layout
- `modules/` contains focused UI pieces such as workspace display, clock, and
  status area
- `services/` contains supporting logic such as time data

## Current Modules

The current setup includes:

- `Workspaces.qml`
- `Clock.qml`
- `StatusArea.qml`
- `Time.qml`

## Design Notes

- The bar is treated as a composition of small QML modules instead of a single
  deeply nested file.
- Service logic is separated from presentation where it improves readability.
- The configuration stays close to plain QML rather than introducing a custom
  abstraction layer.

## What To Change First

If you want to restyle or extend the shell:

- update `Bar.qml` for overall layout
- change module colors and spacing
- add new service components only when shared logic is needed
