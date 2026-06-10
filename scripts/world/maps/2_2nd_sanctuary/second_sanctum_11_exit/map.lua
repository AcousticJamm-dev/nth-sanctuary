---@class Map.dark_place : Map
local map, super = Class(Map, "second_sanctum_11_exit")

function map:onEnter()
    super.onEnter(self)
	for _, follower in ipairs(Game.world.followers) do
		follower.visible = false
	end
end

return map