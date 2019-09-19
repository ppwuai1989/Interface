function ChatEdit_CustomTabPressed()
	if  (this:GetAttribute("chatType") == "SAY")  then
		if (GetNumPartyMembers()>0) then
			this:SetAttribute("chatType", "PARTY");
			ChatEdit_UpdateHeader(this);
		elseif (GetNumRaidMembers()>0) then
			this:SetAttribute("chatType", "RAID");
			ChatEdit_UpdateHeader(this);
		elseif (GetNumBattlefieldScores()>0) then
			this:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(this);
		elseif (IsInGuild()) then
			this:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(this);
		else
			return;
		end
	elseif (this:GetAttribute("chatType") == "PARTY") then
		if (GetNumRaidMembers()>0) then
			this:SetAttribute("chatType", "RAID");
			ChatEdit_UpdateHeader(this);
		elseif (GetNumBattlefieldScores()>0) then
			this:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(this);
		elseif (IsInGuild()) then
			this:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(this);
		else
			this:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(this);
		end
	elseif (this:GetAttribute("chatType") == "RAID") then
		if (GetNumBattlefieldScores()>0) then
			this:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(this);
		elseif (IsInGuild()) then
			this:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(this);
		else
			this:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(this);
		end
	elseif (this:GetAttribute("chatType") == "BATTLEGROUND") then
		if (IsInGuild) then
			this:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(this);
		else
			this:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(this);
		end
	elseif (this:GetAttribute("chatType") == "GUILD") then
		this:SetAttribute("chatType", "SAY");
		ChatEdit_UpdateHeader(this);
	end
end
