---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

local apps = require("defaultApps")
local terminal = apps.terminal
local explorer = apps.explorer

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(terminal .. " yazi"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -t png -l 5"))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("walset"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("swaync-client -t -sw"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("CTRL + ALT + left",  hl.dsp.window.resize({ x = -50, y = 0 }))
hl.bind("CTRL + ALT + right", hl.dsp.window.resize({ x = 50,  y = 0 }))
hl.bind("CTRL + ALT + up",    hl.dsp.window.resize({ x = 0,   y = -50 }))
hl.bind("CTRL + ALT + down",  hl.dsp.window.resize({ x = 0,   y = 50 }))

hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%"))

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))

hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd(
	[[bash -c 'dev="ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad"; state=$(hyprctl devices | grep -A 5 "$dev" | grep enabled | awk "{print \$2}"); if [ "$state" = "true" ]; then hyprctl keyword input:touchpad:disable true; notify-send "Touchpad Disabled"; else hyprctl keyword input:touchpad:disable false; notify-send "Touchpad Enabled"; fi']]
))
