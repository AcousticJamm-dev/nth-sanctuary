local LeechBlob, super = Class(Bullet)

function LeechBlob:init(x, y)
    super.init(self, x, y, "effects/spr_darkshape_transform")


    self:setColor(COLORS.white)
    self.image_speed = 0.5;
    self.size = 2;
    self.damage = 90;
    self.prime_speed = 6;
    self.max_speed = 10;
    self.acc = 140;
    self.active_move = false

    self.sprite:play(1 / 15, true)

    self.grazed = true
    self.layer = BATTLE_LAYERS["top"]
    self.tension_amount = 1
    self:setScale(1, 1)
end

function LeechBlob:onAdd(parent)
    super.onAdd(self, parent)

    Assets.playSound("snd_spawn_weaker", 1, 2)
    Assets.playSound("break1")

	self.target_x = self.attacker.x+self.attacker.width/2
	self.target_y = self.attacker.y-self.attacker.height
    self.physics.direction = MathUtils.angle(self.x, self.y, self.target_x, self.target_y) + math.rad(180)
    self.physics.speed = self.prime_speed


    Game.battle.timer:tween(20 / 30, self, { scale_x = 0.4, scale_y = 0.4, color = { 0, 1, 0 } }, "linear", function()
        self.active_move = true
    end)
end

function LeechBlob:update()
    --Kristal.Console:log("timer: "..tostring(self.wave.timer))
    self.physics.speed = self.physics.speed * 0.85;
	self.target_x = self.attacker.x+self.attacker.width/2
	self.target_y = self.attacker.y-self.attacker.height
    if self.active_move then
        local accel = self.acc / MathUtils.dist(self.x, self.y, self.target_x + 10, self.target_y + 10);
        self.physics.direction = MathUtils.angle(self.x, self.y, self.target_x, self.target_y);
        self.physics.speed = MathUtils.approach(self.physics.speed, self.max_speed, accel)
    end
    if MathUtils.dist(self.x, self.y, self.target_x, self.target_y) <= 40 then
		local damage = self:getDamage()
		if damage > 0 then
			self.attacker:heal(damage)
			Assets.stopSound("power")
			Assets.stopAndPlaySound("titan_cure", 1, 2)
		end
		self:finishexplosion()
		self:remove()
	end
    --[[if (MathUtils.dist(self.x, self.y, Game.battle.soul.x + 10, Game.battle.soul.y + 10) <= 20 and self.active_move) then
        self:remove()
    end]]

    super.update(self)
end

function LeechBlob:finishexplosion()
    local boom_sprite = Sprite("effects/spr_finisher_explosion", self.x, self.y)
    boom_sprite:setOrigin(0.5, 0.5)
    boom_sprite:setScale(0.0625, 0.0625)
    boom_sprite:setFrame(3)
    Game.battle.timer:tween(4/30, boom_sprite, {scale_x = 0.0625 * 3, scale_y = 0.0625 * 3})
    boom_sprite.layer = self.layer  +1
    boom_sprite:setColor(COLORS.lime)
    boom_sprite:play(1 / 30, false, function()
        boom_sprite:remove()
    end)
    Game.battle:addChild(boom_sprite)
    --[[Game.battle.timer:after(5/30, function ()
        boom_sprite:remove()
    end)]]

end

function LeechBlob:flashsparestars()
    for i = 1, (3 + love.math.random(0, 2)) do
        local bar = Game.battle.tension_bar

        local x = love.math.random(0, 25)
        local y = 40 + love.math.random(0, 160)

        local star = bar:addChild(Sprite("effects/spare/star", x, y))
        star:setOrigin(0.5, 0.5)
        local dur = 10 + love.math.random(0, 5)

        star:play(5 / dur)
        star.layer = 999
        star.alpha = 1

        star.physics = {
            speed = 3 + love.math.random() * 3,
            direction = -math.rad(90)
        }
        Game.battle.timer:tween(dur / 30, star.physics, { speed = 0 }, "linear")
        Game.battle.timer:tween(dur / 30, star, { alpha = 0.25 }, "linear", function()
            star:remove()
        end)
    end
end

function LeechBlob:onCollide(soul)
	if not self.active_move then
		return
	end
    local damage = self:getDamage()
    if damage > 0 then 
		local party = Game.battle:getPartyFromTarget(self:getTarget())
        for _, target in pairs (party) do
			target:heal(damage)
        end
    end
    self:finishexplosion()
    self:remove()
end

return LeechBlob
