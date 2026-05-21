--- @class MonitorUtil
local M = {}

--- Normalizes monitor params.
--- @param monitors HL.MonitorSpec|HL.MonitorSpec[]
--- @return HL.MonitorSpec[]
local function normalize_monitors(monitors)
    if monitors[1] ~= nil then
        return monitors
    end

    return { monitors }
end

--- Registers monitor(s) with Hyprland.
--- @param monitors HL.MonitorSpec|HL.MonitorSpec[]
M.register = function(monitors)
    monitors = normalize_monitors(monitors)

    for _, mon in ipairs(monitors) do
        hl.monitor(mon)
    end
end

--- @type MonitorUtil
return M
