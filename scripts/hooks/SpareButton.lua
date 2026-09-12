---@class SpareButton : ActionButton
---@overload fun(...) : SpareButton
local SpareButton, super = HookSystem.hookScript(SpareButton)

function SpareButton:init(battler, x, y)
    super.init(self, battler, x, y)
    if battler.chara:checkArmor("doctrine_veil") then
        self.disabled = true
    end
end

return SpareButton