--[[
	if (IsAddOnLoaded("ClassButtons")) then return else
		LoadAddOn("ClassButtons");
	end
]]
local _, class = UnitClass("player")
--[[
if (class == "WARLOCK") then

end
]]
--[[
if (class == "DEATHKNIGHT") then
	if (IsAddOnLoaded("RuneItAll")) then return else
		LoadAddOn("RuneItAll");
	end
end
]]
--[[
if (class == "WARRIOR") then

end
]]
--[[
if (class == "HUNTER") then

end
]]
--[[
if (class == "MAGE") then
	if (IsAddOnLoaded("Decursive")) then return else
		LoadAddOn("Decursive");
	end
end
]]
--[[
if (class == "PRIEST") then
	if (IsAddOnLoaded("Decursive")) then return else
		LoadAddOn("Decursive");
	end
end
]]
--[[
if (class == "DRUID") then
	if (IsAddOnLoaded("ComboPoints")) then return else
		LoadAddOn("ComboPoints");
	end
	if (IsAddOnLoaded("Decursive")) then return else
		LoadAddOn("Decursive");
	end
end
]]
--[[
if (class == "PALADIN") then
	if (IsAddOnLoaded("Decursive")) then return else
		LoadAddOn("Decursive");
	end
end
]]
--[[
if (class == "SHAMAN") then
	if (IsAddOnLoaded("Decursive")) then return else
		LoadAddOn("Decursive");
	end
end
]]
--[[
if (class == "ROGUE") then
	if (IsAddOnLoaded("ComboPoints")) then return else
		LoadAddOn("ComboPoints");
	end
end
]]
