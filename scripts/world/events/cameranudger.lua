local CameraNudger, super = Class(Event)

function CameraNudger:init(data)
    super.init(self, data)
	
	self.con = 0
	self.timer = 0
	self.default_offset = nil
	self.xnudge = data.properties["xnudge"] or 0
	self.ynudge = data.properties["ynudge"] or 0
	self.lerpstrength = data.properties["lerp"] or nil
	self.extmode = data.properties["mode"] or nil
	self.walk_only = data.properties["walk"] or false
	self.climb_only = data.properties["climb"] or false
end

return CameraNudger