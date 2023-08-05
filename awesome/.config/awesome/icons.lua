return {
    setup = function(wibox, theme)
        local function make_fa_icon(code)
            return wibox.widget {
                font   = theme.icon_font,
                markup = ' <span color="' .. theme.icon_color .. '">' .. code .. '</span> ',
                align  = 'center',
                valign = 'center',
                widget = wibox.widget.textbox
            }
        end

        return {
            linux = make_fa_icon('\u{f0a0}'),
            drive = make_fa_icon('\u{f0a0}'),
            cpu = make_fa_icon('\u{f2db}'),
            memory = make_fa_icon('\u{f538}'),
            time = make_fa_icon('\u{f017}'),
        }
    end
}
