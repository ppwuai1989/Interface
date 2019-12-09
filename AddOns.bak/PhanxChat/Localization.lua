--[[--------------------------------------------------------------------
	PhanxChat
	Reduces chat frame clutter and enhances chat frame functionality.
	Copyright (c) 2006-2018 Phanx <addons@phanx.net>. All rights reserved.
	https://www.wowinterface.com/downloads/info6323-PhanxChat.html
	https://www.curseforge.com/wow/addons/phanxchat
	https://github.com/phanx-wow/PhanxChat
----------------------------------------------------------------------]]

local _, PhanxChat = ...
local C, S, L = {}, {}, {}
local LOCALE = GetLocale()
PhanxChat.ChannelNames, PhanxChat.ShortStrings, PhanxChat.L = C, S, L

-- Channel Names
-- Must match the default channel names shown in your game client.
C.Conversation    = "Conversation"
C.General         = "General"
C.LocalDefense    = "LocalDefense"
C.LookingForGroup = "LookingForGroup"
C.Trade           = "Trade"
C.WorldDefense    = "WorldDefense"

-- Short Channel Names
-- Use the shortest abbreviations that make sense in your language.
S.Conversation       = "C"
S.General            = "G"
S.LocalDefense       = "LD"
S.LookingForGroup    = "LFG"
S.Trade              = "T"
S.WorldDefense       = "WD"
S.Guild              = "g"
S.InstanceChat       = "i"
S.InstanceChatLeader = "I"
S.Officer            = "o"
S.Party              = "p"
S.PartyGuide         = "P"
S.PartyLeader        = "P"
S.Raid               = "r"
S.RaidLeader         = "R"
S.RaidWarning        = "W"
S.Say                = "s"
S.WhisperIncoming    = "w"
S.WhisperOutgoing    = "@"
S.Yell               = "y"

-- Miscellaneous
S.PET_BATTLE_COMBAT_LOG = "Battle"

-- Options Panel
L.All = "All"
L.Default = "Default"
L.CUSTOM = "Custom"
L.EnableArrows = "Enable arrow keys"
L.EnableArrows_Desc = "Enable arrow keys in the chat edit box."
L.EnableResizeEdges = "Enable resize edges"
L.EnableResizeEdges_Desc = "Enable resize controls at all edges of chat frames, instead of only the bottom right corner."
L.EnableSticky = "Sticky chat"
L.EnableSticky_Desc = "Set which chat types should be sticky."
L.FadeTime = "Fade time"
L.FadeTime_Desc = "Set the time, in minutes, to wait before fading chat text. A setting of 0 will disable fading."
L.FontSize = "Font size"
L.FontSize_Desc = "Set the font size for all chat frames."
L.FontSize_Note = "Note that this is just a shortcut to configuring each chat frame individually through the Blizzard chat options."
L.HideButtons = "Hide buttons"
L.HideButtons_Desc = "Hide the chat frame menu and scroll buttons."
L.HideFlash = "Hide tab flash"
L.HideFlash_Desc = "Disable the flashing effect on chat tabs that receive new messages."
L.HideNotices = "Hide notices"
L.HideNotices_Desc = "Hide channel notification messages."
L.HidePetCombatLog = "Disable pet battle log"
L.HidePetCombatLog_Desc = "Prevent the chat frame from opening a combat log for pet battles."
L.HideRepeats = "Hide repeats"
L.HideRepeats_Desc = "Hide repeated messages in public channels."
L.HideTextures = "Hide extra textures"
L.HideTextures_Desc = "Hide the extra textures on chat tabs and chat edit boxes added in patch 3.3.5."
L.LinkURLs = "Link URLs"
L.LinkURLs_Desc = "Transform URLs in chat into clickable links for easy copying."
L.LockTabs = "Lock docked tabs"
L.LockTabs_Desc = "Prevent docked chat tabs from being dragged unless the Shift key is down."
L.MoveEditBox = "Move edit boxes"
L.MoveEditBox_Desc = "Move chat edit boxes to the top their respective chat frames."
L.None = "None"
L.OptionLocked = "This option is locked by PhanxChat. Use the %q option in PhanxChat instead."
L.OptionLockedConditional = "This option is locked by PhanxChat. If you wish to change it, you must first disable the %q option in PhanxChat."
L.RemoveRealmNames = "Remove realm names"
L.RemoveRealmNames_Desc = "Shorten player names by removing realm names."
L.ReplaceRealNames = "Replace real names"
L.ReplaceRealNames_Desc = "Replace Real ID names and BattleTags with WoW character names when possible."
L.ShortenChannelNames = "Short channel names"
L.ShortenChannelNames_Desc = "Shorten channel names and chat strings."
L.ShortenRealNames = "Shorten real names"
L.ShortenRealNames_Desc = "Choose how to shorten Real ID names, if at all."
L.ShortenRealNames_UseBattleTag = "Replace with BattleTag"
L.ShortenRealNames_UseFirstName = "Show first name only"
L.ShortenRealNames_UseFullName = "Keep full name"
L.ShowClassColors = "Show class colors"
L.ShowClassColors_Desc = "Show class colors in all channels."
L.Whisper_BadTarget = "You can't whisper that target!"
L.Whisper_NoTarget = "You don't have a target to whisper!"
L.WhoStatus_Battlenet = "%s is currently in the Battle.net Desktop App."
L.WhoStatus_Offline = "%s is currently offline."
L.WhoStatus_PlayingOtherGame = "%s is currently playing %s."

