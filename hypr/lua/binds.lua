local globals = require("globals")

--------------------
------ BINDS -------
--------------------
hl.bind(globals.main_mod .. " + X",     hl.dsp.exec_cmd(globals.terminal))
hl.bind(globals.main_mod .. " + Q",     hl.dsp.window.kill())
hl.bind(globals.main_mod .. " + F",     hl.dsp.exec_cmd(globals.fileManager))
hl.bind(globals.main_mod .. " + V",     hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + SPACE",                  hl.dsp.exec_cmd(globals.menu))
hl.bind(globals.main_mod .. " + SPACE", hl.dsp.exec_cmd(globals.command_menu))
hl.bind(globals.main_mod .. " + P",     hl.dsp.window.pseudo())

-- Move focus
hl.bind(globals.main_mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(globals.main_mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(globals.main_mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(globals.main_mod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Switch workspaces
hl.bind(globals.main_mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(globals.main_mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(globals.main_mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(globals.main_mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(globals.main_mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(globals.main_mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(globals.main_mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(globals.main_mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(globals.main_mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(globals.main_mod .. " + 0", hl.dsp.focus({ workspace = "10" }))

-- Move active window to a workspace
hl.bind(globals.main_mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(globals.main_mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(globals.main_mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(globals.main_mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(globals.main_mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(globals.main_mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(globals.main_mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(globals.main_mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(globals.main_mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind(globals.main_mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Move active window in current workspace
hl.bind(globals.main_mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(globals.main_mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(globals.main_mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(globals.main_mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Special workspace (scratchpad)
hl.bind(globals.main_mod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(globals.main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(globals.main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(globals.main_mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Screenshot utility
hl.bind("CTRL + SHIFT + P", hl.dsp.exec_cmd(globals.screenshot_clipboard))
hl.bind("CTRL + SHIFT + O", hl.dsp.exec_cmd(globals.screenshot_downloads))

-- Mouse binds
hl.bind(globals.main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(globals.main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { repeating = true, locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                   { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                   { repeating = true, locked = true })

-- Player controls
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
