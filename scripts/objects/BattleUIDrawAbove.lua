local BattleUIDrawAbove, super = Class(Object)

function BattleUIDrawAbove:init()
    super.init(self, 0, 0)
    self.adraw = 0
    self.layer = BATTLE_LAYERS["above_bullets"]
end

function BattleUIDrawAbove:draw()
    super.draw(self)
    if Input.down("showhealth") then
        self.adraw = self.adraw + 4*DT
	else
        self.adraw = self.adraw - 4*DT
	end
    self.adraw = MathUtils.clamp(self.adraw, 0, 1)
	if Game.battle.battle_ui.animate_out then
		if not Game.battle.battle_ui.animation_done then
			self.adraw = self.adraw * (1 - (Game.battle.battle_ui.animation_timer / 12))
		else
			self.adraw = 0
		end
	end
	if self.adraw > 0 then
        Draw.setColor(0,0,0,self.adraw*0.6)
        Draw.rectangle("fill",0,0,SCREEN_WIDTH, (#Game.battle.party * 30)+ 13)
		local health_canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
        for k, party in ipairs(Game.battle.party) do
            local head = Assets.getTexture(party.chara:getHeadIcons().."/head_alpha") or Assets.getTexture(party.chara:getHeadIcons().."/head")
            local name = Assets.getTexture(party.chara:getNameSprite())
            Draw.setColor(0,0,0,1)
            Draw.draw(head, 17, 12 + 30*(k-1))
            Draw.draw(name, 67, 17 + 30*(k-1))
			
            Draw.setColor(1,1,1,1)
			if party.chara.id == "lobby_man" then
				local static_shader = Assets.getShader("static_bullet")
				static_shader:send("time", Kristal.getTime())
				static_shader:send("brightness", 0.5)
				love.graphics.setShader(static_shader)
			end
            Draw.draw(head, 15, 10 + 30*(k-1))
			love.graphics.setShader()
            Draw.draw(name, 65, 15 + 30*(k-1))
			
            Draw.setColor(0,0,0,1)
            Draw.rectangle("fill", 142, (30*(k-1))+name:getHeight()+5, 100, 10)
			local health_bg_col = PALETTE["action_health_bg"]
			if party.chara.id == "lobby_man" then
				health_bg_col = COLORS.dkgray
			end
            Draw.setColor(health_bg_col)
            Draw.rectangle("fill", 140, (30*(k-1))+name:getHeight()+3, 100, 10)
            local health = (party.chara:getHealth() / party.chara:getStat("health")) * 100
            Draw.setColor(party.chara.color[1], party.chara.color[2], party.chara.color[3])
			if party.chara.id == "lobby_man" then
				Draw.setColor(1, 1, 1, 1)
				local static_shader = Assets.getShader("static_bullet")
				static_shader:send("time", Kristal.getTime())
				static_shader:send("brightness", 1)
				love.graphics.setShader(static_shader)
			end
            if health > 0 then
                Draw.rectangle("fill", 140, (30*(k-1))+name:getHeight()+3, math.ceil(health), 10)
            end
			love.graphics.setShader()

            local g = Assets.getFont("smallnumbers")
            local h = (30*(k-1))+name:getHeight()+3

            love.graphics.setFont(g)
            local color = PALETTE["action_health_text"]

            if health <= 0 then
                color = PALETTE["action_health_text_down"]
            elseif (party.chara:getHealth() <= (party.chara:getStat("health") / 4)) then
                color = PALETTE["action_health_text_low"]
            else
                color = PALETTE["action_health_text"]
            end

            local health_offset = (#tostring(party.chara:getHealth()) - 1) * 8

            Draw.setColor(0, 0, 0, 1)
			local string_width = g:getWidth(tostring(party.chara:getStat("health")))
            for x = -1, 1 do
                for y = -1, 1 do				
					love.graphics.print(party.chara:getHealth(), 250 + x, h + y)
					love.graphics.print("/", (260+x+health_offset), h + y)
					love.graphics.print(party.chara:getStat("health"), (280 + x + health_offset), h + y)
				end
			end
            love.graphics.print(party.chara:getHealth(), 252, h + 2)
            love.graphics.print("/", (262+health_offset), h + 2)
            love.graphics.print(party.chara:getStat("health"), (282 + health_offset), h + 2)
			
            Draw.setColor(color[1], color[2], color[3])
            love.graphics.print(party.chara:getHealth(), 250, h)
            Draw.setColor(PALETTE["action_health_text"])
            love.graphics.print("/", (260+health_offset), h)
            Draw.setColor(color[1], color[2], color[3])
            love.graphics.print(party.chara:getStat("health"), (280 + health_offset), h)
        end
		Draw.popCanvas()
		Draw.setColor(1,1,1,self.adraw)
		Draw.draw(health_canvas)
    end
end

return BattleUIDrawAbove