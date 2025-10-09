---@class FatalEffect2 : Object
---@overload fun(...) : FatalEffect2
local TitanStarDissolve, super = Class(Object)

function TitanStarDissolve:init(texture, dissolve_texture, x, y, after)
    super.init(self, x, y)

    if type(texture) == "string" then
        texture = Assets.getTexture(texture) or (Assets.getFrames(texture)[1])
	end
    if type(dissolve_texture) == "string" then
		dissolve_texture = Assets.getTexture(dissolve_texture) or (Assets.getFrames(dissolve_texture)[1])
    end
    self.texture = texture
    self.dissolve_texture = dissolve_texture

    self.done = false
    self.after_func = after
	
	self.timer = 0
	self.lifetime = 35
	self.prog = 0
	self.lastprog = 0
	self.remprog = {0,0,0,0}
	self.con = 1
	self.particles = 10
	self.pcount = 0
	self.prate = 1 / self.particles
end

function TitanStarDissolve:update()
    --[[if self.blocks[0][self.blocks_y].speed >= 12 then
        self.done = true
        if self.after_func then
            self.after_func()
        end
        self:remove()
    end]]
	self.remprog[4] = self.remprog[3]
	self.remprog[3] = self.remprog[2]
	self.remprog[2] = self.remprog[1]
	self.remprog[1] = self.prog
	self.prog = MathUtils.clamp(self.timer / self.lifetime, 0, 1)
	if self.con == 1 then
		self.timer = self.timer + DTMULT
		if self.prog >= self.prate * self.pcount then
			self.pcount = self.pcount + 1
			
			local midpoint = 0.45
			
			local ts = -4
			local width = 45
			if self.prog <= midpoint then
				width = Utils.ease(0, 1.5, (self.prog / midpoint), "inExpo")
			else
				width = Utils.ease(1.5, 0, (self.prog - midpoint) / (1 - midpoint), "outExpo")
			end
			local tilt = MathUtils.random(0.5, 1) * Utils.randomSign()
			for i = 0, width, 40 do
				local tw = 85
				if tilt > 0 then
					tw = 120
				end
				local dissipate_sprite = BlendSprite("effects/spr_darkshape_dissipate", self.x + MathUtils.lerp(132, 125, self.prog) * 2 + (tilt * (width * tw)), self.y + 370 - (self.prog * 230) + MathUtils.random(-10, 10) + (tilt * ts))
				dissipate_sprite:setOrigin(0.5, 0.5)
				dissipate_sprite:setScale(0.5, 0.5)
				dissipate_sprite:setFrame(2)
				dissipate_sprite.layer = self.layer + 1
				dissipate_sprite.physics.speed = 4
				dissipate_sprite.physics.direction = math.rad(-90)
				dissipate_sprite.physics.friction = 0.1
				dissipate_sprite:play(1 / 7.5, false, function()
					dissipate_sprite:remove()
				end)
				Game.battle:addChild(dissipate_sprite)
			end
		end
		if self.timer >= self.lifetime then
			self.con = 2
		end
	end
    super.update(self)
end

function TitanStarDissolve:draw()
    local r, g, b, a = self:getDrawColor()
	
	--[[local height = 230
	for i = 0, height do
 			
		local midpoint = 0.45
		
		local ts = -4
		local width = 45
		if i/height <= midpoint then
			width = Utils.ease(0, 0.85, ((i/height) / midpoint), "inExpo")
		else
			width = Utils.ease(0.85, 0, ((i/height) - midpoint) / (1 - midpoint), "outExpo")
		end
		local debug_line_start_x = (MathUtils.lerp(132, 125, i/height) * 2) - (width * 85)
		local debug_line_end_x = (MathUtils.lerp(132, 125, i/height) * 2) + (width * 120)
		local debug_line_start_y = 370 - i + (ts * width)
		local debug_line_end_y = 370 - i + (ts * width)
		Draw.setColor(1,0,0,1)
		love.graphics.setLineWidth(1)
		love.graphics.line(debug_line_start_x, debug_line_start_y, debug_line_end_x, debug_line_end_y)
	end
	Draw.setColor(1,1,1,0.5)
	Draw.draw(self.texture, 0, 0, 0, 2, 2)]]
	if self.remprog[3] < 1 then
		love.graphics.stencil(function()
			local last_shader = love.graphics.getShader()
			local shader = Mod.titan_dissolve_shader
			love.graphics.setShader(shader)
			shader:send("amount", self.remprog[3])
			Draw.draw(self.dissolve_texture, 0, 0, 0, 2, 2)
			love.graphics.setShader(last_shader)
		end, "replace", 1)
		love.graphics.setStencilTest("greater", 0)
		local last_shader = love.graphics.getShader()
		Draw.setColor(0.5,0.5,0.5,1)
		Draw.draw(self.texture, 0, 0, 0, 1, 1)
		love.graphics.setStencilTest()
	end
	if self.remprog[1] < 1 then
		love.graphics.stencil(function()
			local last_shader = love.graphics.getShader()
			local shader = Mod.titan_dissolve_shader
			love.graphics.setShader(shader)
			shader:send("amount", self.remprog[1])
			Draw.draw(self.dissolve_texture, 0, 0, 0, 2, 2)
			love.graphics.setShader(last_shader)
		end, "replace", 1)
		love.graphics.setStencilTest("greater", 0)
		local last_shader = love.graphics.getShader()
		Draw.setColor(0,0,0,1)
		Draw.draw(self.texture, 0, 0, 0, 2, 2)
		love.graphics.setStencilTest()
	end
	if self.prog < 1 then
		love.graphics.stencil(function()
			local last_shader = love.graphics.getShader()
			local shader = Mod.titan_dissolve_shader
			love.graphics.setShader(shader)
			shader:send("amount", self.prog)
			Draw.draw(self.dissolve_texture, 0, 0, 0, 2, 2)
			love.graphics.setShader(last_shader)
		end, "replace", 1)
		love.graphics.setStencilTest("greater", 0)
		local last_shader = love.graphics.getShader()
		Draw.setColor(1,1,1,1)
		Draw.draw(self.texture, 0, 0, 0, 2, 2)
		Draw.setColor(r, g, b, a)
		love.graphics.setStencilTest()
	end
    super.draw(self)
end

return TitanStarDissolve