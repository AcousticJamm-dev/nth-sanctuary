---@class MineShape : DarkShapeBullet
---@overload fun(...) : MineShape
local MineShape, super = Class(DarkShapeBullet)

local spr_path = "battle/bullets/titan_custom/mine/"
function MineShape:init(x, y)
    super.init(self, x, y, spr_path.."body_1", spr_path.."body")
	
    self.eye_tex = Assets.getFrames(spr_path.."eye")

    self.radius = 22
    self.light = 0
    self.color = COLORS.fuchsia
    self.destroy_on_hit = false

    self:setScale(1, 1)
    self.scalefactor = 1

    self.canbepushed = false
end

function MineShape:doShrivel()
    if self.light > 0.99 then
        self.image = 6
    elseif self.light > 0.8 then
        self.image = 5
        self.radius = 26
    elseif self.light > 0.6 then
        self.image = 4
        self.radius = 24
    elseif self.light > 0.4 then
        self.image = 3
        self.radius = 23
    elseif self.light > 0.2 then
        self.image = 2
        self.radius = 22
    else
        self.image = 1
        self.radius = 22
    end
    return
end

function MineShape:doPushBack()
    for _, bullet in ipairs(Game.stage:getObjects(DarkShapeBullet)) do
        if (bullet.id ~= self and MathUtils.dist(bullet.x, bullet.y, self.x, self.y) < (self.radius * self.scalefactor)) then
            local tempangle = Utils.angle(self.x, self.y, bullet.x, bullet.y)
            bullet.x = bullet.x + MathUtils.lengthDirX(1, tempangle) * DTMULT
            bullet.y = bullet.y + MathUtils.lengthDirY(1, tempangle) * DTMULT
        end
    end
    return
end

function MineShape:chaseHeart()
    local hx, hy = Game.battle.soul.x, Game.battle.soul.y

    if (MathUtils.dist(self.x, self.y, hx, hy) < 64) then
        self.light = MathUtils.approach(self.light, 1, self.light_rate * DTMULT)

        if Game.battle.soul.ominous_loop then
			Game.battle.soul.ominous_decline = false
			Game.battle.soul.ominous_volume = MathUtils.approach(Game.battle.soul.ominous_volume, 1, ((1 - Game.battle.soul.ominous_volume) * 0.15) * DTMULT)
        end
    else
        self.light = MathUtils.approach(self.light, 0, self.light_recover * DTMULT)
    end
    self.physics.speed = MathUtils.approach(self.physics.speed, self.speed_max * self.speed_max_multiplier, (self.accel * self.speed_max_multiplier * (1 - self.light)) * DTMULT)

    return
end

function MineShape:destroy()
    Assets.playSound("chargeshot_fire", 1, 1)
    Assets.playSound("ui_spooky_action", 0.8, 1.9)

    local boom_sprite = Sprite("effects/titan_custom/shockwave_explosive", self.x, self.y)
    boom_sprite:setOrigin(0.5, 0.5)
	boom_sprite:setColor(self.color)
    boom_sprite.layer = self.layer + 1
    boom_sprite:play(1 / 12, false, function()
        boom_sprite:remove()
    end)
    Game.battle:addChild(boom_sprite)

    for i = 1, 30 do
        local angle = love.math.random() * math.pi * 2
        local r = math.sqrt(love.math.random()) * 50

        local bx = self.x + math.cos(angle) * r
        local by = self.y + math.sin(angle) * r

        local bullet = self.wave:spawnBullet("titan_custom/mine_area_denial_eye", self.x, self.y, bx, by)
        bullet:setColor(self.color)
    end
    self:remove()
    return
end

function MineShape:update()
	super.update(self)
	
    self.collider = CircleCollider(self, 24, 25, self.radius/2)
end

function MineShape:updateStepZero()
	super.updateStepZero(self)

    self.rotation = self.rotation + -math.rad(2.8125) * DTMULT
end

function MineShape:updateStepOne()
    return
end

function MineShape:updateDrawZero()
    super.updateDrawZero(self)
    self:setScale(self.scalefactor, self.scalefactor)
end

function MineShape:draw()
    super.draw(self)
	
    local ox, oy = self:getRotationOriginExact()
    if floor_x then
        ox, oy = MathUtils.floorToMultiple(ox, 1 / CURRENT_SCALE_X), MathUtils.floorToMultiple(oy, 1 / CURRENT_SCALE_Y)
    end
    love.graphics.translate(ox, oy)
	love.graphics.rotate(-self.rotation)

    Draw.draw(self.eye_tex[self.image], 0, 0, 0, 1, 1, 24, 25)
end

return MineShape