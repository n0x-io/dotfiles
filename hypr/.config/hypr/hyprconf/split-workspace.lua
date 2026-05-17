
hl.config({
	plugin = {
		split_monitor_workspaces = {
			count = 6,
			keep_focused = 0,
			enable_notifications = 0,
			enable_persistent_workspaces = 1,
		},
	},
})

local smw = hl.plugin.split_monitor_workspaces
-- Switch workspaces with mainMod + [1-5]
for i = 1, 6 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, function()
		return smw.workspace(i)
	end)
	hl.bind(mainMod .. " + SHIFT + " .. key, function()
		return smw.move_to_workspace_silent(i)
	end)
end
