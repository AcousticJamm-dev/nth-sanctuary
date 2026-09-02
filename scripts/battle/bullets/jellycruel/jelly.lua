local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, rot)
    -- Last argument = sprite path
    super.init(self, x, y, "enemies/jellycruel/idle")
	self:setScale(0.6, 0.6)
	self:setScaleOrigin(0.5, 0)
	self.rotation = rot
end

function SmallBullet:update()
    super.update(self)
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
				battler.hit_count = battler.hit_count + 1
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