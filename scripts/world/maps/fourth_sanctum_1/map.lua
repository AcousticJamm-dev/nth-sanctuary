local Map, super = Class(Map)

function Map:load() --When the map loads....
    super.load(self)
    self.siner = 0 --[i] Required setup variable. 
end

function Map:update() --Every time the game updates...
    super.update(self)
   -- self.world.color = {ColorUtils.HSLToRGB(Kristal.getTime()/5 %1, 1, 1)}
end


return Map