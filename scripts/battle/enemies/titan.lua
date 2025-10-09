local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)
    self.vuln = false
    self.vulnturn = 0

    -- Enemy name
    self.name = "Titan"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("titan")
    self.shield = Sprite("enemies/titan/mask")
    self:addChild(self.shield)
    self.shield:play(1/7, true)

    -- Enemy health
    self.max_health = 21000
    self.health = 21000
    -- Enemy attack (determines bullet damage)
    self.attack = 20
    -- Enemy defense (usually 0)
    self.defense = 20
    -- Enemy reward
    self.money = 0

    self.tired_percentage = -1

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
       "basic",
       "aiming",
       "movingarena",
       "chaserorb"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 40 DF 800\n* ..."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = "."
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* ...?"

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Tell Story", "", {"ralsei"})
	self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Unleash", "Reveal\nweakness", nil, 80)
end

function Dummy:onAct(battler, name)
    if name == "Smile" then
        -- Give the enemy 100% mercy
        self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "... ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The dummy smiles back.",
            "* It seems the dummy just wanted\nto see you happy."
        }

    elseif name == "Tell Story" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            enemy:setTired(true)
        end
        return "* You and Ralsei told the dummy\na bedtime story.\n* The enemies became [color:blue]TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    elseif name == "Unleash" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("titan", "unleash")
        return
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Dummy:update()
    super.update(self)
    if self.vuln then
        self.defense = -200
    else
        self.defense = 25
    end

    if self.vulnturn == 1 or self.vulnturn == 2 then
        self.text = {
            "[voice:ralsei][facec:ralsei/angry, 0, -10]* Attack now!! [wait:10]It's defense \nis down!"
        }
    else
        self.text = {
            "* ..."
        }
    end
end
function Dummy:onHurt(damage, battler)
    self:toggleOverlay(true)
    if not self:getActiveSprite():setAnimation("hurt") then
        self:toggleOverlay(false)
    end
    if self.vuln then 
        self:getActiveSprite():shake(9, 0, 1.5, 2/30)
        self:mercyFlash({1, 0, 0})
    else
        self.shield:shake(2, 0, 0.25, 2/30)
    end

    if self.health <= (self.max_health * self.tired_percentage) then
        self:setTired(true)
    end
end

function Dummy:mercyFlash(color)
    color = color or {1, 1, 0}

    local recolor = self:addFX(RecolorFX())
    Game.battle.timer:during(1/30, function()
        recolor.color = TableUtils.lerp(recolor.color, color, 1 * DTMULT)
    end, function()
        Game.battle.timer:during(8/30, function()
            recolor.color = TableUtils.lerp(recolor.color, {1, 1, 1}, 0.2 * DTMULT)
        end, function()
            self:removeFX(recolor)
        end)
    end)
end

function Dummy:getDamageSound() 
    if self.vuln then
        Assets.playSound("tpunch")
        return "damage"
    else
        return "bump" 
    end
end

function Dummy:onDefeat()
    self.hurt_timer = -1

    Assets.playSound("deathnoise")

    local sprite = self:getActiveSprite()

    sprite.visible = false
    sprite:stopShake()

    local death_x, death_y = sprite:getRelativePos(0, 0, self)
    local death = FatalEffect(sprite:getTexture(), death_x, death_y, function() self:remove() end)
    death:setColor(sprite:getDrawColor())
    death:setScale(sprite:getScale())
    self:addChild(death)
    self:defeat()
end


return Dummy