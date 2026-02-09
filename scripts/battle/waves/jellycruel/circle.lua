local Basic, super = Class(Wave)
function Basic:init()
    super.init(self)
    self.time = 6
    self.attacks = 0
    self.free_moniey = love.math.random(1, 100)
    self.h = love.math.random(1,5)
    if self.h == 5 then
        self:setArenaSize(200,200)
    end
end

function Basic:onStart()
    -- Every 0.33 seconds...
    self.buls = {}
    for i = 1,360, 15 do
        local x, y = 100*math.sin(math.rad(i)), 100* math.cos(math.rad(i))
        if x < 0.001 and x > -0.001 then
            x=0
        end
        if y < 0.001 and y > -0.001 then
            y=0
        end
        local angle = MathUtils.angle(Game.battle.arena.x + x, Game.battle.arena.y + y, Game.battle.soul.x, Game.battle.soul.y)
        local b = self:spawnBullet("jellycruel/jelly", Game.battle.arena.x + x, Game.battle.arena.y + y, angle)
        b.sprite.rotation = -math.pi/2
        b.sprite:setRotationOrigin(0.5) -- not sure if this is the right name
        b.alpha = 0
        b.physics.match_rotation = true
        b.moveing = false
        b.tp = 0.8
        table.insert(self.buls, b)
    end

    self.timer:script(function(wait)
        wait(1)
        for _, bullet in ipairs(self.buls) do
            bullet.physics.speed = -5
            if self.h == 5 then
                wait(1/10)
            else
                wait(1/15)
            end

            if self.free_moniey == 100 then
                bullet:explode()
            end
            
            bullet.moveing = true
        end
    end)
end

function Basic:update()
    -- Code here gets called every frame
    for _, bullet in ipairs(self.buls) do
        bullet.alpha = MathUtils.approach(bullet.alpha, 1, 0.1 + DT)
        if self.h == 5 then
            bullet.x = bullet.x + math.sin(Kristal.getTime()*2.5)*2
            bullet.y = bullet.y - math.cos(Kristal.getTime()*2.5)*2
        end
        if bullet.moveing then
            bullet.physics.speed = bullet.physics.speed + 7*DT
        end
    end

    super.update(self)
end

return Basic