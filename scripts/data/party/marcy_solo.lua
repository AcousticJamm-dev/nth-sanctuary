local character, super = Class(PartyMember, "marcy_solo")

function character:init()
    super.init(self)

    self.name = "Marcy"
	
    self:setActor("marcy")
    self:setLightActor("marcy")

    self.level = 1
    self.title = "Strategist\nSneaks past the\nenemy carefully."

    self.soul_priority = 1
    self.soul_color = {1, 106/255, 0}

    self.has_act = false
    self.has_spells = true

    self.has_xact = true
    self.xact_name = "M-Action"
	
    self.lw_portrait = "face/marcy/neutral"

    self.health = 50
    self.stats = {
        health = 50,
        attack = 2,
        defense = 6,
        magic = 3
    }

    self.max_stats = {
        health = 100,
        attack = 6,
        defense = 10,
        magic = 8
    }

    self.weapon_icon = "ui/menu/equip/sling"
	
    self:setWeapon("empty_all")

    self.color = {0, 1, 1}
    self.dmg_color = ColorUtils.hexToRGB("#FFB366")
    self.attack_bar_color = ColorUtils.hexToRGB("#DB9F11FF")
    self.attack_box_color = {0, 0.5, 0.5}
    self.xact_color = ColorUtils.hexToRGB("#FFBF7FFF")
	-- highlight color A
    self.highlight_color = ColorUtils.hexToRGB("#DB9F11FF")
		-- highlight color B
    self.highlight_color_alt = ColorUtils.hexToRGB("#D6184DFF")

    self.menu_icon = "battle/assist/marcy/head"
    self.head_icons = "battle/assist/marcy/icons"
    self.name_sprite = "battle/assist/marcy/name"

    self.attack_sprite = "effects/attack/sling"
    self.attack_sound = "sling"
    self.attack_pitch = 1

    self.battle_offset = {2, 1}
    self.head_icon_offset = {0, -3}
    self.menu_icon_offset = nil
	
	self.flee_text = {		
		"[voice:marcy][facec:marcy/frown_open]Marcy thinks we should go!"
	}
end

function character:onTurnStart(battler)
    if Debug.once("marcy_solo_in_battle") then
		Mod.logger:warnNotify("\"marcy_solo\" party member shouldn't be in battles!")
	end
	Game.battle:pushForcedAction(battler, "SKIP")
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1  then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Skills", x, y, 0, 0.7, 1)
        love.graphics.print("Yes", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/magic")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Daughter", x, y)
        love.graphics.print("Yes", x+130, y, 0)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        love.graphics.print("x", x+111, y)
        love.graphics.print("∞/2", x+122, y+3)
        
        return true
    end
end

function character:jammHasAssist() return Game:getFlag("marcy_joined") end

function character:setHealth(health)
    if INVINCIBILITY and health < self:getHealth() then
        return
    end

    if Game:isLight() then
        self.lw_health = health
    else
        self.health = health
		if self:jammHasAssist() then
			local jamm = Game:getPartyMember("jamm")
			if jamm then
				jamm:setAssistHealth(health)
			end
		end
    end
end

function character:getHealth()
	if not Game:isLight() and self:jammHasAssist() then
		local jamm = Game:getPartyMember("jamm")
		if jamm then
			return jamm:getAssistHealth()
		else
			return super.getHealth(self)
		end
	else
		return super.getHealth(self)
	end
end

return character
