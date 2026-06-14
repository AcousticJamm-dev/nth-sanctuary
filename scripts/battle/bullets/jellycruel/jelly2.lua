local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "enemies/jellycruel/idle")
	self:setScale(0.6, 0.6)
	self:setScaleOrigin(0.5, 0)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.rotation = dir - math.rad(90)
    
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end


function SmallBullet:onDamage(soul)
	super.onDamage(self, soul)
	local target = self:getTarget()
    if isClass(target) and target:includes(PartyBattler) then
		if MathUtils.randomInt(0, 3) <= Game.battle.encounter.poison_chance and not target:hasStatus("poison") then
			Game.battle.encounter.poison_chance = 0
			Assets.stopAndPlaySound("statuseffect")
			target:inflictStatus("poison")
			target.hit_count = target.hit_count + 1
			target:statusMessage("msg", "poisoned")
		else
			Game.battle.encounter.poison_chance = Game.battle.encounter.poison_chance + 1
		end
	end
end

return SmallBullet