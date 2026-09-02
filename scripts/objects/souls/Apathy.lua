local Apathy, super = Class(Soul)

function Apathy:init(x, y)
    super.init(self, x, y, {237/255, 232/255, 208/255})

    self.apathy_collider = CircleCollider(self, 0, 0, 30)
	
	self.apathy_activity = 0
    self.apathy_radius = 0
    self.apathy_radius_goal = 30
    self.graze_collider = CircleCollider(self, 0, 0, 15 * self.graze_size_factor)
	self.graze_sprite.texture = Assets.getTexture("player/apathy_graze")
	self.graze_sprite.width = self.graze_sprite.texture:getWidth()
	self.graze_sprite.height = self.graze_sprite.texture:getHeight()
end

function Apathy:doMovement()
    local bull = false
	
	for _,wave in ipairs(Game.battle.waves) do
		for _,bullet in ipairs(wave.bullets) do
			if bullet:collidesWith(self.apathy_collider) then
				bull = true
			end
		end
	end
	
	if bull then
		self.apathy_activity = MathUtils.approach(self.apathy_activity, 0.7, 0.2*DTMULT)
		super.doMovement(self)
	else
		self.apathy_activity = MathUtils.approach(self.apathy_activity, 0, 0.2*DTMULT)
	end
end

function Apathy:draw()
	if not self.transitioning then
		local col = ColorUtils.mergeColor({118/255, 116/255, 104/255}, {237/255, 232/255, 208/255}, self.apathy_activity)
		self.apathy_radius = MathUtils.approach(self.apathy_radius, self.apathy_radius_goal, (math.abs(self.apathy_radius_goal - self.apathy_radius) * 0.1) * DTMULT)
		Draw.setColor(col, 0.5)
		love.graphics.circle("fill", 0, 0, self.apathy_radius)
		Draw.setColor(col, 1)
		love.graphics.setLineWidth(2)
		love.graphics.circle("line", 0, 0, self.apathy_radius)
	end
    super.draw(self)
end

return Apathy