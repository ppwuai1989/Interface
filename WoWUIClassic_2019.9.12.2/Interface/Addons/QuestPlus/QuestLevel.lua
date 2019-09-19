local QuestLevelPatch = {}

--------------------------------------------------------------------------------------------------------
--                                    QuestLevelPatch variables                                       --
--------------------------------------------------------------------------------------------------------
local QuestLevel_original_GetQuestLogTitle = GetQuestLogTitle;
local QuestLevel_original_GetGossipAvailableQuests = GetGossipAvailableQuests;
local QuestLevel_original_GetGossipActiveQuests = GetGossipActiveQuests;

--------------------------------------------------------------------------------------------------------
--                                QuestLevelPatch hooked funcitons                                    --
--------------------------------------------------------------------------------------------------------
function GetQuestLogTitle(questIndex)
    local title, level, questTag, isHeader, isCollapsed, isComplete, isDaily, questID, startEvent, displayQuestID = QuestLevel_original_GetQuestLogTitle(questIndex)
    if (title and (not isHeader)) then
        title = "["..level.."] "..title
    end

    return title, level, questTag, isHeader, isCollapsed, isComplete, isDaily, questID, startEvent, displayQuestID
end

function GetGossipAvailableQuests()
    -- name, level, isTrivial, isDaily, isRepeatable, isLegendary, ... = GetGossipAvailableQuests()
    local availableQuests = { QuestLevel_original_GetGossipAvailableQuests() }
    local i = 1
    while(availableQuests[i]) do
        availableQuests[i] = "["..availableQuests[i+1].."] "..availableQuests[i]
        i = i + 6
    end

    return QuestLevelPatch:unpackAvailableQuests(availableQuests)
end

function GetGossipActiveQuests()
    -- name, level, isTrivial, isDaily, isLegendary, ... = GetGossipActiveQuests()
    local activeQuests = { QuestLevel_original_GetGossipActiveQuests() }
    local i = 1
    while(activeQuests[i]) do
        activeQuests[i] = "["..activeQuests[i+1].."] "..activeQuests[i]
        i = i + 5
    end

    return QuestLevelPatch:unpackActiveQuests(activeQuests)
end

--------------------------------------------------------------------------------------------------------
--                                    QuestLevelPatch funcitons                                       --
--------------------------------------------------------------------------------------------------------
function QuestLevelPatch:unpackAvailableQuests(t, i)
    i = i or 1
    if t[i] then
        return t[i], t[i+1], t[i+2], t[i+3], t[i+4], t[i+5], self:unpackAvailableQuests(t, i+6)
    end
end

function QuestLevelPatch:unpackActiveQuests(t, i)
    i = i or 1
    if t[i] then
        return t[i], t[i+1], t[i+2], t[i+3], t[i+4], self:unpackActiveQuests(t, i+5)
    end
end
