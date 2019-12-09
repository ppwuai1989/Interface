--------------------------------------------------------------------------
-- FeatureFrame.lua
--------------------------------------------------------------------------
--[[

	-- Author
	Vjeux and Alexander Brazie
	Liberated from the Earth library by Ryan "Gryphon" Snook
	Made standalone by AnduinLothar

	-- Description
	These are functions to allow a user to register a button
	for their feature to appear within the frame here.

	-- Changes
	2.0	- Refactored to be standalone, renamed
		- Still accepts old EarthFeature_AddButton(...) calls, but the new syntax is FeatureFrame_AddButton(...)
	1.0	- Initial separation from Earth

  -- SVN info
	$Id: FeatureFrame.lua 4157 2006-10-13 20:12:04Z geowar $
	$Rev: 4157 $
	$LastChangedBy: geowar $
	$Date: 2006-10-13 20:12:04Z $

]]--

FeatureFrame_Version = {
	Version = "2.00";
	Revision = "$Rev: 4157 $";
}

-- Inform the default UI of our existence...
UIPanelWindows["FeatureFrame"] = { area = "left",	pushable = 3,	whileDead = 1 };

-- Max Objects
FeatureFrame_MAX = 14;

-- Data objects:
FeatureFrame_Buttons = { };
FeatureFrame_CurrentOffset = 0;

--[[
--	RegisterButton
--
--	Allow you to create a button of your mod in the FeatureFrame.
--
--	Usage:
--
--		FeatureFrame_AddButton ( FeatureFrameRegistrationObject[name,subtext,tooltip,icon,callback,testfunction] )
--
--	Example:
--
--		FeatureFrame_AddButton (
--			{
--				id = "MyAddOnID";
--				name = "My AddOn";
--				subtext = "Is very cool";
--				tooltip = "Long Tool\n Tip Text";
--				icon = "Interface\\Icons\\Spell_Holy_BlessingOfStrength";
--				callback = function()
--					if (MinimapFrameFrame:IsVisible()) then
--						HideUIPanel(MinimapFrame);
--					else
--						ShowUIPanel(MinimapFrame);
--					end
--				end;
--				test = 	function()
--					if (UnitInParty("party1")) then
--						return true; -- The button is enabled
--					else
--						return false; -- The button is disabled
--					end
--				end
--			}
--			);
--
--		A button will be created in the Features Frame.
--
--		Description must not be more than 2 words, you should put a longer description in the tooltip.
--
--	]]--

function FeatureFrame_AddButton ( newButton )
	local i = 1;
	while ( FeatureFrame_Buttons[i]) do
		if FeatureFrame_Buttons[i].name ~= newButton.name then
			i = i + 1;
		else
			return false;
		end
	end
	if ( not newButton ) or ( type(newButton) ~= "table" ) then
		Sea.io.error ( "FeatureFrame_AddButton: ","Missing a table for the button. From ",self:GetName());
		return false;
	end
	if ( newButton.name == nil ) then
		Sea.io.error ( "FeatureFrame_AddButton: ","Missing a name for the button. From ",self:GetName());
		return false;
	end
	if ( newButton.icon == nil ) then
		Sea.io.error ( "FeatureFrame_AddButton: ","Missing an icon path for the FeatureFrame Button. (",newButton.name,")", " from ", self:GetName());
		return false;
	end
	if ( newButton.callback == nil ) then
		Sea.io.error ( "FeatureFrame_AddButton: ","Missing a callback for the FeatureFrame Button. (",newButton.name,")", " from ", self:GetName());
		return false;
	end
	if ( newButton.test == nil ) then
		newButton.test = function () return true; end;
	end

	table.insert ( FeatureFrame_Buttons, newButton );

	FeatureFrame_UpdateButtons();
	FeatureFrameMinimapButton:Show();
	return true;
end

-- Reverse compat alias
EarthFeature_AddButton = FeatureFrame_AddButton;


function ToggleFeatureFrame()
	if (FeatureFrame:IsVisible()) then
		HideUIPanel(FeatureFrame);
	else
		ShowUIPanel(FeatureFrame);
	end
end

function FeatureFrame_OnHide(self)
	UpdateMicroButtons();
	-- PlaySound("igSpellBookClose");
	PlaySound(851);
