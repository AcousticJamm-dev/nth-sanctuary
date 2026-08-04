local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 20
    self:setArenaSize(100, 300)
    self:setSoulPosition(320, 35)
    
end

function Basic:onStart()
    local visual = Sprite("world/culteye")
    local spr = Object(0, 0, visual.width, visual.height)
    self:addChild(spr)
    Assets.playSound("appear_choppy")

    Assets.playSound("ghostappear", 1, 0.8)
    

    visual:setOrigin(0.5)
    visual:setPosition(spr.width / 2, spr.height / 2)
    spr:setScale(10, 3)
    visual.graphics.spin = 0.2
    visual.debug_select = false
    spr:addChild(visual)
    visual.alpha = 0
    visual:fadeToSpeed(1)
    
    spr:setOrigin(0.5)
    spr:setPosition(Game.battle.arena.left + (Game.battle.arena.width/2), Game.battle.arena.bottom)
    local arena = Game.battle.arena
    self.timer:every(1/3, function()
        local h = self:spawnBullet("risestar", love.math.random(arena.left, arena.right), arena.bottom, math.rad(-90))
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
