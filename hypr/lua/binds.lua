local g = require("lua.globals")
local key = require("lua.util.binding")

--------------------
------ BINDS -------
--------------------

--- @type KeyBind[]
local binds = {

    { keys = "X", cb = hl.dsp.exec_cmd(g.terminal), opts = { leader = true } },
    { keys = "Q", cb = hl.dsp.window.close("activewindow"), opts = { leader = true } },
    { keys = "F", cb = hl.dsp.exec_cmd(g.file_manager), opts = { leader = true } },
    { keys = "V", cb = hl.dsp.window.float({ action = "toggle" }), opts = { leader = true } },
    { keys = "P", cb = hl.dsp.window.pseudo(), opts = { leader = true } },

    -- Move focus
    { keys = "H", cb = hl.dsp.focus({ direction = "l" }), opts = { leader = true } },
    { keys = "L", cb = hl.dsp.focus({ direction = "r" }), opts = { leader = true } },
    { keys = "K", cb = hl.dsp.focus({ direction = "u" }), opts = { leader = true } },
    { keys = "J", cb = hl.dsp.focus({ direction = "d" }), opts = { leader = true } },

    -- Switch workspaces
    { keys = "1", cb = hl.dsp.focus({ workspace = "1" }), opts = { leader = true } },
    { keys = "2", cb = hl.dsp.focus({ workspace = "2" }), opts = { leader = true } },
    { keys = "3", cb = hl.dsp.focus({ workspace = "3" }), opts = { leader = true } },
    { keys = "4", cb = hl.dsp.focus({ workspace = "4" }), opts = { leader = true } },
    { keys = "5", cb = hl.dsp.focus({ workspace = "5" }), opts = { leader = true } },
    { keys = "6", cb = hl.dsp.focus({ workspace = "6" }), opts = { leader = true } },
    { keys = "7", cb = hl.dsp.focus({ workspace = "7" }), opts = { leader = true } },
    { keys = "8", cb = hl.dsp.focus({ workspace = "8" }), opts = { leader = true } },
    { keys = "9", cb = hl.dsp.focus({ workspace = "9" }), opts = { leader = true } },
    { keys = "0", cb = hl.dsp.focus({ workspace = "10" }), opts = { leader = true } },

    -- Move active window to a workspace
    { keys = { "SHIFT", "1" }, cb = hl.dsp.window.move({ workspace = "1" }), opts = { leader = true } },
    { keys = { "SHIFT", "2" }, cb = hl.dsp.window.move({ workspace = "2" }), opts = { leader = true } },
    { keys = { "SHIFT", "3" }, cb = hl.dsp.window.move({ workspace = "3" }), opts = { leader = true } },
    { keys = { "SHIFT", "4" }, cb = hl.dsp.window.move({ workspace = "4" }), opts = { leader = true } },
    { keys = { "SHIFT", "5" }, cb = hl.dsp.window.move({ workspace = "5" }), opts = { leader = true } },
    { keys = { "SHIFT", "6" }, cb = hl.dsp.window.move({ workspace = "6" }), opts = { leader = true } },
    { keys = { "SHIFT", "7" }, cb = hl.dsp.window.move({ workspace = "7" }), opts = { leader = true } },
    { keys = { "SHIFT", "8" }, cb = hl.dsp.window.move({ workspace = "8" }), opts = { leader = true } },
    { keys = { "SHIFT", "9" }, cb = hl.dsp.window.move({ workspace = "9" }), opts = { leader = true } },
    { keys = { "SHIFT", "0" }, cb = hl.dsp.window.move({ workspace = "10" }), opts = { leader = true } },

    -- Move active window in current workspace
    { keys = { "SHIFT", "H" }, cb = hl.dsp.window.move({ direction = "l" }), opts = { leader = true } },
    { keys = { "SHIFT", "L" }, cb = hl.dsp.window.move({ direction = "r" }), opts = { leader = true } },
    { keys = { "SHIFT", "K" }, cb = hl.dsp.window.move({ direction = "u" }), opts = { leader = true } },
    { keys = { "SHIFT", "J" }, cb = hl.dsp.window.move({ direction = "d" }), opts = { leader = true } },

    -- Special workspace (scratchpad)
    { keys = { "S" }, cb = hl.dsp.workspace.toggle_special("magic"), opts = { leader = true } },
    { keys = { "SHIFT", "S" }, cb = hl.dsp.window.move({ workspace = "special:magic" }), opts = { leader = true } },

    -- Scroll through workspaces
    { keys = { "mouse_down" }, cb = hl.dsp.focus({ workspace = "e+1" }), opts = { leader = true } },
    { keys = { "mouse_up" }, cb = hl.dsp.focus({ workspace = "e-1" }), opts = { leader = true } },

    -- Mouse binds
    { keys = "mouse:272", cb = hl.dsp.window.drag(), opts = { mouse = true, leader = true } },
    { keys = "mouse:273", cb = hl.dsp.window.resize(), opts = { mouse = true, leader = true } },

    -- Autoworkspaces
    {
        keys = "Home",
        cb = function()
            hl.dispatch(hl.dsp.exec_cmd(g.browser))
            hl.dispatch(hl.dsp.exec_cmd(g.terminal))
            hl.dispatch(hl.dsp.exec_cmd(g.terminal))
        end,
        opts = { leader = true },
    },

    -- App Launcher
    { keys = { "ALT", "SPACE" }, cb = hl.dsp.exec_cmd(g.menu) },

    -- Screenshot utility
    { keys = { "CTRL", "SHIFT", "P" }, cb = hl.dsp.exec_cmd(g.screenshot.clipboard) },
    { keys = { "CTRL", "SHIFT", "O" }, cb = hl.dsp.exec_cmd(g.screenshot.downloads) },

    -- Media keys
    {
        keys = "XF86AudioRaiseVolume",
        cb = hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
        opts = { repeating = true, locked = true },
    },
    {
        keys = "XF86AudioLowerVolume",
        cb = hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
        opts = { repeating = true, locked = true },
    },
    {
        keys = "XF86AudioMute",
        cb = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
        opts = { locked = true },
    },
    {
        keys = "XF86AudioMicMute",
        cb = hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
        opts = { locked = true },
    },
    {
        keys = "XF86MonBrightnessUp",
        cb = hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
        opts = { repeating = true, locked = true },
    },
    {
        keys = "XF86MonBrightnessDown",
        cb = hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
        opts = { repeating = true, locked = true },
    },

    -- Player controls
    { keys = "XF86AudioNext", cb = hl.dsp.exec_cmd("playerctl next"), opts = { locked = true } },
    { keys = "XF86AudioPause", cb = hl.dsp.exec_cmd("playerctl play-pause"), opts = { locked = true } },
    { keys = "XF86AudioPlay", cb = hl.dsp.exec_cmd("playerctl play-pause"), opts = { locked = true } },
    { keys = "XF86AudioPrev", cb = hl.dsp.exec_cmd("playerctl previous"), opts = { locked = true } },
}

key.binds_from_table(binds)
