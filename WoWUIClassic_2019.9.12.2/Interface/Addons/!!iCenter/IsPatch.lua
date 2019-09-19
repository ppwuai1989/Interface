
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
