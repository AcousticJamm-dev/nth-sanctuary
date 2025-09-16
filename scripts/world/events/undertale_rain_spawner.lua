local UndertaleRainSpawner, super = Class(Event, "undertale_rain_spawner")

function UndertaleRainSpawner:init(data)
    super.init(self, data)
	self.timer = 0
end

function UndertaleRainSpawner:update()
    super.update(self)
	
	if self.timer >= 1 then
		local drop = RainSprite("effects/statuedrop", Utils.random(0, Game.world.map.width * Game.world.map.tile_width), 0 - Utils.random(50) - 70)
		drop.layer = self.layer
		drop:setScale(2,2)
		drop.physics.speed_y = 4 + Utils.random(2)
		drop.physics.gravity = 0.4
		Game.world:addChild(drop)
		self.timer = 0
	end
	self.timer = self.timer + DTMULT
end

return UndertaleRainSpawner