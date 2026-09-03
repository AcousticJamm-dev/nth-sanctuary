local map, super = Class(Map, "1_2nd_sanctuary/second_sanctum_3")

function map:init(world, data)
    super.init(self, world, data)
    
	self.show_instructions = false
	self.forceend = false
	self.canceltimer = 0
	self.canceltime = 0
end

function map:onEnter()
	self.forceend = Game:getFlag("climbjump_tutorial_seen", false)
    if not Game.stage:getObjects(TutorialText)[1] then
		local tuttext = TutorialText(5, self)
		self.world:addChild(tuttext)
	end
end

function map:update()
	super.update(self)
	if self.world.player:isClimbing() then
		Object.startCache()	
		for _, obj in ipairs(self.world:getEvents("tutorialzone")) do
			if self.world.player:meetsObject(obj) then
				self.show_instructions = true
				break
			else
				if self.show_instructions then
					self.forceend = true
					Game:setFlag("climbjump_tutorial_seen", true)
				end
				self.show_instructions = false
			end
		end
		Object.endCache()
	else
		self.show_instructions = false
	end
end

return map
