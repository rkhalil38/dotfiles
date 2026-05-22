local g = require("lua.globals")

--- @alias KeySequence string|string[]|string[][]

--- @class BindOpts : HL.BindOptions
--- @field leader? boolean

--- @class KeyBind
--- @field keys KeySequence
--- @field cb fun(...)|HL.Dispatcher
--- @field opts? BindOpts

--- Utilities for creating binds in Hyprland.
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
--- @param cb fun(...)|HL.Dispatcher
--- @param opts? BindOpts
M.bind = function(keys, cb, opts)
    keys = normalize_keys(keys)

    for _, seq in ipairs(keys) do
        if opts and opts.leader then
            hl.bind(kstr_with_prefix(seq, g.leader), cb, opts)
        else
            hl.bind(kstr(seq), cb, opts)
        end
    end
end

--- Creates bindings from KeyBind table.
--- @param binds KeyBind[]
M.binds_from_table = function(binds)
    for _, bind in ipairs(binds) do
        M.bind(bind.keys, bind.cb, bind.opts)
    end
end

--- @type BindUtil
return M
