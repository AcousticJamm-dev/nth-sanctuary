--- An object that is created whenever the player reaches a Game Over, responsible for managing the GameOver sequence. \
--- The type of GameOver that plays (Chapter 1, Chapter 2, or Undertale) is dependent on the mod configuration and whether the death occurred in the Light World or not.
---@class GameOver : Object
---@overload fun(...) : GameOver
local GameOver, super = HookSystem.hookScript(GameOver)

function GameOver:update()
    super.update(self)
	
    if (self.current_stage == 11) then
        Game.world:loadMap("sanctum_hell/hell_1")
		self.current_stage = 12
	end

    if ((self.timer >= 80) and (self.timer < 150)) then
        if (self.skipping >= 4) then
            Game.world:loadMap("sanctum_hell/hell_1")
        end
    end
end

return GameOver