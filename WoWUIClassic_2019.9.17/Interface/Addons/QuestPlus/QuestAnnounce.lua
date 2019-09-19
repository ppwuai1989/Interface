
QA_Channel = "PARTY";  --SAY, PARTY, RAID
if (QA_Enable == nil) then
	QA_Enable = false;
end

QA = LibStub("AceAddon-3.0"):NewAddon("QA", "AceEvent-3.0", "AceHook-3.0");

if (GetLocale() == "zhCN") then
	QA_ADVMSG = "任务进度：";
	QA_Finish = "已完成。";
	QA_String = "(.*)：%s*([-%d]+)%s*/([-%d]+)%s*";
elseif (GetLocale() == "zhTW") then
	QA_ADVMSG = "任務進度：";
	QA_Finish = "已完成。";
	QA_String = "(.*):%s*([-%d]+)%s*/([-%d]+)%s*";
else
	QA_ADVMSG = "Quest Process: ";
	QA_Finish = "finished.";
	QA_String = "(.*):%s*([-%d]+)%s*/([-%d]+)%s*";
end

function QA:OnEnable()
	self:RegisterEvent("UI_INFO_MESSAGE");
	self:RegisterEvent("CHAT_MSG_SYSTEM");
end

function QA:UI_INFO_MESSAGE(event, id, message)
	local QuestText = gsub(message, QA_String, "%1", 1);
	if (QuestText ~= message) then
		if (QA_Enable) then
			self:Notification(message);
		end
	else
		self:CheckPatterns(message);
	end
end

function QA:CHAT_MSG_SYSTEM(event, message)
	if (message) then
		self:CheckPatterns(message);
	end
end

function QA:CheckPatterns(message)
	if (QA_Enable) then
		if (string.find(message, QA_String)) then
			self:Notification(message);
		end
	end
end

function QA:Notification(msg, ...)
	local text
	local _, _, ItemName, ItemNum, NumNeeded = string.find(msg, QA_String);
	local StillNeeded = NumNeeded-ItemNum
	if StillNeeded < 1 then
		text = QA_ADVMSG .. "->>" .. ItemName .. "<<-" .. QA_Finish
	else
		text = QA_ADVMSG .. format(msg, ...);
	end

	if (QA_Channel == "SAY") then
		SendChatMessage(text , "SAY");
	elseif (QA_Channel == "PARTY") then
		if (GetNumSubgroupMembers() > 0) then
			SendChatMessage(text, "PARTY");
		end
	elseif (QA_Channel == "RAID") then
		if (GetNumGroupMembers() > 0) then
			SendChatMessage(text, "RAID");
		end
	end
end

if GetLocale() == "zhCN" then
	QA_Name  = "任务通告";
	QA_ON    = "任务通告已开启";
	QA_OFF   = "任务通告已关闭";
	QA_LINE  = "开启任务通告";
elseif GetLocale() == "zhTW" then
	QA_Name  = "任務通告";
	QA_ON    = "任務通告已開啟";
	QA_OFF   = "任務通告已關閉";
	QA_LINE  = "開啟任務通告";
else
	QA_Name  = "QA";
	QA_ON    = "Quest Announce is enabled.";
	QA_OFF   = "Quest Announce is disabled.";
	QA_LINE  = "Enable Quest Announce";
end

local function OnShow(self)
	self:SetChecked(QA_Enable);
end

local function OnClick(self)
	if QA_Enable == true then
		QA_Enable = false;
		print(QA_OFF);
	else
		QA_Enable = true;
		print(QA_ON);
	end
	self:SetChecked(QA_Enable);
end

local function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:AddLine(QA_LINE);
	GameTooltip:Show();
end

local function OnLeave()
	GameTooltip:Hide();
end

local QA_Button = CreateFrame("CheckButton", "QA_Button", QuestLogFrame, "InterfaceOptionsCheckButtonTemplate");
QA_Button:SetPoint("TOPLEFT", QuestLogFrame, "TOPRIGHT", -265, -11);
QA_Button:SetHitRectInsets(0, -60, 0, 0);
QA_ButtonText:SetText(QA_Name);
QA_ButtonText:SetTextColor(1, 0.82, 0);
QA_Button:SetScript("OnShow", OnShow);
QA_Button:SetScript("OnClick", OnClick);
QA_Button:SetScript("OnEnter", OnEnter);
QA_Button:SetScript("OnLeave", OnLeave);
