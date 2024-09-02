local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local keys = require("src.keys")
local settings = require("src.settings")

local modkey = settings.modkey

local M = {}

local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- All clients will match this rule.
M.global = {
    rule = {},
    properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
}

M.floating = {
    rule_any = {
        name = {
            "Steam - News",
        },
        class = {
            "ksnip",
            "Kvantum Manager",
            "Kvantum Preview",
            "Pavucontrol",
            "Blueman-manager",
        },
        role = {
            "calf_plugin",
            "vlc-video",
        },
    },
    properties = {
        floating = true,
    },
}

M.under_mouse = {
    rule_any = {
        role = {
            "calf_plugin",
        },
        class = {
            "1Password",
        },
        type = {
            "dialog",
        },
    },
    properties = {
        floating = true,
        placement = awful.placement.under_mouse + awful.placement.no_offscreen,
    },
}

M.centered = {
    rule_any = {
        class = {
            "feh",
        },
    },
    properties = {
        floating = true,
        placement = awful.placement.centered,
    },
}

M.forced_tiling = {
    rule_any = {
        role = { "calf_rack" },
    },
    properties = {
        floating = false,
    },
}

M.titlebars = {
    rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = true },
}

M.vlc = {
    rule = {
        role = "vlc-video",
    },
    properties = {
        floating = true,
        titlebars_enabled = false,
        border_width = 0,
    },
    callback = function(c)
        c:geometry({ x = 0, y = 0, width = 1920, height = 1080 })
    end,
}

M.dock = {
    rule_any = {
        type = { "dock" },
    },
    properties = {
        border_width = 0,
    },
}

M.current_screen = {
    rule_any = {
        role = {
            "GtkFileChooserDialog",
        },
    },
    properties = {
        -- TODO: always show on the focused screen
    },
}

M.chrome_popups = {
    rule = {
        class = "Brave-browser",
        role = "pop-up",
    },
    properties = {
        floating = true,
        placement = awful.placement.centered,
    },
}

M.chrome_apps = {
    rule = {
        class = "Brave-browser",
        role = "pop-up",
        instance = "crx_",
    },
    properties = {
        titlebars_enabled = false,
        border_width = 0,
    },
}

M.titlebarless = {
    rule_any = {
        class = { "Brave-browser" },
    },
    properties = {
        titlebars_enabled = false,
        border_width = 0,
    },
}

function M.setup()
    require("awful.rules").rules = {
        M.global,
        M.floating,
        M.under_mouse,
        M.centered,
        M.forced_tiling,
        M.titlebars,
        M.vlc,
        M.dock,
        M.current_screen,
        M.chrome_popups,
        M.chrome_apps,
        M.titlebarless,
    }
end

return M
