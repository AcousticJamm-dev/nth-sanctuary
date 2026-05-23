---@class LightRainDrop : Object
local LightRainDrop, super = Class(Object)

function LightRainDrop:init(x, y)
    super.init(self, x, y)
	self.rain_tex = Assets.getFrames("effects/light_rain_style_b")
	self:setScale(2)
	self.loop = true
	self.init = false
	self.xbuffer = 40
	self.maxx = SCREEN_WIDTH
	self.minx = 0
end

function LightRainDrop:update()
	super.update(self)
	if Game.world.map and Game.world.map.data.properties["inside"] then return end
	if not self.init then
		if self.physics.speed_x > 0 then
			self.maxx = self.maxx + self.xbuffer
		else
			self.minx = self.minx - self.xbuffer
		end
		self.init = true
	end
	local cx, cy = Game.world.camera.x - SCREEN_WIDTH / 2, Game.world.camera.y - SCREEN_HEIGHT / 2
	if self.y - cy >= 560 then
		self:remove()
	elseif self.x >= cx + self.maxx then
		self.x = self.x - (SCREEN_WIDTH + self.xbuffer)
	elseif self.x <= cx + self.minx then
		self.x = self.x + (SCREEN_WIDTH + self.xbuffer)
	end
end

function LightRainDrop:setGMBlendMode(blend_mode)
	if blend_mode == "bm_subtract" then
		Ch4Lib.setBlendState("add", "zero", "oneminussrccolor")
	elseif blend_mode == "bm_add" then
		Ch4Lib.setBlendState("add", "srcalpha", "one")
	elseif blend_mode == "bm_normal" then
		Ch4Lib.setBlendState("add", "srcalpha", "oneminussrcalpha")
	end
end

function LightRainDrop:draw()
	super.draw(self)
	if Game.world.map and Game.world.map.data.properties["inside"] then return end
	love.graphics.push()
	love.graphics.setBlendMode("add")
	Draw.setColor(ColorUtils.mergeColor(COLORS.white, COLORS.black, 0.8))
	Draw.draw(self.rain_tex[self.rain_index], 0, 0, 0, 1, 1, 11, 22)
    love.graphics.setBlendMode("alpha")
    Draw.setColor(1, 1, 1, 1)
	love.graphics.pop()
	love.graphics.setBlendMode("alpha", "alphamultiply")
end

return LightRainDrop