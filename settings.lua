local nextOrder = 0
local function getNextOrder()
    nextOrder = nextOrder + 1
    return string.format("%03d", nextOrder)
end

local activationTriggers = { -- Possible techs where mod activates, or "none".
    "none",
    "logistic-science-pack",
    "chemical-science-pack",
    "space-science-pack",
}
if mods["space-age"] then
    table.insert(activationTriggers, "agricultural-science-pack")
end

local settings = {
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-run-every-n-seconds",
        type = "double-setting",
        setting_type = "startup",
        default_value = 10,
        min_value = 0.1,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-prioritize-spoilable-science",
        type = "bool-setting",
        setting_type = "runtime-global",
        default_value = true,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-prioritize-late-game-science",
        type = "bool-setting",
        setting_type = "runtime-global",
        default_value = false,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-notify-switches",
        type = "bool-setting",
        setting_type = "runtime-global",
        default_value = true,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-show-warnings",
        type = "bool-setting",
        setting_type = "runtime-global",
        default_value = false,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-warn-every-n-seconds",
        type = "double-setting",
        setting_type = "runtime-global",
        default_value = 60,
        min_value = 1,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-early-game-threshold",
        type = "string-setting",
        setting_type = "runtime-global",
        default_value = "chemical-science-pack",
        allowed_values = activationTriggers,
    },
    {
        order = getNextOrder(),
        name = "AutoSwitchTechs-science-available-threshold",
        type = "double-setting",
        setting_type = "runtime-global",
        default_value = 0.5,
        min_value = 0,
        max_value = 1,
    },
}

data:extend(settings)