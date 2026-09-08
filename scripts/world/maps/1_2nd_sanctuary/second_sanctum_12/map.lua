---@class Map.dark_place : Map
local map, super = Class(Map, "second_sanctum_12")

function map:init(world, data)
	super.init(self, world, data)
end

function map:update()
	super.update(self)
	local a4 = 0
	local layer = self:getTileLayer("tiles_floating_platform")
	local event = self:getEvent(20)
	a4 = ((layer.init_y + 8) - layer.init_y) * 0.5
	layer.y = layer.init_y + a4 + (math.sin((Kristal.getTime() / 2) * (2 * math.pi)) * a4)
	event.y = event.init_y + a4 + (math.sin((Kristal.getTime() / 2) * (2 * math.pi)) * a4)
end

return map