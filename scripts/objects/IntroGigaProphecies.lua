local IntroGigaProphecies, super = Class(Object)

function IntroGigaProphecies:init()
    super.init(self)
	self:setPosition(0)
	self:setParallax(0)
	
    self.blueswirly_tex = Assets.getTexture("backgrounds/IMAGE_DEPTH_EXTEND_MONO_SEAMLESS_BRIGHTER")
    self.blueswirly_blur_tex = Assets.getTexture("backgrounds/IMAGE_DEPTH_EXTEND_SEAMLESS")
	self.perlin_tex = Assets.getTexture("backgrounds/perlin_noise_looping")
	self.fill_tex = Assets.getTexture("bubbles/fill")
	self.shatter_frames = Assets.getFrames("intro_prophecies/shatter")
	self.stars = {}
	self.prophecies = {}
	self.prophecy_color = ColorUtils.hexToRGB("#42D0FF")
	self.star_timer = 24
	self.prophecy_timer = 24
	self.con = 0
	self.delta = 1
end

local function returnAlphaColor(color, value)
    local color = color
    return {
        color[1],
        color[2],
        color[3],
        color[4] * (value or 1),
    }
end

function IntroGigaProphecies:update()
	super.update(self)
	self.star_timer = self.star_timer + DTMULT
	self.prophecy_timer = self.prophecy_timer + DTMULT
	if self.star_timer >= 24 and self.con == 0 then
		self.star_timer = 0
		for j = 0, 8 do
			for i = 0, 10 do
				table.insert(self.stars, {
					x = i * 30 + MathUtils.random(-12, 12),
					y = SCREEN_HEIGHT + j * 30 + MathUtils.random(-12, 12),
					layer = MathUtils.randomInt(0, 2),
					lifetime = MathUtils.randomInt(0, 90),
					alpha = 0.6,
					do_break = false
				})
			end
		end
	end
	if self.prophecy_timer >= 24 and self.con == 0 then
		self.prophecy_timer = 0
		for i = 0, 3 do	
			local layers = {0, 1, 2}
			local scales = {1, 0.5, 0.25}
			local rand = MathUtils.randomInt(1, 3)
			table.insert(self.prophecies, {
				texture = Assets.getTexture("intro_prophecies/set_"..MathUtils.randomInt(1, 10)),
				x = 50 + i * 256 + MathUtils.random(-42, 42),
				y = SCREEN_HEIGHT + 100 + MathUtils.random(-42, 42),
				layer = layers[rand],
				scale = scales[rand],
				break_variance = MathUtils.randomInt(-42, 42),
				alpha = 0.6,
				break_shards = {},
				do_break = false
			})
		end
	end
	local stars_to_remove = {}
	for _, star in ipairs(self.stars) do
		if star then
			if star.do_break then
				star.y = star.y - ((self.delta * 8) * ((star.layer + 1) * 0.3)) * DTMULT
				star.alpha = star.alpha - 0.03 * DTMULT
				if star.alpha < 0 then
					table.insert(stars_to_remove, star)
				end
				if star.y < -200 then
					table.insert(stars_to_remove, star)
				end
			else
				star.y = star.y - ((self.delta * 10) * ((star.layer + 1) * 0.3)) * DTMULT
				star.lifetime = star.lifetime - DTMULT
				if star.lifetime < 0 then
					star.do_break = true
				end
				if star.y < -200 then
					table.insert(stars_to_remove, star)
				end
			end
		end
	end
    for _, star in ipairs(stars_to_remove) do
        TableUtils.removeValue(self.stars, star)
    end
	local prophecies_to_remove = {}
	for _, prophecy in ipairs(self.prophecies) do
		if prophecy then
			prophecy.y = prophecy.y - ((self.delta * 20) * ((prophecy.layer + 1) * 0.3)) * DTMULT
			if prophecy.do_break then
				prophecy.alpha = prophecy.alpha - 0.015 * DTMULT
				for i = 1, 73 do
					prophecy.break_shards[i].speed = prophecy.break_shards[i].speed + prophecy.break_shards[i].gravity * DTMULT
					if prophecy.break_shards[i].speed >= 20 then
						prophecy.break_shards[i].speed = 20
					end
					prophecy.break_shards[i].y = prophecy.break_shards[i].y + prophecy.break_shards[i].speed * DTMULT
				end
				if prophecy.alpha < 0 then
					table.insert(prophecies_to_remove, prophecy)
				end
			else
				if prophecy.y < SCREEN_HEIGHT/4 - prophecy.break_variance then
					prophecy.do_break = true
					for i = 1, 73 do
						table.insert(prophecy.break_shards, {
							y = 0,
							speed = 2 * prophecy.scale,
							gravity = (0.5 + MathUtils.random(0.1)) * prophecy.scale
						})
					end
				end
				if prophecy.y < -200 then
					table.insert(prophecies_to_remove, prophecy)
				end
			end
		end
	end	
    for _, prophecy in ipairs(prophecies_to_remove) do
        TableUtils.removeValue(self.prophecies, prophecy)
    end
