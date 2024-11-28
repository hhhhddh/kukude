
STRINGS.INFO_KUKUDE = {
    ACTIONS = {
        -- ACTION_EXAMPLE_TOUCH_IN_INV = '测试动作',
    },
    DISH = {

    },
}

local msg = {
    -- ['prefab_id'] = {
    --     name = '测试预制物',
    --     desc = '测试预制物描述',
    --     recipe_desc = '测试预制物配方描述',
    -- }
}

for k,v in pairs(msg) do
    if v.name then
        STRINGS.NAMES[string.upper(k)] = v.name
        if v.desc then
            STRINGS.CHARACTERS.GENERIC.DESCRIBE[string.upper(k)] = v.desc
        end
        if v.recipe_desc then
            STRINGS.RECIPE_DESC[string.upper(k)] = v.recipe_desc
        end
    end
end

