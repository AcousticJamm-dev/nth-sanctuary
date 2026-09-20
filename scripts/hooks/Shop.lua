---@class Shop : Object
local Shop, super = HookSystem.hookScript(Shop)

function Shop:init()
    super.init(self)
	
	self.ui_ammo_sprite = Assets.getTexture("ui/shop/ui_ammo")
	
	self.sell_options = {
        { "Sell Items", "items" },
        { "Sell Weapons", "weapons" },
        { "Sell Armor", "armors" },
        { "Sell Ammo", "ammo" }
    }
end

function Shop:drawPartyBonusInfo(box_y, item, item_options)
	local p = 1
    for i = 1, #Game.party do
        -- Turn the index into a 2 wide grid (0-indexed)
        local transformed_x = (i - 1) % 2
        local transformed_y = math.floor((i - 1) / 2)

        -- Transform the grid into coordinates
        local offset_x = transformed_x * 100
        local offset_y = transformed_y * 45

        local party_member = Game.party[i]
        local can_equip = party_member:canEquip(item)
        local head_path

        Draw.setColor(COLORS.white)

        if can_equip then
            head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head")
            if item.type == "armor" then
                Draw.draw(self.stat_icons["defense_1"], offset_x + 470, offset_y + 127 + box_y)
                Draw.draw(self.stat_icons["defense_2"], offset_x + 470, offset_y + 147 + box_y)

                for j = 1, 2 do
                    self:drawBonuses(party_member, party_member:getArmor(j), item_options["bonuses"], "defense", offset_x + 470 + 20, offset_y + 127 + ((j - 1) * 20) + box_y)
                end

            elseif item.type == "weapon" then
                Draw.draw(self.stat_icons["attack"], offset_x + 470, offset_y + 127 + box_y)
                Draw.draw(self.stat_icons["magic"], offset_x + 470, offset_y + 147 + box_y)

                self:drawBonuses(
                    party_member,
                    party_member:getWeapon(),
                    item_options["bonuses"],
                    "attack",
                    offset_x + 470 + 20,
                    offset_y + 127 + box_y
                )

                self:drawBonuses(
                    party_member,
                    party_member:getWeapon(),
                    item_options["bonuses"],
                    "magic",
                    offset_x + 470 + 20,
                    offset_y + 147 + box_y
                )
				
            elseif item.type == "ammo" and party_member.id == "jamm" then	-- detecting if the party member has `getAmmo` determines if they use ammo
				Draw.draw(self.stat_icons["attack"], offset_x + 470, offset_y + 127 + box_y)
                Draw.draw(self.stat_icons["magic"], offset_x + 470, offset_y + 147 + box_y)

				if party_member.getAmmo then
					self:drawBonuses(
						party_member,
						party_member:getAmmo(),
						item_options["bonuses"],
						"attack",
						offset_x + 470 + 20,
						offset_y + 127 + box_y
					)

					self:drawBonuses(
						party_member,
						party_member:getAmmo(),
						item_options["bonuses"],
						"magic",
						offset_x + 470 + 20,
						offset_y + 147 + box_y
					)
				end
            end
        else
            head_path = Assets.getTexture(party_member:getHeadIcons() .. "/head_error")
        end

		if head_path then
			Draw.draw(head_path, offset_x + 426, offset_y + 132 + box_y)
		end
    end
end

function Shop:drawItemDisplay()
    Draw.setColor(COLORS.white)

    local current_item = self.items[self.current_selected_item]
    if current_item == nil then
        return
    end

    local box_left, box_top = self.info_box:getBorder()

    local left = self.info_box.x - math.floor(self.info_box.width) - (box_left / 2) * 1.5
    local top = self.info_box.y - math.floor(self.info_box.height) - (box_top / 2) * 1.5
    local width = math.floor(self.info_box.width) + box_left * 1.5
    local height = math.floor(self.info_box.height) + box_top * 1.5

    Draw.pushScissor()
    Draw.scissor(left, top, width, height)

    Draw.setColor(COLORS.white)
    love.graphics.print(current_item.options["description"], left + 32, top + 20)

    if current_item.item.type == "armor" or current_item.item.type == "weapon" or current_item.item.type == "ammo" then
        self:drawPartyBonusInfo(top, current_item.item, current_item.options)
    end

    Draw.popScissor()
end

function Shop:drawStorageDisplay()
    local current_item = self.items[self.current_selected_item]

    if current_item == nil then
        return
    end

    local current_storage = Game.inventory:getDefaultStorage(current_item.item)

    Draw.setColor(COLORS.white)
    local item_type = current_item.item.type

    local space = Game.inventory:getFreeSpace(current_storage, false)
    local space_count = Game.inventory:getItemCount(current_storage, false)
    local total_space = space + space_count

    local storage_space = Game.inventory:getFreeSpace("storage")
    local storage_space_count = Game.inventory:getItemCount("storage")
    local storage_total_space = storage_space + storage_space_count

    local display_x = 545

    love.graphics.setFont(self.space_font)
    if item_type ~= "armor" and item_type ~= "weapon" and item_type ~= "ammo" and item_type ~= "key" then
        Draw.draw(self.ui_hold_sprite, display_x, 398)
        love.graphics.print(string.format("%02d", space_count) .. "/" .. string.format("%02d", total_space), display_x + 1, 412, 0, 0.5, 0.5)
        Draw.draw(self.ui_storage_sprite, display_x, 430)
        love.graphics.print(string.format("%02d", storage_space_count) .. "/" .. string.format("%02d", storage_total_space), display_x + 1, 444, 0, 0.5, 0.5)
    else
        love.graphics.print(string.format("%02d", space_count) .. "/" .. string.format("%02d", total_space), display_x + 1, 436, 0, 0.5, 0.5)
        Draw.draw(self.ui_hold_sprite, display_x, 422)
        if item_type == "armor" then
            Draw.draw(self.ui_armor_sprite, display_x, 410)
        elseif item_type == "weapon" then
            Draw.draw(self.ui_weapon_sprite, display_x, 410)
        elseif item_type == "ammo" then
            Draw.draw(self.ui_ammo_sprite, display_x, 410)
        elseif item_type == "key" then
            Draw.draw(self.ui_pocket_sprite, display_x, 410)
        end
    end
end

return Shop