end

function FeatureFrameButtons_UpdateColor()
	local root =  "FeatureFrame";
	for i=1, FeatureFrame_MAX do
		local icon = getglobal(root.."Button"..i);
		local iconTexture = getglobal(root.."Button"..i.."IconTexture");

		local id = FeatureFrameButton_GetOffset() + i;
		if ( FeatureFrame_Buttons[id] ) then
			if ( FeatureFrame_Buttons[id].test() == false) then
				icon:Disable();
				iconTexture:SetVertexColor(1.00, 0.00, 0.00);
			else
				icon:Enable();
				iconTexture:SetVertexColor(1.00, 1.00, 1.00);
			end
		end
	end
end

function FeatureFrame_OnShow(self)
	FeatureFrameTitleText:SetText(FEATURE_FRAME_TITLE);
	-- PlaySound("igSpellBookOpen");
	PlaySound(850);
	FeatureFrame_UpdateButtons();
end

function FeatureFrameButton_OnEnter(self)
	local id = self:GetID() + FeatureFrameButton_GetOffset();

	if ( FeatureFrame_Buttons[id] ) then
		local tooltip = FeatureFrame_Buttons[id].tooltip;
		if ( type ( tooltip ) == "function" ) then
			tooltip = tooltip();
		end
		if ( tooltip ) then
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
			GameTooltip:SetText(tooltip, 1.0, 1.0, 1.0);
		end
	end
end

function FeatureFrameButton_OnLeave(self)
	GameTooltip:Hide();
end

function FeatureFrameButton_OnClick(self, button)
	local id = self:GetID() + FeatureFrameButton_GetOffset();

	if ( FeatureFrame_Buttons[id] ) then
		self:SetChecked(false);
		FeatureFrame_Buttons[id].callback(button);
	end
end

function FeatureFrameButton_GetOffset()
	return FeatureFrame_CurrentOffset;
end

