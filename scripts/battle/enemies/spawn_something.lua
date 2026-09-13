local SpawnSomething, super = Class("titan_spawn", "spawn_something")

function SpawnSomething:init()
    super.super.init(self)

    self.name = "!battle_spawn"
    self:setActor("spawn_something")

    self.max_health = 3000
    self.health = 3000
    self.attack = 18
    self.defense = 0
    self.money = 0

    self.disable_mercy = true

    self.can_freeze = false

    self.text = {
        "* You hear your heart beating in \nyour ears.",
        "* Waiting for something to happen?",
        "* It sputtered in a voice like \nanguish."
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
    self:registerAct("DualHeal", "Heal\nparty", { "susie", "ralsei" }, 16)
    local banish = self:registerAct("Banish", "Defeat\nenemy", nil, 64)
    banish.color = function()
        if Game:getTension() >= 64 then
            return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(self.t_siner / 4) * 0.5)))
        else
            return COLORS.white
        end
    end

    self.dualhealcount = 0

	self.t_siner = 0

    self.first_barrage = true
    self.phaseturn = 1
    self.difficulty = 0
	
	self.wake_kris_count = 0
    self.afterimage_timer = 0
end

function SpawnSomething:update()
    super.update(self)
    if Game.battle.state ~= "TRANSITION" and Game.battle.state ~= "INTRO" then
		if self:getActiveSprite().anim == "idle" then
			self.afterimage_timer = self.afterimage_timer + DTMULT
			if self.afterimage_timer >= 15 then
				local image = AfterImage(self.sprite, 0.5, 0.02)
				image.physics.speed = 2
				Game.battle:addChild(image)
				self.afterimage_timer = 0
			end
		end
    end
end

function SpawnSomething:onAct(battler, name)
	if name == "Check" then
        if Game:getTension() >= 64 then
            return {
                "* !BATTLE_SPAWN - AT 30 DF 200\n* A shard of guilt, taking the form \nof your fears.",
                "* The atmosphere feels tense...\n* (You can use [color:yellow]BANISH[color:reset]!)"
            }
        else
            return {
                "* !BATTLE_SPAWN - AT 30 DF 200\n* A shard of guilt, taking the form \nof your fears.",
                "* Expose it to LIGHT... and gather COURAGE to gain TP.",
                "* Then, \"[color:yellow]BANISH[color:reset]\" it!",
            }
        end
	end
    return super.onAct(self, battler, name)
end

function SpawnSomething:onTurnEnd()
    self.phaseturn = self.phaseturn + 1
	
    if self.phaseturn > 3 then
        self.phaseturn = 2
    end
end

function SpawnSomething:getNextWaves()
    if self.phaseturn == 1 then
        return { "titan_spawn/darkshapesintro" }
    end
    if self.phaseturn == 2 then
        return { "titan_spawn/darkshapesspeedup" }
    end
    if self.phaseturn == 3 then
        return { "titan_spawn/darkshapeswithred" }
    end

    return super.getNextWaves(self)
end

function SpawnSomething:onHurt(damage, battler)
	super.super.onHurt(self, damage, battler)

    Assets.stopAndPlaySound("spawn_something")
end

return SpawnSomething