------------------------------------------------------------------------
-- Simplified Chinese
-- Contributors: bone_cures, tss1398383123
-- Last updated: 2015-01-05
------------------------------------------------------------------------

if LOCALE == "zhCN" then

-- Channel Names
-- Must match the default channel names shown in your game client.
C.Conversation    = "对话"
C.General         = "综合"
C.LocalDefense    = "本地防务"
C.LookingForGroup = "寻求组队"
C.Trade           = "交易"
C.WorldDefense    = "世界防务"

-- Short Channel Names
-- Use the shortest abbreviations that make sense in your language.
S.Conversation    = "话"
S.General         = "综"
S.LocalDefense    = "本"
S.LookingForGroup = "寻"
S.Trade           = "交"
S.WorldDefense    = "世"

S.Guild              = "公"
S.InstanceChat       = "副本"
S.InstanceChatLeader = "副本首"
S.Officer            = "官"
S.Party              = "队"
S.PartyGuide         = "领队"
S.PartyLeader        = "队首"
S.Raid               = "团"
S.RaidLeader         = "领"
S.RaidWarning        = "团警"
S.Say                = "说"
S.WhisperIncoming    = "密自"
S.WhisperOutgoing    = "密往"
S.Yell               = "喊"

-- Miscellaneous
S.PET_BATTLE_COMBAT_LOG = PET_BATTLE_COMBAT_LOG -- default is ok

