---簡體化:thanks to 南十字星
local M = MerInspect
M.loc = BLocal("MerInspect");

if GetLocale() == "zhCN" then
	M.loc = {       
        Strength = "力量：",
        Agility  = "敏捷：",
        Stamina = "耐力：",
        Intellect = "智力：",
        Spirit = "精神：",
        Armor = "护甲：",
        Resilience = "韧性：",       
        defense = "防御技能：",
        Dodge = "躲闪几率：",
        Parry = "招架几率：",
        Block = "格挡几率：",       
        Resistance_Nature = "自然抗性：",
        Resistance_Fire = "火焰抗性：",
        Resistance_Arcane = "奥术抗性：",
        Resistance_Shadow = "暗影抗性：",
        Resistance_Frost = "冰霜抗性：",
        Resistance_Holy = "神圣抗性：",
        Resistance_Coma = "昏迷抵抗：",       
        Damage_Nature = "自然伤害：",
        Damage_Fire = "火焰伤害：",
        Damage_Arcane = "奥术伤害：",
        Damage_Shadow = "暗影伤害：",
        Damage_Frost = "冰霜伤害：",
        Damage_Holy = "神圣伤害：",
        HitRating = "物理命中：",       
        AttackDamage = "近战伤害：",
        AttackSpeed = "近战速度：",
        AttackPower = "近战强度：",
        AttackCrit = "近战爆击：",
        HasteMelee = "加速等级：",
        RangedAttackDamage = "远程伤害：",
        RangedAttackSpeed = "远程速度：",
        RangedAttackPower = "远程强度：",
        RangedAttackCrit = "远程爆击：",
        HasteRanged = "远程加速等级：",
        HasteSpell = "法术加速：",
		SpellPower = "法术强度：",
        Healing = "治疗加成：",
        SpellHitRating = "法术命中：",
        SpellCrit = "法术爆击：",
        SpellStrike = "法术穿透：",
        ManaRestore = "战斗回蓝：",
        HealthRestore = "生命力回复：",       
        RunSpeed = "移动速度：",
        MountSpeed = "坐骑速度：",

		resistance = "抗性：",
		talent = "天赋：",
		base = "基本属性：",
		added = "进阶属性：",
		hpmp = "生命",
		set = "套装：",
		Attribute = "属性",
		Resistance = "抗性",
		Attack = "近战&远程",
		Spell = "法术",
		Health = "生命&法力",
		ReduceResistance = "降低抗性：",
		HP = "生命值：",
		Mana = "法力值：",
		ArmorReduce = "物理免伤：",
		["Repair Cost"] = "维修费用",
	};
elseif (GetLocale() == "zhTW") then
	M.loc = {	
		Strength = "力量：",
		Agility	= "敏捷：",
		Stamina = "耐力：",
		Intellect = "智力：",
		Spirit = "精神：",
		Armor = "護甲：",
		Resilience = "韌性：",
		defense = "防技：",
		Dodge = "閃躲幾率：",
		Parry = "招架幾率：",
		Block = "格擋幾率：",
		Resistance_Nature = "自然抗性：",
		Resistance_Fire = "火焰抗性：",
		Resistance_Arcane = "祕法抗性：",
		Resistance_Shadow = "暗影抗性：",
		Resistance_Frost = "冰霜抗性：",
		Resistance_Holy = "神聖抗性：",
		Resistance_Coma = "昏迷抗性：",	
		Damage_Nature = "自然傷害：",
		Damage_Fire = "火焰傷害：",
		Damage_Arcane = "祕法傷害：",
		Damage_Shadow = "暗影傷害：",
		Damage_Frost = "冰霜傷害：",
		Damage_Holy = "神聖傷害：",
		HitRating = "物理命中：",	
		AttackDamage = "近戰傷害：",
		AttackSpeed = "近戰速度：",
		AttackPower = "近戰強度：",
		AttackCrit = "近戰致命：",
		HasteMelee = "加速等級：",
		RangedAttackDamage = "遠程傷害：",
		RangedAttackSpeed = "遠程速度：",
		RangedAttackPower = "遠程強度：",
		RangedAttackCrit = "遠程致命：",
		HasteRanged = "遠程加速等級：",
		HasteSpell = "法術加速：",
		SpellPower = "法術強度：",
		Healing = "治療加成：",
		SpellHitRating = "法術命中：",
		SpellCrit = "法術致命：",
		SpellStrike = "法術穿透：",
		ManaRestore = "戰鬥回魔：",
		HealthRestore = "生命力回復：",	
		RunSpeed = "移動速度：",
		MountSpeed = "坐騎速度：",
		
		resistance = "抗性：",
		talent = "天賦：",
		base = "基本屬性：",
		added = "進階屬性：",
		hpmp = "生命",
		set = "套裝：",
		Attribute = "屬性",
		Resistance = "抗性",
		Attack = "近戰&遠程",
		Spell = "法術";
		Health = "生命&法力",
		ReduceResistance = "降低抗性：",
		HP = "生命值：",
		Mana = "法力值：",
		ArmorReduce = "物理免傷：",
		["Repair Cost"] = "維修費用",	
	};
