--------------------
----- GLOBALS ------
--------------------

--- Screenshot Applications.
--- @class Globals.Screenshot
--- @field clipboard string
--- @field downloads string

--- Cursor Specs.
--- @class Globals.CursorSpec
--- @field theme string
--- @field size number

--- @class Globals
--- @field terminal string
--- @field browser string
--- @field file_manager string
--- @field menu string
--- @field screenshot Globals.Screenshot
--- @field cursor Globals.CursorSpec
--- @field nvidia boolean
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
M.leader = "SUPER"

-- System Settings
M.nvidia = true

--- @type Globals
return M
