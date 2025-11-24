local Map, super = Class("Map", true)

function Map:onExit()
	super.onExit(self)
	if Game.world.map.id and Game.world.map.id ~= "fast_travel" and Game.world.map.id ~= "grand_door" and Game.world.map.id ~= "Map" then
		Game:setFlag("ft_last_map", Game.world.map.id)
	end
end

return Map