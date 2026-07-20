return {
    frisk = function (cutscene, event)
		if event.interact_count == 1 then
			if Game:getFlag("fun") ~= 69 then
				cutscene:text("* (Holy shit it's Frisk from the game UNDERTALE.)")
			else
				cutscene:text("* (It's some sort o[sound:budabing]f [image:npcs/frisk/engine, -5,10,1.5,1.5][wait:1].)")
				cutscene:text("* (...Or even a[sound:fafa] [image:fafa-dialogue, -5,10,1, 1][wait:1].)")				
			end
		else
			if Game:getFlag("fun") ~= 69 then
				cutscene:text("* (It's Frisk from UNDERTALE.)")
			else
				cutscene:text("* (It's a sort o[sound:budabing]f [image:npcs/frisk/engine, -5,10,1.5,1.5][wait:1] or a[sound:fafa] [image:fafa-dialogue, -5,10,1, 1][wait:1].)")				
			end
			cutscene:text("* (Fight them?)")
			local ch = cutscene:choicer({"Fight", "No"})
			if ch == 1 then
				cutscene:startEncounter("frisk", event)
			end
		end
    end,
    proph = function (cutscene)
        --cutscene:fadeOut(1, {music = true})
        local g = Sprite("world/events/prophecy/rune")
        g:setOrigin(0.5,0.5)
        g:setParallax(0)
        g.layer = 1000
        g:setScale(2)
        g.x, g.y = SCREEN_WIDTH/2, SCREEN_HEIGHT/2
        Game.world:addChild(g)
        g:addFX(ProphecyScrollFXAlt(1), "prop")
        g:setColor(1,0,0)
    
        cutscene:wait(2)
    end
}