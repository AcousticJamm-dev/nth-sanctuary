---@class ChaseLooper: Event
---@field warp_x number *[Property `warpx`]* X offset to apply to the player
---@field warp_count number *[Property `warpcount`]* X offset to apply to the player
---@field done_flag string *[Property `doneflag`]* Flag to set on completion
---@overload fun(): ChaseLooper
local ChaseLooper, super = Class(Event, "ChaseLooper")
---@cast super Event

function ChaseLooper:init(x, y, width, height, properties)
    super.init(self, x, y, width, height)
    properties = properties or {}
    self.warp_x = properties.warpx or 0
    self.warp_count = properties.warpcount or 0
    self.done_flag = properties.doneflag
end

function ChaseLooper:onEnter(player)
    if Game:getFlag(self.done_flag) then
        return
    end
    self.warp_count = self.warp_count - 1
    if self.warp_count <= 0 then
        return Game:setFlag(self.done_flag, true)
    end
    player.x = player.x + self.warp_x
    for _, bullet in ipairs(Game.world.bullets) do
        if bullet.id == "gravitybullet" then
            bullet.x = bullet.x + self.warp_x
        end
    end
    for _, obj in ipairs(Game.stage:getObjects(DamageNumber)) do
        obj.x = obj.x + self.warp_x
    end
    for _, obj in ipairs(Game.stage:getObjects(Registry.getLegacyEvent("churchfog"))) do
        obj.x = obj.x + self.warp_x
    end
end

return ChaseLooper
