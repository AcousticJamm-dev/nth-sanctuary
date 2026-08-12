local item, super = Class(Item, "tensionband")

function item:init()
    super.init(self)

    -- Display name
    self.name = "TensionBand"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Big\nrubber\nband"
    -- Menu description
    self.description = "A durable, rubber wristband that glows when the wearer is about to get hit. +2 DF"

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

    self.bonus_name = "GrazeArea"
    self.bonus_icon = "ui/menu/icon/upb"

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 2,

        graze_size = 0.25,
    }
    -- Bonus name and icon (displayed in equip menu)

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        lobby_man = false
    }
    -- Character reactions
    self.reactions = {
        susie = {
            susie = "Heh, I can make a slingshot!",
            jamm = "...Really?"
        },
        ralsei = "Stretchy and snug!",
        noelle = "(It's like holding hands...)",
        jamm = "Another one for the collection.",
        lobby_man = "I'll be fine without it."
    }

    -- Character reactions to wearing two
end

return item
