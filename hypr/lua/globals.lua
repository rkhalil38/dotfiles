--------------------
----- GLOBALS ------
--------------------
local M = {}

-- Applications
M.terminal = "ghostty"
M.browser = "firefox"
M.file_manager = "thunar"
M.menu = 'rofi -show drun -show-icons -icon-theme "Kora" -filebrowser-directory $HOME'
M.screenshot = {
    clipboard = "hyprshot -m region --clipboard-only",
    downloads = "hyprshot -m region -o ~/Downloads/",
}

-- Theme
M.cursor = {
    theme = "volantes_cursors",
    size = 24,
}

-- Keys
M.main_mod = "SUPER"

return M
