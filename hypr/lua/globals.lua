--------------------
----- GLOBALS ------
--------------------
local M = {}

M.terminal = "ghostty"
M.browser = "firefox"
M.file_manager = "thunar"
M.menu = "rofi -show drun -show-icons -icon-theme \"Kora\""
M.command_menu = "rofi -show run"
M.screenshot_clipboard = "hyprshot -m region --clipboard-only"
M.screenshot_downloads = "hyprshot -m region -o ~/Downloads/"

M.main_mod = "SUPER"

return M
