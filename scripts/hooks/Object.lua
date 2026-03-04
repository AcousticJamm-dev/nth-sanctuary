local Sprite, super = Class("Sprite", true)

function Sprite:init(...)
    super.init(self, ...)
    
    -- Debug: Check if this sprite has the HasProphecyEffect property
    if self.properties and self.properties["HasProphecyEffect"] then
        print("Found HasProphecyEffect on Sprite:", self.path or "unnamed sprite")
        
        if self.addFX then
            print("addFX method exists, applying HSV effect")
            -- Apply a simpler HSV color-shifting effect for testing
            self:addFX(HSVShiftFX(false), "prophecy")
        else
            print("addFX method not found on this sprite")
        end
    end
end

return Sprite
