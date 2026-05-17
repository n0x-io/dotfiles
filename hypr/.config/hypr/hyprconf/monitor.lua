------------------
---- MONITORS ----
------------------
-- Hyprland uses an inverse Y cartesian system: negative y places a monitor
-- HIGHER. The original conf had DP-2 at y=1440 (below DP-1). Kept as-is.
hl.monitor({ output = "DP-1", mode = "2560x1440@165", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "3440x1440@165", position = "-440x1440", scale = 1 })

-- Persistent workspace 1 on DP-2
hl.workspace_rule({
	workspace = "1",
	monitor = "DP-2",
})
