-----------------------
---- LOOK AND FEEL ----
-----------------------

local colors = require("modules.colors")

hl.config({
	general = {
		gaps_in  = 7,
		gaps_out = 13,

		border_size = 2,

		col = {
			inactive_border = colors.background,
			active_border   = colors.inverse_primary,
		},

		layout = "master",
	},

	decoration = {
		rounding = 15,

		blur = {
			enabled           = true,
			size              = 9,
			passes            = 3,
			ignore_opacity    = true,
			xray              = false,
			new_optimizations = true,
		},

		shadow = {
			enabled      = true,
			range        = 10,
			render_power = 3,
			sharp        = false,
		},

		dim_inactive = false,
	},

	animations = {
		enabled = true,
	},
})

hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 7,  bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "myBezier", style = "slide" })
