-- Require the sketchybar module
sbar = require("sketchybar")

-- Function to check if dark mode is enabled
local function is_dark_mode()
    local handle = io.popen('defaults read -g AppleInterfaceStyle')
    if handle == nil then
        return false -- Fallback to light mode if popen fails
    end

    local result = handle:read("*a")
    handle:close()

    if result == nil then
        return false -- Fallback to light mode if read fails
    end

    return result:match("Dark") ~= nil
end

-- Load the appropriate color file
local colors

if is_dark_mode() then
    colors = require("colors_dark")
else
    colors = require("colors_light")
end

-- Your existing code...
local icons = require("icons")
local settings = require("settings")

-- Example usage of the colors
print("Bar background color: " .. colors.bar.bg)

-- Set the bar name, if you are using another bar instance than sketchybar
-- sbar.set_bar_name("bottom_bar")

-- Bundle the entire initial configuration into a single message to sketchybar
sbar.begin_config()
require("bar")
require("default")
require("items")

sbar.end_config()

-- Run the event loop of the sketchybar module (without this there will be no
-- callback functions executed in the lua module)
sbar.event_loop()
