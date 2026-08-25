local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self:setSoulPosition(300, 140)
    self.time = 15
end

function Basic:onStart()
    -- Every 0.33 seconds...
    local x, y = Game.battle.arena:getCenter()
    local g = self:spawnBullet("bigeye", x, y, 0, 0, 0)

    self.timer:tween(5, g, {spinfactor = 4}, 'in-sine')
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic