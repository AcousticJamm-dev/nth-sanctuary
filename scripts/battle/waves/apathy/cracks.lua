local Cracks, super = Class(Wave)

function Cracks:init()
    super.init(self)
    self.time = 10
    self.bounds = 40
end

function Cracks:onStart()
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    local burstbullets = function(x,y)
        self.crack = Sprite("bullets/crack",x,y)
        local crack = self.crack
        crack.layer = 9999
        Assets.stopAndPlaySound("snd_mirrorbreak1")
        self:addChild(crack)
        self.timer:after(1, function()
            Assets.stopAndPlaySound("explosion_firework")
            for i = 1, 5 do
                local bullet = self:spawnBullet("gravitybullet", crack.x, crack.y)
            end
        end)
    end
    self.timer:script(function(wait)
    Assets.playSound("appear_choppy")
    Assets.playSound("ghostappear", 1, 0.8)
    self.timer:tween(0.5, arena, {width=190,height=190}, "out-sine")
    wait(0.6)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    wait(0.2)
    burstbullets(Utils.random(arena.left,arena.right - self.bounds),Utils.random(arena.top,arena.bottom - self.bounds))
    end)
end

return Cracks