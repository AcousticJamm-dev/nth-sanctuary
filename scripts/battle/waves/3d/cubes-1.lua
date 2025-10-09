local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 10
    self:setSoulPosition(320, 230)
	self.siner = 0
	self.reversesiner = 0
	self.radius = 0
	self.spinspeed = 0
	self.spinrot = 0
	self.spinbullets_l = {}
	self.spinbullets_r = {}
	self.sound = Assets.newSound("3dprism_cubetravelloop")
    self.sound:setPitch(0.8)
    self.sound:setVolume(0)
	self.sound:setLooping(true)
    self.sound:play()
end

function Basic:onStart()
    -- Every 0.33 seconds...
    self.spawned = {}
    local arena = Game.battle.arena
    local a, b = arena:getCenter()
    self.g = self:spawnBullet("3d/smallcube", a, b, math.rad(180), 0)
	for i = 1, 3 do
		local spinbullet = self:spawnBullet("3d/smallcube", a, b, math.rad(180), 0)
		table.insert(self.spinbullets_l, spinbullet)
	end
	for i = 1, 3 do
		local spinbullet = self:spawnBullet("3d/smallcube", a, b, math.rad(180), 0)
		table.insert(self.spinbullets_r, spinbullet)
	end
end

function Basic:onEnd()
	self.sound:stop()
	Assets.stopSound("3dprism_cubetravelloop")
end

function Basic:update()
    -- Code here gets called every frame
    super.update(self)
	self.siner = self.siner + DTMULT
	if self.siner < 10 then
		self.radius = Utils.ease(0, 16, self.siner / 10, "outCubic")
		self.sound:setVolume(self.radius/16)
		self.sound:setPitch(0.8+(self.radius/16)*0.2)
	end
	if self.siner >= 10 and self.siner < 250 then
		self.spinspeed = Utils.ease(0, 8, (self.siner-10) / 240, "outCubic")
		self.sound:setPitch(1+(self.spinspeed/8)*0.2)
	end
	if Game.battle.wave_timer >= Game.battle.wave_length-3 then
		self.reversesiner = self.reversesiner + DTMULT
		if self.reversesiner < 20 then
			self.spinspeed = Utils.ease(8, 0, self.reversesiner / 20, "outCubic")
		end
		if self.reversesiner >= 20 and self.reversesiner < 80 then
			self.spinspeed = Utils.ease(0, -8, (self.reversesiner-20) / 60, "outCubic")
		end
		self.sound:setPitch(1+(self.spinspeed/8)*0.2)
	end
	self.spinrot = self.spinrot + self.spinspeed * DTMULT
    for i,bullet in ipairs(self.spinbullets_l) do
		bullet.x = self.g.x - math.cos(math.rad(self.spinrot - i*(self.spinspeed*2))) * (self.radius * (i*2))
		bullet.y = self.g.y - math.sin(math.rad(self.spinrot - i*(self.spinspeed*2))) * (self.radius * (i*2))
	end
	for i,bullet in ipairs(self.spinbullets_r) do
		bullet.x = self.g.x + math.cos(math.rad(self.spinrot - i*(self.spinspeed*2))) * (self.radius * (i*2))
		bullet.y = self.g.y + math.sin(math.rad(self.spinrot - i*(self.spinspeed*2))) * (self.radius * (i*2))
	end
end

return Basic