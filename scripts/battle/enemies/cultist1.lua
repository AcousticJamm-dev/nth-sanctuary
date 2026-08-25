local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Cultist"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
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
    

    -- Register act called "Smile"
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    
    self.chosen_party_member = nil
end

function Dummy:getEncounterText()
    local rand = love.math.random(1, 7)
    if rand == 10 then
        self.chosen_party_member = love.math.random(1, #Game.battle.party)
        return "* The enemy stares at "..Game.battle.party[self.chosen_party_member].chara:getName().."."
    end
    return super.getEncounterText(self)
end

function Dummy:selectWave(battler)
    if self.chosen_party_member then
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

function Dummy:defeat(reason, violent)
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

function Dummy:onAct(battler, name)
    if name == "Check" then
                return {
            "* CULTIST - AT [image:world/culteye,0,0,2,2] DF [image:world/culteye,0,0,2,2]\n* It radiates with apathy.",
            "* Your [color:yellow]GRAZE AREA [color:white]is reduced."
        }
    end
    return super.onAct(self, battler, name)
end

return Dummy