---@class Camera : Camera
---@field tower CylinderTower
local Camera, super = HookSystem.hookScript(Camera)
---@cast super Camera

function Camera:init(parent, x, y, width, height, keep_in_bounds)
    super.init(self, parent, x, y, width, height, keep_in_bounds)
	self.nudgex = 0
	self.nudgey = 0
	self.nudgelerp = 0.1
end

function Camera:updateAttached()
    local target_x, target_y = self:getTargetPosition()

    if not self.attached_x then target_x = self.x end
    if not self.attached_y then target_y = self.y end

	local nudged = false
	local target = self:getTarget()
	if target and target.is_player and target:isCameraAttachable() then
		Object.startCache()
		for _, nudger in ipairs(Game.world:getEvents("cameranudger")) do
			if target:meetsObject(nudger) and not nudger.climb_only then
				if nudger.lerpstrength then
					self.nudgelerp = nudger.lerpstrength
				end
				local yoff = -2
				if nudger.ynudge > 0 then
					yoff = 2
				end
				local xoff = -2
				if nudger.xnudge > 0 then
					xoff = 2
				end
				local nx = nudger.xnudge
				local ny = nudger.ynudge
				if nudger.extmode == "gradleft" then
					nx = MathUtils.lerp(0, nx, 1 - MathUtils.clamp(((target.x - target.width/2) - nudger.x) / nudger.width, 0, 1))
					ny = MathUtils.lerp(0, ny, 1 - MathUtils.clamp(((target.x - target.width/2) - nudger.x) / nudger.width, 0, 1))
				elseif nudger.extmode == "gradright" then
					nx = MathUtils.lerp(0, nx, MathUtils.clamp(((target.x - target.width/2) - nudger.x) / nudger.width, 0, 1))
					ny = MathUtils.lerp(0, ny, MathUtils.clamp(((target.x - target.width/2) - nudger.x) / nudger.width, 0, 1))
				elseif nudger.extmode == "gradtop" then
					nx = MathUtils.lerp(0, nx, 1 - MathUtils.clamp(((target.y - target.height) - nudger.y) / nudger.height, 0, 1))
					ny = MathUtils.lerp(0, ny, 1 - MathUtils.clamp(((target.y - target.height) - nudger.y) / nudger.height, 0, 1))
				elseif nudger.extmode == "gradbottom" then
					nx = MathUtils.lerp(0, nx, MathUtils.clamp(((target.y - target.height) - nudger.y) / nudger.height, 0, 1))
					ny = MathUtils.lerp(0, ny, MathUtils.clamp(((target.y - target.height) - nudger.y) / nudger.height, 0, 1))
				end
				self.nudgex = MathUtils.lerp(self.nudgex, nx + xoff, 1 - (1 - self.nudgelerp) ^ DTMULT)
				self.nudgey = MathUtils.lerp(self.nudgey, ny + yoff, 1 - (1 - self.nudgelerp) ^ DTMULT)
				self.nudgex = MathUtils.clamp(self.nudgex, math.abs(nx) * -1, math.abs(nx))
				self.nudgey = MathUtils.clamp(self.nudgey, math.abs(ny) * -1, math.abs(ny))
				nudged = true
			end
		end
		Object.endCache()
		if not nudged then
			local yoff = -2
			if self.nudgey < 0 then
				yoff = 2
			end
			local xoff = -2
			if self.nudgex < 0 then
				xoff = 2
			end
			if math.abs(0 - self.nudgex) > 1 then
				self.nudgex = MathUtils.lerp(self.nudgex, 0 + xoff, 1 - (1 - self.nudgelerp) ^ DTMULT)
			else
				self.nudgex = 0
			end
			if math.abs(0 - self.nudgey) > 1 then
				self.nudgey = MathUtils.lerp(self.nudgey, 0 + yoff, 1 - (1 - self.nudgelerp) ^ DTMULT)
			else
				self.nudgey = 0
			end
		end
	else
		self.nudgex = 0
		self.nudgey = 0
	end
    self:moveTo(target_x + self.nudgex, target_y + self.nudgey)
end

return Camera
