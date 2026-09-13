local NymphSpawn, super = Class("titan_spawn", "nymph_spawn")

function NymphSpawn:init()
    super.super.init(self)

    self.name = "Nymph Spawn"
    self:setActor("nymph")

    self.max_health = 2350
    self.health = 2350
    self.attack = 15
    self.defense = -5
    self.money = 100
	
    self.disable_mercy = true

    self.can_freeze = false
	
    self.text = {
        "* You hear your heart beating in \nyour ears.",
        "* When did you start being \nyourself?",
        "* It sputtered in a voice like \ncrushed glass.",
    }
    if Game:hasPartyMember("ralsei") then
        table.insert(self.text, "* Ralsei mutters to himself to \nstay calm.")
    end
	
    self.tired_percentage = 0
	
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* It's slowing down."

    self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Brighten", "Powerup\nlight", "all", 4)
    self:registerAct("DualHeal", "Heal\nparty", { "susie", "ralsei" }, 16)
    local unleash = self:registerAct("Unleash", "Weaken\nenemy", nil, 64)
    unleash.color = function()
        if Game:getTension() >= 64 then
            return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(self.t_siner / 4) * 0.5)))
        else
            return COLORS.white
        end
    end

    self.dualhealcount = 0

	self.t_siner = 0
    self.phaseturn = 1
    self.difficulty = 0
	
	self.wake_kris_count = 0
	
	self.shaker = 0
	self.siner = 0
	self.afterimage_timer = 0
end

function NymphSpawn:update()
    super.update(self)
	if self.shaker > 0 then
		self.graphics.shake_x = MathUtils.random(-self.shaker, self.shaker)
		self.graphics.shake_y = MathUtils.random(-self.shaker, self.shaker)
	end

    if Game.battle.state ~= "TRANSITION" and Game.battle.state ~= "INTRO" then
		if self:getActiveSprite().anim == "idle" then
			self.siner = self.siner + 0.1 * DTMULT
			self.afterimage_timer = self.afterimage_timer + DTMULT
			self.sprite.y = self.sprite.y + (math.sin(self.siner) * 0.6) * DTMULT
			if self.afterimage_timer >= 15 then
				local image = AfterImage(self.sprite, 0.5, 0.02)
				image.physics.speed = 2
				Game.battle:addChild(image)
				self.afterimage_timer = 0
			end
		end
    end
end

function NymphSpawn:onAct(battler, name)
	if name == "Check" then
        if Game:getTension() >= 64 then
            return {"* NYMPH SPAWN - AT 33 DF 210\n* The Spawn that grew before it could be stopped.", "* The atmosphere feels tense...\n* (You can use [color:yellow]UNLEASH[color:reset]!)"}
        else
            return {"* NYMPH SPAWN - AT 33 DF 210\n* The Spawn that grew before it could be stopped.", "* Expose it to LIGHT... and gather COURAGE to gain TP.", "* Then, use \"[color:yellow]UNLEASH[color:reset]\" to weaken it!" }
		end
    elseif name == "Unleash" then
        battler:setAnimation("act")
        Game.battle:startCutscene(function(cutscene)
            cutscene:text("* "..battler.chara:getName().."'s SOUL emitted a brilliant \nlight!")
            battler:flash()

            local bx, by = battler:getRelativePos(battler.width/2 + 4, battler.height/2 + 4)

            local soul = Game.battle:addChild(TitanSpawnPurifySoul(bx, by, nil))
            soul.color = Game:getPartyMember(Game.party[1].id).soul_color or { 1, 0, 0 }
            soul.layer = 501

            local wait = function() return soul.t >= 500 end
            cutscene:wait(wait)
			Assets.playSound("titan_absorb", 1.5, 1.8)
			self.graphics.shake_friction = 0
			self.colormask = self:addFX(ColorMaskFX())
			self.colormask.color = {1, 1, 1}
			self.colormask.amount = 0
			Game.battle.timer:tween(15/30, self, {shaker = 6}, "linear")
			Game.battle.timer:tween(15/30, self.colormask, {amount = 1}, "linear")
			cutscene:wait(15/30)
			local spawn1 = Game.battle.encounter:addEnemy("leech_spawn", self.x, self.y)
			local spawn2 = Game.battle.encounter:addEnemy("leech_spawn", self.x, self.y)
			spawn1:removeAct("Banish")
			spawn2:removeAct("Banish")
			spawn1:registerAct("DualHeal", "Heal\nparty",    { "susie", "ralsei" }, 16)
			spawn2:registerAct("DualHeal", "Heal\nparty",    { "susie", "ralsei" }, 16)
			local banish1 = spawn1:registerAct("Banish",   "Defeat\nenemy",  nil, 50)
			banish1.color = function()
				if Game:getTension() >= 50 then
					return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(spawn1.t_siner / 4) * 0.5)))
				else
					return COLORS.white
				end
			end
			local banish2 = spawn2:registerAct("Banish",   "Defeat\nenemy",  nil, 50)
			banish2.color = function()
				if Game:getTension() >= 50 then
					return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(spawn2.t_siner / 4) * 0.5)))
				else
					return COLORS.white
				end
			end
			Game.battle.encounter.unleash_threshold = 50
			Game.battle.encounter.difficulty = math.max(Game.battle.encounter.difficulty, 2)
			local xx, yy = 550, 200 - 45
			Game.battle.timer:tween(15/30, spawn1, {x = xx, y = yy}, "out-cubic")
			xx, yy = 550 + 10, 200 + 45
			Game.battle.timer:tween(15/30, spawn2, {x = xx, y = yy}, "out-cubic")
			local boom_sprite = Sprite("effects/titan/finisher_explosion", self.x, self.y-self.height)
			boom_sprite:setOrigin(0.5, 0.5)
			boom_sprite:setScale(0.25, 0.25)
			boom_sprite:setFrame(1)
			boom_sprite.rotation = math.rad(MathUtils.random(360))
			Game.battle.timer:tween(4/30, boom_sprite, {scale_x = 0.25 * 3, scale_y = 0.25 * 3})
			boom_sprite.layer = self.layer + 1
			boom_sprite:play(1 / 30, false, function()
				boom_sprite:remove()
			end)
			Game.battle:addChild(boom_sprite)
			local boom_sprite_2 = Sprite("effects/titan/shockwave_bullet_explosion", self.x, self.y-self.height)
			boom_sprite_2:setOrigin(0.5, 0.5)
			boom_sprite_2:setScale(0.5, 0.5)
			boom_sprite_2:setFrame(1)
			boom_sprite_2.rotation = math.rad(MathUtils.random(360))
			boom_sprite_2.layer = self.layer + 1
			boom_sprite_2:play(2 / 30, false, function()
				boom_sprite_2:remove()
			end)
			Game.battle:addChild(boom_sprite_2)
			self.idlee = false
			self.hurt_timer = -1
			self.defeated = true
			self:defeat("PACIFIED", false)
            self:remove()
			Assets.playSound("tspawn", 1, 0.9)
			Assets.playSound("explosion")
            cutscene:text("* The NYMPH SPAWN split in two![wait:5]\n* Gather COURAGE and gain TP to\nfinish them off with [color:yellow]BANISH[color:reset]!")
			Game.battle:finishAction()
        end)
        return
    end
    return super.onAct(self, battler, name)
