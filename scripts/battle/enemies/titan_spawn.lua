local TitanSpawn, super = HookSystem.hookScript("titan_spawn")

function TitanSpawn:init()
    super.super.init(self)

    self.name = "Titan Spawn"
    self:setActor("titan_spawn")

    self.max_health = 3000
    self.health = 3000
    self.attack = 18
    self.defense = 0
    self.money = 0

    self.spare_points = 0

    self.disable_mercy = true

    self.can_freeze = false

    self.text = {
        "* You hear your heart beating in \nyour ears.",
        "* When did you start being \nyourself?",
        "* It sputtered in a voice like \ncrushed glass."
    }
    if Game:hasPartyMember("ralsei") then
        table.insert(self.text, "* Ralsei mutters to himself to \nstay calm.")
    end

	self.tired_percentage = 0

    self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Brighten", "Powerup\nlight", "all", 4)
    self:registerAct("DualHeal", "Heal\nparty", { "susie", "ralsei" }, 16)
    local banish = self:registerAct("Banish", "Defeat\nenemy", nil, 64)
    banish.color = function()
        if Game:getTension() >= 50 then
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
end

function TitanSpawn:update()
    super.super.update(self)
    if Game.battle.state == "MENUSELECT" and Game.battle.state_reason == "ACT" and Game.tension >= 64 then
        self.t_siner = self.t_siner + DTMULT
    end
end

function TitanSpawn:getXAction(battler)
	if Game:hasPartyMember("kris") then
		if battler.chara.id == "jamm" then
			return "RaiseKris"
		end
	end
    return super.getXAction(self, battler)
end

function TitanSpawn:onAct(battler, name)
    if name == "Banish" then
        battler:setAnimation("act")
        Game.battle:startActCutscene(function(cutscene)
            cutscene:text("* " .. battler.chara:getName() .. "'s SOUL emitted a brilliant \nlight!")
            battler:flash()

            local bx, by = battler:getRelativePos(battler.width / 2 + 4, battler.height / 2 + 4)

            local soul = Game.battle:addChild(TitanSpawnPurifySoul(bx, by, nil))
            soul.color = { battler.chara:getSoulColor() }
            soul.layer = 501

            local wait = function() return soul.t >= 500 end
            cutscene:wait(wait)
            if #Game.battle.enemies == 0 then
                cutscene:after(function()
                    Game.battle:setState("VICTORY")
                end, true)
            end
        end)
        return
	elseif name == "DualHeal" then
        self.dualhealcount = self.dualhealcount + 1
        Game.battle:startActCutscene(function(cutscene)
            local function getNumId(id)
                for i, battler in ipairs(Game.battle.party) do
                    if battler.chara.id == id then
                        return i
                    end
                end
            end
            local susie = Game.battle:getPartyBattler("susie")
            local ralsei = Game.battle:getPartyBattler("ralsei")
            local canproceed = false
            local hashealed = false
            Game.battle.timer:after(10 / 30, function()
                susie:setAnimation("heal_charge")
                Game.battle.battle_ui.action_boxes[getNumId("susie")]:setHeadIcon("spell")
                Game.battle.battle_ui.action_boxes[getNumId("ralsei")]:setHeadIcon("spell")
                Assets.playSound("boost")
                battler:flash()
                susie:flash()
                ralsei:flash()
                local bx, by = Game.battle:getSoulLocation()
                local soul = Sprite("effects/soulshine", bx + 5.5, by)
                soul:play(1 / 30, false, function() soul:remove() end)
                soul:setOrigin(0.5)
                soul:setScale(2, 2)
                Game.battle:addChild(soul)
            end)
            Game.battle.timer:after(20 / 30, function()
                susie:setAnimation("heal_charge_loop")
                ralsei:setAnimation("battle/spell_ready")
                Game.battle.battle_ui.action_boxes[getNumId(battler.chara.id)]:setHeadIcon("head")
                battler:setAnimation("battle/act_end")
                canproceed = true
            end)
            cutscene:text("* Your SOUL shined its power on\nRALSEI and SUSIE!")
            cutscene:wait(function() return canproceed end)
            Game.battle.timer:after(8 / 30, function()
                Game.battle.battle_ui.action_boxes[getNumId("susie")]:setHeadIcon("head")
                susie:setAnimation("heal_end_short", function() susie:setAnimation("battle/idle") end)
            end)
            ralsei:setAnimation("battle/spell", function()
                Game.battle.battle_ui.action_boxes[getNumId("ralsei")]:setHeadIcon("head")
                for _, party in ipairs(Game.battle.party) do
                    local healnum = MathUtils.round((susie.chara:getStat("magic") + ralsei.chara:getStat("magic")) * 6)
                    healnum = Game.battle:applyHealBonuses(healnum, susie.chara)
                    healnum = Game.battle:applyHealBonuses(healnum, ralsei.chara)
                    local healmultiplier = 0.2
                    if self.dualhealcount == 1 then
                        healmultiplier = 1.5
                    elseif self.dualhealcount == 2 then
                        healmultiplier = 1
                    elseif self.dualhealcount == 3 then
                        healmultiplier = 0.8
                    elseif self.dualhealcount == 4 then
                        healmultiplier = 0.3
                    end
                    party:heal(MathUtils.round(healnum * healmultiplier))
                end
                hashealed = true
            end)
            if self.dualhealcount < 4 then
                cutscene:text("* Susie and Ralsei cast DUAL HEAL!\nEffectiveness of DUAL HEAL has\nlowered!")
            else
                cutscene:text("* Susie and Ralsei cast DUAL HEAL!")
            end
            cutscene:wait(function() return hashealed end)
        end)
        return
	elseif name == "RaiseKris" then
        Game.battle:startActCutscene(function(cutscene)
            local kris = Game.battle:getPartyBattler("kris")
			self.wake_kris_count = self.wake_kris_count + 1
            cutscene:text("* "..battler.chara:getName().." used Raise Up!")
			kris:shake()
			cutscene:wait(0.5)
			battler:setAnimation("battle/idle")
			if kris then
				local kris_member = Game:getPartyMember("kris")
				if kris_member.health <= 0 then
					local reviveamt = math.abs(kris_member.health) + 50
					kris:heal(reviveamt)
				else
					cutscene:text("* (But, Kris wasn't DOWNed...)")
				end
			end
        end)
        return
    end
    return super.onAct(self, battler, name)
end

function TitanSpawn:onPurifyStart()
	self.x = self.x + 300
end

function TitanSpawn:onPurifyEnd()
	self:spare()
end

return TitanSpawn