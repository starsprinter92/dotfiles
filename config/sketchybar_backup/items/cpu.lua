local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("graph", "cpu", 42, {
    display = 1,
    position = "right",
    graph = { color = colors.yellow },
    background = {
        color = colors.bar.bg,
        drawing = true,
    },
    icon = {
        color = colors.grey,
        string = icons.cpu,
        padding_right = 15,
        padding_left = 10,
    },
    label = {
        color = colors.foreground_light,
        string = "cpu ??%",
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 9.0,
        },
        align = "right",
        padding_right = 10,
        padding_left = 10,
        width = 0,
        y_offset = 4
    },
    -- padding_right = settings.paddings + 6
})

cpu:subscribe("cpu_update", function(env)
    -- Also available: env.user_load, env.sys_load
    local load = tonumber(env.total_load)
    cpu:push({ load / 100. })

    local color = colors.yellow
    if load > 30 then
        if load < 60 then
            color = colors.yellow
        elseif load < 80 then
            color = colors.orange
        else
            color = colors.red
        end
    end

    cpu:set({
        graph = { color = colors.foreground_light, },
        label = "cpu " .. env.total_load .. "%",
    })
end)

cpu:subscribe("mouse.clicked", function(env)
    sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the cpu item
sbar.add("bracket", "cpu.bracket", { cpu.name }, {
    background = { color = colors.bg1 }
})
