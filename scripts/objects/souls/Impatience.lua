local Impatience, super = Class(Soul)

function Impatience:init(x, y)
    super.init(self, x, y, {128/255, 130/255, 134/255})
end

function Impatience:doMovement()
	local old_x = self.x
	local old_y = self.y
	
	super.doMovement(self)
	
	if self.x == old_x and self.y == old_y then
		for k,v in pairs(Game.battle.waves) do
			v.timer:pause()
			v.time = v.time + DT
			v.paused_stuff = true
			for _,j in ipairs(v.bullets) do
				j.paused_stuff = true
			end
		end
		Game.battle.arena.paused_stuff = true
	else
		for k,v in pairs(Game.battle.waves) do
			v.timer:unpause()
			v.paused_stuff = false
			for _,j in ipairs(v.bullets) do
				j.paused_stuff = false
			end
		end
		Game.battle.arena.paused_stuff = true
	end
end

return Impatience