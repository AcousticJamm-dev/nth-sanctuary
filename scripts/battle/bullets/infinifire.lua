local InfiniFire, super = Class(Bullet)

function InfiniFire:init(x, y, rotato, rev)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/guei/holyfire")
	
	self.initial_x = x
	self.initial_y = y
	
	self.rev = rev or 1
	
	self.rotato = rotato
	
	self.siner = 0
end

function InfiniFire:update()
    super.update(self)

    self.siner = self.siner + (DT * 2)
	if self.rotato then
		self.x = self.initial_x + math.sin(self.siner * 2) * 20 * self.rev
		self.y = self.initial_y + math.sin(self.siner) * 40
	else
		self.x = self.initial_x + math.sin(self.siner) * 40 * self.rev
		self.y = self.initial_y + math.sin(self.siner * 2) * 20
	end
end

return InfiniFire