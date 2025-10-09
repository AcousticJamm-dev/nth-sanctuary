local LeechTest, super = Class(Wave)
function LeechTest:init()
    super.init(self)
    self.time = 9999999
    self.difficulty = Game.battle.encounter.difficulty or 3
    --self:setArenaSize(200)
    self.siner = 0
    self.arenaShape = {}
    for i = 1,360, 60 do
        local x, y = 100*math.sin(math.rad(i)), 100* math.cos(math.rad(i))
        if x < 0.001 and x > -0.001 then
            x=0
        end
        if y < 0.001 and y > -0.001 then
            y=0
        end
        
        table.insert(self.arenaShape, {x, y})
    end
    self:setArenaShape(unpack(self.arenaShape))
    self.spinfactor = 4
end

function LeechTest:lengthdir_x(len, dir)
    return len * math.cos(dir)
end

function LeechTest:lengthdir_y(len, dir)
    return len * math.sin(dir)
end

function LeechTest:onStart()
    Game.battle.soul.toggle = true


    local sound = Assets.playSound("snd_spawn_attack")
    sound:setLooping(true)


    if self.difficulty >= 3 then
        self.timer:everyInstant(15 / 3, function()
            local tempdir = MathUtils.random(360);
            local tempdist = 150 + MathUtils.random(50);
            local arena = Game.battle.arena

            local spawn = self:spawnBullet("redshape", arena.x + self:lengthdir_x(tempdist, tempdir),
                arena.y + self:lengthdir_y(tempdist, tempdir))
            self.skip_spawn = true
        end)
    end

    -- Every 0.33 seconds...
    self.timer:everyInstant(self:getEnemyRatio(), function()
        local tempdir = MathUtils.random(360);
        local tempdist = 150 + MathUtils.random(50);
        local selection = { { "leechshape", false, 5.25, "leechshape" } }

        if self.difficulty >= 2 then
            --table.insert(selection, { "mine", true, 2.25, "blown_bullet" })
        end
        local list = TableUtils.pick(selection)

        local arena = Game.battle.arena
		local spawn = self:spawnBullet("leechshape", TableUtils.pick({arena.left - 30, arena.right + 30}), arena.y + self:lengthdir_y(tempdist, tempdir))
		spawn.move_mode = 1
		spawn.max_speed = 5.25
		spawn.slow_track = false
		spawn.tension_amount = 2
		
		spawn.remove_offscreen = false
    end)
end

function LeechTest:getEnemyRatio()
    local enemies = #Game.battle:getActiveEnemies()
    if enemies <= 1 then
        return 1/2
    elseif enemies == 2 then
        return 0.75
    elseif enemies >= 3 then
        return 1
    end
end

function LeechTest:update()
    -- Code here gets called every frame
    self.siner = self.siner + DTMULT
    Game.battle.arena.rotation = Game.battle.arena.rotation + math.rad(math.sin(self.siner/100)*self.spinfactor)
    if self.spinfactor < 0 then
        self.time = 0
    end
    super.update(self)
end

function LeechTest:onEnd()
    Assets.stopSound("snd_spawn_attack")
end

return LeechTest
