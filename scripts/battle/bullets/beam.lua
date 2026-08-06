local Beam, super = Class(Bullet)

function Beam:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/beam")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 0
    self:setScale(2)
    self.damage = 0
    self.time = 3
    self.destroy_on_hit = false
end

function Beam:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if self.time > 0 then
        self.time = self.time - 0.5
    elseif self.time <= 0 then
        self.damage = 30
    end
    super.update(self)
    self.rotation = self.physics.direction
end

return Beam