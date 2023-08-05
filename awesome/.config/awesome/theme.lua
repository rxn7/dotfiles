local dpi           = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme         = {}
theme.wallpaper     = "~/.wallpapers/gradient.png"
-- }}}

-- {{{ Styles
theme.font          = "Monaco Nerd Font 10"

-- {{{ Icons
theme.icon_font     = "Font Awesome 6 Free Solid 12"
theme.icon_color    = "#587D8D"
-- }}}

-- {{{ Colors
theme.fg_normal     = "#DCDCCC"
theme.fg_focus      = "#F0DFAF"
theme.fg_urgent     = "#CC9393"
theme.bg_normal     = "#3F3F3F"
theme.bg_focus      = "#1E2320"
theme.bg_urgent     = "#3F3F3F"
theme.bg_systray    = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(2)
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#d3869b"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Widgets
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"

theme.menu_height   = dpi(50)
theme.menu_width    = dpi(106)

theme.make_fa_icon  = function(code)
  return wibox.widget {
    font   = theme.icon_font .. theme.icon_size,
    markup = ' <span color="' .. theme.icon_color .. '">' .. code .. '</span> ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
end

return theme
