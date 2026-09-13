---@class Actor.kris : Actor
local actor, super = Class("ralsei", true)

function actor:init()
    super.init(self)
    TableUtils.merge(self.animations, {
    })
    TableUtils.merge(self.offsets, {
        ["shocked_left_landed"] = {-7, 4},
        ["shocked_right_landed"] = {-7, 4},
    })
end

return actor