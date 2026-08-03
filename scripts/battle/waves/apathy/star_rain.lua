local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 20
    self:setArenaSize(100, 300)
    self:setSoulPosition(320, 35)
    
end

function Basic:onStart()
    Game.battle.timer:everyInstant(2, function()
        Game.battle.timer:script(function (wait)
            local spr = Sprite("world/culteye")
            self:addChild(spr)
            spr.alpha = 0
            spr:fadeToSpeed(1, 0.5)
            spr:setOrigin(0.5)

            spr.graphics.spin = 0.2
            
            spr:setPosition(Game.battle.arena.left, Game.battle.arena.bottom)
            spr.physics.speed_y = -0.1
            spr.gravity = -1
            wait(1)
            for i = 1, 3 do
                local b = self:spawnBullet("risestar", spr.x, spr.y)
            end
            spr:remove()
            Assets.playSound("bomb")
        end)
    end)
    
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic