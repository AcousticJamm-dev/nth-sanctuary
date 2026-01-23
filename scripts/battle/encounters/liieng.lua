local Winglade, super = Class(Encounter)

function Winglade:init()
    super.init(self)

    self.text = "* Liieng wisps in your way!"

    self.music = "ch4_battle2"
    self.background = true

    self:addEnemy("liieng", 520, 270)
end

return Winglade