local ChurchLegender, super = Class(Event)

function ChurchLegender:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
	
	self.siner = 0
	self.timer = 0
	self.activetimer = 0
	self.alpha = 0
	self.relx = properties["relx"] or 20
	self.rely = properties["rely"] or 20
	self.image_xscale = properties["xscale"] or 2
	self.image_yscale = properties["yscale"] or 2
	self.image_angle = 0
	self.show = false
	self.charspace = 15
	self.triggertype = 0
	self.startingx = properties["startx"] or 280
	self.endingx = properties["endx"] or 600
	self.c_darkblue = ColorUtils.hexToRGB("#181F4A")
	self.stringmax = 10
	self.maxlines = 10
	self.image_only = false
	self.text_settings = {}
	self.line_index = 1
    self.prophecy_text = TiledUtils.parsePropertyMultiList("text", properties)
	self.set_lines = false
	self.alt_sides = properties["altsides"] or false
	self.triggertype = properties["trigger"] or 1
	self.textx = properties["textx"] or -40
	self.textstartwait = properties["textstartwait"] or 90
	self.textendwait = properties["textendwait"] or 90
	self.xx = self.relx
	self.yy = self.rely
	self.maxlines = #self.prophecy_text
	self.stringmax = #self.prophecy_text[self.line_index]
	for i = 1, self.stringmax do
		self.text_settings[i] = {text = self.prophecy_text[self.line_index][i], char = 0, x = self.textx, y = 40 + (i * 40), startwait = 1 + (i * self.textstartwait), endwait = self.textendwait, activetimer = 0, rate = 2, timer = 0}
	end
	self.sprite = properties["texture"] or "world/events/legender/example"
	self.texture = Assets.getTexture(self.sprite) or Assets.getTexture("world/events/legender/example")
	self.font = Assets.getFont("main")
    self.set_flag = properties["setflag"]
    self.set_value = properties["setvalue"]
    self.once = properties["once"] ~= false
end

function ChurchLegender:postLoad()
    super.postLoad(self)
	self.xx = self.world.camera.x - SCREEN_WIDTH/2 + self.relx
	self.yy = self.world.camera.y - SCREEN_HEIGHT/2 + self.rely
end

function ChurchLegender:onLoad()
    super.onLoad(self)
    if self.once and self:getFlag("used_once", false) then
		self:remove()
    end
end

function ChurchLegender:update()
    super.update(self)
	self.siner = self.siner + DTMULT
	self.timer = self.timer + DTMULT
	if self.triggertype == 0 then
		if self.world.camera.x - SCREEN_WIDTH/2 > self.startingx then
			self.show = true
		end
		if self.world.camera.x - SCREEN_WIDTH/2 > self.endingx or self.world.camera.x - SCREEN_WIDTH/2 < self.startingx then
			self.show = false
		end
	end
	if self.triggertype == 0 then
		if self.world.camera.x - SCREEN_WIDTH/2 > self.startingx then
			self.show = true
		end
		if self.world.camera.x - SCREEN_WIDTH/2 > self.endingx or self.world.camera.x - SCREEN_WIDTH/2 < self.startingx then
			self.show = false
		end
	end
	if self.show then
		self.alpha = MathUtils.lerp(self.alpha, 1, 0.25 * DTMULT)
		self.activetimer = self.activetimer + DTMULT
	else
		self.alpha = MathUtils.lerp(self.alpha, 0, 0.25 * DTMULT)	
	end
	if self.image_only then
		return
	end
	if self.line_index < self.maxlines and self.text_settings[self.stringmax].activetimer > self.text_settings[self.stringmax].startwait + self.text_settings[self.stringmax].endwait then
		self.activetimer = 0
		self.set_lines = true
	end
	if self.set_lines then
		self.set_lines = false
		self.line_index = self.line_index + 1
		self.stringmax = #self.prophecy_text[self.line_index]
		for i = 1, self.stringmax do
			local textx = self.text_settings[i].x
			if self.alt_sides then
				textx = 0
				if self.line_index % 2 == 1 then
					self.relx = 400
				end
			end
			local endwait = (self.line_index == self.maxlines and (self.stringmax - 1) == 0) and 180 or 60
			self.text_settings[i] = {text = self.prophecy_text[self.line_index][i], char = 0, x = textx, y = 40 + (i * 40), startwait = 1 + (i * 90), endwait = endwait, activetimer = 0, rate = 2, timer = 0}
		end
	end
	if self.show and self.line_index == self.maxlines and self.text_settings[self.stringmax].activetimer > self.text_settings[self.stringmax].startwait + self.text_settings[self.stringmax].endwait then
		self.triggertype = -1
		self.show = false
        if self.set_flag then
            Game:setFlag(self.set_flag, (self.set_value == nil and true) or self.set_value)
        end
        if self.once then
            self:setFlag("used_once", true)
        end
		for _, looper in ipairs(self.world:getEvents("stairlooper")) do
			looper.legend_finish = true
		end
	end
