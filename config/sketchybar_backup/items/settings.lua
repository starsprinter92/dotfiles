-------------------MENU INDICATOR ICON-----------------
-------------------------------------------------------
local colors = require("colors")
local icons = require("icons")
local settings = require("settings")



local settings =
    sbar.add(
        "item",
        {
            position = "left",
            align = "center",
            icon = {
                padding_left = 5,
                padding_right = 3,
                color = colors.bar.foreground_alt,
                string = "􀺺",
                font = {
                    size = 14
                }
            },
            background = {
                border_width = 0,
                color = colors.bar.bg,
                corner_radius = 6,

            }
        }
    )

settings:subscribe(
    "mouse.entered",
    function(env)
        local selected = env.SELECTED == "true"
        sbar.animate(
            "elastic",
            15,
            function()
                settings:set(
                    {
                        background = {
                            color = {
                                alpha = 1
                            }
                        },
                        icon = {

                            color = colors.orange,
                            font = {
                                size = 18
                            }
                        }
                    }
                )
            end
        )
    end)

settings:subscribe(
    "mouse.exited",
    function(env)
        local selected = env.SELECTED == "true"
        sbar.animate(
            "elastic",
            15,
            function()
                settings:set(
                    {
                        background = {
                            color = {
                                alpha = 1
                            }
                        },
                        label = {
                            color = colors.bar.foreground_alt,
                            font = {
                                size = 14
                            }
                        },
                        icon = {

                            color = colors.bar.foreground_alt,
                            font = {
                                size = 14
                            }
                        }
                    }
                )
            end
        )
        -- Animate the menu items when they show up
    end
)

-- Define a variable to keep track of the icon state
local iconState = false

settings:subscribe(
    "mouse.clicked",
    function(env)
        sbar.exec("open -a 'System Settings'")
    end
)
