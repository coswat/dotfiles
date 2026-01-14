local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 15
-- config.line_height = 1.1
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.colors = { background = "#171717" }
config.leader = { key = "Space", mods = "SHIFT" }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_tab_bar = false

-- Toggle opacity
wezterm.on("toggle-opacity", function(window, _)
	local overrides = window:get_config_overrides() or {}

	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.66
	else
		overrides.window_background_opacity = nil
	end

	window:set_config_overrides(overrides)
end)

-- Key Bindings
config.keys = {
	{
		key = "O",
		mods = "LEADER",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
	{
		key = "T",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

return config
