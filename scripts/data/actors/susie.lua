---@class Actor.kris : Actor
local actor, super = Class("susie", true)

function actor:init()
    super.init(self)
    TableUtils.merge(self.animations, {
        ["pirouette"] = {"battle/pirouette", 3/30, true},
        ["fall_brace"] = {"fall_brace", 1/3, false}
    })
    TableUtils.merge(self.offsets, {
        ["pirouette"] = {0, 0},
        ["fall_brace"] = {0, 0},
    })
end

return actor