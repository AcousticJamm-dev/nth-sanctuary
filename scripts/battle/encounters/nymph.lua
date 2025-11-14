local NymphSpawn, super = Class(Encounter)

function NymphSpawn:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = [==[
        constricts you.
* (    Gain reduced outside of [color:green][shake:10]-[shake:0] [color:reset])
]==]

    self.music = "titan_spawn2"
    self.background = true

    self:addEnemy("nymph")
	
    self.toggle_shadow_mantle_all_bullets = true
    self.banish_goal = nil

    self.reduced_tension = true
    self.light_size = 48
    self.purified = false
    self.difficulty = 1
end

function NymphSpawn:onTurnEnd() 
    self.difficulty = self.difficulty + 1
end

function NymphSpawn:beforeStateChange(old, new, reason)
	if reason == "PURIFIED" then return end -- somehow prevents a stack overflow
    if (new == "DEFENDING" or old == "CUTSCENE") and self.purified then
        Game.battle:setState("VICTORY", "PURIFIED")
    end
end

return NymphSpawn