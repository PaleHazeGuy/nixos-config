-------------------
---- AUTOSTART ----
-------------------

hl.exec_cmd(
	"dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && "
	.. "systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target"
)

hl.exec_cmd("waybar")
hl.exec_cmd("swww init && swww img " .. os.getenv("HOME") .. "/Pictures/Wallpapers/new1.jpg")
hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
hl.exec_cmd("udiskie &")
hl.exec_cmd("wal -R --cols16 &")
hl.exec_cmd("squeekboard")

local terminal = require("defaultApps").terminal

hl.exec_cmd(terminal .. ' sh -c "neofetch; exec zsh"')
hl.exec_cmd(terminal .. " yazi " .. os.getenv("HOME"))
hl.exec_cmd(terminal .. " glances")
