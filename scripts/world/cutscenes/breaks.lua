local function breakCheck(subflag)
    local breaks = Game:getFlag("breaks", {})
    if breaks[subflag] then return true end

    return false
end

local function breakFlagTrue(flag)
    local breaks = Game:getFlag("breaks", {})
    breaks[flag] = true
    Game:setFlag("breaks", breaks)
end

return {
    one = function(cutscene)
        
        if breakCheck("one") then
            cutscene:text("* (A couch.)[wait:10]\n* (Not fitting, [wait:5]but also not unfitting.)")
            cutscene:text("* (It's also time to go.)")
            return
        end

        cutscene:text("* (A dusty couch.)")
        cutscene:text("* (Would you like to rest?)")

        local c = cutscene:choicer({"Yes", "No"})
        if c == 2 then
            cutscene:text("* (And it shall remain unsitted...)")
            return
        end
        breakFlagTrue("one")
        local k = cutscene:getCharacter("kris")
        local r = cutscene:getCharacter("ralsei")
        local s = cutscene:getCharacter("susie")
        local j = cutscene:getCharacter("jamm")
        
        cutscene:text("* ...[wait:10]I think... [wait:10]We could all use a break.", "disappointed", r)
        cutscene:text("* ...Yeah.", "bangs/down", s)
        


        cutscene:detachFollowers()
        cutscene:detachCamera()
        cutscene:wait(cutscene:fadeOut(2, {music = true}))
        cutscene:wait(1)
        k.layer = 0.8
        k:setSprite("battle/defeat")
        k:setPosition(652, 273)

        s:setPosition(705, 305)
        s:setSprite("sit-couch")

        j:setPosition(350, 320)
        j:setSprite("sit")

        r:setSprite("walk_unhappy")
        r:setFacing("down")
        r:setPosition(430, 295)
        Game.world.camera:setPosition(525, 340)
        cutscene:wait(cutscene:fadeIn(1))
        Game.world.music:stop()
        Game.world.music:play()

        cutscene:text("* ...", "concentrate", j)

        cutscene:wait(1)

        cutscene:text("* Are, [wait:5]um... [wait:10]you okay, [wait:5]Jamm?", "pensive", r)
        cutscene:text("* ...[wait:10][face:neutral]Truth be told? [wait:10][face:look_left]Who of us is?", "concentrate", j)
        cutscene:text("* I just feel guilty about going off on Susie like that...", "nervous_left", j)

        cutscene:text("* ...[wait:10]Dude, don't even worry about it.", "dejected", s)
        cutscene:text("* That weirdo got to all of us.", "dejected_smile", s)
        cutscene:text("* Just, [wait:5]uh... [wait:10][face:dejected_look]Don't believe every creep you meet from now on, [wait:5]okay?", "dejected", s)

        cutscene:text("* Haha, [wait:7]sure...", "dejected", j)

        cutscene:wait(1.5)

        cutscene:text("* ...[wait:5]You must really care about her.", "small_smile_side_b", r)
        cutscene:text("* Of course I do. [wait:10]She's my family.[react:1]", "neutral", j, {
            reactions = {
				{"The only immediate \nfamily I have left...", "rightmid", "bottommid", "look_left", "jamm"}
			}
        })
        cutscene:text("* If she really is in here...", "dejected", j)
        
        cutscene:text("* Hey, [wait:5]I get it. [wait:10]Someone important to me is lost here too.", "annoyed_down_alt_smile", s)
        cutscene:text("* ...", "annoyed_down_smile", s)

        cutscene:wait(1.5)

        cutscene:text("* Hey, [wait:5]Ralsei? [wait:10]Are you okay?", "look_left", j)
        cutscene:text("* I...", "disappointed_down", r)
        cutscene:text("* I don't know...", "disappointed", r)
        cutscene:text("* I've been told stories about this world...", "disappointed_side", r)
        cutscene:text("* Stories that have been accurate to what we've been through.", "disappointed", r)
        cutscene:text("* However, [wait:5]when we entered this church again...", "disappointed_smile", r)

        cutscene:text("* ..You weren't told this part, [wait:5]were you?", "worried", j)
        cutscene:text("* I... [wait:10][face:disappointed_down]just don't know what to do...", "disappointed", r)

        cutscene:text("* ...", "dejected", j)

        cutscene:wait(1)

        cutscene:text("* You know, Ralsei, the way I see it...", "stern", j)

        cutscene:fadeOut(2, {music = true})
        cutscene:wait(3)
        Game.world.music:play("otherworldly_vision")
        cutscene:text("[voice:jamm]* Prophecies typically leave out a lot of information.")

        local fakehsv = HSVShiftFX()
		fakehsv.hue_start = 60;
		fakehsv.sat_start = 0.4;
		fakehsv.val_start = 1;
		fakehsv.hue_target = 80;
		fakehsv.sat_target = 0.4;
		fakehsv.val_target = 1;
		fakehsv.hue = fakehsv.hue_start;
		fakehsv.sat = fakehsv.sat_start;
		fakehsv.val = fakehsv.val_start;
		fakehsv.wave_time = 1;
		fakehsv.amount = 0;
        local panel_container = Object(SCREEN_WIDTH/2 + 150/2, 500)
		panel_container:setParallax(0)
		panel_container.layer = 1002
		panel_container:addFX(fakehsv, "fakehsv")
		Game.world:addChild(panel_container)
		local panel = ProphecyPanel("backgrounds/IMAGE_DEPTH_EXTEND_MONO_SEAMLESS", "backgrounds/IMAGE_DEPTH_EXTEND_SEAMLESS", "initial2", "", 150, 90)
		panel:setOrigin(0.5, 0.5)
		panel.sprite_offset_x = 49
		panel.sprite_offset_y = 61
		panel.text_offset_x = -160
		panel.text_offset_y = -16
		panel.no_back = true
		panel.fade_edges = true
		panel.ignore_onscreen_rules = true
		panel_container:addChild(panel)
        Game.world.timer:tween(3, panel, {panel_alpha = 1}, "out-circ")
		Game.world.timer:tween(3, panel_container, {y = 250}, "out-circ")
        cutscene:wait(4)

       cutscene:text("[voice:jamm]* The people who write them are never specific about anything.")
        
       local tabel = {}
       local function dothis()
        	local broken_container = Object(panel_container.x - 150*2 + 49/2, panel_container.y - 90*2 + 34/2)
			broken_container:setParallax(0)
			broken_container.layer = 750
			broken_container.draw_children_below = 0
			Game.world:addChild(broken_container)
			local sprites = Assets.getFrames("world/events/prophecy/shatter/prophecy_shatter_fall")
			Assets.playSound("break1")
            panel_container.visible = false
            for i, texture in ipairs(sprites) do
				local s = Sprite(texture)
				s:setScale(2)
				broken_container:addChild(s)
				s.alpha = 0.8
				s.physics.speed = 7
				s.physics.friction = 0.75
				s.physics.direction = math.rad(90 + MathUtils.random(-3, 3))
				s.physics.speed_x, s.physics.speed_y = s:getSpeedXY()
				if i == #sprites - 2 or i == #sprites - 4 then
					s.physics.speed_x = 0.5
				end
				if i == #sprites - 1 or i == #sprites - 3 then
					s.physics.speed_x = -0.5
				end
				s.physics.speed, s.physics.direction = s:getSpeedDir()
				s.physics.gravity_direction = math.rad(90)
				
				s:addFX(fakehsv, "fakehsv")

                table.insert(tabel, s)
			end
       end
       cutscene:text("[voice:jamm]* So maybe... [wait:10]This part got [wait:10][func:a]lost [wait:10]to time.", {
            functions = {
                a = function()
                    dothis()
                end
            }
       })

        cutscene:wait(1)
		for s, texture in ipairs(tabel) do
            texture.physics.gravity = 0.25 + MathUtils.random(0.1)
			texture.physics.friction = 0
			texture.physics.speed = 2 + (((#tabel - s) / #tabel) * 15)
			if s > (#tabel - 5) or s % 2 == 0 then
				texture.layer = -1
			end
        end

        	Game.world.timer:after(2/30, function() Assets.playSound("glassbreak", 0.4, 0.6) end)
			Assets.playSound("sparkle_glock", 0.5, 0.8)
			Assets.playSound("sparkle_glock", 0.5, 0.71)
			Assets.playSound("punchmed", 0.95, 0.7)
			Assets.playSound("ch4_first_intro_breaking", 0.25, 0.25)
			Assets.playSound("ch4_first_intro_breaking", 0.25, 0.14)

        Game.world.timer:after(3, function()
            for s, texture in ipairs(tabel) do
                texture:remove()
            end
        end)

		for i = 1,30 do
			local groundshard = ProphecyGroundShard((panel_container.x - 150/2 - 199) + ((i * 398) / 30) + MathUtils.random(-30, 30), panel_container.y - 90/2 + MathUtils.random(120))
			groundshard.layer = 1000
			groundshard:setParallax(0)
			groundshard.ytarg = 10000
			Game.world.timer:after(280/30, function()
				groundshard:remove()
			end)
			Game.world:addChild(groundshard)
		end

        panel_container:remove()

        cutscene:wait(3)
        cutscene:text("[voice:jamm]* Maybe nobody knows what's happening.")
        cutscene:text("[voice:jamm]* But... [wait:10]can't that be a good thing?")

        local panel_container = Object(SCREEN_WIDTH/2 + 200/2, 500)
		panel_container:setParallax(0)
		panel_container.layer = 750
		panel_container:addFX(fakehsv, "fakehsv")
		Game.world:addChild(panel_container)
		local panel = ProphecyPanel("backgrounds/IMAGE_DEPTH_EXTEND_MONO_SEAMLESS", "backgrounds/IMAGE_DEPTH_EXTEND_SEAMLESS", "rune", "", 150, 90)
		panel:setOrigin(0.5, 0.5)
		panel.sprite_offset_x = 0
        panel.height = 200
        panel.width = 200

        panel.offset_x = 50
        panel.offset_y = 100
        
		panel.sprite_offset_x = 85
        panel.sprite_offset_y = 50
        
		panel.text_offset_x = -160
		panel.text_offset_y = -16
		panel.no_back = true
		panel.fade_edges = true
		panel.ignore_onscreen_rules = true
		panel_container:addChild(panel)
        Game.world.timer:tween(3, panel, {panel_alpha = 1}, "out-circ")
		Game.world.timer:tween(3, panel_container, {y = 300}, "out-circ")

        cutscene:wait(4)

        cutscene:text("[voice:jamm]* It's not fun knowing everything, [wait:5]is it?")
        cutscene:text("[voice:jamm]* So... [wait:10]just embrace it for once.")

        cutscene:text("[voice:jamm]* Just go with the flow. [wait:10]Let whatever happens,[wait:10] happen.")
        cutscene:text("[voice:jamm]* For once, [wait:5]don't rely on what should be, [wait:5]or what will happen...")

        cutscene:text("[voice:jamm]* But instead, live your life in the present.")

        Game.world.timer:tween(2, panel, {panel_alpha = 0}, "linear")
        cutscene:wait(2)

        cutscene:fadeIn(3)
        cutscene:wait(Game.world.music:fade(0, 2))
        cutscene:text("* After all... [wait:10]Isn't the present a gift?", "wink", j)

        cutscene:text("* Well, when you put it that way...", "pensive", r)
        cutscene:text("* ...", "pensive", r)
        cutscene:text("* ...[face:small_smile_side]Alright, Jamm. I'll try it. Thank you.", "pensive", r)
        
        k:shake(2)
        Assets.playSound("wing")
        cutscene:wait(1.5)
        k:shake(4)
        Assets.playSound("wing")
        cutscene:wait(1)
        Assets.playSound("noise")
        k:resetSprite()
        k:setFacing("down")
        k:setPosition(655, 302)
        cutscene:wait(cutscene:walkTo(k, 655, 328))
        cutscene:wait(0.5)
        r.actor.default = "walk"
        r:resetSprite()
        r:setFacing("right")
        cutscene:text("* Kris! [wait:10]Do you feel better?", "pleased", r)
        cutscene:text("* (Dude, [wait:5]you missed Jamm acting like a total dad.)", "small_smile", s)
        s:shake(2)
        Assets.playSound("wing")
        cutscene:wait(1/15)
        s:resetSprite()
        cutscene:walkTo(s, s.x, 330)
        cutscene:wait(3)

        cutscene:text("* Also looks like we reached the end of the line.", "look_left", j)

        cutscene:wait(cutscene:panTo(720, Game.world.camera.y))
        cutscene:wait(1)
        cutscene:wait(cutscene:attachCamera())
        cutscene:text("* (Remember you can use the [color:yellow]TRAVEL BUTTON [color:white]if there's no exit!)", "wink", r)
        Assets.playSound("wing")
        j:shake()
        j:resetSprite()
        cutscene:interpolateFollowers()
		cutscene:wait(cutscene:attachFollowers())

        
        k:setFacing("down")
    end
}