local g = require("lua.globals")

--- @alias KeySequence string|string[]|string[][]

--- @class KeyBind
--- @field keys KeySequence
--- @field cb fun(...)
--- @field opts? HL.BindOptions

--- @class BindUtil
local M = {}

--- Normalizes key sequences.
--- @param keys KeySequence
--- @return string[][]
local function normalize_keys(keys)
    if type(keys) == "string" then
        return { { keys } }
    elseif type(keys[1]) == "string" then
        return { keys }
    end

    return keys
end

--- Creates hyprland key string from list.
--- @param keys string[]
--- @return string
local function kstr(keys)
    return table.concat(keys, " + ")
end

--- Creates hyprland key string (with prefix) from list.
--- @param keys string[]
--- @param prefix string
--- @return string
local function kstr_with_prefix(keys, prefix)
    return prefix .. " + " .. table.concat(keys, " + ")
end

--- Binds key sequence to action.
--- @param keys KeySequence
--- @param cb fun(...)
--- @param opts? HL.BindOptions
M.bind = function(keys, cb, opts)
    keys = normalize_keys(keys)

    for _, seq in ipairs(keys) do
        hl.bind(kstr(seq), cb, opts)
    end
end

--- Appends leader to key sequence, binds sequence to action.
--- @param keys KeySequence
--- @param cb fun(...)
--- @param opts? HL.BindOptions
M.bind_leader = function(keys, cb, opts)
    keys = normalize_keys(keys)

    for _, seq in ipairs(keys) do
        hl.bind(kstr_with_prefix(seq, g.main_mod), cb, opts)
    end
end

--- Creates bindings from KeyBind table.
--- @param binds KeyBind[]
--- @param leader boolean
M.binds_from_table = function(binds, leader)
    for _, bind in ipairs(binds) do
        if leader then
            M.bind_leader(bind.keys, bind.cb, bind.opts)
        else
            M.bind(bind.keys, bind.cb, bind.opts)
        end
    end
end

--- @type BindUtil
return M