end

function NymphSpawn:onHurt(damage, battler)
	super.super.onHurt(self, damage, battler)

    Assets.stopAndPlaySound("spawn_weaker", 1, 0.9)
end

function NymphSpawn:onDefeat(damage, battler)
    self.idlee = false
    self.hurt_timer = -1
	self.defeated = true
	local sprite = self:getActiveSprite()
	sprite:stopShake()
	Game:addFlag("slain", 1)
	Assets.playSound("titan_absorb", 1.5, 1.8)
	self.graphics.shake_friction = 0
	self.colormask = self:addFX(ColorMaskFX())
	self.colormask.color = {1, 1, 1}
	self.colormask.amount = 0
	self.shaker = 1
	Game.battle.timer:tween(15/30, self, {shaker = 6}, "linear")
	Game.battle.timer:tween(15/30, self.colormask, {amount = 1}, "linear")
	Game.battle.timer:after(15/30, function()
		local spawn1 = Game.battle.encounter:addEnemy("leech_spawn", self.x, self.y)
		local spawn2 = Game.battle.encounter:addEnemy("leech_spawn", self.x, self.y)
		spawn1:removeAct("Banish")
		spawn2:removeAct("Banish")
		spawn1:registerAct("DualHeal", "Heal\nparty", {"susie", "ralsei"}, 16)
		spawn2:registerAct("DualHeal", "Heal\nparty", {"susie", "ralsei"}, 16)
		spawn1:registerAct("Banish",   "Defeat\nenemy",  nil, 50)
		spawn2:registerAct("Banish",   "Defeat\nenemy",  nil, 50)
		if Game:hasPartyMember("susie") and Game:hasPartyMember("ralsei") then
			spawn1.banish_act_index = 4
			spawn2.banish_act_index = 4
		else
			spawn1.banish_act_index = 3
			spawn2.banish_act_index = 3
		end
		Game.battle.encounter.difficulty = math.max(Game.battle.encounter.difficulty, 3)
		local xx, yy = 550, 200 - 45
		Game.battle.timer:tween(15/30, spawn1, {x = xx, y = yy}, "out-cubic")
		xx, yy = 550 + 10, 200 + 45
		Game.battle.timer:tween(15/30, spawn2, {x = xx, y = yy}, "out-cubic")
		local boom_sprite = Sprite("effects/titan/finisher_explosion", self.x, self.y-self.height)
		boom_sprite:setOrigin(0.5, 0.5)
		boom_sprite:setScale(0.25, 0.25)
		boom_sprite:setFrame(1)
		boom_sprite.rotation = math.rad(MathUtils.random(360))
		Game.battle.timer:tween(4/30, boom_sprite, {scale_x = 0.25 * 3, scale_y = 0.25 * 3})
		boom_sprite.layer = self.layer + 1
		boom_sprite:play(1 / 30, false, function()
			boom_sprite:remove()
		end)
		Game.battle:addChild(boom_sprite)
		local boom_sprite_2 = Sprite("effects/titan/shockwave_bullet_explosion", self.x, self.y-self.height)
		boom_sprite_2:setOrigin(0.5, 0.5)
		boom_sprite_2:setScale(0.5, 0.5)
		boom_sprite_2:setFrame(1)
		boom_sprite_2.rotation = math.rad(MathUtils.random(360))
		boom_sprite_2.layer = self.layer + 1
		boom_sprite_2:play(2 / 30, false, function()
			boom_sprite_2:remove()
		end)
		Game.battle:addChild(boom_sprite_2)
		self:defeat("DEFEATED", false)
		self:remove()
		Assets.playSound("tspawn", 1, 0.9)
		Assets.playSound("explosion")
	end)
end

function NymphSpawn:getNextWaves()
    return { "darkshapesmines" }
end

function NymphSpawn:onPurifyStart()
	self.shaker = 1
end

function NymphSpawn:onPurifyEnd()
end

return NymphSpawn