---@class Border.stars: Border
local ChurchFloodedBorder, super = Class(ImageBorder)

function ChurchFloodedBorder:init()
    super.init(self, "church_flooded")
    self.hell_texture = Assets.getTexture("borders/church_flooded_hell")
	self.hell_border_alpha = Game:getFlag("floodedChurchBorderLastAlpha", 0)
	self.id = "church_flooded_dynamic"
end

function ChurchFloodedBorder:draw()
    super.draw(self)
	if Game.world.map.hell_border_alpha then
		self.hell_border_alpha = MathUtils.lerp(self.hell_border_alpha, Game.world.map.hell_border_alpha, 0.5*DTMULT)
		Game:setFlag("floodedChurchBorderLastAlpha", self.hell_border_alpha)
	end
    love.graphics.setColor(1, 1, 1, self.hell_border_alpha * BORDER_ALPHA)
	Draw.draw(self.hell_texture, 0, 0, 0, BORDER_SCALE)
end

return ChurchFloodedBorder