---@class Actor.kris : Actor
local actor, super = Class("susie", true)

function actor:init()
    super.init(self)
    TableUtils.merge(self.animations, {
        ["pirouette"] = {"battle/pirouette", 3/30, true},
        ["fall_brace"] = {"fall_brace", 1/3, false},
        ["heal_charge"] = {"heal_charge", 1/7, false, next= "heal_loop"},
        ["heal_loop"] = {"heal_loop", 1/7, true},
        ["heal_end"] = {"heal_end", 1/10, false, next = "walk"},
    })
    TableUtils.merge(self.offsets, {
        ["pirouette"] = {0, 0},
        ["fall_brace"] = {0, 0},
        ["heal_charge"] = {-25, -15},
        ["heal_loop"] = {-25, -15},
        ["heal_end"] = {-25, -15},

    })
end

return actor