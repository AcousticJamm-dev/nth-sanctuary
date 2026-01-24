local DarkRoomBGEvent, super = Class(Event)

function DarkRoomBGEvent:init(data)
    super.init(self, data)
end

function DarkRoomBGEvent:onAdd(parent)
    super.onAdd(self, parent)
	Game.world:spawnObject(DarkRoomBG(), "objects_bg")
end

return DarkRoomBGEvent