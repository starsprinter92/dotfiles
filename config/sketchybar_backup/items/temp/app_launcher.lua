local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

sbar.add(
	"item",
	{

		position = "right",
		width = settings.group_paddings
	}
)

local terminal =
	sbar.add(
		"item",
		{
			shadown = true,
			position = "right",
			background = {
				border_width = 0,
				border_color = colors.transparent,
				color = colors.bar.bg
			},
			icon = {
				font = { size = 18,
				},
				padding_left = 5,
				string = "􀁗",
				color = colors.lightgray,

			},
			label = {
				drawing = false,
			}

		}
	)

terminal:subscribe(
	"mouse.clicked",
	function(env)
		sbar.exec("open -a 'iTerm'")
	end
)

local chat =
	sbar.add(
		"item",
		{
			position = "right",
			background = {

				color = colors.transparent

			},
			icon = {
				font = { size = 18,
				},

				string = "􂄼",
				color = colors.lightgray,

			},
			label = {
				drawing = false,
			}

		}
	)

chat:subscribe(
	"mouse.clicked",
	function(env)
		sbar.exec("open -a 'ChatGPT'")
	end
)








-- Double border for apple using a single item bracket
sbar.add("bracket", { chat.name, terminal.name }, {

	background = {
		position = "left",
		color = colors.bar.bg,
		width = "dynamic",
		border_color = colors.grey,

	}
})
