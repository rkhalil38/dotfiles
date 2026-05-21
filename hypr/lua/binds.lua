local g = require("lua.globals")
local key = require("lua.util.binding")

--------------------
------ BINDS -------
--------------------

--- @type KeyBind[]
local leader_binds = {
    { keys = "X", cb = hl.dsp.exec_cmd(g.terminal) },
    { keys = "Q", cb = hl.dsp.window.close("activewindow") },
    { keys = "F", cb = hl.dsp.exec_cmd(g.file_manager) },
    { keys = "V", cb = hl.dsp.window.float({ action = "toggle" }) },
    { keys = "P", cb = hl.dsp.window.pseudo() },

    -- Move focus
    { keys = "H", cb = hl.dsp.focus({ direction = "l" }) },
    { keys = "L", cb = hl.dsp.focus({ direction = "r" }) },
    { keys = "K", cb = hl.dsp.focus({ direction = "u" }) },
    { keys = "J", cb = hl.dsp.focus({ direction = "d" }) },

    -- Switch workspaces
    { keys = "1", cb = hl.dsp.focus({ workspace = "1" }) },
    { keys = "2", cb = hl.dsp.focus({ workspace = "2" }) },
    { keys = "3", cb = hl.dsp.focus({ workspace = "3" }) },
    { keys = "4", cb = hl.dsp.focus({ workspace = "4" }) },
    { keys = "5", cb = hl.dsp.focus({ workspace = "5" }) },
    { keys = "6", cb = hl.dsp.focus({ workspace = "6" }) },
    { keys = "7", cb = hl.dsp.focus({ workspace = "7" }) },
    { keys = "8", cb = hl.dsp.focus({ workspace = "8" }) },
    { keys = "9", cb = hl.dsp.focus({ workspace = "9" }) },
    { keys = "0", cb = hl.dsp.focus({ workspace = "10" }) },

    -- Move active window to a workspace
    { keys = { "SHIFT", "1" }, cb = hl.dsp.window.move({ workspace = "1" }) },
    { keys = { "SHIFT", "2" }, cb = hl.dsp.window.move({ workspace = "2" }) },
    { keys = { "SHIFT", "3" }, cb = hl.dsp.window.move({ workspace = "3" }) },
    { keys = { "SHIFT", "4" }, cb = hl.dsp.window.move({ workspace = "4" }) },
    { keys = { "SHIFT", "5" }, cb = hl.dsp.window.move({ workspace = "5" }) },
    { keys = { "SHIFT", "6" }, cb = hl.dsp.window.move({ workspace = "6" }) },
    { keys = { "SHIFT", "7" }, cb = hl.dsp.window.move({ workspace = "7" }) },
    { keys = { "SHIFT", "8" }, cb = hl.dsp.window.move({ workspace = "8" }) },
    { keys = { "SHIFT", "9" }, cb = hl.dsp.window.move({ workspace = "9" }) },
    { keys = { "SHIFT", "0" }, cb = hl.dsp.window.move({ workspace = "10" }) },

    -- Move active window in current workspace
    { keys = { "SHIFT", "H" }, cb = hl.dsp.window.move({ direction = "l" }) },
    { keys = { "SHIFT", "L" }, cb = hl.dsp.window.move({ direction = "r" }) },
    { keys = { "SHIFT", "K" }, cb = hl.dsp.window.move({ direction = "u" }) },
    { keys = { "SHIFT", "J" }, cb = hl.dsp.window.move({ direction = "d" }) },

    -- Special workspace (scratchpad)
    { keys = { "S" }, cb = hl.dsp.workspace.toggle_special("magic") },
    { keys = { "SHIFT", "S" }, cb = hl.dsp.window.move({ workspace = "special:magic" }) },

    -- Scroll through workspaces
    { keys = { "mouse_down" }, cb = hl.dsp.focus({ workspace = "e+1" }) },
    { keys = { "mouse_up" }, cb = hl.dsp.focus({ workspace = "e-1" }) },

    -- Mouse binds
    { keys = "mouse:272", cb = hl.dsp.window.drag(), opts = { mouse = true } },
    { keys = "mouse:273", cb = hl.dsp.window.resize(), opts = { mouse = true } },

    -- Autoworkspaces
    {
        keys = "Home",
        cb = function()
            hl.dispatch(hl.dsp.exec_cmd(g.browser))
            hl.dispatch(hl.dsp.exec_cmd(g.terminal))
            hl.dispatch(hl.dsp.exec_cmd(g.terminal))
        end,
    },
}

--- @type KeyBind[]
local binds = {

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

key.binds_from_table(leader_binds, true)
key.binds_from_table(binds, false)
