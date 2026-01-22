local FireOrb, super = Class(Bullet)

function FireOrb:init(x, y, bullets)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/liieng/fireorb")
	self:setScale(1)
	self.sprite:setScale(2)
	self.timer = 0
	self.siner = 0
	self.spdtimer = 0
	self.speed = 1
	self.bullets = bullets or 3
	self.speedtarg = 6
	self.widthmod = 1
	self.count = count or 1
	self.turn = 1.5 * MathUtils.sign((self.count % 2) - 0.5)
	self.can_graze = false
    self:setHitbox(nil)
    self.sprite.visible = false
	self.sprite:setColor(COLORS.gray)

    self.physics.direction = 0
    self.physics.speed = 0
    self.subs = {}
	self.con = 0
	self.remove_offscreen = false
	self.max_radius = 140
	self.index = 0
	self.x_start = self.x
	self.y_start = self.y
	self.basebuldist = {80}
	self.sinbuldist = {40}
	self.distlerp = 0
	self.multibul = 1
	self.init = false
end

function FireOrb:onCollide()
	return
end

function FireOrb:onAdd(parent)
    super.onAdd(self, parent)
	Game.battle.timer:after(1/30, function()
		for j = 1, self.multibul do
			for i = 1, self.bullets do
				local bul = self.wave:spawnBullet("guei/holyfire", 0, 0, math.rad((360 / self.bullets) * i-1), 0)
				bul.basebuldist = self.basebuldist[j]
				bul.sinbuldist = self.sinbuldist[j]
				bul.remove_offscreen = false
				table.insert(self.subs, bul)
			end
		end
		self.init = true
	end)
end

function FireOrb:onRemove(parent)
    super.onRemove(self, parent)
	for _, bul in ipairs(self.subs) do
		bul:remove()
        TableUtils.removeValue(self.subs, bul)
    end
end

function FireOrb:update()
    super.update(self)
	if not self.init then return end
	self.timer = self.timer + DTMULT
	self.spdtimer = self.spdtimer + self.speed * DTMULT
	if self.timer > 20 then
		self.siner = self.siner + DTMULT
	end
	self.x = self.x_start + MathUtils.lengthDirX(self.max_radius, -math.rad(self.spdtimer + (120 * self.index)))
	self.y = self.y_start + MathUtils.lengthDirY(self.max_radius, -math.rad(self.spdtimer + (120 * self.index)))
	for _, bul in ipairs(self.subs) do
		if self.timer > 10 then
			self.sprite.visible = true
			bul.visible = true
		elseif self.timer % 2 >= 1 then
			self.sprite.visible = true
			bul.visible = true
		else
			self.sprite.visible = false
			bul.visible = false
		end
		bul.angle = bul.angle + math.rad(self.turn) * DTMULT
		bul.dist = (bul.basebuldist - (math.cos((self.siner + (self.index * 4)) / 15) * bul.sinbuldist))
		bul.x = self.x + 25 + MathUtils.lengthDirX(bul.dist, bul.angle)
		bul.y = self.y + 25 + MathUtils.lengthDirY(bul.dist, bul.angle)
	end
	--[[if self.timer >= 10 and self.con == 0 then
		self.physics.direction = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
		self.con = 1
	elseif self.timer >= 10 and self.con == 1 then
		self.physics.speed = MathUtils.approach(self.physics.speed, self.speedtarg, (self.speedtarg/45)*DTMULT)
		self.turn = MathUtils.approach(self.turn, 7 * MathUtils.sign(self.turn), 0.1*DTMULT)
	end]]
end

function FireOrb:draw()
	love.graphics.stencil(function()
		local last_shader = love.graphics.getShader()
		love.graphics.setShader(Kristal.Shaders["Mask"])
		Draw.draw(Assets.getTexture("bullets/liieng/fireorb_fill"), 0, 0, 0, 2, 2)
		love.graphics.setShader(last_shader)
	end, "replace", 1)
	love.graphics.setStencilTest("less", 1)
	love.graphics.push()
	love.graphics.translate(-self.x, -self.y)
	for _, bul in ipairs(self.subs) do
		if bul and not bul:isRemoved() then
			Draw.setColor(COLORS.gray)
			love.graphics.setLineWidth(3)
			love.graphics.line(bul.x+25, bul.y+25, self.x+50, self.y+50)
		end
	end
	love.graphics.setStencilTest()
	love.graphics.pop()
	super.draw(self)
end

return FireOrb