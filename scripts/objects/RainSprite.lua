local RainSprite, super = Class(Sprite)

function RainSprite:init(texture, x, y, width, height, path)
    super.init(self, texture, x, y, width, height, path)
end

function RainSprite:update()
    super.update(self)
    local size = self.width + self.height
    local x, y = self:getScreenPos()
    if y > SCREEN_HEIGHT + size then
		self:remove()
    end
end

return RainSprite