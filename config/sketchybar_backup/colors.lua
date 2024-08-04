-- colors.lua
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

if is_dark_mode() then
    return require("colors_dark")
else
    return require("colors_light")
end