end

function IntroGigaProphecies:draw()
    super.draw(self)
	
	local t = Kristal.getTime()
	local canvas_starfield = Draw.pushCanvas(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
	love.graphics.clear()
    love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        local shader = Kristal.Shaders["Mask"]
        love.graphics.setShader(shader)
		for _, star in ipairs(self.stars) do
			if star and not star.do_break then
				Draw.draw(self.fill_tex, star.x, star.y)
			end
		end
        love.graphics.setShader(last_shader)
    end, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
    Draw.drawWrapped(self.blueswirly_tex, true, true, 0, 0, 0, 1, 1)
    love.graphics.setStencilTest()
	for _, star in ipairs(self.stars) do
		if star and star.do_break then
			Draw.setColor(returnAlphaColor(ColorUtils.hexToRGB("#A3F8FFFF"), star.alpha))
			Draw.draw(self.fill_tex, star.x, star.y)
		end
	end
	Draw.popCanvas(true)
	local canvas_prophecy = Draw.pushCanvas(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
	love.graphics.clear()
    love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        local shader = Kristal.Shaders["Mask"]
        love.graphics.setShader(shader)
		for _, prophecy in ipairs(self.prophecies) do
			if prophecy and not prophecy.do_break then
				Draw.draw(prophecy.texture, math.floor(prophecy.x), math.floor(prophecy.y), 0, prophecy.scale, prophecy.scale)
			end
		end
        love.graphics.setShader(last_shader)
    end, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
    Draw.setColor(returnAlphaColor(self.prophecy_color, 1))
    Draw.drawWrapped(self.blueswirly_tex, true, true, (t * 15) * 0.5, (t * 15) * 0.5, 0, 1, 1)
	love.graphics.setBlendMode("add", "alphamultiply")
    Draw.setColor(returnAlphaColor(self.prophecy_color, Ch4Lib.scr_wave(0, 0.4, 4, 0)))
    Draw.drawWrapped(self.perlin_tex, true, true, (t * 15) * 0.5, (t * 15) * 0.5, 0, 1, 1)
	love.graphics.setBlendMode("alpha", "alphamultiply")
	love.graphics.setStencilTest()
	for _, prophecy in ipairs(self.prophecies) do
		if prophecy then
			if not prophecy.do_break then
				Draw.setColor(0, 0, 0, prophecy.layer * 0.15)
				Draw.draw(self.fill_tex, math.floor(prophecy.x), math.floor(prophecy.y), 0, 130 * prophecy.scale, 100 * prophecy.scale)
			elseif prophecy.do_break then
				Draw.setColor(1, 1, 1, (1 - (prophecy.layer * 0.15)) * prophecy.alpha)
				for i, shard in ipairs(prophecy.break_shards) do
					if shard then
						Draw.draw(self.shatter_frames[i], math.floor(prophecy.x), math.floor(prophecy.y + shard.y), 0, prophecy.scale, prophecy.scale)
					end
				end
			end
		end
	end
	Draw.popCanvas(true)
	
	Draw.setColor(self:getDrawColor())
	Draw.drawCanvas(canvas_starfield, 0, 0, 0, 2, 2)
	Draw.drawCanvas(canvas_prophecy, 0, 0, 0, 2, 2)
end

return IntroGigaProphecies