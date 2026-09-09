local item, super = Class(Item, "crossslicer")

function item:init()
    super.init(self)

    -- Display name
    self.name = "CrossSlicer"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/sword"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A silver blade with a wooden cross hilt. It is said to repel demons."

    -- Default shop price (sell price is halved)
    self.price = 120
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 12
    }
    -- Bonus name and icon (displayed in equip menu)
        -- Bonus name and icon (displayed in equip menu)

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        kris = true
    }

    -- Character reactions
    self.reactions = {
        susie = "The power of brute strength compels you!",
        ralsei = "It's not for me...",
        noelle = "(A square handle...?)",
        jamm = "I-I don't even want to touch that..."
    }
end

return item