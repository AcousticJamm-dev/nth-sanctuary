local fieldmuslogo, super = Class(Object)

function fieldmuslogo:init(logo, x, y, x1, y2)
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.parallax_x = 0
    self.parallax_y = 0

    local logo = Sprite("objects/musiclogos/" .. logo or "objects/musiclogos/field", x or 180, y or 120)
    logo:setScale(2)
    logo.alpha = 0
    self:addChild(logo)

    Game.world.timer:tween(1, logo, {x = x1 or 160, y = y1 or 120, alpha = 1}, "out-sine")
    --[[]
    Game.world.timer:after(4, function()
        Game.world.timer:tween(1, logo, {x = x2 or 140, y = y2 or 120, alpha = 0}, "out-sine")
    end)
    ]]
    Game.world.timer:after(4, function()
        Game.world.timer:tween(1, logo, {x = x2 or 140, y = y2 or 120, alpha = 0}, "out-sine")
    end)
end

return fieldmuslogo