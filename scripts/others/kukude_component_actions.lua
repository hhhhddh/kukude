
-- -----actions-----自定义动作
-- {
-- 	id,--动作ID
-- 	str,--动作显示名字
-- 	fn,--动作执行函数 act.doer(做动作的人), act.target(动作目标), act.invoject(inst), act.pos(动作位置) ...
-- 	actiondata,--其他动作数据，诸如strfn、mindistance等，可参考actions.lua
-- 	state,--关联SGstate,可以是字符串或者函数
-- 	canqueuer,--兼容排队论 allclick为默认，rightclick为右键动作
-- }
-- -----component_actions-----动作和组件绑定
-- {
-- 	type,--动作类型
-- 		*SCENE--点击物品栏物品或世界上的物品时执行,比如采集
-- 		*USEITEM--拿起某物品放到另一个物品上点击后执行，比如添加燃料
-- 		*POINT--装备某手持武器或鼠标拎起某一物品时对地面执行，比如植物人种田
-- 		*EQUIPPED--装备某物品时激活，比如装备火把点火
-- 		*INVENTORY--物品栏右键执行，比如吃东西
-- 	component,--绑定的组件
-- 	tests,--尝试显示动作，可写多个绑定在同一个组件上的动作及尝试函数
-- }
-------------------------------------------------
-- SCENE = --args: inst, doer, actions, right					--场景
-- USEITEM = --args: inst, doer, target, actions, right		--使用项目
-- POINT = --args: inst, doer, pos, actions, right				--地面
-- EQUIPPED = --args: inst, doer, target, actions, right		--装备
-- INVENTORY = --args: inst, doer, actions, right				--库存
-- ISVALID = --args: inst, action, right						--是有效的


local actions = {
	-- {
	-- 	id = 'ACTION_EXAMPLE_TOUCH_IN_INV',
	-- 	str = '摸一下仓库中的金子',
	-- 	fn = function(act)
	-- 		if act.doer ~= nil and act.invobject ~= nil then
    --             TouchFn(act.invobject)
    --             return true
    --         else
	-- 			return false
	-- 		end
	-- 	end,
	-- 	state = 'give',
	-- 	actiondata = {
	-- 		priority = 99,
	-- 		mount_valid = true,
	-- 	},
	-- },
	-- {
	-- 	id = 'ACTION_EXAMPLE_TOUCH_ON_GROUND',
	-- 	str = '摸一下地上的金子',
	-- 	fn = function(act)
	-- 		if act.doer ~= nil and act.target ~= nil then
    --             TouchFn(act.target)
    --             return true
    --         else
	-- 			return false
	-- 		end
	-- 	end,
	-- 	state = 'give',
	-- 	actiondata = {
	-- 		priority = 99,
	-- 		mount_valid = true,
	-- 	},
	-- },
}

local component_actions = {
	-- {
	-- 	type = 'INVENTORY',
	-- 	component = 'inventoryitem',
	-- 	tests = {
	-- 		{
	-- 			action = 'ACTION_EXAMPLE_TOUCH_IN_INV',
	-- 			testfn = function(inst,doer,actions,right)
	-- 				return doer:HasTag('player') and inst.prefab == 'goldnugget' 
	-- 			end,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	type = 'SCENE',
	-- 	component = 'inventoryitem',
	-- 	tests = {
	-- 		{
	-- 			action = 'ACTION_EXAMPLE_TOUCH_ON_GROUND',
	-- 			testfn = function(inst,doer,actions,right)
	-- 				return right and doer:HasTag('player') and inst.prefab == 'goldnugget'
	-- 			end,
	-- 		},
	-- 	},
	-- },
}


-- 

for _,act in pairs(actions) do
    local addaction = AddAction(act.id,act.str,act.fn)
    if act.actiondata then
        for k,v in pairs(act.actiondata) do
            addaction[k] = v
        end
    end

    AddStategraphActionHandler('wilson',GLOBAL.ActionHandler(addaction, act.state))
    AddStategraphActionHandler('wilson_client',GLOBAL.ActionHandler(addaction,act.state))
end

for _,v in pairs(component_actions) do
    local testfn = function(...)
        local actions = GLOBAL.select(v.type=='POINT' and -3 or -2,...)
        for _,data in pairs(v.tests) do
            if data and data.testfn and data.testfn(...) then
                data.action = string.upper(data.action)
                table.insert(actions,GLOBAL.ACTIONS[data.action])
            end
        end
    end
    AddComponentAction(v.type, v.component, testfn)
end


