local LeechSpawn, super = Class(EnemyBattler)

function LeechSpawn:init()
    super.init(self)

    -- Enemy name
    self.name = "Leech Spawn"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("leech")

    -- Enemy health
    self.max_health = 1250
    self.health = 1250
    -- Enemy attack (determines bullet damage)
    self.attack = 12
    -- Enemy defense (usually 0)
    self.defense = -5
    -- Enemy reward
    self.money = 100
    self.disable_mercy = true
    self.tired = false

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "darkleech_test",
        --"chaserorb"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 17 DF 6\n* The backend darkness that\nleeches off your fear."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* "..Game.party[math.random(1,3)].name.." shudders in place.",
        "* Darkness trails behind it.",
        "* The Leech Spawn suckles on the ground. [wait:30]It... [wait:10]Doesn't get anything out of doing that."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* It's slowing down."

	self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Brighten", "Powerup\nlight", "all", 4)

    self.banish_amt =  64

    self:registerAct("Banish", "Defeat\nenemy", nil,  self.banish_amt)
	
    self.t_siner = 0
	
    self.tired_percentage = -1000
    self.can_freeze = false
end

function LeechSpawn:getGrazeTension()
    return 0
end

function LeechSpawn:update()
    super.update(self)
    if (Game.battle.state == "MENUSELECT") and (Game.tension >=  self.banish_amt) then
        self.t_siner = self.t_siner + (1 * DTMULT)
        if Game.battle.menu_items[3] then
            if Game.battle.menu_items[3].name == "Banish" then
                Game.battle.menu_items[3].color =
                    function()
                        return (ColorUtils.mergeColor(COLORS.yellow, COLORS.white, 0.5 + (math.sin(self.t_siner / 4) * 0.5)))
                    end
            end
        end
    end
end

function LeechSpawn:isXActionShort(battler)
    return true
end

function LeechSpawn:onHurt(damage, battler)
    super.onHurt(self)

    Assets.playSound("snd_spawn_weaker")
end

function LeechSpawn:hurt(amount, battler, on_defeat, color, show_status, attacked)
    if battler.chara:checkWeapon("blackshard") or battler.chara:checkWeapon("twistedswd") then
        amount = amount * 10
    end
    super.hurt(self, amount, battler, on_defeat, color, show_status, attacked)
end

function LeechSpawn:onTurnEnd()
    Game.battle.encounter.light_size = 48
end

function LeechSpawn:getEncounterText()
    if (Game.tension >=  self.banish_amt) then
        return "* The atmosphere feels tense...\n* (You can use [color:yellow]BANISH[color:reset]!)"
    end
    return super.getEncounterText(self)
end

function LeechSpawn:onShortAct(battler, name)
    if name == "Standard" then
        return "* " .. battler.chara:getName() .. " tried to ACT, but failed!"
    end
    return nil
end

function LeechSpawn:onAct(battler, name)
    
    if name == "Brighten" then
        battler:flash()
        Game.battle.timer:after(7 / 30, function()
            Assets.playSound("boost")
            battler:flash()

            for _, chara in ipairs(Game.battle.party) do
                chara:flash()
            end
            local bx, by = Game.battle:getSoulLocation()
            local soul = Sprite("effects/soulshine", bx, by)
            soul:play(1 / 30, false, function() soul:remove() end)
            soul:setOrigin(0.25, 0.25)
            soul:setScale(2, 2)
            Game.battle:addChild(soul)
        end)

        Game.battle.encounter.light_size = 63

        return "* " .. battler.chara:getName() .. "'s SOUL shone brighter!"
    elseif name == "Banish" then
        battler:setAnimation("act")

        Game.battle:startCutscene(function(cutscene)
            cutscene:text("* " .. battler.chara:getName() .. "'s SOUL emitted a brilliant light!")
            battler:flash()
            cutscene:playSound("revival")

            cutscene:playSound("snd_great_shine", 1, 1.2)

            local bx, by = Game.battle:getSoulLocation()

            local soul = Game.battle:addChild(purifyevent(bx + 20, by + 10))
            soul.color = Game:getPartyMember(Game.party[1].id).soul_color or { 1, 0, 0 }
            soul.layer = 501
            --  soul.graphics.fade = 0.20
            --soul.graphics.fade_to = 0

            local flash_parts = {}
            local flash_part_total = 20
            local flash_part_grow_factor = 0.5
            for i = 1, flash_part_total - 1 do
                -- width is 1px for better scaling
                local part = Rectangle(bx + 20, 0, 1, SCREEN_HEIGHT)
                part:setOrigin(0.5, 0)
                part.layer = soul.layer - i
                part:setColor(1, 1, 1, -(i / flash_part_total))
                part.graphics.fade = flash_part_grow_factor / 16
                part.graphics.fade_to = math.huge
                part.scale_x = i * i * 2
                part.graphics.grow_x = flash_part_grow_factor * i * 2
                table.insert(flash_parts, part)
                Game.battle:addChild(part)
            end

            local rect = nil

            local function fade(step, color)
                rect = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                rect:setParallax(0, 0)
                rect:setColor(color)
                rect.layer = soul.layer + 1
                rect.alpha = 0
                rect.graphics.fade = step
                rect.graphics.fade_to = 1
                Game.battle:addChild(rect)
                cutscene:wait(1 / step / 45)
            end

            cutscene:wait(50 / 30)

            -- soul:remove()
            fade(0.04, { 1, 1, 1 })
            for _, enemy in ipairs(Game.battle.enemies) do
                enemy.alpha = 0
            end
            cutscene:wait(20 / 30)
            for _, part in ipairs(flash_parts) do
                part:remove()
            end

            rect.graphics.fade = 0.02
            rect.graphics.fade_to = 0


            local wait = function() return soul.t > 540 end
            cutscene:wait(wait)

            Game:addFlag("purified", #Game.battle.enemies)
            for _, enemy in ipairs(Game.battle.enemies) do
                cutscene:playSound("spare")
                enemy:recruitMessage("purified")
            end

            Game.battle.encounter.purified = true
        end)

        return
    elseif name == "Standard" then
        Game.battle:startActCutscene(function(cutscene)
            cutscene:text("* " ..
                battler.chara:getName() ..
                " tried to \"[color:yellow]ACT[color:reset]\"...\n* But, the enemy couldn't understand!")
        end)
        return

    elseif name == "Check" then
        if Game:getTension() >= self.banish_amt then
            return {"* LEECH SPAWN - AT 17 DF 6\n* The backend darkness that leeches off your fear.", "* The atmosphere feels tense...\n* (You can use \"[color:yellow]BANISH[color:reset]\"!)"}
        else
            return {"* LEECH SPAWN - AT 17 DF 6\n* The backend darkness that leeches off your fear.", "* Expose it to LIGHT... and gather COURAGE to gain TP.", "* Then, \"[color:yellow]BANISH[color:reset]\" it!" }
    end
end
    return super:onAct(self, battler, name)
end

function LeechSpawn:getSpareText(battler, success)
    return "* But, it was not something that\ncan understand MERCY."
end

function LeechSpawn:onDefeat(damage, battler)
    self:onDefeatFatal()
end

function LeechSpawn:onDefeatFatal(damage, battler)
    super.onDefeatFatal(self, damage, battler)
    Game:addFlag("slain", 1)
end

function LeechSpawn:freeze()
    self:onDefeat()
end

return LeechSpawn