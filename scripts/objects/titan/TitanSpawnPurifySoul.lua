---@class TitanSpawnPurifySoul : Object
local TitanSpawnPurifySoul, super = HookSystem.hookScript("TitanSpawnPurifySoul")

function TitanSpawnPurifySoul:draw()
    super.draw(self)
    if self.t >= 450 then
        if self.enemymovecon == 2 then
            for _, enemy in ipairs(Game.battle:getActiveEnemies()) do
                if enemy.id == "leech_spawn" then
                    enemy.x = enemy.x + 300
                end
            end
            self.enemymovecon = 3
        end
    end
	
    if self.t >= 500 then
        if self.enemysparecon == 2 then
            for _, enemy in ipairs(Game.battle:getActiveEnemies()) do
                if enemy.id == "leech_spawn" then
                    enemy:spare()
                end
            end
            self.enemysparecon = 3
        end
    end
end

return TitanSpawnPurifySoul