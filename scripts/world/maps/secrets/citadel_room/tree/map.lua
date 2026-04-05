---@class Map.tree : Map
local map, super = Class(Map, "tree")

function map:init(world, data)
    super.init(self, world, data)
end
local h = HSVShiftFX()
h.hue_start = 220
h.hue_target = 220


function map:onEnter()
    super.onEnter(self)
    Game.world.map.events_by_name["prophecy"][1]:addFX(h)
    	for _, follower in ipairs(Game.world.followers) do
		follower.visible = false
	end
end

function map:onLeave()
    Game.world.map.events_by_name["prophecy"][1]:removeFX(h)
end

function map:draw()
    super.draw(self)
end

return map