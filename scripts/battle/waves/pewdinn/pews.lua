local Aiming, super = Class(Wave)

function Aiming:init()
    super.init(self)
    self.pewcount = 0
    for k,v in ipairs(Game.battle.enemies) do
      if v.name == "Pewdinn" then
        self.pewcount = self.pewcount + 1
      end
    end
    self:setArenaSize(100 * self.pewcount, 150)
    self.rectangles = {}
    self.benches = {}
    self.time = 15
end

function Aiming:onStart()
    for i = 1, self.pewcount-1 do
        local rectangle = Rectangle(100*i, 0, 5, 150)
        table.insert(self.rectangles, rectangle)
        rectangle:setColor(0,0.25,0)
        rectangle.alpha = 0
        Game.battle.arena:addChild(rectangle)
        
        self.timer:tween(1, rectangle, {alpha = 1})
    end
    for i = 1, self.pewcount do
        local bench = Sprite("bullets/bench", 100*(i-1), 150)
        bench:setOrigin(0,1)
        bench.alpha = 0
        Game.battle.arena:addChild(bench)
        table.insert(self.benches, bench)
        self.timer:tween(1, bench, {alpha = 1}, 'out-cubic')
    end
    Assets.playSound("appear_choppy")
    -- Every 0.5 seconds...
    local time = self.pewcount > 1 and self.pewcount or 2
    self.timer:every(time/3, function()
        -- Get all enemies that selected this wave as their attack
        local attackers = self:getAttackers()

        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do

            -- Get the attacker's center position
            local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

            -- Get the angle between the bullet position and the soul's position
            local angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
            for _, b in ipairs (self.benches) do
                local x1, y1 = b:getScreenPos()
                local a = self:spawnBullet("guei/holyfire", love.math.random(x1, x1+b.width), y1)
                a.physics.speed = 15
                a.physics.gravity = 0.5
                a.physics.direction = math.rad(-90)
                a:setScale(1)
            end
            
        end
    end)
end

function Aiming:update()
    -- Code here gets called every frame
    super.update(self)
end

return Aiming