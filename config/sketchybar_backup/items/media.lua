local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local whitelist = {
    ["Spotify"] = true
}

local function setup_media_items()
    local media_icon = sbar.add("item", {
        display = 1,
        bar = "right_bar",
        background = {
            color = colors.green,
        },
        position = "right",
        align = "left",
        label = {
            padding_left = 10,
            padding_right = 5,
            drawing = false
        },
        icon = {
            padding_left = 10,
            padding_right = 10,
            drawing = true,
            string = "",
            color = colors.bar.bg,

        },
        drawing = true,
        updates = true,
        popup = {
            align = "lefz",
            horizontal = true,
            height = 55,


        }
    })
    local media_cover = sbar.add("item", {
        display = 1,
        padding_left = 0,
        position = "popup." .. media_icon.name,
        background = {
            image = {
                string = "media.artwork",
                scale = 2,
            },
            color = colors.transparent,
        },
        label = { drawing = false },
        icon = { drawing = false },
        drawing = true,
        updates = true,
        popup = {
            align = "left",
            horizontal = true,
        }
    })




    local media_artist = sbar.add("item", {
        position = "popup." .. media_icon.name,
        drawing = true,
        width = 0,
        icon = {
            drawing = false
        },
        label = {
            align = "right",
            padding_right = 10,
            padding_left = 10,
            width = "dynamic",
            font = {
                size = 16
            },
            color = colors.green,
            max_chars = 10,
            y_offset = 10
        },

    })

    local media_title = sbar.add("item", {
        position = "popup." .. media_icon.name,
        drawing = true,
        icon = {
            drawing = false
        },
        label = {
            align = "right",
            padding_right = 30,

            width = "dynamic",

            color = colors.lightgray,
            max_chars = 10,
            font = {
                size = 16
            },
            y_offset = -10
        },

    })

    return media_icon, media_cover, media_artist, media_title
end

local media_icon, media_cover, media_artist, media_title = setup_media_items()

local media_bracket =
    sbar.add(
        "bracket",
        "media.bracket",
        { media_cover.name, media_title.name, media_artist.name },
        {
            label = {
                position = "left",
                align = "left",
                padding_left = 10,
                padding_right = 10,
            },

            background = {

                height = 65,
                shadow = true,
                color = colors.bar.bg
            },
            popup = {
                padding_left = 20,
                padding_right = 20,
                align = "right"
            }
        }
    )



local media_container = sbar.add("bracket", "media_bracket", { media_title.name },
    {
        background = {
            position = "popup." .. media_bracket.name,

        }
    })

sbar.add("item", {
    position = "popup." .. media_icon.name,
    padding_left = 20,

    icon = {
        color = colors.bar.foreground,
        string = icons.media.back,
        font = {
            size = 16
        },

    },
    label = {

        drawing = true
    },
    click_script = "nowplaying-cli previous"
})
sbar.add("item", {
    position = "popup." .. media_icon.name,
    icon = {
        color = colors.bar.foreground,
        string = icons.media.play_pause,
        font = {
            size = 30
        },

    },

    label = {
        drawing = true
    },
    click_script = "nowplaying-cli togglePlayPause"
})
sbar.add("item", {
    position = "popup." .. media_icon.name,
    icon = {
        color = colors.bar.foreground,
        string = icons.media.forward,
        font = {
            size = 16
        },
    },
    label = {
        drawing = true
    },
    click_script = "nowplaying-cli next"
})

local interrupt = 0
local function animate_detail(detail)
    if (not detail) then
        interrupt = interrupt - 1
    end
    if interrupt > 0 and (not detail) then
        return
    end

    sbar.animate("tanh", 30, function()
        media_cover:set({
            label = {
                width = "dynamic"
            }
        })
        media_artist:set({
            label = {
                width = "dynamic"
            }
        })
        media_title:set({
            label = {
                width = "dynamic"
            }
        })
    end)
end

media_icon:subscribe("media_change", function(env)
    if whitelist[env.INFO.app] then
        local drawing = (env.INFO.state == "playing")
        media_cover:set({
            drawing = drawing
        })
        media_artist:set({
            drawing = drawing,
            label = env.INFO.artist
        })
        media_title:set({
            drawing = drawing,
            label = env.INFO.title
        })


        if drawing then
            animate_detail(true)
            interrupt = interrupt + 1
            sbar.delay(5, animate_detail)

            -- Show popup for 10 seconds
            media_icon:set({
                popup = {
                    drawing = true
                }
            })
            sbar.delay(10, function()
                media_icon:set({
                    popup = {
                        drawing = false
                    }
                })
            end)
        else
            media_icon:set({
                popup = {
                    drawing = false
                }
            })
        end
    end
end)

media_icon:subscribe("mouse.entered", function(env)
    interrupt = interrupt + 1
    animate_detail(true)
end)

media_icon:subscribe("mouse.exited", function(env)
    animate_detail(false)
end)

media_icon:subscribe("mouse.clicked", function(env)
    media_icon:set({
        popup = {
            drawing = "toggle"
        }
    })
end)

media_title:subscribe("mouse.exited.global", function(env)
    media_icon:set({
        popup = {
            drawing = false
        }
    })
end)

return media_container