end

M.patterns = {
	front = { zhTW = ".+法術強度提高(%d+)點(.*)", zhCN = ".+法术强度提高(%d+)点(.*)",},
	ignore = {
		{ zhTW = "^使用", zhCN = "^使用",},
		{ zhTW = "有一定幾率", zhCN = "有一定几率",},
		{ zhTW = "^擊中時可能", zhCN = "^击中时可能",},
		{ zhTW = "寵物的攻擊強度", zhCN = "宠物的攻击强度",},
	},
	loop = {
		{ zhTW = "(%+%d+.-)和(.+)", zhCN = "(%+%d+.-)，(%+%d+.+)",},
		{ zhTW = "(初級速度)和(.+)", zhCN = "(初级速度)和(.+)",},
		{ zhTW = "^(.-)及(.+)", zhCN = "^(.-)及(.+)",},
		{ zhTW = "^(.-)/(.+)", zhCN = "^(.-)/(.+)",},
	},
	general = {
		{ effect = "Armor", zhTW = "護甲$", zhCN = "护甲",}, --護甲片
		{ effect = "Stamina", zhTW = "耐力", zhCN = "耐力",},
		{ effect = "Agility", zhTW = "敏捷", zhCN = "敏捷",},
		{ effect = "Strength", zhTW = "力量", zhCN = "力量",},
		{ effect = "Intellect", zhTW = "智力", zhCN = "智力",},
		{ effect = "Spirit", zhTW = "精神", zhCN = "精神",},
		{ effect = "hp", zhTW = "生命力$", zhCN = "生命值$",}, --附魔
		{ effect = "mp", zhTW = "法力$", zhCN = "法力值$",}, --附魔
		{ effect = "Resilience", zhTW = "韌性等級", zhCN = "韧性等级",},		
		{ effect = "Stamina|Agility|Strength|Intellect|Spirit", zhTW = "所有屬性", zhCN = "所有属性",}, --附魔
		{ effect = "ManaRestore", zhTW = "法力恢復", zhCN = "法力恢复",}, --zg
		{ effect = "ManaRestore", zhTW = "法力回復", zhCN = "法力回复",}, --cwow
		
		{ effect = "Resistance_Frost", zhTW = "冰霜抗性", zhCN = "冰霜抗性",},
		{ effect = "Resistance_Shadow", zhTW = "暗影抗性", zhCN = "暗影抗性",},
		{ effect = "Resistance_Arcane", zhTW = "祕法抗性", zhCN = "奥术抗性",},
		{ effect = "Resistance_Fire", zhTW = "火焰抗性", zhCN = "火焰抗性",},
		{ effect = "Resistance_Nature", zhTW = "自然抗性", zhCN = "自然抗性",},
		{ effect = "Resistance_Holy", zhTW = "神聖抗性", zhCN = "神圣抗性",},
		{ effect = "Resistance_Frost|Resistance_Shadow|Resistance_Arcane|Resistance_Fire|Resistance_Nature|Resistance_Holy", zhTW = "所有抗性", zhCN = "所有抗性",}, --附魔
		
		{ effect = "Damage_Frost", zhTW = "冰霜法術傷害", zhCN = "冰霜法术伤害",},
		{ effect = "Damage_Shadow", zhTW = "暗影法術傷害", zhCN = "暗影法术伤害",},
		{ effect = "Damage_Arcane", zhTW = "祕法法術傷害", zhCN = "奥术法术伤害",},
		{ effect = "Damage_Fire", zhTW = "火焰法術傷害", zhCN = "火焰法术伤害",},
		{ effect = "Damage_Nature", zhTW = "自然法術傷害", zhCN = "自然法术伤害",},
		{ effect = "Damage_Holy", zhTW = "神聖法術傷害", zhCN = "神圣法术伤害",},
		{ effect = "Damage_Shadow", zhTW = "陰影法術傷害", zhCN = "阴影法术伤害",}, --cwow		
		--魔杖
		{ effect = "Damage_Frost", zhTW = "冰霜傷害", zhCN = "冰霜伤害",},
		{ effect = "Damage_Shadow", zhTW = "暗影傷害", zhCN = "暗影伤害",},
		{ effect = "Damage_Arcane", zhTW = "祕法傷害", zhCN = "奥术伤害",},
		{ effect = "Damage_Fire", zhTW = "火焰傷害", zhCN = "火焰伤害",},
		{ effect = "Damage_Nature", zhTW = "自然傷害", zhCN = "自然伤害",},
		{ effect = "Damage_Holy", zhTW = "神聖傷害", zhCN = "神圣伤害",},
		
		{ effect = "SpellPower", zhTW = "法術強度", zhCN = "法术强度",}, --changed in 3.1
		{ effect = "SpellHitRating", zhTW = "命中等級", zhCN = "命中等级",},
		{ effect = "SpellCrit", zhTW = "致命一擊等級", zhCN = "爆击等级",},
		
		{ effect = "SpellStrike", zhTW = "法術穿透力", zhCN = "法术穿透",},
		{ effect = "SpellHitRating", zhTW = "法術命中等級", zhCN = "法术命中等级",},
		{ effect = "SpellCrit", zhTW = "法術致命一擊等級", zhCN = "法术爆击等级",},
		
		{ effect = "Healing", zhTW = "法術治療", zhCN = "法术治疗",}, --cwow
		{ effect = "Healing", zhTW = "治療法術", zhCN = "治疗法术",},
		{ effect = "Healing", zhTW = "治療", zhCN = "治疗",},
		
		{ effect = "Dodge", zhTW = "閃躲等級", zhCN = "躲闪等级",},
		{ effect = "Parry", zhTW = "招架等級", zhCN = "招架等级",},
		{ effect = "defense", zhTW = "防禦等級", zhCN = "防御等级",},
		{ effect = "HitRating", zhTW = "命中等級", zhCN = "命中等级",},
		{ effect = "RangedAttackPower", zhTW = "遠程攻擊強度", zhCN = "远程攻击强度",},		
		{ effect = "AttackCrit|RangedAttackCrit", zhTW = "致命一擊等級", zhCN = "爆击等级",},		
		{ effect = "AttackPower|RangedAttackPower", zhTW = "攻擊強度", zhCN = "攻击强度",},
		{ effect = "Block", zhTW = "格擋等級", zhCN = "格挡等级",},
		--{ effect = "Block", zhTW = "格擋值", zhCN = "格挡值",},
	},
	extra = {
		--抵抗恐懼效果的機率提高5%		
		{ effect = "Armor", zhTW = "(%d+)點護甲$", zhCN = "(%d+)点护甲$",},
		--{ effect = "Block", zhTW = "(%d+)格擋$", zhCN = "(%d+)格挡$",},
		
		{ effect = "ManaRestore", zhTW = "每5秒恢復(%d+)點法力", zhCN = "每5秒恢复(%d+)点法力",},
		{ effect = "ManaRestore", zhTW = "每5秒法力回复%+(%d+)", zhCN = "每5秒法力回复%+(%d+)",}, --cwow寶石
		{ effect = "Resilience", zhTW = "韌性等級提高(%d+)", zhCN = "韧性等级提高(%d+)",},
		{ effect = "SpellHitRating", zhTW = "提高命中等級(%d+)", zhCN = "命中等级提高(%d+)",},
		{ effect = "HasteSpell", zhTW = "提高加速等級(%d+)", zhCN = "急速等级提高(%d+)",},
		{ effect = "SpellCrit", zhTW = "提高致命一擊等級(%d+)", zhCN = "爆击等级提高(%d+)",},
		{ effect = "SpellStrike", zhTW = "法術穿透力提高(%d+)", zhCN = "法术穿透提高(%d+)",},		
		{ effect = "SpellDamage|Healing", zhTW = "所有法術和魔法效果所造成的傷害和治療效果提高最多(%d+)", zhCN = "所有法术和魔法效果所造成的伤害和治疗效果，最多(%d+)", },
		{ effect = "SpellDamage|Healing", zhTW = "所有法術和魔法效果所造成的傷害和治療效果提高最多(%d+)", zhCN = "使法术和魔法效果的治疗和伤害提高最多(%d+)", },
		{ effect = "Healing", extra = 0.33, zhTW = "法術和魔法效果所造成的治療效果提高最多(%d+)", zhCN = "使法术治疗提高最多(%d+)", },
		{ effect = "Damage_Frost", zhTW = "冰霜法術和效果所造成的傷害提高最多(%d+)", zhCN = "冰霜法术和效果所造成的伤害，最多(%d+)",},
		{ effect = "Damage_Shadow", zhTW = "暗影法術和效果所造成的傷害提高最多(%d+)", zhCN = "暗影法术和效果所造成的伤害，最多(%d+)",},
		{ effect = "Damage_Arcane", zhTW = "祕法法術和效果所造成的傷害提高最多(%d+)", zhCN = "奥术法术和效果所造成的伤害，最多(%d+)",},
		{ effect = "Damage_Fire", zhTW = "火焰法術和效果所造成的傷害提高最多(%d+)", zhCN = "火焰法术和效果所造成的伤害，最多(%d+)",},
		{ effect = "Damage_Nature", zhTW = "自然法術和效果所造成的傷害提高最多(%d+)", zhCN = "自然法术和效果所造成的伤害，最多(%d+)",},
		{ effect = "Damage_Holy", zhTW = "神聖法術和效果所造成的傷害提高最多(%d+)", zhCN = "神圣法术和效果所造成的伤害，最多(%d+)",},
		
		{ effect = "HasteMelee", zhTW = "提高加速等級(%d+)", zhCN = "急速等级提高(%d+)",},
		{ effect = "RangedAttackPower", zhTW = "提高遠程攻擊強度(%d+)", zhCN = "远程攻击强度提高(%d+)",},		
		{ effect = "AttackCrit|RangedAttackCrit", zhTW = "提高致命一擊等級(%d+)", zhCN = "爆击等级提高(%d+)",},		
		{ effect = "AttackPower|RangedAttackPower", zhTW = "提高攻擊強度(%d+)", zhCN = "攻击强度提高(%d+)",},
		{ effect = "HitRating", zhTW = "提高命中等級(%d+)", zhCN = "命中等级提高(%d+)",},
		{ effect = "Parry", zhTW = "招架等級提高(%d+)", zhCN = "招架等级提高(%d+)",},
		{ effect = "defense", zhTW = "提高防禦等級(%d+)", zhCN = "防御等级提高(%d+)",},
		{ effect = "Dodge", zhTW = "閃躲等級提高(%d+)", zhCN = "躲闪等级提高(%d+)",},
		--{ effect = "Block", zhTW = "盾牌的格擋值提高(%d+)", zhCN = "盾牌格挡值提高(%d+)",},
		{ effect = "Block", zhTW = "格擋等級提高(%d+)", zhCN = "格挡等级提高(%d+)",},
		{ effect = "Block", zhTW = "盾牌格擋等級(%d+)", zhCN = "盾牌格挡等级(%d+)",},
		{ effect = "ReduceResistance", zhTW = "使你法術目標的魔法抗性降低(%d+)點。", zhCN = "使你的法术目标的魔法抗性降低(%d+)点。" },
		-- twow 60前的物品
		{ effect = "SpellHitRating", zhTW = "法術命中等級提高(%d+)", zhCN = "提高法术命中等级(%d+)",},
		{ effect = "SpellCrit", zhTW = "法術致命一擊等級提高(%d+)", zhCN = "提高法术爆击等级(%d+)",},
		{ effect = "RangedAttackPower", zhTW = "遠程攻擊強度提高(%d+)", zhCN = "提高远程攻击强度(%d+)",},		
		{ effect = "AttackCrit|RangedAttackCrit", zhTW = "致命一擊等級提高(%d+)", zhCN = "提高爆击等级(%d+)",},		
		{ effect = "AttackPower|RangedAttackPower", zhTW = "攻擊強度提高(%d+)", zhCN = "提高攻击强度(%d+)",},
		{ effect = "HitRating", zhTW = "命中等級提高(%d+)", zhCN = "提高命中等级(%d+)",},
		{ effect = "Parry", zhTW = "提高招架等級(%d+)", zhCN = "提高招架等级(%d+)",},
		{ effect = "defense", zhTW = "防禦等級提高(%d+)", zhCN = "提高防御等级(%d+)",},
		{ effect = "Dodge", zhTW = "提高閃躲等級(%d+)", zhCN = "提高躲闪等级(%d+)",},
	},
	special = {
		{ effect = "Damage_Shadow|Damage_Frost", value = 54, zhTW = "靈魂冰霜$", zhCN = "灵魂冰霜$",},
		{ effect = "Damage_Fire|Damage_Arcane", value = 50, zhTW = "烈日火焰$", zhCN = "烈日火焰$",},
		{ effect = "Resistance_Coma", value = 5, zhTW = "昏迷抗性", zhCN = "昏迷抗性",},
		{ effect = "ManaRestore|HealthRestore", value = 4, zhTW = "活力$", zhCN = "活力$",},
		{ effect = "AttackPower|RangedAttackPower", value = 70, zhTW = "野性$", zhCN = "野蛮$",},		
		{ effect = "MountSpeed", value = 4, zhTW = "秘銀馬刺", zhCN = "秘银马刺",},
		{ effect = "MountSpeed", value = 2, zhTW = "坐騎移動速度略微提升", zhCN = "坐骑移动速度略微提升",},
		{ effect = "MountSpeed", value = 10, zhTW = "坐騎速度提高10%%", zhCN = "坐骑速度提高10%%",},
		{ effect = "MountSpeed", value = 3, zhTW = "坐騎速度提高3%%", zhCN = "坐骑速度提高3%%",}, --棍子上的胡蘿蔔
		{ effect = "RunSpeed", value = 8, zhTW = "略微提高移動速度", zhCN = "略微提高移动速度",},
		{ effect = "RunSpeed", value = 8, zhTW = "略微提高奔跑速度", zhCN = "略微提高奔跑速度",},
		{ effect = "RunSpeed", value = 8, zhTW = "移動速度略微提升", zhCN = "移动速度略微提升",},
		{ effect = "RunSpeed", value = 8, zhTW = "初級速度", zhCN = "初级速度",},		
		{ effect = "ManaRestore", value = 14, zhTW = "超強法力之油", zhCN = "超强法力之油",},
		{ effect = "ManaRestore", value = 12, gonext = true, zhTW = "卓越法力之油", zhCN = "卓越法力之油",},
		{ effect = "Healing", value = 24, gonext = true, zhTW = "卓越法力之油", zhCN = "卓越法力之油",},
		--{ effect = "", value = 2, zhTW = "威脅值$", zhCN = "威胁值$",},
		--{ effect = "", value = 1, zhTW = "法術反射$", zhCN = "法术反射$",},		
	},
	percent = {
		{ effect = "SpellDamage", anchor = "Intellect", zhTW = "法術所造成的傷害提高相當於你總智力的(%d+)%%", zhCN = "法术伤害加成提高,数值最多相当于你的智力总值的(%d+)%%",},
		--{ effect = "ManaRestore2", zhTW = "施法時仍可保留(%d+)%%的法力", zhCN = "施法时仍可保留(%d+)%%的法力值恢复",},
	},
	talent = {
		--[[
			base -- 只与基础属性相关
			type -- 1 加, 2 减
			direct -- 直接累计
			logic -- 需要换算, 主要是percent换算成rating
			buff -- 针对buff的增长比例
			gonext -- 一个天赋加2种以上的属性时.
			anchor -- 依赖属性
		]]
		HUNTER = {
			{ effect = "hp", step = "0.02|0.04|0.06|0.08|0.10", base = true, zhTW = "生存專家", zhCN = "生存专家",},
			{ effect = "hp", step = "0.01|0.02|0.03|0.04|0.05", base = true, zhTW = "耐久訓練", zhCN = "耐久训练",},
			{ effect = "Armor", step = "0.04|0.07|0.10", zhTW = "厚皮", zhCN = "厚皮",},
			{ effect = "Dodge", step = "0.01|0.02|0.03", direct = true, logic = "Dodge", zhTW = "靈敏反射", zhCN = "猎豹反射",},
			{ effect = "Agility", step = "0.03|0.06|0.09|0.12|0.15", zhTW = "閃電反射", zhCN = "闪电反射",},
			{ effect = "Agility", step = "0.01|0.02", gonext = true, zhTW = "作戰經驗", zhCN = "战斗经验",},
			{ effect = "Intellect", step = "0.03|0.06", zhTW = "作戰經驗", zhCN = "战斗经验",},
			{ effect = "HitRating", step = "0.01|0.02|0.03", direct = true, zhTW = "稳固", zhCN = "稳固",},
			{ effect = "AttackCrit", step = "0.01|0.02|0.03", direct = true, logic = "AttackCrit", zhTW = "殺戮本能", zhCN = "杀戮本能",},
			{ effect = "RangedAttackCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "RangedAttackCrit", zhTW = "奪命射擊", zhCN = "夺命射击",},
			{ effect = "AttackPower", step = "0.02|0.04", zhTW = "求生本能", zhCN = "生存本能",},
			{ effect = "RangedAttackPower", step = "0.15|0.30|0.45", anchor = "Intellect", zhTW = "仔細瞄準", zhCN = "精确瞄准",},
			{ effect = "RangedAttackPower", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "狙擊大師", zhCN = "狙击高手",},
			{ effect = "Parry", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Parry", zhTW = "偏斜", zhCN = "偏斜",},
		},
		WARLOCK = {
			{ effect = "hp", step = "0.01|0.02|0.03", zhTW = "惡魔耐力", zhCN = "恶魔耐力",},
			{ effect = "Stamina", step = "0.03|0.06|0.09|0.12|0.15", gonext = true, zhTW = "惡魔之擁", zhCN = "恶魔之拥",},
			{ effect = "Spirit", step = "0.01|0.02|0.03|0.04|0.05", zhTW = "惡魔之擁", zhCN = "恶魔之拥", type = 2},
			{ effect = "Damage_Shadow", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "精通暗影", zhCN = "暗影掌握",},
			{ effect = "Damage_Shadow", step = "0.02|0.04|0.06|0.08|0.10", anchor = "SpellDamage", zhTW = "精通暗影", zhCN = "暗影掌握",},
			{ effect = "Damage_Shadow", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "餘燼風暴", zhCN = "灰烬风暴",},
			{ effect = "Damage_Shadow", step = "0.02|0.04|0.06|0.08|0.10", anchor = "SpellDamage", zhTW = "餘燼風暴", zhCN = "灰烬风暴",},
			{ effect = "SpellCrit", step = "0.01|0.02|0.03", direct = "true", logic = "SpellCrit", zhTW = "反衝", zhCN = "反冲",},
			{ effect = "SpellCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = "true", logic = "SpellCrit", zhTW = "惡魔策略", zhCN = "恶魔战术",},
		},
		PRIEST = {
			{ effect = "Armor", step = "0.10|0.20|0.30", buff = true, zhTW = "強化心靈之火", zhCN = "强化心灵之火",},
			{ effect = "ManaRestore2", step = "0.10|0.20|0.30", direct = true, zhTW = "冥想", zhCN = "冥想",},
			{ effect = "Spirit", step = "0.05", zhTW = "救贖之靈", zhCN = "救赎之魂",},
			{ effect = "SpellDamage", step = "0.01|0.02|0.03|0.04|0.05", zhTW = "意志之力", zhCN = "意志之力",},
			{ effect = "Stamina|Intellect|Spirit", step = "0.01|0.02|0.03|0.04|0.05", zhTW = "啟蒙", zhCN = "启迪",},
			{ effect = "SpellDamage|Healing", anchor = "Spirit", step = "0.05|0.10|0.15|0.20|0.25", zhTW = "精神導引", zhCN = "精神导引",},
			{ effect = "Healing", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "精神治療", zhCN = "精神治疗",},
			{ effect = "Damage_Shadow", step = "0.02|0.04|0.06|0.08|0.10", gonext = true, zhTW = "黑暗", zhCN = "黑暗",},
			{ effect = "Damage_Shadow", anchor = "SpellDamage", step = "0.02|0.04|0.06|0.08|0.10",zhTW = "黑暗", zhCN = "黑暗",},
		},
		PALADIN = {
			{ effect = "Armor", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "堅韌", zhCN = "坚韧",},
			{ effect = "Strength", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "神聖之力", zhCN = "神圣之力",},
			{ effect = "Intellect", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "神聖智慧", zhCN = "神圣智慧",},
			{ effect = "defense", step = "4|8|12|16|20", direct = true, zhTW = "預知", zhCN = "预知",},
			{ effect = "Stamina", step = "0.03|0.06", zhTW = "神聖職責", zhCN = "神圣使命",},
			{ effect = "Stamina", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "戰鬥熟練", zhCN = "战斗精准",},
			{ effect = "SpellHitRating", step = "0.01|0.02|0.03", direct = true, logic = "SpellHitRating", gonext = true, zhTW = "精準", zhCN = "精确",},
			{ effect = "HitRating", step = "0.01|0.02|0.03", direct = true, logic = "HitRating", gonext = true, zhTW = "精準", zhCN = "精确",},
			{ effect = "Parry", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Parry", zhTW = "偏斜", zhCN = "偏斜",},
			{ effect = "AttackCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "AttackCrit", zhTW = "定罪", zhCN = "定罪",},
		},
		MAGE = {
			{ effect = "Resistance_Frost|Resistance_Shadow|Resistance_Arcane|Resistance_Fire|Resistance_Nature|Resistance_Holy", step = "2|4|6|8|10", direct = true, zhTW = "魔法吸收", zhCN = "魔法吸收",},
			{ effect = "Armor", step = "0.50", anchor = "Intellect", zhTW = "秘法轉化", zhCN = "奥术坚韧",},
			{ effect = "ManaRestore2", step = "0.10|0.20|0.30", direct = true, zhTW = "秘法冥想", zhCN = "奥术冥想",},
			{ effect = "Intellect", step = "0.03|0.06|0.09|0.12|0.15", base = true, zhTW = "秘法心智", zhCN = "奥术心智",},
			{ effect = "SpellStrike", step = "5|10", direct = true, zhTW = "秘法精妙", zhCN = "奥术精妙",}, --
			{ effect = "SpellCrit", step = "0.01|0.02|0.03", direct = true, logic = "SpellCrit", gonext = true, zhTW = "秘法增效", zhCN = "奥术增效", },
			{ effect = "Damage_Fire", step = "0.02|0.04|0.06|0.08|0.10", gonext = true, zhTW = "火焰強化", zhCN = "火焰强化",},
			{ effect = "Damage_Fire", step = "0.02|0.04|0.06|0.08|0.10", anchor = "SpellDamage", zhTW = "火焰強化", zhCN = "火焰强化",},
			{ effect = "Damage_Frost", step = "0.01|0.02|0.03|0.04|0.05", gonext = true, zhTW = "極地之風", zhCN = "极寒之风",},
			{ effect = "Damage_Frost", step = "0.01|0.02|0.03|0.04|0.05", anchor = "SpellDamage", zhTW = "極地之風", zhCN = "极寒之风",},
			{ effect = "Damage_Frost", step = "0.02|0.04|0.06", gonext = true, zhTW = "刺股寒冰", zhCN = "刺股寒冰",},
			{ effect = "Damage_Frost", step = "0.02|0.04|0.06", anchor = "SpellDamage", zhTW = "刺股寒冰", zhCN = "刺股寒冰",},
		},
		ROGUE = {
			{ effect = "AttackCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "AttackCrit", zhTW = "惡意", zhCN = "恶意",},
			{ effect = "AttackCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "AttackCrit", zhTW = "匕首專精", zhCN = "匕首专精",},
			{ effect = "Dodge", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Dodge", zhTW = "閃電反擊", zhCN = "闪电反射",},
			{ effect = "Parry", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Parry", zhTW = "偏斜", zhCN = "偏斜",},
			{ effect = "HitRating", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "HitRating", zhTW = "精準", zhCN = "精确",},
			{ effect = "HitRating", step = "5|10", direct = true, zhTW = "武器熟練", zhCN = "武器专家",},
			{ effect = "AttackPower", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "致命傷害", zhCN = "致命",},
			{ effect = "Agility", step = "0.03|0.06|0.09|0.12|0.15", zhTW = "邪惡呼喚", zhCN = "邪恶召唤",},
			{ effect = "Stamina", step = "0.02|0.04", gonext = true, zhTW = "活力", zhCN = "活力",},
			{ effect = "Agility", step = "0.01|0.02",  zhTW = "活力", zhCN = "活力",},
		},
		DRUID = {
			{ effect = "Healing", step = "0.25|0.50", anchor = "Strength", zhTW = "培育天性", zhCN = "治愈本能",},
			{ effect = "Stamina|Agility|Strength|Intellect|Spirit", step = "0.01|0.02|0.03", zhTW = "適者生命", zhCN = "适者生存",},
			{ effect = "Spirit", step = "0.05|0.10|0.15", zhTW = "活化精神", zhCN = "生命之魂",},
			{ effect = "Intellect", step = "0.04|0.08|0.12|0.16|0.20", zhTW = "野性之心", zhCN = "野性之心",},
			{ effect = "SpellHitRating", step = "0.02|0.04", direct = true, logic = "SpellHitRating", zhTW = "力量平衡", zhCN = "能量平衡",},
			{ effect = "Healing", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "自然賜福", zhCN = "自然赐福",},
			{ effect = "ManaRestore", step = "0.04|0.07|0.10", anchor = "Intellect", zhTW = "夢境", zhCN = "梦境",},
			{ effect = "Armor", step = "0.04|0.07|0.10", zhTW = "厚皮", zhCN = "厚皮",},
		},
		SHAMAN = {
			{ effect = "Healing", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "凈化", zhCN = "净化",},
			{ effect = "Armor", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "堅韌", zhCN = "坚韧",},
			{ effect = "Dodge", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Dodge", zhTW = "預知", zhCN = "预知",},
			{ effect = "Block", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Block", zhTW = "盾牌專精", zhCN = "盾牌专精",},
		},
		WARRIOR = {
			{ effect = "defense", step = "0.04|0.08|0.12|0.16|0.20", direct = true, logic = "defense", zhTW = "預知", zhCN = "预知",},
			{ effect = "Stamina", step = "0.01|0.02|0.03|0.04|0.05", gonext = true, zhTW = "活力", zhCN = "活力",},
			{ effect = "Strength", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "活力", zhCN = "活力",},
			{ effect = "Parry", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Parry", zhTW = "偏斜", zhCN = "偏斜",},
			{ effect = "Block", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "Block", zhTW = "盾牌專精", zhCN = "盾牌专精",},
			{ effect = "AttackCrit", step = "0.01|0.02|0.03|0.04|0.05", direct = true, logic = "AttackCrit", zhTW = "殘忍", zhCN = "残忍",},
			{ effect = "HitRating", step = "0.01|0.02|0.03", direct = true, logic = "HitRating", zhTW = "精準", zhCN = "精确",},
			{ effect = "Armor", step = "0.02|0.04|0.06|0.08|0.10", zhTW = "堅韌", zhCN = "坚韧",},
		},
	},
	buffs = {
		zhTW = {
			{ from = "並", to = "，" },
			{ from = "點和", to = "點，" },
		},
		zhCN = {
			{ from = "并", to = "，" },
			{ from = "点和", to = "点，" },
		},		
		{ effect = "Armor", zhTW = "護甲值提高(%d+)", zhCN = "护甲值提高(%d+)",},
		{ effect = "Stamina", zhTW = "耐力提高(%d+)", zhCN = "耐力提高(%d+)",},
		{ effect = "Spirit", zhTW = "提高精神(%d+)", zhCN = "提高精神(%d+)",},
		{ effect = "Resistance_Shadow", zhTW = "暗影抗性提高(%d+)", zhCN = "暗影抗性提高(%d+)",},
		{ effect = "Intellect", zhTW = "智力提高(%d+)", zhCN = "智力提高(%d+)",},
		{ effect = "Resistance_Frost", zhTW = "冰霜抗性提高(%d+)", zhCN = "冰霜抗性提高(%d+)",},	
		{ effect = "Stamina|Agility|Strength|Intellect|Spirit", zhTW = "所有屬性提高(%d+)點", zhCN = "所有属性提高(%d+)点",},
		{ effect = "Resistance_Frost|Resistance_Shadow|Resistance_Arcane|Resistance_Fire|Resistance_Nature|Resistance_Holy", zhTW = "所有抗性提高(%d+)點", zhCN = "所有抗性提高(%d+)点",},
		{ effect = "ManaRestore", zhTW = "每5秒恢復(%d+)點法力", zhCN = "每5秒恢复(%d+)点法力",},
		{ effect = "HealthRestore", zhTW = "每5秒恢復(%d+)點生命", zhCN = "每5秒恢复(%d+)点生命",},
		{ effect = "Stamina|Agility|Strength|Intellect|Spirit", percent = true, zhTW = "所有屬性提高(%d+)%%", zhCN = "所有属性提高(%d+)%%",},
		{ effect = "SpellCrit", logic = "SpellCrit", zhTW = "法術造成致命一擊的機率提高(%d+)%%", zhCN = "法术爆击几率提高(%d+)%%",},	--	???
		{ effect = "Dodge", logic = "Dodge", zhTW = "閃躲機率提高(%d+)%%", zhCN = "闪躲几率提高(%d+)%%",},
		{ effect = "AttackPower", zhTW = "近戰攻擊強度提高(%d+)", zhCN = "近战攻击强度提高(%d+)",},
		{ effect = "hp", zhTW = "生命力上限提高(%d+)", zhCN = "生命力上限提高(%d+)",},
		{ effect = "hp", zhTW = "生命力提高(%d+)點", zhCN = "生命力提高(%d+)",},
		{ effect = "Resistance_Frost|Resistance_Shadow|Resistance_Arcane|Resistance_Fire|Resistance_Nature|Resistance_Holy", zhTW = "對所有系別的魔法抗性提高(%d+)", zhCN = "对所有系别的魔法抗性提高(%d+)",},
		{ effect = "RangedAttackPower", zhTW = "遠程攻擊強度提高(%d+)", zhCN = "远程攻击强度提高(%d+)",},
		{ effect = "AttackPower|RangedAttackPower", zhTW = "提高攻擊強度(%d+)", zhCN = "提高攻击强度(%d+)",},
		{ effect = "Resistance_Nature", zhTW = "自然抗性提高(%d+)", zhCN = "自然抗性提高(%d+)",},
		{ effect = "Stamina", zhTW = "耐力%+(%d+)點", zhCN = "耐力%+(%d+)",},
		{ effect = "defense", zhTW = "防禦等級提高(%d+)", zhCN = "生命力提高(%d+)",},
		{ effect = "Healing", zhTW = "治療效果提高(%d+)", zhCN = "治疗效果提高(%d+)",},
		{ effect = "Healing", zhTW = "治療法術效果提高最多(%d+)", zhCN = "治疗效果提高(%d+)",},
		{ effect = "Agility", zhTW = "敏捷提高(%d+)", zhCN = "敏捷提高(%d+)",},
		{ effect = "Strength", zhTW = "力量提高(%d+)", zhCN = "力量提高(%d+)",},
		{ effect = "Spirit", zhTW = "精神提高(%d+)", zhCN = "精神提高(%d+)",},
		{ effect = "Intellect|Spirit", zhTW = "智力和精神提高(%d+)", zhCN = "智力和精神提高(%d+)",},
		{ effect = "SpellDamage", zhTW = "法術傷害和治療效果提高最多(%d+)", zhCN = "法术伤害和治疗效果提高最多(%d+)",},
		{ effect = "SpellCrit", zhTW = "法術致命一擊等級提高(%d+)", zhCN = "法术爆击等级提高(%d+)",},		
		{ effect = "AttackCrit|RangedAttackCrit", zhTW = "致命一擊提高(%d+)", zhCN = "爆击提高(%d+)",},
		{ effect = "Damage_Shadow", percent = true, zhTW = "造成的暗影傷害提高(%d+)%%", zhCN = "造成的暗影伤害提高(%d+)%%",},
		{ effect = "ArmorReduce2", zhTW = "受到物理攻擊時承受的傷害降低(%d+)%%", zhCN = "受到物理攻击时承受的伤害降低(%d+)%%",},	
	},
}
