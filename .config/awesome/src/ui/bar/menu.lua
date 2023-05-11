local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local settings = require("src.settings")

local main_menu = awful.menu({
    items = {
        {
            "awesome",
            {
                {
                    "hotkeys",
                    function()
                        hotkeys_popup.show_help(nil, awful.screen.focused())
                    end,
                },
                {
                    "restart",
                    awesome.restart,
                },
                {
                    "quit",
                    function()
                        awesome.quit()
                    end,
                },
            },
            beautiful.awesome_icon,
        },
        { "open terminal", settings.terminal },
    },
})

return main_menu