-- Options Panel
L.All = "所有"
L.Default = "默认"
L.CUSTOM = "自定义"
L.EnableArrows = "输入框中使用方向键"
L.EnableArrows_Desc = "允许在输入框中使用方向键。"
L.EnableResizeEdges = "开启边缘调整"
L.EnableResizeEdges_Desc = "开启聊天框边缘调整，而不只是在右下角调整。"
L.EnableSticky = "保持聊天频道与类型"
L.EnableSticky_Desc = "设定哪一聊天输出频道将被保持。"
L.FadeTime = "渐隐时间"
L.FadeTime_Desc = "设置文本消失时间，设为0将不消失。"
L.FontSize = "字体大小"
L.FontSize_Desc = "为所有聊天框设置字体大小。"
L.FontSize_Note = "注意，这只是链接到暴雪每个单独的聊天框设置的快捷方式。"
L.HideButtons = "隐藏按钮"
L.HideButtons_Desc = "隐藏聊天框菜单和滚动按钮。"
L.HideFlash = "隐藏标签闪烁"
L.HideFlash_Desc = "禁用聊天框收到消息后标签的闪烁效果。"
L.HideNotices = "隐藏警告"
L.HideNotices_Desc = "隐藏聊天框内的警告信息。"
L.HidePetCombatLog = "禁用宠物战斗纪录"
L.HidePetCombatLog_Desc = "阻止聊天框为一场宠物战斗开启战斗纪录。"
L.HideRepeats = "屏蔽重复信息"
L.HideRepeats_Desc = "屏蔽公共频道中的重复刷屏信息。"
L.HideTextures = "隐藏额外材质"
L.HideTextures_Desc = "隐藏在3.3.5中为聊天框标签和聊天输入框额外加入的材质。"
L.LinkURLs = "URL链接快速复制"
L.LinkURLs_Desc = "被点击的URL内容将被递交到聊天输入框以便复制。"
L.LockTabs = "隐藏附着标签"
L.LockTabs_Desc = "锁定已附着的聊天标签（按住Shift移动）。"
L.MoveEditBox = "移动聊天输入框"
L.MoveEditBox_Desc = "移动聊天输入框到该信息框顶部。"
L.None = "无"
L.OptionLocked = "此选项已被 PhanxChat 锁定。使用 PhanxChat 的 %q 选项代替。"
L.OptionLockedConditional = "此选项被 PhanxChat 锁定。如果你想改变设置，必须先在 PhanxChat 里禁用 %q 选项。"
L.RemoveRealmNames = "移除服务器名"
L.RemoveRealmNames_Desc = "移除玩家服务器名来缩短名字长度。"
L.ReplaceRealNames = "替换玩家实名"
L.ReplaceRealNames_Desc = "以玩家角色名替换显示战网实名。"
L.ShortenChannelNames = "缩短频道名"
L.ShortenChannelNames_Desc = "缩短频道名和聊天类型名。"
L.ShortenRealNames = "缩短玩家实名"
L.ShortenRealNames_Desc = "如果可行，选择如何去缩短玩家实名。"
L.ShortenRealNames_UseBattleTag = "用战网昵称代替"
L.ShortenRealNames_UseFirstName = "只显示角色名"
L.ShortenRealNames_UseFullName = "保持全名"
L.ShowClassColors = "显示职业颜色"
L.ShowClassColors_Desc = "在所有频道显示职业颜色。"
L.Whisper_BadTarget = "你无法密语此目标！"
L.Whisper_NoTarget = "你无法在没有目标时密语！"
L.WhoStatus_Battlenet = "%s 战网桌面客户端在线。"
L.WhoStatus_Offline = "%s 离线。"
L.WhoStatus_PlayingOtherGame = "%s 在线 %s。"

return end

------------------------------------------------------------------------
-- Traditional Chinese
-- Contributors: BNSSNB, yunrong
------------------------------------------------------------------------

if LOCALE == "zhTW" then

-- Channel Names
-- Must match the default channel names shown in your game client.
C.Conversation    = "對話"
C.General         = "綜合"
C.LocalDefense    = "本地防務"
C.LookingForGroup = "尋求組隊"
C.Trade           = "交易"
C.WorldDefense    = "世界防務"

-- Short Channel Names
-- Use the shortest abbreviations that make sense in your language.
S.Conversation    = "話"
S.General         = "綜"
S.LocalDefense    = "本"
S.LookingForGroup = "尋"
S.Trade           = "交"
S.WorldDefense    = "世"

S.Guild              = "公"
S.InstanceChat       = "副"
S.InstanceChatLeader = "領"
S.Officer            = "官"
S.Party              = "隊"
S.PartyGuide         = "領"
S.PartyLeader        = "領"
S.Raid               = "團"
S.RaidLeader         = "領"
S.RaidWarning        = "警"
S.Say                = "說"
S.WhisperIncoming    = "自"
S.WhisperOutgoing    = "往"
S.Yell               = "喊"

