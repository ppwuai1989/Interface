
local _, L = ...

L.addPlayer = "Add Player"
L.removePlayer = "Remove Player"

local loc = GetLocale()
if loc == "zhTW" then
    L.addPlayer = "添加玩家"
    L.removePlayer = "刪除玩家"
elseif loc == "zhCN" then
    L.addPlayer = "添加玩家"
    L.removePlayer = "删除玩家"
end
