-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

hl.env("GDK_SCALE", "1.65")
hl.env("GDK_DPI_SCALE", "1.6")
hl.env("QT_SCALE_FACTOR", "1.6")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- For AGS
hl.env("XDG_STATE_HOME", (os.getenv("HOME") or "") .. "/.local/state")
hl.env("ILLOGICAL_IMPULSE_VIRTUAL_ENV", (os.getenv("XDG_STATE_HOME") or ((os.getenv("HOME") or "") .. "/.local/state")) .. "/ags/.venv")
