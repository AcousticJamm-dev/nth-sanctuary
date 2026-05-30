local Character3D = modRequire("libraries.ak3d.src.game.world.character")
---@class AK3D.Player3D: AK3D.Character3D
local Player3D, super = Class(Character3D)

function Player3D:init(chara, x, y, z)
    super.init(self, chara, x, y, z)
    
end

return Player3D
