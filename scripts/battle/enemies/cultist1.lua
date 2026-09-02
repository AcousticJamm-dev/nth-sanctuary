local CultistApathy, super = Class(EnemyBattler)

function CultistApathy:init()
    super.init(self)

    -- Enemy name
    self.name = "Cultist"
    self:setActor("cultist1")

    -- Enemy health
    self.max_health = 6000
    self.health = 6000
    -- Enemy attack (determines bullet damage)
    self.attack = 17
    -- Enemy defense (usually 0)
    self.defense = 3
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
	
    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "apathy/spining",
        "apathy/explode",
        "apathy/spinchase"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = ""

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Black liquid drips from its cloak.",
        "* You can't see its face.",
        "* Smells like apathy.",
        "* Dust and stars rain in the distance.",
        "* ...",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The enemy's movements became sluggish."

    self.tired_percentage = -999
    self.low_health_percentage = 0.25
    
    self.chosen_party_member = nil
	
	self.boss = true
	
	self.s_acted = false
	self.r_acted = false
	self.j_acted = false
    self.atk_down = false
	self.dualhealcount = 0
	self.tired_amt = -2
end

function CultistApathy:getTiredDisplayPercentage()
    return self.tired_amt
end

function CultistApathy:getMercyDisplay()    
    return MathUtils.round(self.tired_amt).."%"
end

