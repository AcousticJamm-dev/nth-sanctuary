local SnowVeilCloud, super = Class(Object)

function SnowVeilCloud:init(x, y)
    super.init(self, x, y)
	self.timer = 0
	self.fading_out = false
	self.physics.speed = MathUtils.random(2, 4)
	-- 90 is straight down, so let's add random 20 to lower and upper bound
	self.physics.direction = math.rad(MathUtils.random(70, 110))
end

function SnowVeilCloud:update()
	self.timer = self.timer + DTMULT
	if self.timer >= 25 then
		self.fading_out = true
	end

	if self.fading_out then
		self.alpha = self.alpha - 0.15 * DTMULT
		if self.alpha <= 0 then
			self:remove()
		end
	end

	super.update(self)
end

function SnowVeilCloud:draw()
	love.graphics.setColor(1, 1, 1, self.alpha)
	love.graphics.rectangle("fill", 0, 0, 2, 2)
    super.draw(self)
end

return SnowVeilCloud