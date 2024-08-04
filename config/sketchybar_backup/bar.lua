local colors = require("colors")
local settings = require("settings")

-- Equivalent to the --bar domain
sbar.bar(
    {
        topmost = "window",
        height = 30,
        color = colors.transparent,
        padding_right = 0,
        padding_left = 0,
        margin = 30,
        corner_radius = 8,
        y_offset = 8,
        shadow = true,
        blur_radius = 10,
        position = "top"
    }
)
