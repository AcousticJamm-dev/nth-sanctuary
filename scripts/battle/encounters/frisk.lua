local Frisk, super = Class(Encounter)

function Frisk:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A familiar human attacks!"

    -- Battle music ("battle" is rude buster)
    self.music = "miniboss_new_section_idea_wip"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("frisk")
end

return Frisk