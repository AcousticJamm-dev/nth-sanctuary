local SmallStar, super = Class(Bullet)

function SmallStar:init(x, y, dir, speed)
    super.init(self, x, y, "world/bullets/outlinestar")
    self.physics.direction = dir
    self.physics.speed = speed
end

function SmallStar:update()
    self.rotation = self.rotation + 0.1
    super.update(self)
end

return SmallStar