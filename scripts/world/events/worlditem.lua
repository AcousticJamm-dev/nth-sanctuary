local WorldItem, super = Class(Event, "worlditem")

function WorldItem:init(data)
    super.init(self, data)

    self.properties = data.properties or {}
    self.once = self.properties.once or false
    self.shard = self.properties["shard"] or false
    self.shard_id = self.properties["shardid"] or 0

    self.solid = true

    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/worlditem/shine", 1/6)

    local width, height = self:getSize()
    self:setHitbox(0, math.ceil(height / 4) * 2, width, math.floor(height / 4) * 2)
end

function WorldItem:getDebugInfo()
    local info = super.getDebugInfo(self)
    table.insert(info, "Is Dark Shard: " .. (self.shard and "True" or "False"))
    table.insert(info, "Dark Shard ID: " .. self.shard_id)
    return info
end

function WorldItem:update()
    super.update(self)
end

function WorldItem:onInteract(player, dir)
    --Assets.playSound("splat")
    if self.shard then
        Game.world:startCutscene(function (cutscene)
            cutscene:text("* You found a [color:9999ff]Dark Shard[color:white].")
            Mod:setDarkShard(self.shard_id, true)
            --[[cutscene:text("* ...but WorldItem doesn't have a way to specify the dark shard ID.")
            cutscene:text("* Maybe dark shards on the ground should be a different object entirely.")]]
        end)
    end
    if self.once then
        self:remove()
    end

end

function WorldItem:onAdd(parent)
    super.onAdd(self, parent)
    if self.once and self:getFlag("used_once", false) then
        self:remove()
    end
end

return WorldItem
