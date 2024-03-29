-- Aura Icons indicator

local Grid2 = Grid2
local min = min
local pairs = pairs
local ipairs = ipairs
local format = string.format

local function Icon_Create(self, parent)
	local f = self:CreateFrame("Frame", parent)
	f.myIndicator = self
	f.myFrame = parent
	f.auras = f.auras or {}
	f.visibleCount = 0
end

-- Warning: This is an overrided indicator:Update() NOT the standard indicator:OnUpdate()
local function Icon_OnFrameUpdate(f)
	local unit = f.myFrame.unit
	if not unit then return end
	local self = f.myIndicator
	local max = self.maxIcons
	local auras = f.auras
	local showStack = self.showStack
	local showCool = self.showCooldown
	local useStatus = self.useStatusColor
	local i = 1
	for _, status in ipairs(self.statuses) do
		if status:IsActive(unit) then
			if status.GetIcons then
				local auras = f.auras
				local k, textures, counts, expirations, durations, colors = status:GetIcons(unit)
				for j=1,k do
					local aura = auras[i]
					aura.icon:SetTexture(textures[j])
					if showStack then
						local count = counts[j]
						aura.text:SetText(count>1 and count or "")
					end
					if showCool then
						local expiration, duration = expirations[j], durations[j]
						aura.cooldown:SetCooldown(expiration - duration, duration)
					end
					if useStatus then
						local c = colors[j]
						aura:SetBackdropBorderColor(c.r,c.g,c.b, min(c.a,self.borderOpacity) )
					end
					aura:Show()
					i = i + 1
					if i>max then break end
				end
			else
				local aura = auras[i]
				aura.icon:SetTexture(status:GetIcon(unit))
				aura.icon:SetTexCoord(status:GetTexCoord(unit))
				aura.icon:SetVertexColor(status:GetVertexColor(unit))
				if showStack then
					local count = status:GetCount(unit)
					aura.text:SetText(count>1 and count or "")
				end
				if showCool then
					local expiration, duration = status:GetExpirationTime(unit) or 0, status:GetDuration(unit) or 0
					aura.cooldown:SetCooldown(expiration - duration, duration)
				end
				if useStatus then
					local r,g,b,a = status:GetColor(unit)
					aura:SetBackdropBorderColor(r,g,b, min(a,self.borderOpacity) )
				end
				aura:Show()
				i = i + 1
			end
			if i>max then break end
		end
	end
	for j=i,f.visibleCount do
		auras[j]:Hide()
	end
	f.visibleCount = i-1
	f:SetShown(i>1)
end

-- Delayed updates
local count = 0
local updates = {}
local EnableDelayedUpdates = function()
	CreateFrame("Frame", nil, Grid2LayoutFrame):SetScript("OnUpdate", function()
		for i=1,#updates do
			count = count + 1
			Icon_OnFrameUpdate(updates[i])
		end
		wipe(updates)
	end)
	EnableDelayedUpdates = Grid2.Dummy
end

