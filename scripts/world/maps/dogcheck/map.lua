---@class Map.dark_place : Map
local map, super = Class(Map, "dogcheck/dogcheck")

function map:init(world, data)
    super.init(self, world, data)

end

function map:onEnter()
	local cam = Game.world.camera
    cam.zoom_x = 2
    cam.zoom_y = 2
    cam.ox = -160
    cam.oy = 120
	--_prophecy = instance_create(camerax() + 160, cameray() + 120, 115);
end

function map:onExit()
	local cam = Game.world.camera
    cam.zoom_x = 1
    cam.zoom_y = 1
    cam.ox = 0
    cam.oy = 0
end

return map
