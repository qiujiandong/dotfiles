-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

--   x -> +
-- y
-- |
-- v
-- +

-- Up
hl.monitor({
	output = "DP-2",
	mode = "2560x1440@60Hz",
	position = "0x0",
	scale = "1",
})

-- Down
hl.monitor({
	output = "HDMI-A-1",
	mode = "3840x2400@60Hz",
	position = "0x1440",
	scale = "2",
})
