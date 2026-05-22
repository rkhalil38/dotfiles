local g = require("lua.globals")

--------------------
---- AUTOSTART -----
--------------------
hl.on("hyprland.start", function()
    for _, app in ipairs(g.autostart) do
        hl.exec_cmd(app)
    end
end)
