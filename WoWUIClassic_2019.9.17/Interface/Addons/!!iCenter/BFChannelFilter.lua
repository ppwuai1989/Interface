if not bfwhitelist then bfwhitelist = {} end
if not bfblacklist then bfblacklist = {} end

local function listtostring(list)
    local text = "";
    for k, v in ipairs( list ) do
        if text == "" then
            text = v;
        else
            text = text.." "..v;
        end
    end
    return text;
end

local function savelist(self, list)
    local text = self:GetText();
    if text ~= "" then
        _G[list] = {strsplit(" ", text)};
    else
        _G[list] = {};
    end
    self:ClearFocus();
end

function BFChannelFilter(self, event, msg, playername, _, channel, _, flag, zonechannelid, channelindex, channelname, unused, id)
    if channelname == "大脚世界频道" then
        local find = false;
        if next(bfwhitelist) ~= nil then
            for _, word in ipairs(bfwhitelist) do
                local newString, result= gsub(msg, word, "");
                if (result > 0) then
                    find = true;
                    break;
                end
            end
        else
            find = true;
        end

        if find then
            if next(bfblacklist) ~= nil then
                for _, word in ipairs(bfblacklist) do
                    local newString, result= gsub(msg, word, "");
                    if (result > 0) then
                        return true;
                    end
                end
            end
            return false;
        else
            return true;
        end
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", BFChannelFilter);

--settings
local bff = CreateFrame("Frame", "BFChannelFilterFrame", UIParent);
bff:SetSize(385, 175);
bff:ClearAllPoints();
bff:SetPoint("CENTER");
bff:SetClampedToScreen(true);
bff:EnableMouse(true);
bff:SetMovable(true);
bff:RegisterForDrag("LeftButton");
bff:SetScript("OnDragStart", function(self) self:StartMoving() end);
bff:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end);
bff:Hide();
bff.bg = bff:CreateTexture();
bff.bg:ClearAllPoints();
bff.bg:SetAllPoints(bff);
bff.bg:SetColorTexture(0, 0, 0, 0.5);
bff.close = CreateFrame("Button", nil, bff, "UIPanelCloseButton");
bff.close:ClearAllPoints();
bff.close:SetPoint("TOPRIGHT", bff, "TOPRIGHT", -5, -5);
bff.title = bff:CreateFontString(nil, nil, "GameFontNormalLarge");
bff.title:ClearAllPoints();
bff.title:SetPoint("TOPLEFT", 16, -16);
bff.title:SetText("世界频道过滤器");
bff.description = bff:CreateFontString(nil, nil, "GameFontNormalLarge");
bff.description:ClearAllPoints();
bff.description:SetPoint("TOPLEFT",bff.title, "TOPLEFT", 0, -20);
bff.description:SetText("使用空格分隔关键词");
bff.description:SetTextColor(1, 1, 1);

--whitelist
bff.whitelist = bff:CreateFontString(nil, nil, "GameFontNormalLarge");
bff.whitelist:ClearAllPoints();
bff.whitelist:SetPoint("TOPLEFT",bff.description, "TOPLEFT", 0, -30);
bff.whitelist:SetText("白名单：");
--whitelist editbox
bff.whitelisteditbox = CreateFrame("EditBox", nil, bff, "InputBoxTemplate");
bff.whitelisteditbox:ClearAllPoints();
bff.whitelisteditbox:SetPoint("TOPLEFT", bff.whitelist, "TOPLEFT", 3, -16);
bff.whitelisteditbox:SetWidth(350);
bff.whitelisteditbox:SetHeight(25);
bff.whitelisteditbox:SetAutoFocus(false);
bff.whitelisteditbox:ClearFocus();
bff.whitelisteditbox:SetScript("OnEnterPressed", function(self)
    savelist(self, "bfwhitelist");
end)
bff.whitelisteditbox:SetScript("OnEscapePressed", function(self)
    savelist(self, "bfwhitelist");
end)
bff.whitelisteditbox:SetScript("OnEditFocusLost", function(self)
    savelist(self, "bfwhitelist");
end)
bff.whitelisteditbox:SetScript("OnShow", function(frame)
    bff.whitelisteditbox:SetText(listtostring(bfwhitelist));
end)

--blacklist
bff.blacklist = bff:CreateFontString(nil, nil, "GameFontNormalLarge");
bff.blacklist:ClearAllPoints();
bff.blacklist:SetPoint("TOPLEFT",bff.whitelisteditbox, "TOPLEFT", -3, -38);
bff.blacklist:SetText("黑名单：");
--blacklist editbox
bff.blacklisteditbox = CreateFrame("EditBox", nil, bff, "InputBoxTemplate");
bff.blacklisteditbox:ClearAllPoints();
bff.blacklisteditbox:SetPoint("TOPLEFT", bff.blacklist, "TOPLEFT", 3, -16);
bff.blacklisteditbox:SetWidth(350);
bff.blacklisteditbox:SetHeight(25);
bff.blacklisteditbox:SetAutoFocus(false);
bff.blacklisteditbox:ClearFocus();
bff.blacklisteditbox:SetScript("OnEnterPressed", function(self)
    savelist(self, "bfblacklist");
end)
bff.blacklisteditbox:SetScript("OnEscapePressed", function(self)
    savelist(self, "bfblacklist");
end)
bff.blacklisteditbox:SetScript("OnEditFocusLost", function(self)
    savelist(self, "bfblacklist");
end)
bff.blacklisteditbox:SetScript("OnShow", function(frame)
    bff.blacklisteditbox:SetText(listtostring(bfblacklist));
end)

--command
function BFChannelFilter_SlashHandler()
    if not bff:IsShown() then
        bff:Show();
    else
        bff:Hide();
    end
end
SlashCmdList["BFChannelFilter"] = BFChannelFilter_SlashHandler;
SLASH_BFChannelFilter1 = "/bfchannelfilter";
SLASH_BFChannelFilter2 = "/bff";
