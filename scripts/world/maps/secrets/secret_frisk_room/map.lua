---@class Map.dark_place : Map
local map, super = Class(Map, "secrets/secret_frisk_room")

function map:init(world, data)
    super.init(self, world, data)
    
end

function map:onEnter()
	for _, event in ipairs(self.events) do
		if event.layer == self.layers["objects_parallax"] then
			 event.parallax_x = 0.5
		end
	end
end

return map