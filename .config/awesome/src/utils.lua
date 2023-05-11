local naughty = require("naughty")
local gears = require("gears")

local M = {}

function M.notify_lua(data, title)
    naughty.notify({
        preset = naughty.config.presets.normal,
        title = title or "Lua",
        text = gears.debug.dump_return(data, nil, 10),
        position = "top_left",
        timeout = 0,
    })
end

return M
