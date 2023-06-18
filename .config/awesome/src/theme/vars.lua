local gfs = require("gears.filesystem")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")

local tw = require("src.palettes.tailwind")
local nord = require("src.palettes.nord")
local dpi = xresources.apply_dpi
local assets_path = gfs.get_dir("config") .. "/src/theme/assets/"

local theme = {}

theme.font_name = "sans"
theme.font_size = 8
theme.nerd_font = "FiraCode Nerd Font"

local gray = tw.stone

theme.xresources_colors = {
    color0 = nord.night0,
    color8 = nord.night3,
    --red
    color1 = nord.aurora0,
    color9 = nord.aurora0,
    --green
    color2 = nord.aurora3,
    color10 = nord.aurora3,
    --yellow
    color3 = nord.aurora2,
    color11 = nord.aurora2,
    --blue
    color4 = nord.frost3,
    color12 = nord.frost2,
    --purple
    color5 = nord.aurora4,
    color13 = nord.aurora4,
    --cyan
    color6 = nord.frost0,
    color14 = nord.frost1,
    --white
    color7 = nord.storm0,
    color15 = nord.storm2,
    --
    background = nord.night0,
    foreground = nord.storm2,
}

-- overwrite xrdb colors for hotkeys popup
xresources.get_current_theme = function()
    return theme.xresources_colors
end

theme.bg_normal = gray(800)
theme.border_normal = theme.bg_normal
theme.fg_normal = gray(300)

theme.bg_focus = tw.lime(700)
theme.border_focus = theme.bg_focus
theme.fg_focus = tw.white

theme.bg_urgent = tw.red(700)
theme.fg_urgent = tw.white

theme.titlebar_bg_normal = theme.bg_normal .. "88"
theme.titlebar_bg_focus = theme.bg_focus .. "d0"

theme.bg_minimize = gray(700)
theme.fg_minimize = gray(400)

theme.useless_gap = dpi(2)
theme.border_width = dpi(1)
theme.border_marked = "#91231c"

theme.hotkeys_modifiers_fg = gray(500)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel =
    theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel =
    theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = assets_path .. "submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(150)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = assets_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = assets_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = assets_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = assets_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = assets_path
    .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = assets_path
    .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = assets_path
    .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = assets_path
    .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = assets_path
    .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = assets_path
    .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = assets_path
    .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = assets_path
    .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = assets_path
    .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = assets_path
    .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = assets_path
    .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = assets_path
    .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = assets_path
    .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = assets_path
    .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = assets_path
    .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = assets_path
    .. "titlebar/maximized_focus_active.png"

theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpaper/2.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = assets_path .. "layouts/fairhw.png"
theme.layout_fairv = assets_path .. "layouts/fairvw.png"
theme.layout_floating = assets_path .. "layouts/floatingw.png"
theme.layout_magnifier = assets_path .. "layouts/magnifierw.png"
theme.layout_max = assets_path .. "layouts/maxw.png"
theme.layout_fullscreen = assets_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = assets_path .. "layouts/tilebottomw.png"
theme.layout_tileleft = assets_path .. "layouts/tileleftw.png"
theme.layout_tile = assets_path .. "layouts/tilew.png"
theme.layout_tiletop = assets_path .. "layouts/tiletopw.png"
theme.layout_spiral = assets_path .. "layouts/spiralw.png"
theme.layout_dwindle = assets_path .. "layouts/dwindlew.png"
theme.layout_cornernw = assets_path .. "layouts/cornernww.png"
theme.layout_cornerne = assets_path .. "layouts/cornernew.png"
theme.layout_cornersw = assets_path .. "layouts/cornersww.png"
theme.layout_cornerse = assets_path .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon =
    theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
