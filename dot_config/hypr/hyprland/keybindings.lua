local terminal = "kitty"
local fileManager = "dolphin"
local menu = "hyprlauncher"
local browser = "microsoft-edge-stable"
-- hyprlock and hyprshutdown are also needed

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- Lock screen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Shutdown
hl.bind(mainMod .. " + SHIFT + M", function()
	hl.dispatch(hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' -p 'systemctl poweroff'"))
end)

-- Logout
hl.bind(mainMod .. " + M", function()
	hl.dispatch(hl.dsp.exec_cmd("hyprshutdown"))
end)

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + W", hl.dsp.focus({ workspace = "name:wksp" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "name:wksp" }))

hl.bind(mainMod .. " + D", function()
	hl.dispatch(hl.dsp.focus({ workspace = "name:docs" }))
end)
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "name:docs" }))

hl.bind(mainMod .. " + T", function()
	hl.dispatch(hl.dsp.focus({ workspace = "name:term" }))
end)
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "name:term" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move between workspaces, only valid in scrolling layout
hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("move -col"))

-- Swap between workspaces, only valid in scrolling layout
hl.bind(mainMod .. " + slash", hl.dsp.layout("swapcol l"))

-- Fullscreen window, see https://wiki.hypr.land/Configuring/Basics/Dispatchers/#window-1
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
