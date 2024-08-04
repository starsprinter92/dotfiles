local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local space_colors = {


	colors.yellow, -- Color for space 2
	colors.pink,  -- Color for space 3
	colors.orange, -- Color for space 4
	colors.red,   -- Color for space 5
	colors.magenta, -- Color for space 6
	colors.turquise, -- Color for space 7
	colors.blue,  -- Color for space 8
	colors.darkblue, -- Color for space 9
	colors.green, -- Color for space 10








}


local function getSpaceColor(spaceNumber)
	return space_colors[spaceNumber]
end

local sf_icons_active = {
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
	-- "􀝜", "􀝜", "􀝜", "􀝜", "􀝜", "􀝜", "􀝜", "􀝜", "􀝜", "􀝜",
}

local sf_icons_inactive = {
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
	-- "􁹨", "􁹨", "􁹨", "􁹨", "􁹨", "􁹨", "􁹨", "􁹨", "􁹨", "􁹨",
}

local function getSpaceIcon(space, active, app_name)
	if active then
		return sf_icons_active[space]
	else
		return sf_icons_inactive[space]
	end
end

local spaces = {}

local function log(message)
	os.execute('echo "' .. message .. '" >> /tmp/sketchybar.log')
end

local function switchToSpace(spaceNumber)
	local scriptPath = string.format('"$CONFIG_DIR/items/scripts/switchSpace/switchToSpace%d.scpt"', spaceNumber)
	log("Switching to space: " .. spaceNumber .. " with script: " .. scriptPath)
	local command = "osascript " .. scriptPath
	log("Executing command: " .. command)
	local result = os.execute(command)
	log("Result: " .. tostring(result))
end

-- Create space items
for i = 1, 10, 1 do
	local space = sbar.add("space", "space." .. i, {
		space = i,
		position = "left",

	})
	spaces[i] = space

	space:subscribe("front_app_switched", function(env)
		local selected = env.SELECTED == "true"
		sbar.animate("elastic", 10, function()
			space:set({
				label = {
					drawing = false,
				},
				icon = {
					padding_left = selected and 8 or 5,
					padding_right = selected and 8 or 5,
					family = settings.font.clock,
					string = selected and getSpaceIcon(i, true) or getSpaceIcon(i, false),
					color = selected and getSpaceColor(i) or colors.grey,
					font = {
						style = selected and settings.font.style_map["Bold"] or settings.font.style_map["Regualr"],
						size = selected and 14 or 12,
					},

				},
				background = {
					border_width = selected and 1 or 0,
					border_color = colors.bar.border,
					drawing = selected and true or false,
					corner_radius = selected and 4 or 50,
					y_offset = selected and 0 or 0,
					color = selected and colors.bar.bg2 or colors.transparent,

					height = selected and 20 or 18,
					padding_left = 6,
					padding_right = 6,
				},

			})
		end)
	end)

	space:subscribe("mouse.entered", function(env)
		local selected = env.SELECTED == "true"
		sbar.animate("elastic", 8, function()
			space:set({
				label = {
					drawing = false,
				},
				icon = {
					family = settings.font.numbers,
					padding_left = selected and 5 or 5,
					padding_right = selected and 5 or 5,
					y_offset = selected and 0 or 0,
					drawing = true,
					string = selected and "􀅼" or "􀄳",
					color = selected and getSpaceColor(i),

					font = {
						size = selected and 14 or 12.
					},
				},
				background = {
					border_width = selected and 1 or 0,
					border_color = colors.bar.border,
					drawing = selected and true or false,
					corner_radius = selected and 4 or 50,
					y_offset = selected and 0 or 0,
					color = selected and colors.bar.bg2 or colors.transparent,

					height = selected and 18 or 18,
					padding_left = 6,
					padding_right = 6,
				},
			})
		end)
	end)

	space:subscribe("mouse.exited", function(env)
		local selected = env.SELECTED == "true"
		sbar.animate("elastic", 10, function()
			space:set({
				label = {
					drawing = false,
				},
				icon = {
					padding_left = selected and 8 or 5,
					padding_right = selected and 8 or 5,
					family = settings.font.clock,
					string = selected and getSpaceIcon(i, true) or getSpaceIcon(i, false),
					color = selected and getSpaceColor(i) or colors.grey,
					font = {
						style = selected and settings.font.style_map["Bold"] or settings.font.style_map["Regualr"],
						size = selected and 14 or 12,
					},

				},
				background = {
					border_width = selected and 1 or 0,
					border_color = colors.bar.border,
					drawing = selected and true or false,
					corner_radius = selected and 4 or 50,
					y_offset = selected and 0 or 0,
					color = selected and colors.bar.bg2 or colors.transparent,

					height = selected and 20 or 18,
					padding_left = 6,
					padding_right = 6,
				},
			})
		end)
	end)

	space:subscribe("mouse.clicked", function(env)
		local selected = env.SELECTED == "true"
		log("Clicked space: " .. i)
		switchToSpace(i)
		local new_space = sbar.add("item", {
			icon = {
				click_script = selected and sbar.exec('osascript "$CONFIG_DIR/items/scripts/newSpace.scpt"'),
			},

			background = {
				border_color = colors.dolphin_grey,
				y_offset = 0,
				drawing = true,
				padding_left = selected and 10 or 10,
				padding_right = selected and 18 or 10,
			},
		})
	end)
end





local space_names = {}
for i = 1, 10 do
	table.insert(space_names, spaces[i].name)
end
sbar.add("bracket", space_names, {

	background = {
		border_width = 0,
		border_color = colors.bar.border,
		color = colors.bar.bg,
		width = "dynamic"

	},
})
