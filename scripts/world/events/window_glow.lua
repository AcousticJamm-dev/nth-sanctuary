local WindowGlow, super = Class(Event, "window_glow")

function WindowGlow:init(data)
    super.init(self, data)
	self.siner = 0
	self.glows = 4
    local properties = data and data.properties or {}
	self.huge = properties["huge"] or false
	self.scalex = 2
	self.scaley = 2
	if self.huge then
		self.glows = 5
		self:setSprite("world/events/window_glow/church_window_huge")
		self:setScale(0.5,0.5)
		self.sprite:setScale(2,2)
	else
		self:setSprite("world/events/window_glow/church_window_big")
	end
	self:setOrigin(0.5, 1)
end

function WindowGlow:update()
	super.update(self)	
	self.siner = self.siner + DTMULT
	self.sprite.alpha = self.alpha
end

function WindowGlow:draw()
    super.draw(self)
	love.graphics.setBlendMode("add")
	local xoff = -math.cos(math.rad(self.siner)) * 1
	local yoff = -math.sin(math.rad(self.siner)) * 1
	local dist = 4 * self.scalex
	local scale = 0.05 * self.scalex
	for i = 0, self.glows do
		Draw.setColor(1,1,1,((0.7 + math.sin(self.siner / 40) * 0.4) - (0.1 * i)) * self.alpha)
		Draw.draw(self.sprite.texture, (xoff * i * dist), yoff + (i * dist), 0, self.scalex + (scale * i), self.scaley + (scale * i))
	end
	love.graphics.setBlendMode("alpha")
	Draw.setColor(1,1,1,1)
end

return WindowGlow