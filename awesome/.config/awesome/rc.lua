pcall(require, "luarocks.loader")

os.execute("~/.scripts/autostart.sh")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Startup failed",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end

beautiful.init("~/.config/awesome/theme.lua")
local theme = beautiful.get()

local terminal = os.getenv("TERMINAL") or "xterm"
local modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile,
}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper

        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        gears.wallpaper.fit(wallpaper, s)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local icons = require("icons").setup(wibox, theme)

local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local net_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local todo_widget = require("awesome-wm-widgets.todo-widget.todo")
local clock_widget = wibox.widget.textclock()
local separator_widget = wibox.widget.textbox("<span foreground='" .. theme.icon_color .. "'><b> | </b></span>")

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.noempty,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.tasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.wibox = awful.wibar({
        position = "top", screen = s
    })

    -- Add widgets to the wibox
    s.wibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
        },
        s.tasklist, -- Middle widget
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            todo_widget(),
            separator_widget,

            icons.drive,
            fs_widget(),
            separator_widget,

            net_widget(),
            separator_widget,

            icons.cpu,
            cpu_widget(),
            separator_widget,

            icons.memory,
            ram_widget(),
            separator_widget,

            volume_widget(),
            separator_widget,

            icons.time,
            clock_widget,
            separator_widget,

            wibox.widget.systray(),
        },
    }
end)
-- }}}

local globalkeys = gears.table.join(
    awful.key({ modkey }, "s", function() awful.spawn("screengrab") end),
    awful.key({ modkey }, "]", function() volume_widget:inc(5) end),
    awful.key({ modkey }, "[", function() volume_widget:dec(5) end),
    awful.key({ modkey }, "\\", function() volume_widget:toggle() end),
    awful.key({ modkey }, "j", function() awful.client.focus.byidx(1) end),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(-1) end),
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end),
    awful.key({ modkey }, "p", function() awful.spawn('rofi -show drun') end),
    awful.key({ modkey }, "e", function() awful.spawn(os.getenv('FILEMAN')) end),
    awful.key({ modkey, }, "w", function() awful.spawn(os.getenv("BROWSER")) end),
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey, "Shift" }, "r", awesome.restart),
    awful.key({ modkey, "Shift" }, "c", awesome.quit),
    awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end),
    awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end),
    awful.key({ modkey, }, "space", function() awful.layout.inc(1) end),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end),

    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end
    )
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

root.keys(globalkeys)

local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c) c:emit_signal("request::activate", "mouse click", { raise = true }) end),
    awful.button({ modkey }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse click", { raise = true })
            awful.mouse.client.move(c)
        end),
    awful.button({ modkey }, 3,
        function(c)
            c:emit_signal("request::activate", "mouse click", { raise = true })
            awful.mouse.client.resize(c)
        end)
)

local clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift" }, "q", function(c) c:kill() end, { description = "close", group = "client" }),
    awful.key({ modkey }, "space", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey }, "o", function(c) c:move_to_screen() end, { description = "move to screen", group = "client" }),
    awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey }, "n", function(c) c.minimized = true end, { description = "minimize", group = "client" }),
    awful.key({ modkey }, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, { description = "(un)maximize horizontally", group = "client" })
)

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        callback = function(c)
            c.maximized = false
            c.maximized_vertical = false
            c.maximized_horizontal = false
        end,
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            titlebars_enabled = false
        }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {},
            class = {
                "Arandr",
                "Gpick",
                "Sxiv",
            },
            name = {
            },
            role = {
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },
}

local function update_client_shape(c)
    if not c.fullscreen then
        c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
    else
        c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
    end
end

client.connect_signal("manage", function(c)
    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    update_client_shape(c)
end)

client.connect_signal("property::fullscreen", function(c)
    update_client_shape(c)
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
