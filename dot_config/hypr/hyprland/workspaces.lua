hl.workspace_rule({
	workspace = "name:docs",
	monitor = "DP-2",
})
hl.workspace_rule({
	workspace = "name:term",
	monitor = "DP-2",
})
hl.workspace_rule({
	workspace = "name:wksp",
	no_rounding = true,
	decorate = false,
	gaps_in = 0,
	gaps_out = 0,
	no_border = true,
	monitor = "HDMI-A-1",
})
for i = 1, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1" })
end
