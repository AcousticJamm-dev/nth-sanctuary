local PewdinnFlameAppear, super = Class(Object)

function PewdinnFlameAppear:init(x, y)
    super.init(self, x, y)
	self.ball_thickness = 1
	self.ball_life = 8
	self.ball_lifemax = self.ball_life
    self.curve = curve or LibTimer.tween["out-quad"]
end

function PewdinnFlameAppear:update()
    super.update(self)
    self.ball_life = MathUtils.approach(self.ball_life, 0, DTMULT)
    self.ball_thickness = MathUtils.lerp(self.ball_thickness, 0, self.curve(1 - (self.ball_life / self.ball_lifemax)))
	if self.ball_life <= 0 then
        self:remove()
    end
end

function PewdinnFlameAppear:draw()
    super.draw(self)

	local last = love.graphics.getLineWidth()
	love.graphics.setLineWidth(28*(self.ball_thickness))
	Draw.setColor(0,0,0,1)
	love.graphics.circle("line", 18, 18, 1+(14*(1-self.ball_thickness/2)), 32)
	love.graphics.setLineWidth(28*(self.ball_thickness/2))
	Draw.setColor(1,1,1,1)
	love.graphics.circle("line", 18, 18, 1+(14*(1-self.ball_thickness/2)), 32)
	love.graphics.setLineWidth(last)
end

return PewdinnFlameAppear