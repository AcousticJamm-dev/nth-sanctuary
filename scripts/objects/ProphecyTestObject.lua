---@class ProphecyTestObject : Event
local ProphecyTestObject, super = Class(Event)

function ProphecyTestObject:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}

    print("ProphecyTestObject:init called")

    -- Create a simple sprite for testing
    self.sprite = Sprite("ui/menu/button")
    self.sprite:setScale(2)
    
    -- Set the HasProphecyEffect property on the sprite itself
    self.sprite.properties = self.sprite.properties or {}
    self.sprite.properties["HasProphecyEffect"] = true
    
    print("Set HasProphecyEffect to true on sprite")

    self:addChild(self.sprite)

    -- Add some basic properties for positioning
    self:setOrigin(0.5, 0.5)
    
    print("ProphecyTestObject fully initialized")
end

function ProphecyTestObject:update()
    super.update(self)
    
    -- Simple floating animation
    self.y = self.y + math.sin(Kristal.getTime() * 2) * 0.5
end

return ProphecyTestObject
