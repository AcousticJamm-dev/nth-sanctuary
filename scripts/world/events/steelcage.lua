local SteelCage, super = Class(Interactable)

function SteelCage:init(data)
    super.init(self, data.x, data.y, data.shape, data.properties)

    self.solid = true
    local properties = data and data.properties or {}

    self.text = properties["text"] and TiledUtils.parsePropertyMultiList("text", properties) or {"* (Perhaps if you play part of a bar,[wait:5] the bars will part.)"}
	self.flyaway = properties["flyaway"] or true
	
    self:setSprite("world/events/steelcage/steelstaff")
end

function SteelCage:onRemove(parent)
	if self.flyaway then
		local afterimage = Sprite("world/events/steelcage/steelstaff", self.x, self.y)
		afterimage:setScale(2)
		afterimage.layer = self.layer
		afterimage.physics.gravity = -0.5
		afterimage:fadeOutSpeedAndRemove(0.04)
		Game.world:addChild(afterimage)
	end
    super.onRemove(self, parent)
end

return SteelCage