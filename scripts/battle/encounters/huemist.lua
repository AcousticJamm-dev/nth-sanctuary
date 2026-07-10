local Huemist, super = Class(Encounter)

function Huemist:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Huemist condensates in!"

    -- Battle music ("battle" is rude buster)
    self.music = "vaporbattle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("huemist")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
    self.bg = VaporBattleBG()

    self.target_soul_speed = 4
end

function Huemist:createBackground()
    self.bg.layer =BATTLE_LAYERS["background"]
    return Game.battle:addChild(self.bg)
end

return Huemist