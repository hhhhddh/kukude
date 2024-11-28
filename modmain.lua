GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

PrefabFiles = {
}

Assets = {
}

local mod_name = 'kukude'
TUNING.CONFIG_LANG_KUKUDE = GetModConfigData('lang_'..mod_name)


modimport('scripts/languages/'..mod_name..'_strings_'..TUNING.CONFIG_LANG_KUKUDE..'.lua')
modimport('scripts/others/'..mod_name..'_recipes.lua')
modimport('scripts/others/'..mod_name..'_component_actions.lua')

