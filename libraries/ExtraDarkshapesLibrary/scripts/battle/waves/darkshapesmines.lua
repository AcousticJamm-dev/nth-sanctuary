local DarkShapesMines, super = Class(Wave)

function DarkShapesMines:init()
    super.init(self)

    self.time = 420/30 -- waves for the spawn attacks are usually 360/30.
end

function DarkShapesMines:onStart()
    Game.battle:swapSoul(FlashlightSoul())

    local darkshape_manager = self:spawnObject(DarkShapeCustomManager())
    darkshape_manager:patternToUse("mines")
end

function DarkShapesMines:onEnd()
    if Game.battle.soul.ominous_loop then
		Game.battle.soul.ominous_loop:stop()
	end
end

return DarkShapesMines