local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local settings = require("src.settings")

local M = {}

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t)
        t:view_only()
    end),
    awful.button({ settings.modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ settings.modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
    end),
    awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
    end)
)

function M.setup_for_screen(s)
    return awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout = wibox.layout.fixed.vertical,
        style = {
            shape = nil,
            -- shape = gears.shape.circle,
            -- shape = function(cr, width, height)
            --     local h = math.max(width, height)
            --     gears.shape.circle(cr, width, h)
            -- end,
        },
        widget_template = {
            {
                {
                    {
                        id = "index_role",
                        widget = wibox.widget.textbox,
                    },
                    {
                        id = "icon_role",
                        widget = wibox.widget.imagebox,
                    },
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                        align = "center",
                        valign = "center",
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
            shape = gears.shape.circle,
            -- shape = gears.shape.circle,
            --     function(cr, width, height)
            --     local h = math.max(width, height)
            --     -- Naughty.notify({
            --     --     preset = Naughty.config.presets.normal,
            --     --     title = "1",
            --     --     text = "H: " .. h,
            --     -- })
            --     return gears.shape.circle(cr, width, 50)
            -- end,
        },
    })
end

return M
