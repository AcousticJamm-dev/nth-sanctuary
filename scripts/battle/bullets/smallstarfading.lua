local SmallStarFading, super = Class(Bullet)

function SmallStarFading:init(x, y, dir, speed, fade_in)
    super.init(self, x, y, "world/bullets/outlinestar")
    self.physics.direction = dir
    self.physics.speed = speed
	self.removing = false
	self.was_in_arena = false
	self.remove_outside_arena = false
	if fade_in then
		self.alpha = 0
		self.collidable = false
		self:fadeToSpeed(1, 0.2, function()
			self.collidable = true
		end)
	end
end

function SmallStarFading:update()
    self.rotation = self.rotation + 0.1 * DTMULT
    super.update(self)	
	local arena = Game.battle.arena
	if (self.x < arena.left + self.width) and self.physics.direction == math.rad(180) then
		self:doRemove()
	elseif (self.x > arena.right - self.width) and self.physics.direction == math.rad(0) then
		self:doRemove()
	elseif (self.y > arena.bottom - self.height) and self.physics.direction == math.rad(90) then
		self:doRemove()
	elseif (self.y < arena.top + self.height) and self.physics.direction == math.rad(270) then
		self:doRemove()
	end
end

function SmallStarFading:doRemove()
	if self.removing then return end
	self.removing = true
	self.collidable = false

	self:fadeOutSpeedAndRemove(0.2)
end

return SmallStarFading