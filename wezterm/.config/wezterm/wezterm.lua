local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.color_scheme = "gruvbox_material_dark_hard"
config.window_frame = {
  active_titlebar_bg = "#3F3F3F",
  inactive_titlebar_bg = "#262626"
}
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font('IosevkaTerm Nerd Font')

config.color_schemes = {
    ["gruvbox_material_dark_hard"] = {
    foreground = "#D4BE98",
    background = "#1D2021",
    cursor_bg = "#D4BE98",
    cursor_border = "#D4BE98",
    cursor_fg = "#1D2021",
    selection_bg = "#D4BE98" ,
    selection_fg = "#3C3836",

    ansi = {"#1d2021","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"},
    brights = {"#eddeb5","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"},
  },
}

return config
