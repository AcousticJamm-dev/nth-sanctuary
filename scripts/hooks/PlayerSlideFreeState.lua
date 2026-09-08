---@class PlayerSlideFreeState : PlayerSlideBaseState
---
---@overload fun(player: Player) : PlayerSlideFreeState
local PlayerSlideFreeState, super = HookSystem.hookScript(PlayerSlideFreeState)

-- Sylvi why do you make me do this
function PlayerSlideFreeState:handleMovement()
    local slide_x = 0
    local slide_y = 0

    if self.player:isMovementEnabled() then
        if Input.down("right") then slide_x = slide_x + 1 end
        if Input.down("left") then slide_x = slide_x - 1 end
        if Input.down("down") then slide_y = slide_y + 1 end
        if Input.down("up") then slide_y = slide_y - 1 end
    end

    self.player:moveAndCollide(slide_x * 6, slide_y * 6, 6)
end

return PlayerSlideFreeState