local function Icon_Update(self, parent)
	updates[#updates+1] = parent[self.name]
end

local function Icon_Layout(self, parent)
	local f = parent[self.name]
	local x,y   = 0,0
	local ux,uy = self.ux,self.uy
	local vx,vy = self.vx,self.vy
	local size  = self.iconTotSize
	local borderSize = self.borderSize
	local frameName
	if not self.dbx.disableOmniCC then
		local i,j  = parent:GetName():match("Grid2LayoutHeader(%d+)UnitButton(%d+)")
		frameName  = format( "Grid2Icons%s%02d%02d", self.name:gsub("%-","") , i, j )
	end
	f:SetParent(parent)
	f:ClearAllPoints()
	f:SetPoint(self.anchor, parent.container, self.anchorRel, self.offsetx, self.offsety)
	f:SetFrameLevel(parent:GetFrameLevel() + self.frameLevel)
	f:SetSize( self.width, self.height )
	local auras = f.auras
	for i=1,self.maxIcons do
		local frame = auras[i]
		if not frame then
			frame = CreateFrame("Frame", nil, f)
			frame.icon = frame:CreateTexture(nil, "ARTWORK")
			frame.text = frame:CreateFontString(nil, "OVERLAY")
			frame.cooldown = CreateFrame("Cooldown", frameName and frameName..i or nil, frame, "CooldownFrameTemplate")
			frame.cooldown:SetHideCountdownNumbers(true)
			auras[i] = frame
		end
		frame:SetSize( self.iconSize, self.iconSize )
		-- frame container
		Grid2:SetFrameBackdrop(frame, self.backdrop)
		if borderSize>0 then
			local c = self.colorBorder
			frame:SetBackdropBorderColor(c.r,c.g,c.b,c.a)
		end
		frame:ClearAllPoints()
		frame:SetPoint( self.anchorIcon, f, self.anchorIcon, (x*ux+y*vx)*size, (x*uy+y*vy)*size )
		-- stack count text
		if self.showStack then
			local text = frame.text
			text:SetFontObject(GameFontHighlightSmall)
			text:SetFont(self.font, self.fontSize, self.fontFlags )
			local c = self.colorStack
			text:SetTextColor(c.r, c.g, c.b, c.a)
			text:ClearAllPoints()
			text:SetPoint(self.fontPoint, self.fontOffsetX, self.fontOffsetY)
			text:Show()
		else
			frame.text:Hide()
		end
		-- cooldown animation
		if self.showCooldown then
			frame.cooldown:SetDrawEdge(self.dbx.disableOmniCC~=nil)
			frame.cooldown.noCooldownCount = self.dbx.disableOmniCC
			frame.cooldown:SetReverse(self.dbx.reverseCooldown)
			frame.cooldown:SetAllPoints()
			frame.cooldown:Show()
		else
			frame.cooldown:Hide()
		end
		-- icon texture
		frame.icon:SetPoint("TOPLEFT",     frame ,"TOPLEFT",  borderSize, -borderSize)
		frame.icon:SetPoint("BOTTOMRIGHT", frame ,"BOTTOMRIGHT", -borderSize, borderSize)
		frame.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		--
		frame:Hide()
		x = x + 1
		if x>=self.maxIconsPerRow then x = 0; y = y + 1 end
	end
end

local function Icon_Disable(self, parent)
	local f = parent[self.name]
	f:Hide()
	f:SetParent(nil)
	f:ClearAllPoints()
end

local pointsX = { TOPLEFT =  1,	TOPRIGHT = -1, BOTTOMLEFT = 1, BOTTOMRIGHT = -1 }
local pointsY = { TOPLEFT = -1, TOPRIGHT = -1, BOTTOMLEFT = 1, BOTTOMRIGHT =  1 }
local function Icon_UpdateDB(self)
	local dbx = self.dbx
	local theme = Grid2Frame.db.profile
	-- location
	local l = dbx.location
	self.anchor     = l.point
	self.anchorRel  = l.relPoint
	self.offsetx    = l.x
	self.offsety    = l.y
	self.anchorIcon = (pointsX[self.anchor] and self.anchor) or (self.anchor=="BOTTOM" and "BOTTOMLEFT") or (self.anchor=="RIGHT" and "TOPRIGHT") or "TOPLEFT"
	-- misc variables
	self.borderSize     = dbx.borderSize or 0
	self.orientation    = dbx.orientation or "HORIZONTAL"
	self.frameLevel     = dbx.level or 1
	self.iconSize       = dbx.iconSize or theme.iconSize or 14
	self.iconSpacing    = dbx.iconSpacing or 1
	self.maxIcons       = dbx.maxIcons or 6
	self.maxIconsPerRow = dbx.maxIconsPerRow or 3
	self.iconTotSize    = self.iconSize + self.iconSpacing
	local maxRows = math.floor(self.maxIcons/self.maxIconsPerRow) + (self.maxIcons%self.maxIconsPerRow==0 and 0 or 1)
	self.uy     = 0
	self.vx     = 0
	self.ux     = pointsX[self.anchorIcon]
	self.vy     = pointsY[self.anchorIcon]
	self.width  = math.abs(self.ux)*self.iconTotSize*self.maxIconsPerRow
	self.height = math.abs(self.vy)*self.iconTotSize*maxRows
	if self.orientation=="VERTICAL" then
		self.ux, self.vx = self.vx, self.ux
		self.uy, self.vy = self.vy, self.uy
		self.width, self.height = self.height,self.width
	end
	self.showCooldown    = not dbx.disableCooldown
	self.showStack       = not dbx.disableStack
	self.useStatusColor  = dbx.useStatusColor
	self.borderOpacity   = dbx.borderOpacity  or 1
	self.colorBorder     = Grid2:MakeColor(dbx.color1, "WHITE")
	self.colorStack      = Grid2:MakeColor(dbx.colorStack, "WHITE")
	-- stacks text
	local jV,jH = dbx.fontJustifyV or 'MIDDLE', dbx.fontJustifyH or 'CENTER'
	self.fontPoint       = (jV=='MIDDLE' and jH) or (jH=='CENTER' and jV) or jV..jH
	self.fontOffsetX     = dbx.fontOffsetX or 0
	self.fontOffsetY     = dbx.fontOffsetY or 0
	self.fontFlags       = dbx.fontFlags or "OUTLINE"
	self.fontSize        = dbx.fontSize or 9
	self.font            = Grid2:MediaFetch("font", dbx.font or theme.font) or STANDARD_TEXT_FONT
	-- backdrop
	self.backdrop = self.borderSize>0 and Grid2:GetBackdropTable("Interface\\Addons\\Grid2\\media\\white16x16", self.borderSize) or nil
end

Grid2.setupFunc["icons"] = function(indicatorKey, dbx)
	local indicator = Grid2.indicators[indicatorKey] or Grid2.indicatorPrototype:new(indicatorKey)
	indicator.dbx      = dbx
	indicator.Create   = Icon_Create
	indicator.Layout   = Icon_Layout
	indicator.OnUpdate = Icon_OnUpdate
	indicator.Disable  = Icon_Disable
	indicator.Update   = Icon_Update
	indicator.UpdateDB = Icon_UpdateDB
	Icon_UpdateDB(indicator)
	EnableDelayedUpdates()
	Grid2:RegisterIndicator(indicator, { "icon", "icons" })
	return indicator
end
