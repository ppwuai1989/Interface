local WhisperTable_Name = {};
local WhisperTable_Msg = {};
local WhisperTable_Page = 1;

if GetLocale() == "zhCN" then
	DEL_BTN	= "删除";
	CALL_BTN= "密语屏";
elseif GetLocale() == "zhTW" then
	DEL_BTN	= "刪除";
	CALL_BTN= "密語屏";
else
	DEL_BTN	= "Delete";
	CALL_BTN= "WhisperTable";
end

function WhisperTable_Onload(self)
	self:RegisterEvent("CHAT_MSG_WHISPER");
	self:RegisterEvent("CHAT_MSG_WHISPER_INFORM");
	self:RegisterEvent("CHAT_MSG_BN_WHISPER");
	self:RegisterEvent("CHAT_MSG_BN_WHISPER_INFORM");
	self:RegisterForDrag("LeftButton");
	self:SetClampedToScreen(true);
	SlashCmdList["WhisperTable"] = WhisperTable_Set;
	SLASH_WhisperTable1 = "/wt";
	WhisperTable_ListShow();
end

function WhisperTable_Set(self, msg)
	if (msg == "point") then
		WhisperTable_ShowBotton:SetPoint("CENTER","Minimap","CENTER",-153,-63);
	else
		if (WhisperTable_Main:IsVisible()) then
			WhisperTable_Main:Hide();
		else
			WhisperTable_Main:Show();
		end;
	end;
end

function WhisperTable_OnEvent(self, event, ...)
	local arg1, arg2 = ...
	if ((event == "CHAT_MSG_WHISPER") or (event == "CHAT_MSG_BN_WHISPER")) then
		local name = arg2;
		local msg = arg1;
		local time = string.sub(date(),  10, 17);
		msg = "|cffFFFFFF"..time.."-|r"..msg;
		--DEFAULT_CHAT_FRAME:AddMessage(name.."-"..msg);
		if not(WhisperTable_Msg[name]) then
			table.insert(WhisperTable_Name,1,name);
			WhisperTable_Msg[name] = {};
		else
			local j = 1;
			while WhisperTable_Name[j] do
				if (name == WhisperTable_Name[j]) then
					table.remove(WhisperTable_Name,j);
					table.insert(WhisperTable_Name,1,name);
					break;
				end;
				j = j + 1;
			end;
		end;
		table.insert(WhisperTable_Msg[name],msg);
		WhisperTable_ListShow();
	elseif ((event == "CHAT_MSG_WHISPER_INFORM") or (event == "CHAT_MSG_BN_WHISPER_INFORM")) then
		local name = arg2;
		local msg = arg1;
		local time = string.sub(date(),  10, 17);
		msg = "|c009d9d9d"..time.."-|r"..msg;
		--DEFAULT_CHAT_FRAME:AddMessage(name.."-"..msg);
		if not(WhisperTable_Msg[name]) then
			table.insert(WhisperTable_Name,name);
			WhisperTable_Msg[name] = {};
		end;
		table.insert(WhisperTable_Msg[name],msg);
		WhisperTable_ListShow();
	end;
end

function WhisperTable_ListShow()
	local j, msg, num;
	for j=1 ,8 ,1 do
		num = (WhisperTable_Page - 1) * 8 + j;
		if WhisperTable_Name[num] then
			msg = WhisperTable_Name[num];
			getglobal("WhisperTable_Name"..j.."_Text"):SetText(msg);
			getglobal("WhisperTable_Name"..j):Show();
			getglobal("WhisperTable_Del"..j):Show();
		else
			getglobal("WhisperTable_Name"..j):Hide();
			getglobal("WhisperTable_Del"..j):Hide();
		end;
	end;
	if WhisperTable_Name[num+1] then
		WhisperTable_NextPageButton:Enable();
	else
		WhisperTable_NextPageButton:Disable();
	end;
	num = (WhisperTable_Page - 1) * 8;
	if WhisperTable_Name[num] then
		WhisperTable_PrevPageButton:Enable();
	else
		WhisperTable_PrevPageButton:Disable();
	end;
end

function WhisperTable_PrevNextPage(self, num)
	WhisperTable_Page = WhisperTable_Page + num;
	WhisperTable_PageText:SetText(WhisperTable_Page);
	WhisperTable_ListShow();
end

function WhisperTable_OnClick(self, num)
	local name = getglobal("WhisperTable_Name"..num.."_Text"):GetText();
	local msg = "/w "..name.." ";
	if ( not SELECTED_CHAT_FRAME.editBox:IsVisible() ) then
		ChatFrame_OpenChat(msg);
	else
		SELECTED_CHAT_FRAME.editBox:SetText(msg);
	end;
	ChatEdit_ParseText(ChatFrame1.editBox, 0);
end

function WhisperTable_OnEnter(self, num)
	local name = getglobal("WhisperTable_Name"..num.."_Text"):GetText();
	GameTooltip:SetOwner(self, "ANCHOR_LEFT");
	GameTooltip:SetText("|cff0080FF"..name.."|r");
	local num = table.getn(WhisperTable_Msg[name]);
	local j = 1;
	if num>25 then
		j = num - 24;
	end;
	while WhisperTable_Msg[name][j] do
		GameTooltip:AddLine(WhisperTable_Msg[name][j]);
		j = j + 1;
	end;
	GameTooltip:Show();
end

function WhisperTable_OnLeave(self)
	GameTooltip:Hide();
end

function WhisperTable_Del(self, num)
	local name = getglobal("WhisperTable_Name"..num.."_Text"):GetText();
	local j = 1;
	while WhisperTable_Name[j] do
		if (WhisperTable_Name[j]==name) then
			table.remove(WhisperTable_Name,j);
			WhisperTable_Msg[name] = nil;
			break;
		end;
		j = j + 1;
	end;
	WhisperTable_ListShow();
end
