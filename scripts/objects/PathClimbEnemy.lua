---@class Event.glowy : Event
local PathClimbEnemy, super = Class(ClimbEnemy)

function PathClimbEnemy:init(x, y, properties)
    super.init(self, x, y, "world/events/climbenemy/enemy_20")
	
	self.path = properties["path"]
    self.speed = properties["speed"] or 6

    self.progress = (properties["progress"] or 0) % 1
end

function PathClimbEnemy:snapToPath()
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
					
					self.rotation = MathUtils.angle(self.x, self.y, x, y) - math.rad(90)

                    self.x = x
					self.y = y
                    break
                else
                    current_dist = current_dist + next_dist
                end
            end
        elseif path.shape == "ellipse" then
            local angle = progress * (math.pi * 2)
            local x = path.x + math.cos(angle) * path.rx
            local y = path.y + math.sin(angle) * path.ry
			
			self.rotation = MathUtils.angle(self.x, self.y, x, y) - math.rad(90)

            self.x = x
			self.y = y
        end
    end
end

function PathClimbEnemy:update()
	super.update(self)
	
	if self.path and self.world.map.paths[self.path] then
		local path = self.world.map.paths[self.path]

		self.progress = self.progress + (4 / path.length) * DTMULT
		if path.closed then
			self.progress = self.progress % 1
		end

		self:snapToPath()
	end
end

return PathClimbEnemy