local Basic, super = Class(Wave)
function Basic:init()
    super.init(self)
    self.time = 10
    self:setArenaSize(150, 50)
	self.attacks = 0
    self.wa = love.math.random(1, 5)
end

function Basic:onStart()
    -- Every 0.33 seconds...
    local arena = Game.battle.arena
    self.arena_start_x = arena.x
    self.timer:every(0.5, function()
		self.attacks = self.attacks + 1
		local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
		if self.attacks % 3 == 0 then
			x = Game.battle.soul.x
		end
        self:spawnBullet("jellycruel/rise_jelly", x, Game.battle.arena.top - 120)
    end)
end

function Basic:update()
    -- Code here gets called every frame
    if self.wa == 3 then
        Game.battle.arena:setPosition(self.arena_start_x + math.sin(Kristal.getTime()*3)*25, Game.battle.arena.y)
    end
    super.update(self)
end

return Basic