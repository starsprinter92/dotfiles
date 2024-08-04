local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
-- Padding item required because of bracket


local left =
    sbar.add(
        "item",

        {
            padding_left = -20,
            position = "left",
            label = {
                drawing = false,
            },
        }
    )

local right =
    sbar.add(
        "item",

        {
            padding_right = -20,
            position = "right",
            label = {

                drawing = false,

            },
        }
    )



-- Double border for apple using a single item bracket
sbar.add("bracket", "spaces.bracket", { left.name, right.name }, {

    background = {
        position = "center",
        color = colors.bar.bg,
    }
})
