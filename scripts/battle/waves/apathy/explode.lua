local Explode, super = Class(Wave)

function Explode:init()
    super.init(self)
    self.time = 15
    self:setSoulPosition(320, 270)
    self:setArenaSize(260)
end

function Explode:onStart()
    local arena = Game.battle.arena
    arena.width=260
    arena.height=260
    local soul = Game.battle.soul
    local star = Sprite("world/culteye", 130, 130)
    Game.battle.arena:addChild(star)
    star:setScale(2,2)
    star:setOrigin(0.5,0.5)
    self.timer:every(1, function()
        self.timer:tween(1, star, {rotation = star.rotation + math.rad(70)}, "out-circ")
        Assets.playSound("rocket")
        self.timer:tween(0.01, star, {scale_x=4,scale_y=4}, "out-sine", function()
            self.timer:tween(0.2, star, {scale_x=2,scale_y=2}, "in-sine")
        end)
        for i=1, 8 do
            local bullet = self:spawnBulletTo(arena, "smallstar", star.x, star.y, star.rotation - math.rad(45 * i), 0.1)
            bullet.physics.friction = -0.25
        end
    end)
    local bottom = function()
        local x = Game.battle.arena.right
        local y = Game.battle.arena.bottom
        local angle = math.rad(180)
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = true
        bullet.tp = 0
        bullet.grazed = true
    end
    local left = function()
        local angle = math.rad(270)
        local x = Game.battle.arena.left
        local y = Game.battle.arena.bottom
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = true
        bullet.tp = 0
        bullet.grazed = true
    end
    local top = function()
        local angle = math.rad(0)
        local x = Game.battle.arena.left
        local y = Game.battle.arena.top
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = true
        bullet.tp = 0
        bullet.grazed = true
    end
    local right = function()
        local angle = math.rad(90)
        local x = Game.battle.arena.right
        local y = Game.battle.arena.top
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = true
        bullet.tp = 0
        bullet.grazed = true
    end
    self.timer:every(0.1, function()
        bottom()
        left()
        top()
        right()
    end)
end

return Explode