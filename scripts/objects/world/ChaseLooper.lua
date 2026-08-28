---@class ChaseLooper: Event
---@field warp_x number *[Property `warpx`]* X offset to apply to the player
---@field warp_count number *[Property `warpcount`]* X offset to apply to the player
---@field done_flag string? *[Property `doneflag`]* Flag to set on completion
---@field private total_warp_x number
---@overload fun(): ChaseLooper
local ChaseLooper, super = Class(Event, "ChaseLooper")
---@cast super Event

function ChaseLooper:init(x, y, width, height, properties)
    super.init(self, x, y, width, height)
    properties = properties or {}
    self.warp_x = properties.warpx or 0
    self.warp_count = properties.warpcount or 0
    self.done_flag = properties.doneflag
    self.total_warp_x = 0
end

function ChaseLooper:onEnter(player)
    if not player:includes(Player) then
        return
    end
    if self.done_flag and Game:getFlag(self.done_flag) then
        return
    end
    self.warp_count = self.warp_count - 1
    self.total_warp_x = self.total_warp_x + self.warp_x
    if self.warp_count <= 0 then
        if self.done_flag then
            Game:setFlag(self.done_flag, true)
        end
        return
    end
    player.x = player.x + self.warp_x
    for _, char in ipairs(Game.world.followers) do
        for i, hist in ipairs(char.history) do
            hist.x = hist.x + self.warp_x
        end
    end
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
    for _, obj in ipairs(Game.stage:getObjects(TileObject)) do
        obj.x = obj.init_x + (self.total_warp_x * ((obj.parallax_x or 1))) % obj.width
    end
end

return ChaseLooper
