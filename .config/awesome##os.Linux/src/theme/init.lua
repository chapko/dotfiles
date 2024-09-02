local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local theme_vars = require("src.theme.vars")

local M = {}

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

function M.setup(opts)
    local theme = gears.table.join(theme_vars, opts)
    theme.font = theme.font_name .. " " .. theme.font_size

    beautiful.wallpaper = theme.wallpaper
    beautiful.init(theme)

    screen.connect_signal("request::wallpaper", set_wallpaper)
    awful.screen.connect_for_each_screen(set_wallpaper)
end

return M
