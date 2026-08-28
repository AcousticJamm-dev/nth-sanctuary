local SmallStar, super = Class(Bullet)

function SmallStar:init(x, y, dir, speed, spinfactor)
    super.init(self, x, y, "bullets/bigeye")
    self:setOrigin(0.5)
    self.physics.direction = dir
    self.physics.speed = speed
    self.collider = PolygonCollider(self, {
        {0, 50},
        {38, 45},
        {45, 38},
        {50, 0},
        {55, 38},
        {62, 45},
        {100, 50},
        {62, 55},
        {55, 62},
        {50, 100},
        {45, 62},
        {38, 55},
        {0, 50},
        {38, 45}
    })
    self.spinfactor = spinfactor or 1
    self.alpha = 0
    self:fadeToSpeed(1)

    self.destroy_on_hit = false
end

function SmallStar:update()
    self.rotation = self.rotation + (math.rad(self.spinfactor)*DTMULT)
    super.update(self)
end

return SmallStar