local Guei, super = Class(Encounter)

function Guei:init()
    super.init(self)

    self.text = "* Guei wisps in your way!"

    self.music = "ch4_battle"
    self.background = true

    self:addEnemy("guei", 520, 140)
    self:addEnemy("guei", 520, 300)
end

return Guei