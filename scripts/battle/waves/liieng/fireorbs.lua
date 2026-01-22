local FireOrbs, super = Class(Wave)

function FireOrbs:init()
    super.init(self)

    self.time = 270/30
end

function FireOrbs:onStart()
    local attackers = #self:getAttackers()           --scr_monsterpop()
    local enemies = #Game.battle:getActiveEnemies()  --sameattack
    local arena = Game.battle.arena
	
	if attackers == enemies then
		local fireorb = self:spawnBullet("liieng/fireorb", arena.x, arena.y, 4)
		fireorb.speed = 2
		fireorb.index = 0
		fireorb.basebuldist = {140, 100, 60}
		fireorb.sinbuldist = {100, 60, 20}
		fireorb.multibul = 3
	else
		for i = 1, attackers do
			local fireorb = self:spawnBullet("liieng/fireorb", arena.x, arena.y, 4 - attackers)
			fireorb.index = i - 1
			fireorb.basebuldist = 80 - (attackers * 10)
			fireorb.sinbuldist = 40 - (attackers * 10)
		end
	end
end

return FireOrbs