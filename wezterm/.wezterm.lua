local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.font_size = 15
-- config.line_height = 1.1
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "catppuccin-mocha"
config.colors = { background = "#171717" }


config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_tab_bar = false

return config
