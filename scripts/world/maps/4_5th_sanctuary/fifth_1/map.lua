local map, super = Class(Map)

function map:onEnter()
  if Game:getFlag("churchbell_rung_5th", false) then
    Game.world.map:getHitbox("specblock").collidable = false
  end
end

return map
