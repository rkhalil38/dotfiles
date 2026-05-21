local mon = require("lua.util.display")

--------------------
----- MONITORS -----
--------------------
local monitors = {
    {
        output = "desc:Microstep MSI MAG 275QF CE2M144701107",
        mode = "2560x1440@180",
        position = "2560x0",
        scale = 1,
    },
    {
        output = "desc:Samsung Electric Company SAMSUNG",
        mode = "3840x2160@60",
        position = "0x0",
        scale = 1.5,
        bitdepth = 10,
    }

}

mon.register(monitors)
