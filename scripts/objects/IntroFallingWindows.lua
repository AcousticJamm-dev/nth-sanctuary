local IntroFallingWindows, super = Class(Object)

function IntroFallingWindows:init()
    super.init(self)
	self:setPosition(0)
	self:setParallax(0)
	
    self.window_tex = Assets.getTexture("world/events/window_glow/church_window_big")
    self.window_blur_tex = Assets.getTexture("world/events/window_glow/church_window_blur")
	
	self.delta = 1
	self.window_timer = 0
	self.window_con = 0
	self.darken = 0
end

function IntroFallingWindows:draw()
    super.draw(self)
	if self.window_timer <= 0 then return end
	self.window_timer = self.window_timer + self.delta * DTMULT
	local window = self.delta > 0.5 and self.window_blur_tex or self.window_tex
	if self.window_timer * 40 >= 600 and self.window_con == 0 then
		self.window_con = 1
	end
	Draw.setColor(ColorUtils.mergeColor(COLORS.white, ColorUtils.hexToRGB("#2A39FFFF"), self.darken))
	for i = 0, 6 do
		if self.window_con ~= 1 then
			Draw.draw(window, 40, 500 - (((self.window_timer * 40) - (i * 200))), 0, 2, 2)
			Draw.draw(window, 640 - 62 - 40, 500 - (((self.window_timer * 40) - (i * 200))), 0, 2, 2)
		else
			Draw.draw(window, 40, 500 - (((self.window_timer * 40) - (i * 200)) % 600), 0, 2, 2)
			Draw.draw(window, 640 - 62 - 40, 500 - (((self.window_timer * 40) - (i * 200)) % 600), 0, 2, 2)
		end
	end
end

return IntroFallingWindows