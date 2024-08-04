return {


    black = 0xff171616,
    white = 0xffdedede,
    foreground_light = 0xffa0a0a0,
    foreground_dark = 0xff1c1c1c,
    inactive_foreground = 0xff5c5c5c,

    red = 0xff6b2f2c,
    green = 0xff384b3a,
    yellow = 0xffae954b,
    aqua = 0xffa4b8b2,
    orange = 0xffaa5b35,
    blue = 0xff58728b,
    darkblue = 0xff212c35,
    pink = 0xffbd9288,
    magenta = 0xff7d7699,
    cyan = 0xff416662,
    silver = 0xff819a98,
    grey = 0xff535558,
    davy_grey = 0xff535558,
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

    desert_sand = 0xffdfc9a7,
    cadet = 0xff5c716c,
    quartz = 0xff4c4a50,
    eggplant = 0xff5b4550,
    deeptaupe = 0xff806666,

    transparent = 0x00000000,
    semi_transparent = 0x40ffffff,
    border_transparent = 0x33ffffff,

    hover = 0xffffffff,
    grey2 = 0xff626262,
    grey3 = 0xff4e4e4e,
    grey4 = 0xff373737,
    grey5 = 0xff303030,

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
        one = 0xff73868f,
        two = 0xff5c6d75,
        three = 0xff49575e,
        four = 0xff39454a,
        light = 0xff7c879e,
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
        bg = 0xff1c1c1c,
        bg2 = 0xff1f1f1f,
        sub = 0xff242424,
        active = 0xff9eaeb3,
        selected = 0xff593c3c,
        transparent = 0xe51e1e1e,
        border = 0x1affffff,
        secondary = 0xff61817f,
        white_transparent = 0x0dffffff,
        inactive = 0xff727272,
        icons = 0xff61817f,
        foreground = 0xffc3c5c2,
        foreground_alt = 0xff828282,
        foreground_icon = 0xff486a68,
        foreground_dimmed = 0x66dcdcdc,
        foreground_alt_blue = 0xff497270,
        foreground_alt_blue_dimmed = 0xff3d6765,
    },
    popup = {
        bg = 0x781c1c1c,
        border = 0x00000000,
        buttons = 0xff959697,
        label = 0xff1e1e1e,

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
