local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A sermon of Pewdinn come forth!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle2"
    -- Enables the purple grid battle background
    self.background = true

    self.reduced_tp = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("pewdinn")
    self:addEnemy("pewdinn")
    self:addEnemy("pewdinn")
    
end

return Dummy