end

function ChurchLegender:onEnter(chara)
	if chara.is_player and self.triggertype == 1 then
		self.show = true
	end
end

function ChurchLegender:onExit(chara)
	if chara.is_player and self.triggertype == 1 then
		self.show = false
	end
end

function ChurchLegender:draw()
    super.draw(self)
	love.graphics.push()
	love.graphics.translate(-self.x, -self.y)
	self.xx = MathUtils.lerp(self.xx, self.world.camera.x - SCREEN_WIDTH/2 + self.relx, 0.4 * DTMULT)
	self.yy = MathUtils.lerp(self.yy, self.world.camera.y - SCREEN_HEIGHT/2 + self.rely, 0.4 * DTMULT)
	local xsin = 0
	local ysin = math.cos(self.siner / 12) * 4
	Draw.setColor(self.color, self.alpha)
	Draw.draw(self.texture, self.xx + xsin, self.yy + ysin, self.image_angle, self.image_xscale, self.image_yscale)
	local spacer = 3
	local rate = 24
	local r, g, b, a = love.graphics.getColor()
	Draw.setColor(r, g, b, a / 5)
	for i = 1, 4 do
		Draw.draw(self.texture, self.xx + xsin + (math.sin(self.activetimer / rate) * spacer * i), self.yy + ysin + (math.cos(self.activetimer / rate) * spacer * i), self.image_angle, self.image_xscale, self.image_yscale)
	end
	if self.image_only then
		love.graphics.pop()
		return
	end
	Draw.setColor(1, 1, 1, self.alpha)
	love.graphics.setFont(self.font)
	local ver = 1
	if ver == 0 then
		-- UNUSED
	end
	if ver == 1 then
		local stringlength
		local delay
		local xdraw
		local ydraw
		local count
		local truetimer
		for i = 1, self.stringmax do
			if self.activetimer >= self.text_settings[i].startwait then
				stringlength = StringUtils.len(self.text_settings[i].text)
				self.text_settings[i].activetimer = self.text_settings[i].activetimer + DTMULT
				delay = (i - 1) * 30
				xdraw = self.xx + self.text_settings[i].x
				ydraw = self.yy + self.text_settings[i].y + (math.sin(self.siner / 24) * 4)
				count = 8
				truetimer = self.text_settings[i].activetimer - delay
				for j = 0, count do
					for k = 0, count do
						local alph = MathUtils.clamp((truetimer / 40) - (k / 4), 0, 0.2) * self.alpha
						local shadcolor = ColorUtils.mergeColor(COLORS.black, self.c_darkblue, MathUtils.clamp(alph * 10, 0, 1))
						Draw.setColor(shadcolor, alph)
						local rotspeed = 4
						local startdist = 20
						local len = MathUtils.clamp(startdist - truetimer, 2, startdist)
						local xd2 = xdraw + MathUtils.lengthDirX(len + (k / 4), -math.rad((j * (360 / count)) + (truetimer * rotspeed)))
						local yd2 = ydraw + MathUtils.lengthDirY(len + (k / 4), -math.rad((j * (360 / count)) + (truetimer * rotspeed))) + (k / 4)
						local maxdist = 12
						local amt = MathUtils.clamp(maxdist - truetimer, 4, maxdist)
						love.graphics.print(self.text_settings[i].text, xd2, yd2)
					end
				end
				local alph = MathUtils.clamp(truetimer / 30, 0, 1) * self.alpha
				local col = ColorUtils.hexToRGB("#94A9DC")
				Draw.setColor(col, (alph / 2) * math.sin((truetimer + 12) / 12))
				love.graphics.print(self.text_settings[i].text, xdraw - 1, ydraw - 1)
				Draw.setColor(col, (alph / 2) * math.sin((truetimer + 24) / 12))
				love.graphics.print(self.text_settings[i].text, xdraw + 1, ydraw - 1)
				Draw.setColor(col, (alph / 2) * math.sin((truetimer + 36) / 12))
				love.graphics.print(self.text_settings[i].text, xdraw - 1, ydraw + 1)
				Draw.setColor(col, (alph / 2) * math.sin((truetimer + 48) / 12))
				love.graphics.print(self.text_settings[i].text, xdraw + 1, ydraw + 1)
				Draw.setColor(COLORS.white, alph)
				love.graphics.print(self.text_settings[i].text, xdraw, ydraw)
				self.text_settings[i].timer = self.text_settings[i].timer + DTMULT
				if self.text_settings[i].timer >= self.text_settings[i].rate then
					if self.text_settings[i].char < stringlength then
						self.text_settings[i].char = self.text_settings[i].char + 1
					end
					self.text_settings[i].timer = 0
				end
			end
		end
	end
	Draw.setColor(1,1,1,1)
	love.graphics.pop()
end

return ChurchLegender