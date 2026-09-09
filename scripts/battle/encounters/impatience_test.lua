local CultistImpatience, super = Class(Encounter)

function CultistImpatience:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = [==[
* Impatience constricts you...
* ([color:yellow]Time only moves with you.[color:reset])
]==]

    -- Battle music ("battle" is rude buster)
    self.music = "battle_cult"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the enemy to the encounter
    self.c = self:addEnemy("dummy")
end

function CultistImpatience:createSoul(x, y, color)
    return Impatience(x, y)
end

function CultistImpatience:createBackground()
    return Game.battle:addChild(CreatureBG())
end

return CultistImpatience
