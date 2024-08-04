local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local function getAppIcon(app_name)
    return app_icons[app_name] or app_icons["default"]
end

local front_icon = sbar.add("item", "front_app", {
    position = "left",
    display = "active",
    icon = {
        drawing = false,
        padding_left = 10,
        font = {
            size = 12,
        },
        string = getAppIcon("default")
    },
    label = {
        padding_left = 10,
        padding_right = 10,
        drawing = true,
    },
    background = {
        color = colors.bar.bg,
    },
    updates = true,
})

front_icon:subscribe("front_app_switched", function(env)
    front_icon:set({
        label = { string = env.INFO },
        -- icon = { font = "sketchybar-app-font:Regular:16.0", string = getAppIcon(env.INFO) }
    })
end)

front_icon:subscribe("mouse.clicked", function(env)
    sbar.trigger("swap_menus_and_spaces")
end)
