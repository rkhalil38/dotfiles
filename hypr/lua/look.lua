local c = require("colors")

--------------------
----- GENERAL ------
--------------------
local general = hl.general
general.gaps_in = 5
general.gaps_out = 20
general.border_size = 2
general.col.active_border = c.primary
general.col.inactive_border = c.surface

--------------------
---- DECORATION ----
--------------------
local deco = hl.decoration
deco.rounding = 10
deco.rounding_power = 2
deco.active_opacity = 1.0
deco.inactive_opacity = 0.9

local shadow = deco.shadow
shadow.enabled = true
shadow.range = 4
shadow.render_power = 3
shadow.color = c.shadow

local blur = deco.blur
blur.enabled = true
blur.size = 3
blur.passes = 1
blur.vibrancy = 0.1696
