local WindowParallaxUnused, super = Class(Event, "window_parallax")

function WindowParallaxUnused:init(data)
    super.init(self, data)
	self.siner = 0
    local properties = data and data.properties or {}
	self.ss = properties["parallax_x"] or 0.5
	self.ssy = properties["parallax_y"] or 0.5
	self.crazy = properties["crazy"] or false
	self.xoff = 0
	self.yoff = 0
	self.auto = 0
	self.autoy = 0
	self.windowbg = Assets.getTexture("world/events/window_parallax/windowbg_soft")
	self:setSprite("world/events/window_parallax/window")
	self:setOrigin(0.5, 1)
	self.x_start = self.x
	self.y_start = self.y
end

function WindowParallaxUnused:update()
	super.update(self)
	if self.crazy then
		self.siner = self.siner + DTMULT
		self.y = self.y_start + (math.sin(self.x_start + (self.siner / 20)) * 10)
		self.x = self.x_start + (math.cos(self.x_start + (self.siner / 20)) * 40)
		self.auto = self.auto + 10 * DTMULT
	end
	self.xoff = ((Game.world.camera.x - SCREEN_WIDTH/2) + self.auto) * self.ss
	self.yoff = ((Game.world.camera.y - SCREEN_HEIGHT/2) + self.autoy) * self.ssy
end

function WindowParallaxUnused:draw()
	Draw.pushScissor()
    Draw.scissor(0, 23*2, 29*2, 49*2)
	Draw.setColor(1,1,1,1)
	Draw.drawWrapped(self.windowbg, true, true, self.xoff, self.yoff, 0, 2, 2)
    Draw.popScissor()
    super.draw(self)
end

return WindowParallaxUnused