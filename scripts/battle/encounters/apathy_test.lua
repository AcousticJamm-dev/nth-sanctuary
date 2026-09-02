local CultistApathy, super = Class(Encounter)

function CultistApathy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter

    self.no_end_message = true
    self.text = [==[
* Apathy constricts you...
* ([color:yellow]Movement[color:reset] restricted outside of [color:red]DANGER[color:reset])
]==]

    -- Battle music ("battle" is rude buster)
    self.music = "battle_cult"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the enemy to the encounter
    self.c = self:addEnemy("cultist1")
    self.siner = 0


    Game.battle.timer:everyInstant(1/7, function()
        local img = AfterImage(self.c.sprite, 0.25)
        img.physics.speed_x = 2
        img.graphics.grow = 0.01
        img:setColor(COLORS.red)
        self.c:addChild(img)
    end)

    self.parried = false
	self.draw_tired_bar = true
end

function CultistApathy:onBattleEnd()
	for _, battler in ipairs(Game.battle.party) do
		battler.chara.has_xact = battler.chara.default_has_xact or battler.chara.has_xact
	end
end

function CultistApathy:createSoul(x, y, color)
    return Apathy(x, y)
end

function CultistApathy:update()
    super.update(self)
    self.siner = self.siner + (DT*30)

    self.c.y = self.c.y + (math.sin(self.siner/10)/2)*DTMULT
end

function CultistApathy:createBackground()
    return Game.battle:addChild(CreatureBG())
end

return CultistApathy
