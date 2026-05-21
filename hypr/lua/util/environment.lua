--- Opts for EnvVar
--- @class EnvVar.Opt
--- @field conditional boolean|fun(...): boolean condition for var to be set on

--- Class representing an Env variable.
--- @class EnvVar
--- @field name string
--- @field val string|number
--- @field opts? EnvVar.Opt

--- Utility for configuring Hyprland environment variables.
--- @class EnvUtil
local M = {}

--- Normalizes env vars.
--- @param vars EnvVar|EnvVar[]
--- @return EnvVar[]
local function normalize_envs(vars)
    if vars[1] ~= nil then
        return vars
    end

    return { vars }
end

--- Sets an environment variable.
--- @param vars EnvVar|EnvVar[]
M.set_vars = function(vars)
    vars = normalize_envs(vars)

    for _, var in ipairs(vars) do
        hl.env(var.name, var.val)
    end
end

--- @type EnvUtil
return M
