local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
-- local naughty = require("naughty")

-- Create a textclock widget
local clock = wibox.widget.textclock()
local keyboardlayout = awful.widget.keyboardlayout()
local launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = require("src.ui.bar.menu"),
})

awful.screen.connect_for_each_screen(function(s)
    s.ui = {}

    -- Each screen has its own tag table.
    local tags = awful.tag({ "1", "2", "3", "4" }, s, awful.layout.layouts[1])

    for _, tag in pairs(tags) do
        tag.master_width_factor = 0.625
    end

    s.ui.prompt = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    --
    s.ui.layoutbox = awful.widget.layoutbox(s)
    s.ui.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 3, function()
            awful.layout.inc(-1)
        end),
        awful.button({}, 4, function()
            awful.layout.inc(1)
        end),
        awful.button({}, 5, function()
            awful.layout.inc(-1)
        end)
    ))

    s.ui.taglist = require("src.ui.bar.taglist").setup_for_screen(s)
    s.ui.tasklist = require("src.ui.bar.tasklist").setup_for_screen(s)

    -- Create the wibox
    s.ui.wibox = awful.wibar({
        position = "left",
        stretch = true,
        screen = s,
        layout = wibox.layout.fixed.vertical,
        ontop = false,
        width = 48,
    })

    s.ui.systray = wibox.widget.systray()
    s.ui.systray:set_horizontal(false)

    -- Add widgets to the wibox
    s.ui.wibox:setup({
        layout = wibox.layout.align.vertical,
        {
            -- Left widgets
            layout = wibox.layout.fixed.vertical,
            launcher,
            s.ui.taglist,
            s.ui.prompt,
        },
        s.ui.tasklist, -- Middle widget
        {
            -- Right widgets
            layout = wibox.layout.fixed.vertical,
            keyboardlayout,
            s.ui.systray,
            clock,
            s.ui.layoutbox,
        },
    })
end)
-- }}}
