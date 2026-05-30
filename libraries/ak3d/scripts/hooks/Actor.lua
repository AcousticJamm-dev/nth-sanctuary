-- -@class Actor : Actor
local Actor, super = Utils.hookScript(Actor)

---@param chara AK3D.Character3D
---@param matrix AK3D.Matrix
function Actor:pre3DDraw(chara, matrix) end

return Actor