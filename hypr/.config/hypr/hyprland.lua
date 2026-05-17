-- ##########################################################################
-- Hyprland 0.55+ Lua configuration.
-- Migrated from hyprland.conf (hyprlang). Hyprlang is deprecated since 0.55.
-- File location: $XDG_CONFIG_HOME/hypr/hyprland.lua  (~/.config/hypr/hyprland.lua)
-- Wiki: https://wiki.hypr.land/Configuring/Start/
-- ##########################################################################

local configDir = os.getenv("HOME") .. "/.config/hypr/"
package.path = configDir .. "?.lua;" .. package.path


---------------------- 
---- GLOBAL BINDS ----
----------------------
_G.mainMod = "SUPER"

---------------------
---- MY PROGRAMS ----
---------------------
_G.terminal    = "kitty"
_G.fileManager = "pcmanfm"
_G.menu        = "rofi -show drun"
_G.screenshot  = 'grim -g "$(slurp)" - | swappy -f -'
_G.pwmanager   = "bitwarden-desktop"
_G.lockscreen  = "hyprlock"

require("hyprconf.base")
require("hyprconf.monitor")
require("hyprconf.keybinds")
require("hyprconf.split-workspace")

-------------------
---- AUTOSTART ----
-------------------
-- exec-once is gone; use hl.on("hyprland.start", ...).
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("bitwarden-desktop")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("dunst")
    hl.exec_cmd("nextcloud --background")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE",   "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- NVIDIA / Wayland environment.
hl.env("LIBVA_DRIVER_NAME",          "nvidia")
hl.env("XDG_SESSION_TYPE",           "wayland")
hl.env("GBM_BACKEND",                "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME",  "nvidia")
hl.env("NVD_BACKEND",                "direct")



--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
-- Float Bitwarden
hl.window_rule({
    name  = "bw-float",
    match = { title = "^(Bitwarden)$" },
    float = true,
})

-- Suppress maximize events from all clients
hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