function CultistApathy:getEncounterText()
    local rand = love.math.random(1, 7)
    if rand == 7 then
        self.chosen_party_member = love.math.random(1, #Game.battle.party)
        return "* The enemy stares at "..Game.battle.party[self.chosen_party_member].chara:getName().."."
    end
    return super.getEncounterText(self)
end

function CultistApathy:selectWave(battler)
    if self.chosen_party_member and not Game.battle.encounter.parried then
        self.current_target = self.chosen_party_member
        self.chosen_party_member = nil
        self.selected_wave = "apathy/risestar"
        return self.selected_wave
    end

    if Game.battle.turn_count == 1 then
        self.selected_wave = "basic-apathy"
        return self.selected_wave
    end
    return super.selectWave(self, battler)
end

function CultistApathy:defeat(reason, violent)
    self.done_state = reason or "DEFEATED"

    if violent then
        if self:isRecruitable() and self:getRecruitStatus() ~= false then
            if Game:getConfig("enableRecruits") and self.done_state ~= "FROZEN" then
                self:recruitMessage("lost")
            end
            self:setRecruitStatus(false)
        end
    end

    if self:isRecruitable() and type(self:getRecruitStatus()) == "number" and (self.done_state == "PACIFIED" or self.done_state == "SPARED") then
        self:setRecruitStatus(self:getRecruitStatus() + 1)
        if Game:getConfig("enableRecruits") then
            local counter = self:recruitMessage("recruit")
            counter.first_number = self:getRecruitStatus()
            counter.second_number = Game:getRecruit(self.id):getRecruitAmount()
            Assets.playSound("sparkle_gem")
        end
        if self:getRecruitStatus() >= Game:getRecruit(self.id):getRecruitAmount() then
            self:setRecruitStatus(true)
        end
    end

    Game.battle.money = Game.battle.money + self.money
    Game.battle.xp = Game.battle.xp + self.experience

    Game.battle:removeEnemy(self, true)
end

function CultistApathy:onDefeatRun(damage, battler)
    self:defeat("VIOLENCED", true)
end

function CultistApathy:onTurnStart()
    if self.atk_down then
        self.atk_down = false
        self:statusMessage("damage", "+10", {1, 0.25, 0})
        self.attack = 17
    end
	self.tired_amt = MathUtils.approach(self.tired_amt, 100, 2)
	if self.tired_amt >= 100 then
		self:setTired(true)
	end	
end

function CultistApathy:onAct(battler, name)
    if name == "Check" then
        return {
            "* CULTIST - AT [image:world/culteye,0,0,2,2] DF [image:world/culteye,0,0,2,2]\n* It radiates with apathy.",
            "* Your [color:yellow]GRAZE AREA [color:white]is reduced."
        }
    elseif name == "DarkBuster" then
        Game.battle:startActCutscene(function(cutscene)
            local susie = Game.battle:getPartyBattler("susie")
            local jamm = Game.battle:getPartyBattler("jamm")
            local canproceed = false
            local hashealed = false
            Game.battle.timer:after(10 / 30, function()
                Assets.playSound("boost")
                battler:flash()
                susie:flash()
                jamm:flash()
                local bx, by = Game.battle:getSoulLocation()
                local soul = Sprite("effects/soulshine", bx + 5.5, by)
                soul:play(1 / 30, false, function() soul:remove() end)
                soul:setOrigin(0.5)
                soul:setScale(2, 2)
                Game.battle:addChild(soul)
            end)
            Game.battle.timer:after(20 / 30, function()
                susie:setAnimation("battle/spell_ready")
                jamm:setAnimation("battle/act_ready")
                canproceed = true
            end)
            cutscene:text("* Your SOUL shined its power on\nSUSIE and JAMM!")
            cutscene:wait(function() return canproceed == true end)
			local buster_finished = false
			if not susie:setAnimation("battle/rude_buster", function() susie:setAnimation("battle/idle") end) then
				susie:setAnimation("battle/rude_buster", function() susie:setAnimation("battle/idle") end)
			end
			Game.battle.timer:after(15/30, function()
				Assets.playSound("rudebuster_swing")
				local x, y = susie:getRelativePos(susie.width, susie.height/2 - 10, Game.battle)
				local tx, ty = self:getRelativePos(self.width/2, self.height/2, Game.battle)
				local blast = RudeBusterBeam(true, x, y, tx, ty, function(damage_bonus, play_sound)
					local damage = math.ceil((susie.chara:getStat("magic") * 6) + (susie.chara:getStat("attack") * 13) - (self.defense * 6)) + 90 + damage_bonus
					if play_sound then
						Assets.playSound("scytheburst")
					end
					local flash = self:flash()
					flash.color_mask:setColor(1, 0, 0)
					self:hurt(damage, susie)
					buster_finished = true
				end)
				blast.layer = BATTLE_LAYERS["above_ui"]
				Game.battle:addChild(blast)
			end)
            cutscene:text("* Susie and Jamm cast DARK BUSTER!")
            cutscene:wait(function() return buster_finished == true end)
        end)
    elseif name == "DualHeal" then
        self.dualhealcount = self.dualhealcount + 1
        Game.battle:startActCutscene(function(cutscene)
            local susie = Game.battle:getPartyBattler("susie")
            local ralsei = Game.battle:getPartyBattler("ralsei")
            local canproceed = false
            local hashealed = false
            Game.battle.timer:after(10 / 30, function()
                susie:setAnimation("heal_charge") -- Susie starts the animation with the effects
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
                ralsei:setAnimation("battle/spell_ready") -- Ralsei starts the animation after a pause
                canproceed = true
            end)
            cutscene:text("* Your SOUL shined its power on\nRALSEI and SUSIE!")
            cutscene:wait(function() return canproceed == true end)
            susie:setAnimation("heal_end_short", function() susie:setAnimation("battle/idle") end)
            ralsei:setAnimation("battle/spell", function()
                for _,party in ipairs(Game.battle.party) do
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
            cutscene:wait(function() return hashealed == true end)
        end)
        return
    elseif name == "Tranquilize" then 
        Game.battle:startActCutscene(function(cutscene)
            local ralsei = Game.battle:getPartyBattler("ralsei")
            local jamm = Game.battle:getPartyBattler("jamm")
            local canproceed = false
            local hastranquilized = false
            Game.battle.timer:after(10 / 30, function()
                Assets.playSound("boost")
                battler:flash()
                ralsei:flash()
                jamm:flash()
                local bx, by = Game.battle:getSoulLocation()
                local soul = Sprite("effects/soulshine", bx + 5.5, by)
                soul:play(1 / 30, false, function() soul:remove() end)
                soul:setOrigin(0.5)
                soul:setScale(2, 2)
                Game.battle:addChild(soul)
            end)
            Game.battle.timer:after(20 / 30, function()
                ralsei:setAnimation("battle/spell_ready")
                jamm:setAnimation("battle/act_ready")
                canproceed = true
            end)
            cutscene:text("* Your SOUL shined its power on\nRALSEI and JAMM!")
            cutscene:wait(function() return canproceed == true end)
            jamm:setAnimation("battle/act", function() jamm:setAnimation("battle/idle") end)
            ralsei:setAnimation("battle/spell", function() 
				Assets.playSound("hypnosis")
				ralsei:setAnimation("battle/idle")
				self:flash()
				self:statusMessage("damage", "-10", {1, 0.25, 0})
				self.attack = 7
				self.atk_down = true
				self.tired_amt = MathUtils.approach(self.tired_amt, 100, 6)
				if self.tired_amt >= 100 then
					self:setTired(true)
				else
					self:statusMessage("damage", "+6%", { 0, 0.7, 1 })
				end
				hastranquilized = true
			end)
			if self.tired_amt >= 94 then
				cutscene:text("* Ralsei and Jamm cast TRANQUILIZE![wait:5]\n* The Cultist became fully [color:blue]TIRED[color:reset] and its ATTACK went down this turn!")
			else
				cutscene:text("* Ralsei and Jamm cast TRANQUILIZE![wait:5]\n* The Cultist became more [color:blue]TIRED[color:reset] and its ATTACK went down this turn!")
			end
            cutscene:wait(function() return hastranquilized == true end)
		end)
		return
	elseif name == "Standard" then
		Game.battle:startActCutscene(function(cutscene)
			cutscene:text("* "..battler.chara:getName().." tried to reason with the Cultist...")
			-- TODO: Specific dialogues for the characters.
			local spell_moved_text = ""
			if not self.j_acted and not self.s_acted and not self.r_acted then
				spell_moved_text = "\n* (Check Kris's [color:yellow]ACT[color:reset] menu!)"
			end
			if battler.chara.id == "susie" then
				self.s_acted = true
				cutscene:text("* But they wouldn't listen.")
				cutscene:text("* Susie's will is changing...\n* [color:#FF80FF]S-ACTION[color:reset] became [color:yellow]DARK BUSTER[color:reset]!" .. spell_moved_text)
				battler.chara.default_has_xact = battler.chara.has_xact
				battler.chara.has_xact = false
				self:registerAct("DarkBuster", "Dark\ndamage", {"susie", "jamm"}, 60)
			elseif battler.chara.id == "ralsei" then
				self.r_acted = true
				cutscene:text("* But they wouldn't listen.")
				cutscene:text("* Ralsei's will is changing...\n* [color:#80FF80]R-ACTION[color:reset] became [color:yellow]DUAL HEAL[color:reset]!" .. spell_moved_text)
				battler.chara.default_has_xact = battler.chara.has_xact
				battler.chara.has_xact = false
				self:registerAct("DualHeal", "Heal\nparty", {"susie", "ralsei"}, 50)
			elseif battler.chara.id == "jamm" then
				self.j_acted = true
			    cutscene:battlerText("jamm", "Look,[wait:5] I don't know\nwhat you're trying\nto do...", {right = true})
			    cutscene:battlerText("jamm", "But it's clearly putting\nthese kids in danger.", {right = true})
			    cutscene:battlerText("jamm", "We're both adults.[wait:5]\nCan't we talk this\nout as such?", {right = true})
				cutscene:text("* But they wouldn't listen.")
			    cutscene:battlerText("jamm", "... No dice,[wait:5] huh?", {right = true})
			    cutscene:battlerText("jamm", "Well,[wait:5] guess we'll do\nthis the hard way, then.", {right = true})
				cutscene:text("* Jamm's will is changing...\n* [color:#FFBF7F]J-ACTION[color:reset] became [color:yellow]TRANQUILIZE[color:reset]!" .. spell_moved_text)
				battler.chara.default_has_xact = battler.chara.has_xact
				battler.chara.has_xact = false 
				self:registerAct("Tranquilize", "TIRE &\nlower DMG", {"ralsei", "jamm"}, 32)
			else
				cutscene:text("* But they wouldn't listen.")
			end
		end)
    end
    return super.onAct(self, battler, name)
end

return CultistApathy