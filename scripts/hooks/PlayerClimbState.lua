---@class PlayerClimbState : PlayerClimbState
---@field world World
local PlayerClimbState, super = HookSystem.hookScript(PlayerClimbState)

function PlayerClimbState:updateClimbCamera()
    local camera = Game.world.camera
    if camera == nil then
        return
    end

    if self.player.onrotatingtower then
        local camera_lerp_speed = 0.16

        local camera_min_x, camera_min_y = camera:getMinPosition()
        local camera_max_x, camera_max_y = camera:getMaxPosition()

        local camera_x = MathUtils.clamp(Game.world.map.cyltower.krisx, camera_min_x, camera_max_x)
        local camera_y = MathUtils.clamp(Game.world.map.cyltower.krisy + self.camera_y_offset, camera_min_y, camera_max_y)

        local t = 1 - (1 - camera_lerp_speed) ^ DTMULT
		local ideal_y = MathUtils.lerp(camera.y, camera_y, t)

        camera:setPosition(camera_x, ideal_y)
    else
		local camera = Game.world.camera
		if camera == nil then
			return
		end
		local camera_lerp_speed = 0.16
		local xnudge = 0
		local ynudge = 0

		Object.startCache()	
		for _, nudger in ipairs(Game.world:getEvents("cameranudger")) do
			if self.player:meetsObject(nudger) then
				xnudge = nudger.xnudge
				ynudge = nudger.ynudge
				if nudger.lerpstrength then
					camera_lerp_speed = nudger.lerpstrength
				end
			end
		end
		Object.endCache()
		local camera_min_x, camera_min_y = camera:getMinPosition()
		local camera_max_x, camera_max_y = camera:getMaxPosition()

		local camera_x = MathUtils.clamp(self.player.x + xnudge, camera_min_x, camera_max_x)
		local camera_y = MathUtils.clamp(self.player.y + ynudge + self.camera_y_offset, camera_min_y, camera_max_y)

		local t = 1 - (1 - camera_lerp_speed) ^ DTMULT

		local ideal_x = MathUtils.lerp(camera.x, camera_x, t)
		local ideal_y = MathUtils.lerp(camera.y, camera_y, t)

		camera:setPosition(ideal_x, ideal_y)
    end
end

return PlayerClimbState