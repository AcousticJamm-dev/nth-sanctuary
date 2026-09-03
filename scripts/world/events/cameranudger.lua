local CameraNudger, super = Class(Event)

function CameraNudger:init(data)
    super.init(self, data)
	
	self.con = 0
	self.timer = 0
	self.default_offset = nil
	self.xnudge = data.properties["xnudge"] or 0
	self.ynudge = data.properties["ynudge"] or 0
	self.lerpstrength = data.properties["lerp"] or nil
end

return CameraNudger