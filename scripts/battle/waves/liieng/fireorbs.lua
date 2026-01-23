local FireOrbs, super = Class(Wave)

function FireOrbs:init()
    super.init(self)

    self.time = 270/30
end

function FireOrbs:onStart()
    local attackers = #self:getAttackers()           --scr_monsterpop()
    local enemies = #Game.battle:getActiveEnemies()  --sameattack
    local arena = Game.battle.arena
	
	for i = 1, attackers do
		Game.battle.timer:after(((i-1)*4)/30, function()
			local fireorb = self:spawnBullet("liieng/fireorb", arena.x, arena.y)
			if attackers == enemies and enemies < 3 then
				fireorb.speed = 2
			else
				fireorb.speed = 1
			end
			fireorb.index = i - 1
			fireorb.basebuldist = {100, 60, 140}
			fireorb.sinbuldist = {60, 20, 100}
			if attackers == enemies then
				fireorb.bullets = math.min(6 - attackers, 5)
				if enemies == 1 then
					fireorb.multibul = 3
				else
					fireorb.multibul = 2
				end
			else
				fireorb.bullets = math.min(5 - attackers, 4)
				if attackers == 1 and enemies < 3 then
					fireorb.multibul = 2
				else
					fireorb.multibul = 1
				end
			end
		end)
	end
end

return FireOrbs