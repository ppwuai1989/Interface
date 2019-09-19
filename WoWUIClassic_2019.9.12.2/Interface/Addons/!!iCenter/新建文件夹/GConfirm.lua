------------------------------------------------------------
-- GConfirm.lua
--
-- Abin
-- 2009-9-11
------------------------------------------------------------

local L = {
	["title"] = "GConfirm",
	["gquit"] = "This operation will make you quit from you guild, ",
	["gleader"] = "This operation will set your guild leader to |cffff0000\"%s\"|r, ",
	["gdisband"] = "This operation will disband your guild, ",
	["confirm"] = "Do you want to proceed?",
}

if GetLocale() == "zhCN" then
	L = {
		["title"] = "GConfirm",
		["gquit"] = "此操作将使你退出你的公会，",
		["gleader"] = "此操作将把你的公会领导权转让给|cffff0000\"%s\"|r，",
		["gdisband"] = "此操作将解散你的公会，",
		["confirm"] = "确定要继续吗？",
	}
elseif GetLocale() == "zhTW" then
	L = {
		["title"] = "GConfirm",
		["gquit"] = "此操作將使你退出你的公會，",
		["gleader"] = "此操作將把你的公會領導權轉讓給|cffff0000\"%s\"|r，",
		["gdisband"] = "此操作將解散你的公會，",
		["confirm"] = "確定要繼續嗎？",
	}
end

------------------------------------------------------------
-- Hooks
------------------------------------------------------------

local _GuildLeave = GuildLeave
local _GuildSetLeader = GuildSetLeader
local _GuildDisband = GuildDisband
local _CloseSpecialWindows = CloseSpecialWindows
local strformat = string.format
local tostring = tostring
local selectedFunc, selectedParam

local function CreatePressButton(parent, isOkay)		
	local button = CreateFrame("Button", nil, parent)
	button:SetWidth(90)
	button:SetHeight(25)	

	local texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonUpTexture")
	texture:SetAllPoints(button)
	button:SetNormalTexture(texture)

	texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonDownTexture")
	texture:SetAllPoints(button)
	button:SetPushedTexture(texture)

	texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonDisabledTexture")
	texture:SetAllPoints(button)
	button:SetDisabledTexture(texture)

	texture = button:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture")
	texture:SetAllPoints(button)
	button:SetHighlightTexture(texture)

	local text = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	text:SetPoint("CENTER")

	if isOkay then
		text:SetText(OKAY)
		button:SetScript("OnClick", function(self)
			if selectedFunc then
				selectedFunc(selectedParam)
			end
			self:GetParent():Hide()
		end)
	else
		text:SetText(CANCEL)
		button:SetScript("OnClick", function(self)
			self:GetParent():Hide()
		end)
	end
	
	return button
end

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 32, edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 32, insets = {left = 11, right = 12, top = 12, bottom = 11 }, })
frame:SetWidth(300)
frame:SetHeight(140)
frame:SetToplevel(true)
frame:EnableMouse(true)
frame:SetMovable(true)
frame:SetFrameStrata("DIALOG")
frame:SetPoint("CENTER")
frame:CreateTitleRegion():SetAllPoints(frame)

frame:SetScript("OnHide", function(self)
	selectedFunc = nil
	selectedParam = nil
end)

local header = frame:CreateTexture(nil, "ARTWORK")
header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
header:SetHeight(62)
header:SetPoint("TOP", frame, "TOP", 1, 13)

local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
titleText:SetPoint("TOP", frame, "TOP", 0, 1)
titleText:SetText(L["title"])

local msgText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLeft")
msgText:SetJustifyV("TOP")
msgText:SetNonSpaceWrap(true)
msgText:SetSpacing(5)
msgText:SetPoint("TOPLEFT", 18, -40)
msgText:SetPoint("BOTTOMRIGHT", -16, 0)

local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeButton:SetWidth(24)
closeButton:SetHeight(24)
closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)

local okButton = CreatePressButton(frame, true)
okButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOM", 0, 20)

local cancelButton = CreatePressButton(frame)
cancelButton:SetPoint("LEFT", okButton, "RIGHT")

local function GConfirmExecute(msg, func, param)
	msgText:SetText(msg..L["confirm"])
	selectedFunc = func
	selectedParam = param	
	frame:Show()
end

GuildLeave = function()
	GConfirmExecute(L["gquit"], _GuildLeave)
end

GuildSetLeader = function(name)
	GConfirmExecute(strformat(L["gleader"], tostring(name)), _GuildSetLeader, name)
end

GuildDisband = function()
	GConfirmExecute(L["gdisband"], _GuildDisband)
end

CloseSpecialWindows = function(...)
	if frame:IsShown() then
		frame:Hide()
		return 1
	end
	return _CloseSpecialWindows(...)
end