local item, super = Class(Item, "rubber_pellet")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Rubber Pellet"

    -- Item type (item, key, weapon, armor)
    self.type = "ammo"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/ammo"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A worn pellet made of rubber. It looks like it came from a bottle or something."

    -- Default shop price (sell price is halved)
    self.price = 100
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
        attack = 2,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        jamm = true
    }

    -- Character reactions
    self.reactions = {
        jamm = "Eh. I'm used to this anyways."
    }
end

return item