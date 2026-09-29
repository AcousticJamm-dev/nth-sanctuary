local spell, super = Class(Spell, "powder_mist")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Powder Mist"

    -- Battle description
    self.effect = "Raise Miss\nChance"
    -- Menu description
    self.description = "Summons a misty snow around the party, making attacks have a chance to miss this turn."

    -- TP cost
    self.cost = 80

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {"ice"}
end

function spell:getTPCost(chara)
    local cost = super.getTPCost(self, chara)
    if chara and chara:checkWeapon("thornring") then
        cost = MathUtils.round(cost / 2)
    end
    return cost
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!"
end

function spell:onCast(user, target)
    Assets.playSound("spellcast", 0.5, 0.7)
	Game.battle.powder_mist = true
    for _,battler in ipairs(target) do
        Game.battle:addChild(SnowVeilCloud(battler.x, battler.y - battler.height * 2 - 10))
    end
    Game.battle.timer:script(function(wait)
        wait(1/2)
        Assets.playSound("ghostappear", 1, 1.3)
        wait(1/5)
        Assets.playSound("ghostappear", 1, 1.3)
        wait(1/5)
        Assets.playSound("ghostappear", 1, 1.3)
    end)
end

return spell
