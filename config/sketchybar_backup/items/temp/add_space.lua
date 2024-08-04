local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

-- ADD SPACE BUTTON---------------------------
----------------------------------------------
-- Background around the cpu item
sbar.add("item", "add_space.padding", {
    position = "left",
    width = settings.group_paddings
})

local add_space = sbar.add("item", {
    position = "left",
    icon = {
        padding_left = 10,
        padding_right = 10,
        font = {
            size = 12,
        },
        string = icons.plus,

    },
    label = {
        drawing = false,
        string = "]"

    },
    background = {

        color = colors.bar.bg,
    },
})

add_space:subscribe("mouse.entered", function(env)
    sbar.animate("elastic", 10, function()
        add_space:set({
            icon = {
                string = "Add space",
                color = colors.lightgray,
            },
        })
    end)
end)

add_space:subscribe("mouse.exited", function(env)
    sbar.animate("elastic", 10, function()
        add_space:set({
            icon = {
                string = icons.plus,
                color = colors.stormcloud.two,
                font = {
                    size = 12,
                },
            },
        })
    end)
end)

add_space:subscribe("mouse.clicked", function(env)
    sbar.exec('osascript "$CONFIG_DIR/items/scripts/newSpace.scpt"')
end)
