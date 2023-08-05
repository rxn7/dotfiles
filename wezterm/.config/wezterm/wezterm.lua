local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.color_scheme = "Zenburn"
config.window_frame = {
  active_titlebar_bg = "#3F3F3F",
  inactive_titlebar_bg = "#262626"
}

return config