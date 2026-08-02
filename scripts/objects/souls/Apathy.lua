local Apathy, super = Class(Soul)

function Apathy:init(x, y)
    super.init(self, x, y, {237/255, 232/255, 208/255})

    self.apathy_collider = CircleCollider(self, 0, 0, 25)

    self.graze_collider = CircleCollider(self, 0, 0, 15 * self.graze_size_factor)
	self.graze_sprite:setScale(0.6)
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
		super.doMovement(self)
	end
end

function Apathy:draw()
    super.draw(self)

    self.apathy_collider:draw(118/255, 116/255, 104/255)
end

return Apathy