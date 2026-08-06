local TestBullet, super = Class(Bullet)
function TestBullet:init(x, y)
    super.init(self, x, y, "world/bullets/tinystar")

    self:setOrigin(0.5)

    self.graphics.spin = 0.2

    self.damage = 20

    self.physics.speed_y = -7
    self.physics.speed_x = love.math.random(-5, 5)
    self.physics.gravity = 0.5

    self.alpha = 1

    self.start_x = x
end
return TestBullet
