local mon = require("lua.util.display")

--------------------
----- MONITORS -----
--------------------

--- @type HL.MonitorSpec[]
local monitors = {
    {
        output = "desc:Samsung Electric Company Odyssey G70F HNBYA00241",
        mode = "3840x2160@180",
        position = "0x0",
        scale = 1.5,
    },
    {
        output = "desc:Microstep MAG 271QPX E2",
        mode = "2560x1440@240",
        position = "2560x0",
        scale = 1,
        bitdepth = 10,
    },
}

mon.register(monitors)
