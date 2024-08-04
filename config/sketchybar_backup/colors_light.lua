return {

    black = 0xff171616,
    white = 0xffcecece,
    foreground_light = 0xffa0a0a0,
    foreground_dark = 0xff1c1c1c,
    inactive_foreground = 0xff5c5c5c,
    transparent = 0x00000000,


    -- red = 0xfff89c99,
    -- green = 0xff78c0af,
    -- yellow = 0xfff8d6a1,
    -- aqua = 0xff78cdc5,
    -- orange = 0xfff8c28f,
    -- blue = 0xffbce6f1,
    -- turquise = 0xff70a7a8,
    -- magenta = 0xffceccef,
    -- silver = 0xff819a98,
    -- grey = 0xff575450,
    -- darkliver = 0xff505050,
    -- lightgrey = 0xff3e3e3e,
    -- dolphin_grey = 0xff7a8e82,
    red = 0xff6b2f2c,
    green = 0xff78c0af,
    yellow = 0xffbca238,
    aqua = 0xff78cdc5,
    orange = 0xfff8c28f,
    blue = 0xffbce6f1,
    turquise = 0xff70a7a8,
    magenta = 0xffceccef,
    silver = 0xff819a98,
    grey = 0xff575450,
    darkliver = 0xff505050,
    lightgrey = 0xff3e3e3e,
    dolphin_grey = 0xff7a8e82,

    dolphin_grey1 = 0xCC7a8e82,
    dolphin_grey2 = 0xB37a8e82,
    dolphin_grey3 = 0x997a8e82,
    dolphin_grey4 = 0x807a8e82,
    dolphin_grey5 = 0x667a8e82,
    dolphin_grey6 = 0x4D7a8e82,
    dolphin_grey7 = 0x337a8e82,
    dolphin_grey8 = 0x1A7a8e82,
    dolphin_grey9 = 0x0d7a8e82,

    indigo = {
        blue = 0xff2e3e45,
        red = 0xffff4841,
        brown = 0xff
    },

    grey1 = 0xffdcdcdc,
    grey2 = 0xff626262,
    grey3 = 0xff4e4e4e,
    grey4 = 0xff373737,
    grey5 = 0xff232323,

    stormcloud = {
        one = 0xff516169,
        two = 0xffadb9bf,
    },
    indigo = {
        one = 0xff667287,
        two = 0xff424a57,
        three = 0xff3b424d,
        four = 0xff323841,
        five = 0xff323c49,
        six = 0xff272c33
    },

    dimgray = {
        one = 0xffb5b5b5,
        two = 0xff6d6d6b,
    },

    slategray = {
        one = 0xffc5c5c5,
        two = 0xff434343,
        three = 0xff373737,
        four = 0xff1e1e1e,
    },

    granit = {
        one = 0xff64655e,
        two = 0xff4f514b,
        three = 0xff373935,
        four = 0xff272826,
    },

    seezalt = {
        spanishgrey = 0xff8f969e,
        light = 0xffacaeb1,
        dark = 0xff545454,
        platinum = 0xffe5e5e5,
    },
    bar = {
        bg = 0xfff6f6f6,
        sub = 0xff575c5f,
        active = 0xff9eaeb3,
        selected = 0xff593c3c,
        transparent = 0xccffffff,
        border = 0xffededed,
        secondary = 0xff61817f,
        white_transparent = 0x8faeaeae,
        inactive = 0xff727272,
        icons = 0xff61817f,
        foreground = 0xffb3b3b3,
        foreground_alt = 0xff434343,
        foreground_icon = 0xff486a68,
        foreground_dimmed = 0xff848484,
        foreground_alt_blue = 0xff486a68,
        foreground_alt_blue_dimmed = 0xdd486a68,
    },
    popup = {
        bg = 0x661e1e1e,
        border = 0x000000,
        buttons = 0xff959697,
        icons = 0xff486a68,


        bg1 = 0xff1c1c1c,
        bg2 = 0xff242424,
        with_alpha = function(color, alpha)
            if alpha > 1.0 or alpha < 0.0 then
                return color
            end
            return (color and 0x001e1e1e) or (math.floor(alpha * 255.0) < 24)
        end
    }
}
