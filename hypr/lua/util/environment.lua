--- Opts for EnvVar
--- @class EnvVar.Opt
--- @field condition boolean|fun(...): boolean condition for var to be set on

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

--- Checks whether an env should be set based on its condition.
--- @param env EnvVar
--- @return boolean
local function should_set(env)
    local cond = env.opts and env.opts.condition

    if cond == nil then
        return true
    end

    if type(cond) == "boolean" then
        return cond
    end

    if type(cond) == "function" then
        return cond()
    end

    return false
end

--- Sets an environment variable.
--- @param vars EnvVar|EnvVar[]
M.set_vars = function(vars)
    vars = normalize_envs(vars)

    for _, var in ipairs(vars) do
        if should_set(var) then
            hl.env(var.name, var.val)
        end
    end
end

--- @type EnvUtil
return M
