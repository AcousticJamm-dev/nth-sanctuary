local BillboardSprite = modRequire("libraries.ak3d.g3dlib.g3d.billboard")
---@class AK3D.Character3D: AK3D.BillboardSprite
---@field actor Actor
local Character3D, super = Class(BillboardSprite)

function Character3D:init(actor, x, y, z)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    ---@type Actor
    self.actor = actor

    self.path = self.actor:getSpritePath()

    super.init(self, actor, x, y)
end

function Character3D:draw()
    
end


return Character3D