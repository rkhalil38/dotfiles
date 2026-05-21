local globals = require("lua.globals")
local env = require("lua.util.environment")

--------------------
----- ENV VARS -----
--------------------

--- @type EnvVar[]
local vars = {
    { name = "XCURSOR_SIZE", val = globals.cursor.size },
    { name = "XCURSOR_THEME", val = globals.cursor.theme },
    { name = "HYPRCURSOR_SIZE", val = globals.cursor.size },
    { name = "HYPRCURSOR_THEME", val = globals.cursor.theme },
    { name = "LIBVA_DRIVER_NAME", val = "nvidia" },
    { name = "__GLX_VENDOR_LIBRARY_NAME", val = "nvidia" },
    { name = "QT_QPA_PLATFORMTHEME", val = "hyprqt6engine" },
    { name = "TERM", val = globals.terminal },
}

env.set_vars(vars)
