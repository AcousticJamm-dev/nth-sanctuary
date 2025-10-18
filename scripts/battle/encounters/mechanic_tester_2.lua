local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Testing Ahead!"

    -- Battle music ("battle" is rude buster)
    self.music = "sin/wrath"
    -- Enables the purple grid battle background
    self.background = true

    self.reduced_tp = true

    -- Add the dummy enemy to the encounter
    local a = self:addEnemy("tester")
    a.health = 999999
    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
    self.do_once = false
end

function Dummy:onTurnStart()
    if not self.do_once then
        local a = Text("BATTLE EFFECT ACTIVE\n\n[color:99ff99]Poison Damage[color:white]\nAdditive poison damage that intensifies \nthe more you get hurt.")
        Game.battle.timer:script(function (wait)
            Game.battle:addChild(a)
            a.x = 10
            a.layer = 1000
            wait(2)
            Game.battle.timer:tween(3, a, {alpha = 0})
            wait(3)
            a:remove()
            self.do_once = true
        end)
    end
    for _, battler in ipairs(Game.party) do
        if battler.poison_hurt then
            Game.battle.timer:every(1/battler.poison_hurt, function()
                if battler.health > MathUtils.round(battler.stats.health/10) then
                    battler.health = battler.health - 5
                end
            end)
        end
    end
end

return Dummy

