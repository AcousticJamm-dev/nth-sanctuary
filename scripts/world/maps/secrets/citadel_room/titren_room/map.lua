---@class Map.titren_room : Map
local map, super = Class(Map, "titren_room")

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    if Game:getFlag("fought_titren") then return end
    local t = Game.world.map:getEvent(3)
    t.sprite:setOrigin(0.5)
    t:setScale(1)
end

function map:draw()
    super.draw(self)
end

return map