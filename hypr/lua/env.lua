local g = require("lua.globals")
local env = require("lua.util.environment")

--------------------
----- ENV VARS -----
--------------------

--- @type EnvVar[]
local vars = {
    { name = "XCURSOR_SIZE", val = g.cursor.size },
    { name = "XCURSOR_THEME", val = g.cursor.theme },
    { name = "HYPRCURSOR_SIZE", val = g.cursor.size },
    { name = "HYPRCURSOR_THEME", val = g.cursor.theme },
    { name = "LIBVA_DRIVER_NAME", val = "nvidia", opts = { condition = g.nvidia } },
    { name = "__GLX_VENDOR_LIBRARY_NAME", val = "nvidia", opts = { condition = g.nvidia } },
    { name = "QT_QPA_PLATFORMTHEME", val = "hyprqt6engine" },
    { name = "TERM", val = g.terminal },
}

env.set_vars(vars)
