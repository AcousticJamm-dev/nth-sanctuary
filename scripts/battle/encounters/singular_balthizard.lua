local Balthizard, super = Class(Encounter)

function Balthizard:init()
    super.init(self)

    self.text = "* Balthizard swings in!"

    self.music = "ch4_battle"
    self.background = true

    self.incense_1 = self:addEnemy("balthizard", 550, 182)
end

return Balthizard