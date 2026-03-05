---@class Map.base_sanctum_center : Map
local map, super = Class(Map, "0_base_sanctum/base_sanctum_center")

function map:onEnter()
	Game.world:loadMap("0_base_sanctum/base_center") -- Go to new map name
end

return map
