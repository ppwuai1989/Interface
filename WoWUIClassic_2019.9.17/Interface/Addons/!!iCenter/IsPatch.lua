
--自动取消敏感词过滤
local filter = CreateFrame('Frame')
filter:RegisterEvent("VARIABLES_LOADED")
filter:SetScript("OnEvent", function(self, event)
    if GetCVar("profanityFilter") ~= 0 then
        SetCVar("profanityFilter", 0, 1)
    end
    if GetCVar("overrideArchive") ~= 0 then
        SetCVar("overrideArchive", 0, 1)
    end
end)

--自动回收内存
local eventcount = 0
local recovery = CreateFrame("Frame")
recovery:RegisterAllEvents()
recovery:SetScript("OnEvent", function(self, event)
	eventcount = eventcount + 1
	if InCombatLockdown() then return end
	if eventcount > 6000 or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_REGEN_ENABLED" then
		collectgarbage("collect")
		eventcount = 0
	end
end)

--新职业颜色
if GetLocale() == "zhCN" then
    LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"] = "死亡骑士"
    LOCALIZED_CLASS_NAMES_MALE["DEMONHUNTER"] = "恶魔猎手"
    LOCALIZED_CLASS_NAMES_MALE["MONK"] = "武僧"
    LOCALIZED_CLASS_NAMES_FEMALE["DEATHKNIGHT"] = "死亡骑士"
    LOCALIZED_CLASS_NAMES_FEMALE["DEMONHUNTER"] = "恶魔猎手"
    LOCALIZED_CLASS_NAMES_FEMALE["MONK"] = "武僧"
elseif GetLocale() == "zhTW" then
    LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"] = "死亡騎士"
    LOCALIZED_CLASS_NAMES_MALE["DEMONHUNTER"] = "惡魔獵人"
    LOCALIZED_CLASS_NAMES_MALE["MONK"] = "武僧"
    LOCALIZED_CLASS_NAMES_FEMALE["DEATHKNIGHT"] = "死亡騎士"
    LOCALIZED_CLASS_NAMES_FEMALE["DEMONHUNTER"] = "惡魔獵人"
    LOCALIZED_CLASS_NAMES_FEMALE["MONK"] = "武僧"
else
    LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"] = "Death Knight"
    LOCALIZED_CLASS_NAMES_MALE["DEMONHUNTER"] = "Demon Hunter"
    LOCALIZED_CLASS_NAMES_MALE["MONK"] = "Monk"
    LOCALIZED_CLASS_NAMES_FEMALE["DEATHKNIGHT"] = "Death Knight"
    LOCALIZED_CLASS_NAMES_FEMALE["DEMONHUNTER"] = "Demon Hunter"
    LOCALIZED_CLASS_NAMES_FEMALE["MONK"] = "Monk"
end

RAID_CLASS_COLORS["DEATHKNIGHT"] = CreateColor(0.77, 0.12, 0.23, 1);
RAID_CLASS_COLORS["DEATHKNIGHT"].colorStr = RAID_CLASS_COLORS["DEATHKNIGHT"]:GenerateHexColor()
RAID_CLASS_COLORS["DEMONHUNTER"] = CreateColor(0.64, 0.19, 0.79, 1);
RAID_CLASS_COLORS["DEMONHUNTER"].colorStr = RAID_CLASS_COLORS["DEMONHUNTER"]:GenerateHexColor()
RAID_CLASS_COLORS["MONK"] = CreateColor(0, 1, 0.59, 1);
RAID_CLASS_COLORS["MONK"].colorStr = RAID_CLASS_COLORS["MONK"]:GenerateHexColor()
