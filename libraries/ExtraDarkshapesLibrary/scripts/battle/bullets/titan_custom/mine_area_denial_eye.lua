local MineAreaDenialEye, super = Class(Bullet)

function MineAreaDenialEye:init(x, y, tx, ty)
    super.init(self, x, y, "battle/bullets/titan_custom/mine_eye")
    --points: x1, y1, x2, y2, x3, y3

    self.damage = 120
    self:setScale(1, 1)
    self.time = 0
    self.randappear = MathUtils.random(0.1, 0.4)
	self.frame = 1
	self.sprite:stop()
    self.sprite:setFrame(1)
	self.target_x = tx or self.x
	self.target_y = ty or self.y
end

function MineAreaDenialEye:onAdd(parent)
    super.onAdd(self, parent)

    Game.battle.timer:tween(self.randappear/2, self, { x = self.target_x, y = self.target_y }, "out-cubic")
    Game.battle.timer:tween(self.randappear, self, { frame = #self.sprite.frames }, "in-quint", function()
		self.frame = #self.sprite.frames
		self.collidable = false
        self:fadeOutAndRemove(0.3)
    end)
end

function MineAreaDenialEye:update()
    super.update(self)
    
    self.sprite:setFrame(math.floor(self.frame))
end

return MineAreaDenialEye