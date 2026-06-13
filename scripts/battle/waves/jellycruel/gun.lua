local Aiming, super = Class(Wave)

function Aiming:init()
    super.init(self)
    self.gun = Sprite("gun")
    self.gun:setOrigin(0.5, 0.2)
    self.gun.alpha = 0

    self.time = 1000
end
function Aiming:onStart()
    -- Every 0.5 seconds...
    self:spawnObject(self.gun, 470, 150)

    self.timer:script(function(wait)
        wait(1)
        Assets.playSound("magic_sparkle")
        Game.battle.timer:tween(1, self.gun, {alpha = 1}, 'out-expo')
        wait(0.5)
        self.lock = true
        Assets.playSound("cardrive")
        self.timer:tween(0.3, self.gun, {rotation = self.gun.rotation - math.rad(45)}, 'out-circ')
        wait(0.5)
        for i = 1, 8 do
            Assets.playSound("noise", 0.5, 1)
            local x, y = self.gun:getRelativePos(0, 0)
            Game.battle.timer:tween(0.25, self.gun, {rotation = self.gun.rotation + math.rad(10)}, 'out-expo')
            self:spawnBullet("smallbullet", x, y, math.rad(180)+self.gun.rotation, 5)
            wait(0.1)
        end
        wait(0.5)
        self.lock = false
                wait(0.5)
        self.lock = true
        Assets.playSound("cardrive")
        self.timer:tween(0.3, self.gun, {rotation = self.gun.rotation - math.rad(45)}, 'out-circ')
        wait(0.5)
        for i = 1, 8 do
            Assets.playSound("noise", 0.7, 1)
            local x, y = self.gun:getRelativePos(0, 0)
            Game.battle.timer:tween(0.25, self.gun, {rotation = self.gun.rotation + math.rad(10)}, 'out-expo')
            self:spawnBullet("smallbullet", x, y, math.rad(180)+self.gun.rotation, 5)
            wait(0.1)
        end
        wait(0.5)
        self.lock = false
                wait(0.5)
        self.lock = true
        Assets.playSound("boost", 1, 1)
        self.timer:tween(0.3, self.gun, {rotation = self.gun.rotation - math.rad(75)}, 'out-circ')
        wait(1)
        for i = 1, 30 do
            Assets.playSound("noise", 0.5, 1)
            local x, y = self.gun:getRelativePos(0, 0)
            Game.battle.timer:tween(1/15, self.gun, {rotation = self.gun.rotation + math.rad(5)}, 'out-expo')
            self:spawnBullet("smallbullet", x, y, math.rad(180)+self.gun.rotation, 2)
            wait(1/15)
        end
        wait(0.5)
        self.lock = false
        wait(0.5)
        self.time = 0
        
    end)
end

function Aiming:update()
    -- Code here gets called every frame
    super.update(self)
    if not self.lock then
        local ang = math.rad(180) + MathUtils.angle(self.gun.x, self.gun.y, Game.battle.soul.x, Game.battle.soul.y)
        self.gun.rotation = MathUtils.angleLerp(self.gun.rotation, ang, 0.3)
    end
end

return Aiming