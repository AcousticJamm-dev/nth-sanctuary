---@class Map.citadel_room_3 : Map
local map, super = Class(Map, "citadel_room_3")

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    if Game:getFlag("belch") then
        local mason = Game.world:getCharacter("mason")
        mason:setSprite("fell")
    end
end

function map:draw()
    super.draw(self)
end

return map