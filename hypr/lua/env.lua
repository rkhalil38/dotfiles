--------------------
----- ENV VARS -----
--------------------
local globals = require("lua.globals")

hl.env("XCURSOR_SIZE", globals.cursor.size)
hl.env("XCURSOR_THEME", globals.cursor.theme)
hl.env("HYPRCURSOR_SIZE", globals.cursor.size)
hl.env("HYPRCURSOR_THEME", globals.cursor.theme)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("TERM", globals.terminal)
