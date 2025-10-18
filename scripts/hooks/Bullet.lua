--- *(Override)* Called when the bullet hits the player's soul without invulnerability frames. \
--- Not calling `super.onDamage()` here will stop the normal damage logic from occurring.
---@param soul Soul
---@return table<PartyBattler> battlers_hit

local Bullet, super = HookSystem.hookScript(Bullet)

function Bullet:onDamage(soul)
    local damage = self:getDamage()
    if damage > 0 then
        local target = self:getTarget()
        local battlers = Game.battle:hurt(damage, false, target, self:shouldSwoon(damage, target, soul))
        soul.inv_timer = self.inv_timer
        soul:onDamage(self, damage)
        if Game.battle.encounter.id == "mechanic_tester_2" then
            for k,v in ipairs(battlers) do
                v:recruitMessage(10, 20, "poisoned")
               if not v.chara.poison_hurt then
                   v.chara.poison_hurt = 1
               else
                   v.chara.poison_hurt = v.chara.poison_hurt + 1
               end
            end
        end
        return battlers
    end
    return {}
end

return Bullet