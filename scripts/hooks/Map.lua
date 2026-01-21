local Map, super = Class("Map", true)

function Map:onExit()
	super.onExit(self)
	if Game.world.map.id and 
	Game.world.map.id ~= "fast_travel" and 
	Game.world.map.id ~= "grand_door" and 
	Game.world.map.id ~= "citadel_room" and
	Game.world.map.id ~= "citadel_room2" and
	Game.world.map.id ~= "Map" then
		Game:setFlag("ft_last_map", Game.world.map.id)
	end
end

function Map:load()
	super.load(self)
	if DISCORD_RPC_AVAILABLE and Kristal.Config["discordRPC"] then
        local presence = Kristal.getPresence()
		print(Game.world.map.name)
        presence.state = "Map: "..(Game.world.map.name or "???")
        presence.details = "Shards: "..tostring(Game:getFlag("shards") or 0)
        Kristal.setPresence(presence)
    end
end

return Map