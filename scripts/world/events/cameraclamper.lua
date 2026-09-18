local CameraClamper, super = Class(Event)

function CameraClamper:init(data)
    super.init(self, data)
	
	self.con = 0
	self.timer = 0
	self.default_offset = nil
	self.clampx = data.properties["clampx"] or self.x
	self.clampy = data.properties["clampy"] or self.y
	self.clampw = data.properties["clampwidth"] or self.width
	self.clamph = data.properties["clampheight"] or self.height
	self.lerpstrength = data.properties["lerp"] or nil
	self.walk_only = data.properties["walk"] or false
	self.climb_only = data.properties["climb"] or false
end

function CameraClamper:update()
    super.update(self)
	if self.climb_only then return end
	if not self.world.player:isClimbing() then
		Object.startCache()
		if self.world.player:meetsObject(self) then
			self.world.camera:setBounds(self.clampx, self.clampy, self.clampw, self.clamph)
		else
			self.world.camera:setBounds()
		end
		Object.endCache()
	else
		self.world.camera:setBounds()
	end
end

return CameraClamper