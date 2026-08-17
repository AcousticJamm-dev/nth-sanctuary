local Spinning, super = Class(Wave)

function Spinning:init()
    super.init(self)
    self.time = 10
end
function Spinning:onStart()
    Assets.playSound("boost")
    local arena = Game.battle.arena
    local soul = Game.battle.soul
    self.timer:every(0.5, function()
        Assets.stopAndPlaySound("ui_cancel_small")
        local x, y = Utils.pick({Game.battle.arena.left,Game.battle.arena.right}), Utils.pick({SCREEN_HEIGHT, 0})
        local angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
        self:spawnBullet("smallstar", x, y, angle, 9)
    end)
end
function Spinning:update()
    super.update(self)
    if Game.battle.arena then
        Game.battle.arena.rotation = Game.battle.arena.rotation + 0.01
    end
end

return Spinning