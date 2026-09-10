local item, super = Class(Item, "deftcloak")

function item:init()
    super.init(self)

    -- Display name
    self.name = "DeftCloak"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A thick and light cloak that offers both resistance and mobility."

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

    self.bonus_name = "Doctrine UP"
    self.bonus_icon = "ui/menu/icon/up"

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 5,
        magic = 1,
    }
    -- Bonus name and icon (displayed in equip menu)

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        lobby_man = true
    }

    -- Character reactions

    -- Character reactions to wearing two
end

return item
