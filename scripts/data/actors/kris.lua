---@class Actor.kris : Actor
local actor, super = Class("kris", true)

function actor:init()
    super.init(self)
    TableUtils.merge(self.animations, {
        ["fall_hurt"] = {"fall_hurt", 0, true},
        ["fall_hurt_wind"] = {"fall_hurt_wind", 1/5, true},
        ["run"] = {"run", 3/30, true}
    })
    self.animations["slide"] = {"slide_animated", 4/30, true}
    TableUtils.merge(self.offsets, {
        ["piano"] = {-6, -1},
	})
end

return actor