function FeatureFrame_NextPage(self)
	if ( #FeatureFrame_Buttons > FeatureFrame_CurrentOffset + FeatureFrame_MAX ) then
		FeatureFrame_CurrentOffset = FeatureFrame_CurrentOffset + FeatureFrame_MAX;
	end
	FeatureFrame_UpdateButtons();
end


function FeatureFrame_PrevPage(self)
	if ( FeatureFrame_CurrentOffset - FeatureFrame_MAX < 0 ) then
		FeatureFrame_CurrentOffset = 0;
	else
		FeatureFrame_CurrentOffset = FeatureFrame_CurrentOffset - FeatureFrame_MAX;
	end
	FeatureFrame_UpdateButtons();
end

function FeatureFrame_UpdateButtons()
	local root = "FeatureFrame";
	for i = 1, FeatureFrame_MAX, 1 do
		local icon = getglobal(root.."Button"..i);
		local iconTexture = getglobal(root.."Button"..i.."IconTexture");
		local iconName = getglobal(root.."Button"..i.."Name");
		local iconDescription = getglobal(root.."Button"..i.."OtherName");

		local id = FeatureFrameButton_GetOffset() + i;
		if ( FeatureFrame_Buttons[id] ) then
			icon:Show();
			icon:Enable();
			iconTexture:Show();
			iconTexture:SetTexture(FeatureFrame_Buttons[id].icon);
			iconName:Show();
			if ( type ( FeatureFrame_Buttons[id].name ) == "function" ) then
				iconName:SetText(FeatureFrame_Buttons[id].name());
			else
				iconName:SetText(FeatureFrame_Buttons[id].name);
			end
			iconDescription:Show();
			if ( type ( FeatureFrame_Buttons[id].subtext ) == "function" ) then
				iconDescription:SetText(FeatureFrame_Buttons[id].subtext());
			else
				iconDescription:SetText(FeatureFrame_Buttons[id].subtext);
			end
		else
			icon:Hide();
			iconTexture:Hide();
			iconName:Hide();
			iconDescription:Hide();
		end
	end
	FeatureFrame_UpdatePageArrows();
	FeatureFrameButtons_UpdateColor();
end

function FeatureFrame_UpdatePageArrows()
	local root = "FeatureFrame";
	local currentPage, maxPages = FeatureFrame_GetCurrentPage();
	if ( currentPage== 1 ) then
		getglobal(root.."PrevPageButton"):Disable();
	else
		getglobal(root.."PrevPageButton"):Enable();
	end
	if ( currentPage == maxPages ) then
		getglobal(root.."NextPageButton"):Disable();
	else
		getglobal(root.."NextPageButton"):Enable();
	end
end

function FeatureFrame_GetCurrentPage()
	local currentPage = (FeatureFrameButton_GetOffset()/FeatureFrame_MAX) + 1;
	local maxPages = ceil(#FeatureFrame_Buttons/FeatureFrame_MAX);
	return currentPage, maxPages;
end

--[[
--	Minimap Button Mobility Code
--]]

function FeatureFrameMinimapButton_OnLoad(self)
	self:RegisterEvent("VARIABLES_LOADED");
	FeatureFrameMinimapButton:SetFrameLevel(MinimapZoomIn:GetFrameLevel());
	--FeatureFrameMinimapButton_Reset();
end

function FeatureFrameMinimapButton_Reset()
	--fixes a mysterious frame level problem that would hide the FeatureFrameMinimapButton behind some unknown minimap frame.
	ToggleWorldMap();
	ToggleWorldMap();
end

function FeatureFrameMinimapButton_OnEvent(self, event)
	if (event == "VARIABLES_LOADED") then
		if (FeatureFrameMinimapButton_OffsetX) and (FeatureFrameMinimapButton_OffsetY) then
			self:SetPoint("CENTER", "Minimap", "CENTER", FeatureFrameMinimapButton_OffsetX, FeatureFrameMinimapButton_OffsetY);
		end
	end
end

function FeatureFrameMinimapButton_OnMouseDown(self)
	if (IsControlKeyDown()) then
		if ( arg1 == "RightButton" ) then
			--wait for reset
		else
			self.isMoving = 0;	-- true, so as not to conflict with MobileMinimapButtons
		end
	end
end

function FeatureFrameMinimapButton_OnMouseUp(self)
	if (self.isMoving) then
		self.isMoving = false;
		FeatureFrameMinimapButton_OffsetX = self.currentX;
		FeatureFrameMinimapButton_OffsetY = self.currentY;
	elseif (MouseIsOver(FeatureFrameMinimapButton)) then
		if (IsControlKeyDown()) and ( arg1 == "RightButton" ) then
			FeatureFrameMinimapButton_Reset();
		else
			ToggleFeatureFrame();
		end
	end
end

function FeatureFrameMinimapButton_OnHide(self)
	self.isMoving = false;
end

function FeatureFrameMinimapButton_OnUpdate(self)
	if (self.isMoving) then
		local mouseX, mouseY = GetCursorPosition();
		local centerX, centerY = Minimap:GetCenter();
		local scale = Minimap:GetEffectiveScale();
		mouseX = mouseX / scale;
		mouseY = mouseY / scale;
		local radius = (Minimap:GetWidth()/2) + (self:GetWidth()/3);
		local x = math.abs(mouseX - centerX);
		local y = math.abs(mouseY - centerY);
		local xSign = 1;
		local ySign = 1;
		if not (mouseX >= centerX) then
			xSign = -1;
		end
		if not (mouseY >= centerY) then
			ySign = -1;
		end
		--Sea.io.print(xSign*x,", ",ySign*y);
		local angle = math.atan(x/y);
		x = math.sin(angle)*radius;
		y = math.cos(angle)*radius;
		self.currentX = xSign*x;
		self.currentY = ySign*y;
		self:SetPoint("CENTER", "Minimap", "CENTER", self.currentX, self.currentY);
	end
end

function FeatureFrameMinimapButton_Reset()
	FeatureFrameMinimapButton:ClearAllPoints();
	FeatureFrameMinimapButton_OffsetX = -46.330;	-- Isler's WoWUI
	FeatureFrameMinimapButton_OffsetY = -66.848;	-- Isler's WoWUI
	FeatureFrameMinimapButton:SetPoint("CENTER", "Minimap", "CENTER", FeatureFrameMinimapButton_OffsetX, FeatureFrameMinimapButton_OffsetY);
end
