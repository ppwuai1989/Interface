
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(frame, _, addon)
	if addon ~= "BadBoy_CCleaner" then return end
	if type(BADBOY_CCLEANER) ~= "table" then
		BADBOY_CCLEANER = {
			"1-60",
			"极速",
			"站桩",
			"老板",
			"代刷",
			"代打",
			"躺尸",
			"消费",
			"vx",
			"马云",
			"老牌",
			"V信",
			"支付宝",
			"V信",
			"小魏",
			"皇冠",
			"好评",
			"金币",
			"一键",
			"淘宝",
			"TB",
			"速练",
			"QQ",
			"满级",
			"实惠",
			"纯手工",
			"三本毕业",
			"上号代",
			"上号打金",
			"专业带",
			"专机",
			"代价",
			"先练后付",
			"分钟一把",
			"包赔",
			"单带一个",
			"双法",
			"双法代刷",
			"咨询",
			"工作室",
			"带刷★",
			"接活",
			"有偿",
			"极速升"
		}
	end

	local Ambiguate, prevLineId, result, BADBOY_CCLEANER = Ambiguate, 0, nil, BADBOY_CCLEANER
	local BadBoyIsFriendly = BadBoyIsFriendly

	--main filtering function
	local filter = function(_,event,msg,player,_,_,_,flag,chanid,_,_,_,lineId,guid)
		if lineId == prevLineId then
			return result
		else
			prevLineId, result = lineId, nil
			local trimmedPlayer = Ambiguate(player, "none")
			if event == "CHAT_MSG_CHANNEL" and (chanid == 0 or type(chanid) ~= "number") then return end --Only scan official custom channels (gen/trade)
			if BadBoyIsFriendly(trimmedPlayer, flag, lineId, guid) then return end
			local lowMsg = msg:lower() --lower all text
			for i=1, #BADBOY_CCLEANER do --scan DB for matches
				if lowMsg:find(BADBOY_CCLEANER[i], nil, true) then
					if BadBoyLog then BadBoyLog("CCleaner", event, trimmedPlayer, msg) end
					result = true
					return true --found a trigger, filter
				end
			end
		end
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", filter)

	frame:SetScript("OnEvent", nil)
	frame:UnregisterEvent("ADDON_LOADED")
end)

