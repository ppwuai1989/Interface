local DEBUG = false
SlashCmdList["YAIAPFIX"] = function()
	DEBUG = not DEBUG
	print("|c00ff0000YAIAP|r: Debug = "..tostring(DEBUG))
end
SLASH_YAIAPFIX1 = "/yaiap"

local old = SendAddonMessage

local t = {["pvp"] = true, ["arena"] = true, ["raid"] = true, ["party"] = true}

local function fix(pre, msg, ch, ...)
	local _, loc = IsInInstance()
	local chl = strlower(ch)
	if t[loc] and t[chl] then
		if DEBUG == true then 
			print("|c00ff0000YAIAP|r: prefix = |c0000ff00"..pre.."|r: debugstack = "..debugstack(3, 4, 0))
		end
		return
	end
	old(pre, msg, ch, ...)
end

SendAddonMessage = fix