-- Miscellaneous
S.PET_BATTLE_COMBAT_LOG = PET_BATTLE_COMBAT_LOG -- default is ok

-- Options Panel
L.All = "所有"
L.Default = "預設"
L.CUSTOM = "自訂"
L.EnableArrows = "輸入框中使用方向鍵"
L.EnableArrows_Desc = "允許在輸入框中使用方向鍵。"
L.EnableResizeEdges = "開啟邊緣調整"
L.EnableResizeEdges_Desc = "開啟聊天框邊緣調整，而不只是在右下角調整。"
L.EnableSticky = "保持聊天頻道與類型"
L.EnableSticky_Desc = "設定哪一聊天輸出頻道將被保持。"
L.FadeTime = "漸隱時間"
L.FadeTime_Desc = "設置文字消失時間，以分為單位，設為0將不消失。"
L.FontSize = "字體大小"
L.FontSize_Desc = "為所有聊天框設置字體大小。"
L.FontSize_Note = "注意，這只是連結到暴雪每個單獨的聊天框設置的快捷方式。"
L.HideButtons = "隱藏按鈕"
L.HideButtons_Desc = "隱藏聊天視窗選單和滾動按鈕。"
L.HideFlash = "隱藏標籤閃爍"
L.HideFlash_Desc = "禁用聊天框收到消息後標籤的閃爍效果。"
L.HideNotices = "隱藏警告"
L.HideNotices_Desc = "隱藏聊天框內的警告訊息。"
--L.HidePetCombatLog = "Disable pet battle log"
--L.HidePetCombatLog_Desc = "Prevent the chat frame from opening a combat log for pet battles."
L.HideRepeats = "隱藏重複訊息"
L.HideRepeats_Desc = "隱藏公共頻道中的重複刷頻訊息。"
L.HideTextures = "隱藏額外材質"
L.HideTextures_Desc = "隱藏在3.3.5中為聊天框標籤和聊天輸入框額外加入的材質。"
L.LinkURLs = "URL連結快速複製"
L.LinkURLs_Desc = "轉換聊天中的URL為可點擊的連結以便複製。"
L.LockTabs = "鎖定附著標籤"
L.LockTabs_Desc = "鎖定已附著的聊天標籤（按住Shift移動）。"
L.MoveEditBox = "移動聊天輸入框"
L.MoveEditBox_Desc = "移動聊天輸入框到該訊息框頂部。"
L.None = "無"
L.OptionLocked = "此選項已由PhanxChat鎖定。使用PhanxChat中的 %q 選項來替代。"
L.OptionLockedConditional = "此選項已由PhanxChat鎖定。如果你想要改動，你必須先取消PhanxChat中 %q 的選項。"
L.RemoveRealmNames = "移除伺服器名稱"
L.RemoveRealmNames_Desc = "移除伺服器名稱以縮短玩家名稱。"
L.ReplaceRealNames = "替換玩家實名"
L.ReplaceRealNames_Desc = "以玩家角色名取代顯示戰網ID。"
L.ShortenChannelNames = "縮短頻道名"
L.ShortenChannelNames_Desc = "縮短頻道名和聊天類型名。"
L.ShortenRealNames = "縮短玩家實名"
L.ShortenRealNames_Desc = "選擇如何縮短玩家實名，如果是所有。"
L.ShortenRealNames_UseBattleTag = "替換為BattleTag"
L.ShortenRealNames_UseFirstName = "僅顯示姓"
L.ShortenRealNames_UseFullName = "保留全名"
L.ShowClassColors = "顯示職業顏色"
L.ShowClassColors_Desc = "顯示職業顏色在所有頻道。"
L.Whisper_BadTarget = "你無法密語目標! "
L.Whisper_NoTarget = "你沒有目標可密語!"
--L.WhoStatus_Battlenet = "%s is currently in the Battle.net Desktop App."
L.WhoStatus_Offline = "%s 目前為離線。"
L.WhoStatus_PlayingOtherGame = "%s 目前正在玩 %s。"

return end
