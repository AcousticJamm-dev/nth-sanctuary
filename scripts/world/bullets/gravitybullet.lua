local TestBullet, super = Class(WorldBullet)

function TestBullet:init(x, y)
    super.init(self, x, y, "world/bullets/tinystar")

    self:setOrigin(0.5)
    self.sprite:setOrigin(0.5)

    self.sprite.graphics.spin = 0.2

    if flip then
        self.flip_x = true
        self.physics.direction = math.pi
    end
    if flip2 then
        self.physics.direction = math.rad(90)
        self.rotation = math.rad(90)
    end

    self.damage = 20

    self.physics.speed_y = -7
    self.physics.speed_x = love.math.random(-5, 5)+8
    self.physics.gravity = 0.56

    self.alpha = 1

    self.start_x = x
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
    if self.y > 1200 then
        self:remove()
    end
end

return TestBullet