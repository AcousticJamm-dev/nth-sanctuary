local SuckStar, super = Class(Wave)

function SuckStar:init()
super.init(self)
self.time = 10
self.siner = 0
end

function SuckStar:onStart()
    self.spr = Sprite("enemies/creature_a/eye")
    local spr = self.spr
    local arena = Game.battle.arena
    self.timer:script(function (wait)
        self.timer:tween(0.5, arena, {width=170,height=170}, "out-sine")
        wait(0.6)
        spr.x, spr.y = arena:getCenter()
        spr.alpha = 0
        Assets.playSound("alert")
        Game.battle.timer:tween(1, spr, {alpha = 1}, "out-cubic")
        spr:setOrigin(0.5, 0.5)
        spr:setScale(3)
        self:addChild(spr)
        wait(1.5)
        self.moving = true
        self.spr_startx = spr.x
            self.spr_starty = spr.y
        self.timer:every(0.5, function()
            Game.battle.timer:tween(0.5, spr, {rotation = spr.rotation + math.rad(40)}, "out-circ")
            local offset = Utils.random(60,-60)
            local x,y = arena.left - 60, spr.y - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.left - 60, spr.y + 20 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.left - 60, spr.y - 20 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.left - 60, spr.y - 40 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.left - 60, spr.y + 40 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
        end)
        self.timer:every(0.5, function()
            local offset = Utils.random(60,-60)
            local x,y = arena.right + 60, spr.y - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.right + 60, spr.y + 20 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.right + 60, spr.y - 20 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.right + 60, spr.y - 40 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
            local x,y = arena.right + 60, spr.y + 40 - offset
            local angle = MathUtils.angle(x, y, spr.x, spr.y)
            local bullet = self:spawnBullet("guei/holyfire", x, y)
            bullet.alpha = 0
            Game.battle.timer:tween(0.5, bullet, {alpha = 1}, "linear")
            bullet.physics.speed = 8
            bullet.physics.direction = angle
        end)
    end)
end

function SuckStar:update()
    if self.moving then
        self.siner = self.siner + DT
        local offset = math.sin(self.siner * 1.5) * 60
        self.spr:setPosition(self.spr_startx, self.spr_starty + offset)
    end
    super.update(self)
end

return SuckStar