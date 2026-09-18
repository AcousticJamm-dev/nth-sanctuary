---@class PlayerClimbState : PlayerClimbState
---@field world World
local PlayerClimbState, super = HookSystem.hookScript(PlayerClimbState)

function PlayerClimbState:updateClimbCamera()
    local camera = Game.world.camera
    if camera == nil then
        return
    end

    local camera_lerp_speed = 0.16
	local xnudge = 0
	local ynudge = 0

    local camera_min_x, camera_min_y = camera:getMinPosition()
    local camera_max_x, camera_max_y = camera:getMaxPosition()
	
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
	for _, clamper in ipairs(Game.world:getEvents("cameraclamper")) do
		if self.player:meetsObject(clamper) then
			camera_min_x = clamper.clampx + (camera.width / camera.zoom_x) / 2
			camera_min_y = clamper.clampy + (camera.height / camera.zoom_y) / 2
			camera_max_x = clamper.clampx + clamper.clampw - (camera.width / camera.zoom_x) / 2
			camera_max_y = clamper.clampy + clamper.clamph - (camera.height / camera.zoom_y) / 2
			if clamper.lerpstrength then
				camera_lerp_speed = nudger.lerpstrength
			end
		end
	end
	Object.endCache()
	
	local camera_x = MathUtils.clamp(self.player.x + xnudge, camera_min_x, camera_max_x)
	local camera_y = MathUtils.clamp(self.player.y + ynudge + self.camera_y_offset, camera_min_y, camera_max_y)
    if self.player.onrotatingtower then
        camera_x = MathUtils.clamp(Game.world.map.cyltower.krisx + xnudge, camera_min_x, camera_max_x)
        camera_y = MathUtils.clamp(Game.world.map.cyltower.krisy + ynudge + self.camera_y_offset, camera_min_y, camera_max_y)
	end
    
	local t = 1 - (1 - camera_lerp_speed) ^ DTMULT
	local ideal_x = MathUtils.lerp(camera.x, camera_x, t)
	local ideal_y = MathUtils.lerp(camera.y, camera_y, t)

    camera:setPosition(ideal_x, ideal_y)
end

return PlayerClimbState