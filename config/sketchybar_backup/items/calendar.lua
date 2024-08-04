local settings = require("settings")
local colors = require("colors")




local cal =
    sbar.add(
        "item",
        {
            display = 1,
            position = "center",
            label = {
                align = "center",
                position = "center",
                padding_right = 10,
                padding_left = 10,
                background = {
                    border_width = 1,
                    border_color = colors.bar.border,
                    corner_radius = 6,
                    color = colors.bar.bg,
                },
                color = colors.pink,
                font = {
                    family = settings.font.numbers,
                    style = settings.font.style_map["SemiBold"],
                    size = 14
                }
            },

            icon = {
                padding_left = 10,
                padding_right = 10,
                align = "left",
                color = colors.foreground_light,
                font = {
                    style = settings.font.style_map["Regualr"],
                    size = 12
                }
            },
            update_freq = 30,
            background = {
                border_width = 1,

                -- color = colors.bar.transparent,
                color = colors.bar.transparent
                ,

            },
            blur_radius = 10,
            color = colors.bar.transparent,
            width = "dynamic",

        }

    )

cal:subscribe(
    { "forced", "routine", "system_woke" },
    function(env)
        cal:set(
            {
                icon = os.date("%a %d, %B"),
                label = os.date("%H:%M"),
            }
        )
    end
)

cal:subscribe(
    "mouse.clicked",
    function(env)
        sbar.exec("open -a 'Calendar'")
    end
)
