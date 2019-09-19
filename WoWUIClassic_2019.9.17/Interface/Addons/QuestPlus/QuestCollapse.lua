
if GetLocale() == "zhCN" then
	QUEST_COLLAPSE	= "收起";
	QUEST_EXPAND	= "展开";
elseif GetLocale() == "zhTW" then
	QUEST_COLLAPSE	= "收起";
	QUEST_EXPAND	= "展開";
else
	QUEST_COLLAPSE	= "Collapse";
	QUEST_EXPAND	= "Expand";
end

local collapse = 0;

local collapseBtn = CreateFrame("Button", "QuestCollapse", QuestLogFrame, "UIPanelButtonTemplate");
_G[collapseBtn:GetName().."Text"]:SetText(QUEST_COLLAPSE);
if ((GetLocale() == "zhCN") or(GetLocale() == "zhTW")) then
	collapseBtn:SetPoint("TOP", QuestLogFrame, "TOP", -112, -31);
	collapseBtn:SetWidth(50);
else
	collapseBtn:SetPoint("TOP", QuestLogFrame, "TOP", -80, -31);
	collapseBtn:SetWidth(80);
end
collapseBtn:SetHeight(25);
collapseBtn:SetScript("OnClick", function()
	if collapse == 0 then
		collapse = 1;
		CollapseQuestHeader(0);
		_G[collapseBtn:GetName().."Text"]:SetText(QUEST_EXPAND);
	else
		collapse = 0;
		ExpandQuestHeader(0);
		_G[collapseBtn:GetName().."Text"]:SetText(QUEST_COLLAPSE);
	end
end)