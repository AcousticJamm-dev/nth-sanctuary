local WingladeChaser, super = Class(ChaserEnemy, "wingladeenemy")

function WingladeChaser:init(data)
    super.init(self, data.properties["actor"], data.x, data.y, data.properties)

	self.collider = CircleCollider(self, self.width/2, self.height/2, 24)
    self:setOriginExact(26, 24)
end

function WingladeChaser:snapToPath()
    if self.path and self.world.map.paths[self.path] then
        local path = self.world.map.paths[self.path]

        local progress = self.progress
        if not path.closed then
            progress = Ease.inOutSine(progress, 0, 1, 1)
        end

        if path.shape == "line" then
            local dist = progress * path.length
            local current_dist = 0

            for i = 1, #path.points - 1 do
                local next_dist = MathUtils.dist(path.points[i].x, path.points[i].y, path.points[i + 1].x, path.points[i + 1].y)

                if current_dist + next_dist > dist then
                    local x = MathUtils.lerp(path.points[i].x, path.points[i + 1].x, MathUtils.clamp((dist - current_dist) / next_dist, 0, 1))
                    local y = MathUtils.lerp(path.points[i].y, path.points[i + 1].y, MathUtils.clamp((dist - current_dist) / next_dist, 0, 1))

                    if self.debug_x and self.debug_y and Kristal.DebugSystem.last_object == self then
                        x = Utils.ease(self.debug_x, x, Kristal.DebugSystem.release_timer, "outCubic")
                        y = Utils.ease(self.debug_y, y, Kristal.DebugSystem.release_timer, "outCubic")
                        if Kristal.DebugSystem.release_timer >= 1 then
                            self.debug_x = nil
                            self.debug_y = nil
                        end
                    end

					self:moveTo(x, y)
					self.rotation = MathUtils.angle(path.points[i].x, path.points[i].y, path.points[i + 1].x, path.points[i + 1].y) - math.rad(270)
                    break
                else
                    current_dist = current_dist + next_dist
                end
            end
        elseif path.shape == "ellipse" then
            local angle = progress * (math.pi * 2)
            local x = path.x + math.cos(angle) * path.rx
            local y = path.y + math.sin(angle) * path.ry

            if self.debug_x and self.debug_y and Kristal.DebugSystem.last_object == self then
                x = Utils.ease(self.debug_x, x, Kristal.DebugSystem.release_timer, "outCubic")
                y = Utils.ease(self.debug_y, y, Kristal.DebugSystem.release_timer, "outCubic")
                if Kristal.DebugSystem.release_timer >= 1 then
                    self.debug_x = nil
                    self.debug_y = nil
                end
            end

            self:moveTo(x, y)
			self.rotation = angle - math.rad(180)
        end
    end
	if Game.world.player then
		local x_screen_pos, y_screen_pos = self:getScreenPos()
		local x_player, y_player = Game.world.player:getScreenPos()
		local eye_angle = MathUtils.angle(x_screen_pos + 27, y_screen_pos + 23, x_player, y_player)
		self.sprite.eye_target_x = math.cos(eye_angle - self.rotation) * 2
		self.sprite.eye_target_y = math.sin(eye_angle - self.rotation) * 2
	else
	    self.sprite.eye_target_x = 0
		self.sprite.eye_target_y = 0
	end
end

return WingladeChaser