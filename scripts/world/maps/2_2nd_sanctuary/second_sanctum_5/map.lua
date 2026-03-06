---@class Map.dark_place : Map
local map, super = Class(Map, "second_sanctum_5")

function map:onEnter()
	self.world.camera:setBounds(0, 0, 30 * self.tile_width, self.height * self.tile_height)
end

function map:onExit()
	self.world.camera:setBounds()
end

return map