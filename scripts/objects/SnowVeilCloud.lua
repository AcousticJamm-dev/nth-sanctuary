local SnowVeilCloud, super = Class(Sprite)

function SnowVeilCloud:init(x, y)
    super.init(self, "effects/icespell/mist", x, y)
	self:setOrigin(0.5)
	self:setScale(1.5)
	self.alpha = 0
	self.fading_in = true
	self.fading_out = false
	self.snowflake_timer = 0
	self.existance_timer = 0
end

function SnowVeilCloud:update()
    super.update(self)

	self.existance_timer = self.existance_timer + DTMULT
	if self.existance_timer >= 45 then
		self.fading_out = true
	end

	if self.alpha >= 1 then
		self.snowflake_timer = self.snowflake_timer + DTMULT
	end

	if self.fading_in then
		self.alpha = self.alpha + 0.15 * DTMULT
		if self.alpha >= 1 then
			self.fading_in = false
		end
	end

	if self.fading_out then
		self.alpha = self.alpha - 0.15 * DTMULT
		if self.alpha <= 0 then
			self:remove()
		end
	end

	if self.snowflake_timer >= 2 then
		self.snowflake_timer = 0
		local snowflake = Game.battle:addChild(SnowVeilSnowflake(self.x + MathUtils.random(-10, 10), self.y + MathUtils.random(-5, 5)))
		snowflake.layer = snowflake.layer - 0.1
	end

end

return SnowVeilCloud