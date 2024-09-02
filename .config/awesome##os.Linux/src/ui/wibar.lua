local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local settings = require("src.settings")

-- local naughty = require("naughty")

local dpi = xresources.apply_dpi

local wibar_width = dpi(48)
local icon_size = dpi(32)
local spacing = dpi(12)

local clock = wibox.widget.textclock("%a\n%b %d\n%I:%M\n%p")
clock.align = "center"

local keyboardlayout = awful.widget.keyboardlayout()
keyboardlayout.widget.align = "center"
keyboardlayout.widget.font = beautiful.font_name .. " " .. (beautiful.font_size * 1.5)

awful.screen.connect_for_each_screen(function(s)
    s.ui = {}

    local tag_names = {}
    for i = 1, settings.tags_number, 1 do
        table.insert(tag_names, i)
    end
    -- Each screen has its own tag table.
    local tags = awful.tag(tag_names, s, awful.layout.layouts[1])

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
        ontop = false,
        width = wibar_width,
    })

    s.ui.systray = wibox.widget.systray()
    s.ui.systray:set_horizontal(false)

    local m = (wibar_width - icon_size) / 2
    local tray = wibox.container.margin(s.ui.systray, m, m, 0, 0)

    -- Add widgets to the wibox
    s.ui.wibox:setup({
        layout = wibox.layout.align.vertical,
        {
            layout = wibox.layout.fixed.vertical,
            wibox.widget({
                widget = wibox.widget.separator,
                orientation = "horizontal",
                forced_height = 5,
            }),
            spacing = spacing,
            clock,
            s.ui.taglist,
            s.ui.prompt,
        },
        {
            layout = wibox.layout.fixed.vertical,
            s.ui.tasklist,
        },
        {
            layout = wibox.layout.fixed.vertical,
            spacing = spacing,
            keyboardlayout,
            tray,
            wibox.container.margin(s.ui.layoutbox, m, m, 0, 0),
            wibox.widget({
                widget = wibox.widget.separator,
                orientation = "horizontal",
                forced_height = 5,
            }),
        },
    })
end)
-- }}}
