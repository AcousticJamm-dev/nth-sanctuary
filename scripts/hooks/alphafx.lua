local AlphaFX, super = Class("AlphaFX", true)

function AlphaFX:init(alpha, priority)
    super.init(self, priority or 100)

    self.target_alpha = alpha or 1
    self.alpha = self.target_alpha
    self.fade_in = false

    if Game.world
       and Game.world.cutscene
       and Game.world.cutscene.id == "primary.intro" then
        self.alpha = 0
        self.fade_in = true
    end
end

function AlphaFX:update()
    if self.fade_in then
        self.alpha = math.min(
            self.alpha + (self.target_alpha / 120) * DTMULT,
            self.target_alpha
        )
    end
end

function AlphaFX:draw(texture)
    Draw.setColor(1, 1, 1, self.alpha)
    Draw.drawCanvas(texture)
end

return AlphaFX
