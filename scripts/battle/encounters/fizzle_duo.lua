local FizzleDuo, super = Class(Encounter)

function FizzleDuo:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Fizzles condensate in!"

    -- Battle music ("battle" is rude buster)
    self.music = "vaporbattle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("fizzle")
    self:addEnemy("fizzle")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
    self.bg = VaporBattleBG()

    self.next_soul_speed = 4
end

function FizzleDuo:createSoul(x, y, color)
    local soul = super.createSoul(self, x, y, color)    
    if self.next_soul_speed then
        soul.speed = self.next_soul_speed
    end
    return soul
end

function FizzleDuo:onWavesDone()
    self.next_soul_speed = 4
end

function FizzleDuo:createBackground()
    self.bg.layer =BATTLE_LAYERS["background"]
    return Game.battle:addChild(self.bg)
end

return FizzleDuo