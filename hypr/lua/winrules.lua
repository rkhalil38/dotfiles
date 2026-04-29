--------------------
----- WINRULES -----
--------------------
hl.window_rule({
    name = "windowrule-1",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "windowrule-2",
    no_initial_focus = true,
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    }
})
