--------------------
----- ENV VARS -----
--------------------
local globals = require("lua.globals")

hl.env("XCURSOR_SIZE", 24)
hl.env("XCURSOR_THEME", "volantes_cursors")
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_THEME", "volantes_cursors")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("TERM", globals.terminal)
