---@class DarkShapeCustomManager : Object
---@overload fun(...) : DarkShapeCustomManager
local DarkShapeCustomManager, super = Class(Object)

function DarkShapeCustomManager:init(x, y)
    super.init(self, 0, 0)

    self.pattern = "mines"

    self.aim_var = 0
    self.dark_count = 0
    self.basic_shapes = true
    self.noise_played = false

    self.angery = true
    self.timer = 17
    self.timer_alt = 3
    self.timer_alt_goal = 36
    self.speedup_timer = 0
    self.random_offset = MathUtils.randomInt(360)
    self.spawn_counter = 0

    if Game.battle.soul then
        self:setLayer(Game.battle.soul.layer - 1)
    end

    self.its_time = false

    self.barrage_offset = 40
    self.barrage_interval = 40
    self.barrage_end = 64
    self.phase_difficulty = 1
end

function DarkShapeCustomManager:onAdd(parent)
    super.onAdd(self, parent)

    self.spawn_attack_loop = Assets.newSound("spawn_attack")
    self.spawn_attack_loop:setLooping(true)
end

function DarkShapeCustomManager:onRemove(parent)
    super.onRemove(self, parent)

    if Game.battle.soul.omnious_loop then
        Game.battle.soul.omnious_loop:stop()
    end

    self.spawn_attack_loop:stop()
end

function DarkShapeCustomManager:onRemoveFromStage(stage)
    super.onRemoveFromStage(self, stage)

    if Game.battle.soul.omnious_loop then
        Game.battle.soul.omnious_loop:stop()
    end

    self.spawn_attack_loop:stop()
end

function DarkShapeCustomManager:patternToUse(pattern)
    self.pattern = pattern or "mines"
    return self.pattern
end

-- Add your custom Titan Spawn attack patterns here.
function DarkShapeCustomManager:createPattern()
    if self.pattern == "mines" then
        if not self.noise_played then
            self.spawn_attack_loop:play()
            self.noise_played = true
        end

        if (self.timer % 20) == 0 then
            local tempdir = MathUtils.randomInt(360)
            local tempdist = 125
            local x, y = Game.battle.arena.x + MathUtils.lengthDirX(tempdist, math.rad(tempdir)), Game.battle.arena.y + MathUtils.lengthDirY(tempdist, math.rad(tempdir))

            if (self.spawn_counter % 3) == 2 then
                local newbullet = self.wave:spawnBullet("titan_custom/mineshape", x, y)
                newbullet.physics.direction = MathUtils.angle(newbullet.x, newbullet.y, Game.battle.arena.x, Game.battle.arena.y)
                newbullet.rotation = newbullet.physics.direction
            else
                tempdist = 150 + MathUtils.randomInt(50)

                local newbullet = self.wave:spawnBullet("titan/darkshape", x, y)
                newbullet:setScale(0.85, 0.85)
                newbullet.scalefactor = 0.85
            end

            self.spawn_counter = self.spawn_counter + 1
        end

    -- base code for making your own titan spawn attack pattern
    --elseif self.pattern == "your_pattern_name_here" then
        --[[if not self.noise_played then        --uncomment if you want the ambient sound to play during the attack
            self.spawn_attack_loop:play()
            self.noise_played = true
        end]]


    end
end

function DarkShapeCustomManager:update()
    self.timer = self.timer + DTMULT

    if Game.battle.wave_timer >= Game.battle.wave_length - 1/30 then
        self.its_time = true
        self:remove()
    end

    if not self.its_time then
        self:createPattern()
    end

    super.update(self)
end

return DarkShapeCustomManager