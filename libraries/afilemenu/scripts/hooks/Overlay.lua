---@class Overlay : Overlay
local Overlay, super = HookSystem.hookScript(Kristal.Overlay)

function Overlay:quit()
    if not (Kristal.getLibConfig("afilemenu", "hookOverlay")) then
        return super.quit(self)
    end
    Input.clear("escape", true)
    self.quit_timer = 0

    if Game.world and Game.world.map and Game.world.map.id == "fileselect" then
        return super.quit(self)
    else
        Game:load(nil,nil,true)
    end
end

return Overlay