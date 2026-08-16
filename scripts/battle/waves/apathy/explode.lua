local Explode, super = Class(Wave)

function Explode:init()
    super.init(self)
    self.time = 15
    
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
    soul.y = Game.battle.arena.bottom + 30
    self.timer:every(1, function()
        Game.battle.timer:tween(2, star, {rotation = star.rotation + math.rad(180)}, "linear")
        Assets.playSound("rocket")
        self.timer:tween(0.1, star, {scale_x=4,scale_y=4}, "out-sine", function()
            self.timer:tween(0.2, star, {scale_x=2,scale_y=2}, "in-sine")
        end)
        for i=1, 16 do
            local bullet = self:spawnBulletTo(arena, "smallstar", star.x, star.y, Utils.random(math.rad(0),math.rad(360)), math.random(6,8))
            local scale = math.random(1,2)
            bullet:setScale(scale,scale)
        end
    end)
    local bottom = function()
        local x = SCREEN_WIDTH + 80
        local y = Game.battle.arena.bottom
        local angle = math.rad(180)
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = false    
    end
    local left = function()
        local angle = math.rad(270)
        local x = Game.battle.arena.left
        local y = 520
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = false
    end
    local top = function()
        local angle = math.rad(0)
        local x = 0 - 80
        local y = Game.battle.arena.top
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = false
    end
    local right = function()
        local angle = math.rad(90)
        local x = Game.battle.arena.right
        local y = 0 - 80
        local bullet = self:spawnBullet("smallstar", x, y, angle, 8)
        bullet.remove_offscreen = false
    end
    self.timer:every(0.1, function()
        bottom()
        left()
        top()
        right()
    end)
end

return Explode