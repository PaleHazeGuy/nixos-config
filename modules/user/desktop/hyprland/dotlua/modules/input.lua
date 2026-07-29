---------------
---- INPUT ----
---------------

hl.device({
	name        = "ELAN9008:00 04F3:43C7 Stylus",
	sensitivity = 1.0,
})

hl.config({
	input = {
		kb_layout  = "us,th",
		kb_options = "grp:win_space_toggle",

		follow_mouse = 1,

		touchpad = {
			natural_scroll = true,
		},

		sensitivity = 0,
	},
})
