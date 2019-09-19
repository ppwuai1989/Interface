
local _, L = ...

L.spamBlocked = "BadBoy: Spam blocked"
L.clickToReport = "|cffeda55fClick|r to report, |cffeda55fAlt-Click|r to dismiss."
L.spamTooltip = "Show spam in button tooltip"
L.noAnimate = "Disable button pulse animation"
L.frequentButton = "Show the button more frequently"
L.frequentButtonTip = "To reduce player annoyance the report button will not always show.\nEnable this to always show the button asking to report and show it faster."

local loc = GetLocale()
if loc == "zhTW" then
	L.spamBlocked = "BadBoy: 垃圾訊息已被阻擋"
	L.clickToReport = "|cffeda55f左鍵|r 報告, |cffeda55fAlt-左鍵|r 消除"
	L.spamTooltip = "在滑鼠提示中顯示垃圾資訊"
	L.noAnimate = "禁用按鈕跳動動畫"
	L.frequentButton = "更頻繁地顯示按鈕"
	L.frequentButtonTip = "為了減少玩家的煩惱，報告按鈕並不總是顯示.\n啟用這個會總是顯示按的請求報告"
elseif loc == "zhCN" then
	L.spamBlocked = "BadBoy: 垃圾信息已被拦截"
	L.clickToReport = "|cffeda55f左键|r 报告, |cffeda55fAlt-左键|r 消除"
	L.spamTooltip = "在鼠标提示中显示垃圾信息"
	L.noAnimate = "禁用按钮跳动动画"
	L.frequentButton = "更频繁地显示按钮"
	L.frequentButtonTip = "为了减少玩家的烦恼，报告按钮并不总是显示.\n启用这个会总是显示按的请求报告"
end
