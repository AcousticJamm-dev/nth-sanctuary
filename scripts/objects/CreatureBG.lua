local CreatureBG, super = Class(BattleBackground)

function CreatureBG:init()
    super.init(self)
    self.offset = 0
    self.h = 0
end

function CreatureBG:update()
    super.update(self)

    self.h = self.h -1


    if not self.fading_out then
        self.alpha = MathUtils.approach(self.alpha, 1, 0.1 * DTMULT)
    else
        self.alpha = MathUtils.approach(self.alpha, 0, 0.1 * DTMULT)

        if self.alpha <= 0 then
            self:remove()
        end
    end
end


function CreatureBG:drawBackground()
        -- Draw the black background
    Draw.setColor(0, 0, 0, self.alpha)
    love.graphics.rectangle("fill", -10, -10, SCREEN_WIDTH + 20, SCREEN_HEIGHT + 20)

    local background = Assets.getTexture("battle/backgrounds/creature_bg")

    Draw.setColor(1, 1, 1, self.alpha/1.5)
    Draw.drawWrapped(background, true, true, MathUtils.round(0 + self.h)+math.sin(self.h/20)*20, MathUtils.round(0 + self.h), 0, 2, 2)

end

return CreatureBG