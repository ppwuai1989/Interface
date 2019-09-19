  -- // rQuestWatchFrameMover
  -- // zork - 2012

  -----------------------------
  -- CONFIG
  -----------------------------

  local pos = { a1 = "TOPRIGHT", a2 = "TOPRIGHT", af = "UIParent", x = -100, y = -250 }
  if (QT_movable == nil) then
    QT_movable = true
  end
  local watchframeheight = 450

  -----------------------------
  -- FUNCTIONS
  -----------------------------

  --tooltip for icon func
if GetLocale() == "zhCN" then
  DRAGME    = "点击拖动";
elseif GetLocale() == "zhTW" then
  DRAGME    = "點擊拖動";
else
  DRAGME    = "Drag me!";
end
  local function rQWFM_Tooltip(self)
    if (QT_movable == true) then
      GameTooltip:SetOwner(self, "ANCHOR_TOP")
      GameTooltip:AddLine(DRAGME, 0, 1, 0.5, 1, 1, 1)
      GameTooltip:Show()
    end
  end

  --make the quest watchframe movable
  local wf = QuestWatchFrame
  wf:SetClampedToScreen(true)
  wf:SetMovable(true)
  wf:SetUserPlaced(true)
  wf:ClearAllPoints()
  wf.ClearAllPoints = function() end
  wf:SetPoint(pos.a1,pos.af,pos.a2,pos.x,pos.y)
  wf.SetPoint = function() end
  wf:SetHeight(watchframeheight)

  wf:EnableMouse(true)
  wf:RegisterForDrag("LeftButton")
  wf:SetHitRectInsets(-15, -15, -5, -5)
  wf:SetScript("OnDragStart", function(s)
    if (QT_movable == true) then
      wf:StartMoving()
    end
  end)
  wf:SetScript("OnDragStop", function(s)
    wf:StopMovingOrSizing()
  end)
  wf:SetScript("OnEnter", function(s)
    rQWFM_Tooltip(s)
  end)
  wf:SetScript("OnLeave", function(s)
    GameTooltip:Hide()
  end)

if GetLocale() == "zhCN" then
  TRACKER_BUTTON    = "任务追踪";
  TRACKER_UNLOCKED  = "任务追踪列表已解锁";
  TRACKER_LOCKED    = "任务追踪列表已锁定";
  TOOLTIP_LINE      = "解锁任务追踪列表";
elseif GetLocale() == "zhTW" then
  TRACKER_BUTTON    = "任務追蹤";
  TRACKER_UNLOCKED  = "任務追蹤列表已解鎖";
  TRACKER_LOCKED    = "任務追蹤列表已鎖定";
  TOOLTIP_LINE      = "解鎖任務追蹤列表";
else
  TRACKER_BUTTON    = "QT";
  TRACKER_UNLOCKED  = "Quest Tracker is now UNLOCKED.";
  TRACKER_LOCKED    = "Quest Tracker is now LOCKED.";
  TOOLTIP_LINE      = "Unlock Quest Tracker";
end

local function OnShow(self)
  self:SetChecked(QT_movable);
end

local function OnClick(self)
  if QT_movable == true then
    QT_movable = false;
    print(TRACKER_LOCKED);
  else
    QT_movable = true;
    print(TRACKER_UNLOCKED);
  end
  self:SetChecked(QT_movable);
end

local function OnEnter(self)
  GameTooltip:SetOwner(self, 'ANCHOR_RIGHT');
  GameTooltip:AddLine(TOOLTIP_LINE);
  GameTooltip:Show();
end

local function OnLeave()
  GameTooltip:Hide();
end

local qtf = CreateFrame("CheckButton", "qtf", QuestLogFrame, "InterfaceOptionsCheckButtonTemplate");
qtf:SetPoint("TOPLEFT", QuestLogFrame, "TOPRIGHT", -165, -11);
qtf:SetHitRectInsets(0, -60, 0, 0);
qtfText:SetText(TRACKER_BUTTON);
qtfText:SetTextColor(1, 0.82, 0);
qtf:SetScript("OnShow", OnShow);
qtf:SetScript("OnClick", OnClick);
qtf:SetScript("OnEnter", OnEnter);
qtf:SetScript("OnLeave", OnLeave);
