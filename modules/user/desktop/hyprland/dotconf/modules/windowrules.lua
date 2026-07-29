--------------------------------
---- WINDOWS AND LAYERS ----
--------------------------------

hl.window_rule({
	name  = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name  = "no-blur-empty-class-title",
	match = { class = "^()$", title = "^()$" },

	no_blur = true,
})

hl.window_rule({
	name  = "stay-focused-empty-class-title",
	match = { class = "^()$", title = "^()$" },

	stay_focused = true,
})

hl.window_rule({
	name  = "float-file-pickers",
	match = {
		title = "^(Open File|Open|Save|Save As|Export|Import|Choose File)$",
		class = "^(.*)$",
	},

	float  = true,
	center = true,
})

hl.window_rule({
	name  = "float-xdg-desktop-portal-gtk-lower",
	match = { class = "(xdg-desktop-portal-gtk)" },

	float  = true,
	center = true,
})

hl.window_rule({
	name  = "float-xdg-desktop-portal-gtk-upper",
	match = { class = "(Xdg-desktop-portal-gtk)" },

	float  = true,
	center = true,
})

hl.layer_rule({
	name  = "swaync-control-center",
	match = { namespace = "swaync-control-center" },

	blur         = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	name  = "swaync-notification-window",
	match = { namespace = "swaync-notification-window" },

	blur         = true,
	ignore_alpha = 0.5,
})
