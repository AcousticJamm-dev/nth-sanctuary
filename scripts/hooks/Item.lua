local Item, super = HookSystem.hookScript(Item)

function Item:getTypeName()
    if self.type == "ammo" then
        return "AMMO"
    end
    return super.getTypeName(self)
end

return Item