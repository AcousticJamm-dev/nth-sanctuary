local ClimbCameraNudger, super = Class(Event)

function ClimbCameraNudger:init(data)
    super.init(self, data)
	
	self.con = 0
	self.timer = 0
	self.default_offset = nil
	self.nudge = data.properties["nudge"] or -80
	self.permanent = data.properties["permanent"] or false
end

function ClimbCameraNudger:update()
    super.update(self)	
	if self.world.player:isClimbing() then
		local climb_player = self.world.player.climb_state
		local climb_dir = nil
		if self.con == 0 then
			if climb_player.direction == "up" then
				climb_dir = 2
			elseif climb_player.direction == "down" then
				climb_dir = 0
			elseif climb_player.direction == "right" then
				climb_dir = 1
			elseif climb_player.direction == "left" then
				climb_dir = 3
			end
			if not self.default_offset then
				self.default_offset = climb_player.camera_y_offset
			end
			local skipcheck = false
			if self.permanent and ((climb_dir % 2) == 1 or climb_player.camera_y_offset == (self.nudge * (climb_dir - 1))) then
				skipcheck = true
			end
			Object.startCache()	
			if not skipcheck and self.world.player:meetsObject(self) then
				self.con = 1
			end
			Object.endCache()
		elseif self.con == 1 then
			if self.instant then
				climb_player.camera_y_offset = self.nudge
			else
				if self.permanent then
					if climb_dir % 2 == 0 then
						if climb_player.camera_y_offset ~= (self.nudge * (climb_dir - 1)) then
							Game.world.timer:tween(1, climb_player, {camera_y_offset = self.nudge * (climb_dir - 1)})
						end
						self.timer = 0
						self.con = 3
					end
				end
				self.timer = MathUtils.clamp(self.timer + 0.05 * DTMULT, 0, 1)
				climb_player.camera_y_offset = MathUtils.lerp(self.default_offset, self.nudge, self.timer)
			end
			Object.startCache()	
			if not self.world.player:meetsObject(self) then
				self.con = 2
			end
			Object.endCache()
		elseif self.con == 2 then
			if self.instant then
				climb_player.camera_y_offset = self.default_offset
				self.con = 0
			else
				self.timer = MathUtils.clamp(self.timer - 0.05 * DTMULT, 0, 1)
				if self.timer <= 0 then
					self.con = 0
				end
				climb_player.camera_y_offset = MathUtils.lerp(self.default_offset, self.nudge, self.timer)
			end
			Object.startCache()	
			if self.world.player:meetsObject(self) then
				self.con = 1
			end
			Object.endCache()
		else
			self.timer = self.timer + DTMULT
			if self.timer >= 35 then
				self.con = 0
			end
		end
	end
end

return ClimbCameraNudger