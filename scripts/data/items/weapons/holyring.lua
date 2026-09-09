local item, super = Class(Item, "holyring")

function item:init()
    super.init(self)

    -- Display name
    self.name = "HolyRing"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/ring"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A ring with a cross on it.\nNot much to the eye, but..."

    -- Default shop price (sell price is halved)
    self.price = 1000
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
        attack = 6,
        magic = 8,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        noelle = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "Damn, it's sturdy...",
        ralsei = "Reminds me of something...",
        noelle = "It... looks nice, at least.",
		jamm = "This is some fine craftsmanship."
    }
end

return item