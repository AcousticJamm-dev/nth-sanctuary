local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = [==[
* Apathy constricts you...
* ([color:yellow]Movement[color:reset] restricted outside of [color:red]DANGER[color:reset])
]==]

    -- Battle music ("battle" is rude buster)
    self.music = "battle_cult"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self.c = self:addEnemy("cultist1")
    self.siner = 0

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")

    Game.battle.timer:everyInstant(1/7, function()
        local img = AfterImage(self.c.sprite, 0.25)
        img.physics.speed_x = 2
        img.graphics.grow = 0.01
        img:setColor(COLORS.red)
        self.c:addChild(img)
    end)
end

function Dummy:createSoul(x, y, color)
    return Apathy(x, y)
end

function Dummy:update()
    super.update(self)
    self.siner = self.siner + DTMULT

    self.c.y = self.c.y + math.sin(self.siner/10)/2
end

function Dummy:createBackground()
    return Game.battle:addChild(CreatureBG())
end

return Dummy

--[[    WAVE PLAN
for later

tall arena (100, 300)
soul appear center X, top of arena.
Cue culteye fading in at the bottom of the arena. wide, spinning.
Shoots up bullets that split into multiple --> Those rain down

]]