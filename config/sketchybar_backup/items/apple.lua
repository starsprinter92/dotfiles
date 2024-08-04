local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local iconPath1 = "/items/multi_color/apple.logo.png"


local apple = sbar.add("item", {
	display = 1,
	icon = {
		drawing = true,
		padding_left = 8,
		padding_right = 5,
		font = {
			size = 16,
		},
		string = icons.apple,
		color = colors.davy_grey,

	},

	background = {
		drawing = true,
		border_width = 0,
		color = colors.bar.bg,
	},

	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})

apple:subscribe("mouse.entered", function(env)
	local selected = env.SELECTED == "true"
	sbar.animate("elastic", 10, function()
		apple:set({
			icon = {
				padding_left = 8,
				padding_right = 5,
				drawing = true,
				color = colors.bar.bg,
				string = "􀁹",
				font = {
					size = 16,
				},
			},
			background = {

				color = colors.blue,

			},
		})
	end)
end)

apple:subscribe("mouse.exited", function(env)
	sbar.animate("elastic", 10, function()
		apple:set({
			display = 1,
			icon = {
				drawing = true,
				padding_left = 8,
				padding_right = 5,
				font = {
					size = 16,
				},
				string = icons.apple,
				color = colors.davy_grey,

			},

			background = {
				drawing = true,
				border_width = 0,
				color = colors.bar.bg,
			},

			click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
		})
	end)
end)
apple:subscribe("mouse.clicked", function(env)
	sbar.animate("elastic", 10, function()
		apple:set({

			icon = {
				padding_left = 8,
				padding_right = 5,
				drawing = true,
				color = colors.bar.bg,
				string = "􀁹",
				font = {
					size = 16,
				},
			},
			background = {

				color = colors.blue,

			},

			click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
		})
	end)
end)
