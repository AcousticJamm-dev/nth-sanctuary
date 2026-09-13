local LeechSpawn, super = Class("titan_spawn", "leech_spawn")

function LeechSpawn:init()
    super.super.init(self)

    self.name = "Leech Spawn"
    self:setActor("leech")

    self.max_health = 1650
    self.health = 1650
    self.attack = 12
    self.defense = -5
    self.money = 100

    self.spare_points = 0

    self.disable_mercy = true

    self.can_freeze = false

    self.text = {
        "* You hear your heart beating in \nyour ears.",
        "* When did you start being \nyourself?",
        "* It started to suckle on the ground."
    }
    if Game:hasPartyMember("ralsei") then
        table.insert(self.text, "* Ralsei mutters to himself to \nstay calm.")
    end

    self.tired_percentage = 0
	
	self.low_health_text = nil
	self.tired_text = nil
	self.spareable_text = nil

    self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Brighten", "Powerup\nlight", "all", 4)
    local banish = self:registerAct("Banish", "Defeat\nenemy", nil, 50)
    banish.color = function()
        if Game:getTension() >= 50 then
            return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(self.t_siner / 4) * 0.5)))
        else
            return COLORS.white
        end
    end

    self.dualhealcount = 0

	self.t_siner = 0
    self.phaseturn = 1
    self.difficulty = 0
	
	self.wake_kris_count = 0
end

function LeechSpawn:update()
    super.super.update(self)
    if Game.battle.state == "MENUSELECT" and Game.battle.state_reason == "ACT" and Game.tension >= 50 then
        self.t_siner = self.t_siner + DTMULT
    end
end

function LeechSpawn:onAct(battler, name)
	if name == "Check" then
        if Game:getTension() >= 50 then
            return {
                "* LEECH SPAWN - AT 27 DF 160\n* The backend darkness that leeches off of your fear.",
                "* The atmosphere feels tense...\n* (You can use [color:yellow]BANISH[color:reset]!)"
            }
        else
            return {
                "* LEECH SPAWN - AT 27 DF 160\n* The backend darkness that leeches off of your fear.",
                "* Being leeches, [wait:5]they can [color:yellow]drain HP \nand TP[color:reset] from you.",
                "* Expose it to LIGHT... gather TP, then \"[color:yellow]BANISH[color:reset]\" it!",
            }
        end
	end
    return super.onAct(self, battler, name)
end

function LeechSpawn:getNextWaves()
    return { "darkleech_test" }
end

function LeechSpawn:onHurt(damage, battler)
	super.super.onHurt(self, damage, battler)

    Assets.stopAndPlaySound("spawn_weaker", 1, 2)
end

function LeechSpawn:getEncounterText()
    if Game:getTension() >= 50 then
		return "* The atmosphere feels tense...\n* (You can use [color:yellow]BANISH[color:reset]!)"
	else
		return super.getEncounterText(self)
	end
end

return LeechSpawn