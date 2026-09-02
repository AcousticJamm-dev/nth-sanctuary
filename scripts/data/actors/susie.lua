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
		
        ["walk_unhappy/down"] = {0, 0},
        ["walk_unhappy/left"] = {0, 0},
        ["walk_unhappy/right"] = {0, 0},
        ["walk_unhappy/up"] = {0, -2},
        -- Battle offsets (serious)
        ["battle_serious/idle"] = {-22, -1},

        ["battle_serious/attack"] = {-26, -25},
        ["battle_serious/attackready"] = {-26, -25},
        ["battle_serious/spell"] = {-22, -30},
        ["battle_serious/spellready"] = {-22, -15},
        ["battle_serious/item"] = {-22, -1},
        ["battle_serious/itemready"] = {-22, -1},
        ["battle_serious/defend"] = {-20, -23},
    })
	TableUtils.merge(self.mirror_sprites, {
        ["walk_unhappy/down"] = "walk_unhappy/up",
        ["walk_unhappy/up"] = "walk_unhappy/down",
        ["walk_unhappy/left"] = "walk_unhappy/left",
        ["walk_unhappy/right"] = "walk_unhappy/right",
    })
    -- Alternate animations to use for Susie without a smile
    self.animations_serious = {
        ["battle/idle"]         = {"battle_serious/idle", 0.2, true},

        ["battle/attack"]       = {"battle_serious/attack", 1/15, false},
        ["battle/spell"]        = {"battle_serious/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle_serious/item", 1/12, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle_serious/attackready", 0.2, true},
        ["battle/spell_ready"]  = {"battle_serious/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle_serious/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle_serious/defend", 1/15, false},
    }
end

function actor:getAnimation(anim)
	if Game:getPartyMember("susie"):getFlag("serious", false) and self.animations_serious[anim] ~= nil then
        return self.animations_serious[anim] or nil
    else
        return super.getAnimation(self, anim)
    end
end

return actor