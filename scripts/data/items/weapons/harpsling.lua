local item, super = Class(Item, "harpsling")

function item:init()
    super.init(self)

    -- Display name
    self.name = "HarpSling"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/sling"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A slingshot with multiple harp strings. Plays a few notes when shot."

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
        attack = 8,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        jamm = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "Don't wanna cut the strings...",
        ralsei = "(It's made of gold...!)",
        noelle = "(How does this even work?)",
		jamm = "A calming melody..."
    }
end

function item:getAttackSound(battler, enemy, points)
    return "harpnoise"
end

function item:onAttackHit(battler, enemy, damage)
	if damage > 0 then
		for k,v in ipairs(Game.battle.enemies) do
			if v.musical then
				v:addMercy(25)
			end
		end
	end
end

return item