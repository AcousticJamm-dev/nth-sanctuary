local TestBullet, super = Class(WorldBullet)

function TestBullet:init(x, y, flip, flip2)
    super.init(self, x, y, "world/culteye")
    self.alpha = 0
    self:fadeToSpeed(1, 0.1)
    self:setOrigin(0.5)
    self.sprite:setOrigin(0.5)
    
    self:setParallax(0)
    self.sprite.graphics.spin = 0.1
    self.sprite:setScale(4)
    self.sprite.graphics.grow = -0.1
    self.timer = Timer()
    self.timer:after(1, function()
            self:remove()
            for i = 1, 5 do
                local b = Game.world:spawnBullet("gravitybullet", self.x + Game.world.camera.x - 320, self.y + Game.world.camera.y - 240)
            end
    end)
end

function TestBullet:getDrawColor()
    local r, g, b, a = super.getDrawColor(self)
    if self.battle_fade then
        return r, g, b, a * self.world.battle_alpha
    else
        return r, g, b, a
    end
end

function TestBullet:update()
    super.update(self)
    self.timer:update()
end

return TestBullet