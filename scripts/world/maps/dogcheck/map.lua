---@class Map.dark_place : Map
local map, super = Class(Map, "dogcheck/dogcheck")

function map:init(world, data)
    super.init(self, world, data)

end

function map:onEnter()
	local cam = Game.world.camera
	Game.world.timer:tween(0, cam, {zoom_y = 2, zoom_x = 2, ox = -160, oy = 120}, 'linear')
	--_prophecy = instance_create(camerax() + 160, cameray() + 120, 115);
end

function map:onExit()
	local cam = Game.world.camera
	Game.world.timer:tween(0, cam, {zoom_y = 1, zoom_x = 1, ox = 0, oy = 0}, 'linear')
end

return map
