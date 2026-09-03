local TutorialZone, super = Class(Event)

function TutorialZone:init(data)
    super.init(self, data)
	
	self.solid = false
end

return TutorialZone