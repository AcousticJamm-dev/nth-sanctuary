local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "enemies/jellycruel/idle")
	self:setScale(0.6, 1)
	self:setScaleOrigin(0.5, 0)
    self.physics.speed_y = MathUtils.random(6, 8)
	self.physics.friction = MathUtils.random(0.2, 0.3)
	self.goal_spdy = MathUtils.random(0.6, 0.8)
	self.alpha = 0
	self.siner = MathUtils.random(0, math.pi*2)
	self.start_x = self.x
	self:setHitbox(10, 25, 28, 14)
	self.removing = false
end

function SmallBullet:update()
    super.update(self)
	if self.physics.speed_y <= self.goal_spdy then
		self.physics.speed_y = MathUtils.random(6, 8)
		self.physics.friction = MathUtils.random(0.2, 0.3)
		self.goal_spdy = MathUtils.random(0.6, 0.8)
		self.scale_y = 1
	end
    self.siner = self.siner + (1 / 6) * DTMULT
    self.x = self.start_x + (math.sin(self.siner * 0.5)) * 1
	self.scale_y = MathUtils.lerp(self.scale_y, 0.6, 1 - (1 - 0.2) ^ DTMULT)
	if self.alpha < 1 and not self.removing then
		self.alpha = self.alpha + 0.1 * DTMULT
	end
	if self.y >= Game.battle.arena.bottom + 80 and not self.removing then
		self.removing = true
		self.collider.collidable = false
		self:fadeOutSpeedAndRemove(0.1)
	end
end

function SmallBullet:onDamage(soul)
    local damage = self:getDamage()
    if damage > 0 then
        local target = self:getTarget()
        local battlers = Game.battle:hurt(damage, false, target, self:shouldSwoon(damage, target, soul))

        local inv_frames = self:getInvulnFrames()

        if target ~= "ALL" then
            inv_frames = Game:applyInvulnBonuses(inv_frames)
        end

        Game:setInvulnFrames(inv_frames)

        soul:onDamage(self, damage)
		
		local sndpitch = 1
		local not_poisoned_members = 0
		for _, battler in ipairs(battlers) do
			if not battler:hasStatus("poison") then
				not_poisoned_members = not_poisoned_members + 1
			end
			if MathUtils.randomInt(0, 3) <= Game.battle.encounter.poison_chance and not battler:hasStatus("poison") then
				Game.battle.encounter.poison_chance = 0
				Assets.playSound("statuseffect", 1-(not_poisoned_members)*0.08, sndpitch)
				sndpitch = sndpitch - 0.1
				battler:inflictStatus("poison")
				battler:statusMessage("msg", "poisoned")
			else
				Game.battle.encounter.poison_chance = Game.battle.encounter.poison_chance + 1
			end
		end
        return battlers
    end
	return {}
end

return SmallBullet