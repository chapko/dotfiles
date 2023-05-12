local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local utils = require("src.utils")
local settings = require("src.settings")

local modkey = settings.modkey

local M = {}

local function key(args)
    return awful.key(args.k[1], args.k[2], args.press, args.release, args.data)
end

M.clientkeys = gears.table.join(
    key({
        k = { { modkey }, "f" },
        data = { description = "toggle fullscreen", group = "client" },
        press = function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "c" },
        data = { description = "close", group = "client" },
        press = function(c)
            c:kill()
        end,
    }),
    key({
        k = { { modkey, "Control" }, "space" },
        data = { description = "toggle floating", group = "client" },
        press = awful.client.floating.toggle,
    }),
    key({
        k = { { modkey, "Control" }, "Return" },
        data = { description = "move to master", group = "client" },
        press = function(c)
            c:swap(awful.client.getmaster())
        end,
    }),
    key({
        k = { { modkey }, "o" },
        data = { description = "move to screen", group = "client" },
        press = function(c)
            c:move_to_screen()
        end,
    }),
    key({
        k = { { modkey }, "t" },
        data = { description = "toggle keep on top", group = "client" },
        press = function(c)
            c.ontop = not c.ontop
        end,
    }),
    key({
        k = { { modkey }, "n" },
        data = { description = "minimize", group = "client" },
        press = function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
    }),
    key({
        k = { { modkey }, "m" },
        data = { description = "(un)maximize", group = "client" },
        press = function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
    }),
    key({
        k = { { modkey, "Control" }, "m" },
        data = { description = "(un)maximize vertically", group = "client" },
        press = function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "m" },
        data = { description = "(un)maximize horizontally", group = "client" },
        press = function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
    }),
    key({
        k = { { modkey }, "Delete" },
        data = { description = "print window info", group = "client" },
        press = function(c)
            -- local _, size = c.
            utils.notify_lua({
                {
                    window = c.window,
                    name = c.name,
                    type = c.type,
                    class = c.class,
                    instance = c.instance,
                    pid = c.pid,
                    role = c.role,
                },
                {
                    border_width = c.border_width,
                    border_color = c.border_color,
                    ontop = c.ontop,
                    above = c.above,
                    below = c.below,
                    hidden = c.hidden,
                    minimized = c.minimized,
                    maximized = c.maximized,
                    floating = c.floating,
                    sticky = c.sticky,
                    urgent = c.urgent,
                    modal = c.modal,
                    dockable = c.dockable,
                    is_fixed = c.is_fixed,
                    focusable = c.focusable,
                    size_hints = c.size_hints,
                },
                {
                    x = c.x,
                    y = c.y,
                    width = c.width,
                    height = c.height,
                },
            })
        end,
    }),
    key({
        k = { { modkey }, "w" },
        data = { description = "show main menu", group = "client" },
        press = function(c)
            local _, size = c.titlebar_top(c)

            if size > 0 then
                awful.titlebar.hide(c)
                c.border_width = 0
            elseif c.border_width == 0 then
                c.border_width = beautiful.border_width
            else
                awful.titlebar.show(c)
            end
        end,
    })
)

M.globalkeys = gears.table.join(
    key({
        k = { { modkey }, "s" },
        data = { description = "show help", group = "awesome" },
        press = hotkeys_popup.show_help,
    }),
    key({
        k = { { modkey }, "j" },
        data = { description = "focus next by index", group = "client" },
        press = function()
            awful.client.focus.byidx(1)
        end,
    }),
    key({
        k = { { modkey }, "k" },
        data = { description = "focus previous by index", group = "client" },
        press = function()
            awful.client.focus.byidx(-1)
        end,
    }),
    key({
        k = { { modkey }, "." },
        data = { description = "emoji picker", group = "client" },
        press = function()
            awful.spawn("rofi -show emoji")
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "s" },
        data = { description = "screenshot", group = "screen" },
        press = function()
            awful.spawn.spawn("ksnip -r")
        end,
    }),
    key({
        k = { { modkey }, "e" },
        data = { description = "file manager", group = "screen" },
        press = function()
            awful.spawn.spawn("pcmanfm")
        end,
    }),

    -- Layout manipulation
    key({
        k = { { modkey, "Shift" }, "j" },
        data = { description = "swap with next client by index", group = "client" },
        press = function()
            awful.client.swap.byidx(1)
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "k" },
        data = { description = "swap with previous client by index", group = "client" },
        press = function()
            awful.client.swap.byidx(-1)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "j" },
        data = { description = "focus the next screen", group = "screen" },
        press = function()
            awful.screen.focus_relative(1)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "k" },
        data = { description = "focus the previous screen", group = "screen" },
        press = function()
            awful.screen.focus_relative(-1)
        end,
    }),
    key({
        k = { { modkey }, "u" },
        data = { description = "jump to urgent client", group = "client" },
        press = awful.client.urgent.jumpto,
    }),
    key({
        k = { { modkey }, "Tab" },
        press = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        data = { description = "go back", group = "client" },
    }),

    -- Standard program
    key({
        k = { { modkey }, "t" },
        data = { description = "open a terminal", group = "launcher" },
        press = function()
            awful.spawn(settings.terminal)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "r" },
        data = { description = "reload awesome", group = "awesome" },
        press = awesome.restart,
    }),
    key({
        k = { { modkey, "Shift" }, "q" },
        data = { description = "quit awesome", group = "awesome" },
        press = awesome.quit,
    }),
    key({
        k = { { modkey }, "l" },
        data = { description = "increase master width factor", group = "layout" },
        press = function()
            awful.tag.incmwfact(0.025)
        end,
    }),
    key({
        k = { { modkey }, "h" },
        data = { description = "decrease master width factor", group = "layout" },
        press = function()
            awful.tag.incmwfact(-0.025)
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "l" },
        data = {
            description = "increase the number of master clients",
            group = "layout",
        },
        press = function()
            awful.tag.incnmaster(1, nil, true)
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "h" },
        data = {
            description = "decrease the number of master clients",
            group = "layout",
        },
        press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "l" },
        data = { description = "increase the number of columns", group = "layout" },
        press = function()
            awful.tag.incncol(1, nil, true)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "h" },
        data = { description = "decrease the number of columns", group = "layout" },
        press = function()
            awful.tag.incncol(-1, nil, true)
        end,
    }),
    key({
        k = { { modkey }, "`" },
        data = { description = "select next", group = "layout" },
        press = function()
            awful.layout.inc(1)
        end,
    }),
    key({
        k = { { modkey, "Shift" }, "`" },
        data = { description = "select previous", group = "layout" },
        press = function()
            awful.layout.inc(-1)
        end,
    }),
    key({
        k = { { modkey, "Control" }, "n" },
        data = { description = "restore minimized", group = "client" },
        press = function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", { raise = true })
            end
        end,
    }),

    -- Prompt
    key({
        k = { { modkey }, "r" },
        data = { description = "run prompt", group = "launcher" },
        press = function()
            awful.spawn("rofi -show run")
        end,
    }),
    key({
        k = { { modkey }, "p" },
        data = { description = "launch program", group = "launcher" },
        press = function()
            awful.spawn("rofi -show drun -show-icons")
        end,
    }),
    key({
        k = { { modkey }, "x" },
        data = { description = "lua execute prompt", group = "awesome" },
        press = function()
            awful.prompt.run({
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().ui.prompt.widget,
                exe_callback = function(input)
                    local result = awful.util.eval("return (" .. input .. ")")
                    utils.notify_lua(result)
                end,
                history_path = awful.util.get_cache_dir() .. "/history_eval",
            })
        end,
    })
)

return M
