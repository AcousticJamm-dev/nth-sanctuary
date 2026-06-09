---@class Textbox : Textbox
local Textbox, super = HookSystem.hookScript(Textbox)

function Textbox:setActor(actor)
	super.setActor(self, actor)

    self.jamm = false
    
    if self.actor and self.actor.id == "jamm" and Game:getFlag("jamm_has_glasses", false) then
        self.jamm = Assets.getTexture("face/jamm/glasses_overlay")
    end
end

function Textbox:draw()
    super.draw(self)
    if self.jamm then
        Draw.draw(self.jamm, -1, 3, 0, 2, 2)
    end
end

return Textbox