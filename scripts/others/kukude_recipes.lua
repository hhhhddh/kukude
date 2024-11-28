
local function Injectatlas(ingredients,amount)
	local atlas = 'images/inventoryimages/'..ingredients..'.xml'
	return Ingredient(ingredients,amount,atlas)
end
local function Injectproductimg(product)
	local atlas = 'images/inventoryimages/'..product..'.xml'
	return atlas
end


--给MOD物品添加一个分类
-- AddRecipeFilter({
--     name = 'EXAMPLE_TAB',
--     atlas = 'images/exampletab.xml',
--     image = 'exampletab.tex'
-- })
-- STRINGS.UI.CRAFTING_FILTERS.EXAMPLE_TAB = '样本制作分类'

local recipe_all = {
	
	-- {
	-- 	recipe_name = 'choleknife_recipe_1', --食谱ID
	-- 	ingredients = { --配方
	-- 		Injectatlas('pack_gold',1), 
	-- 		Ingredient('rope',2), 
	-- 		Ingredient('log',2),
	-- 	},
	-- 	tech = TECH.SCIENCE_ONE, --所需科技 ,TECH.LOST 表示需要蓝图才能解锁
	-- 	isOriginalItem = true, --是官方物品,不写则为自定义物品
	-- 	isShown = true, --不写或true显示配方, 其他值则不显示
	-- 	config ={ --其他的一些配置,可不写
	-- 		--制作出来的物品,不写则默认制作出来的预制物为食谱ID
	-- 		product = 'choleknife', 
	-- 		--xml路径,不写则默认路径为,'images/inventoryimages/'..product..'.xml' 或 'images/inventoryimages/'..recipe_name..'.xml'
	-- 		atlas = 'images/choleknife.xml',
	-- 		--图片名称,不写则默认名称为 product..'.tex' 或 recipe_name..'.tex'
	-- 		image = 'choleknife.tex',
	-- 		--制作出的物品数量,不写则为1
	-- 		numtogive = 40,
	--		nounlock = true, --不写或false则解锁配方, true则不解锁配方
	-- 	},
	-- 	filters = {'EXAMPLE_TAB'} --将物品添加到这些分类中,要写,不写则默认用提供的TAB
	-- },

	--FAVORITES--收藏
	--CRAFTING_STATION--科技站专属
	--SPECIAL_EVENT--特殊节日
	--MODS--模组物品(所有非科技站解锁的mod物品会自动添加这个标签)
		
	--CHARACTER--人物专属
	--TOOLS--工具
	--LIGHT--光源
	--PROTOTYPERS--科技
	--REFINE--精炼
	--WEAPONS--武器
	--ARMOUR--盔甲
	--CLOTHING--服装
	--RESTORATION--治疗
	--MAGIC--魔法
	--DECOR--装饰

	--STRUCTURES--建筑
	--CONTAINERS--容器
	--COOKING--烹饪
	--GARDENING--食物、种植
	--FISHING--钓鱼
	--SEAFARING--航海
	--RIDING--骑乘
	--WINTER--保暖道具
	--SUMMER--避暑道具
	--RAIN--雨具
	--EVERYTHING--所有
	
------------------------------------------------------------------
--TOOLS-----------------------------------------------------------
------------------------------------------------------------------


------------------------------------------------------------------
--WEAPONS----------------------------------------------------------
------------------------------------------------------------------
	-- {
	-- 	recipe_name = 'mansui',
	-- 	ingredients = {
	-- 		Ingredient('rope',2),
	-- 	},
	-- 	tech = TECH.NONE,
    --     filters = {'WEAPONS'}
	-- },
------------------------------------------------------------------
--ARMOUR-----------------------------------------------------------
------------------------------------------------------------------

----------
--original
----------

	-- {
	-- 	recipe_name = 'plenty_sewing_tape', 
	-- 	isOriginalItem = true,
	-- 	ingredients = {
	-- 		Ingredient('silk',40),
	-- 		Ingredient('rope',40),
	-- 	},
	-- 	tech = TECH.NONE,
	-- 	config = {
	-- 		product = 'sewing_tape',
	-- 		numtogive = 40,
	-- 	},
	-- 	filters = {'CLOTHING'}
	-- },

}

for k,_r in pairs(recipe_all) do
	if _r.isOriginalItem == nil then
		if _r.config == nil then
			_r.config = {}
		end
		if _r.config.atlas == nil then
			if _r.config.product ~= nil then
				_r.config.atlas = Injectproductimg(_r.config.product)
				_r.config.image = _r.config.product..'.tex'
			else
				_r.config.atlas = Injectproductimg(_r.recipe_name)
				_r.config.image = _r.recipe_name..'.tex'
			end
		end
	end
	if _r.filters == nil then
		_r.filters = {'EXAMPLE_TAB'}
	end
	if _r.config == nil then
		_r.config = {}
	end
	if _r.isShown == nil or _r.isShown == true then
		AddRecipe2(_r.recipe_name, _r.ingredients, _r.tech, _r.config, _r.filters)
	end
end










