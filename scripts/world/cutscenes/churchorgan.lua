return {
    histheme = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Aww,[wait:5] what a pretty melody![wait:5] It's like a lullaby...!", "blush_smile", "ralsei")
    end,

    yourbestfriend = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Aww,[wait:5] that song sounds so friendly and sweet!", "blush_smile", "ralsei")
    end,

    annoying = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Umm...[wait:5] that melody's a little...", "blush_smile", "ralsei")
        cutscene:text("* Annoying?", "small_smile", "susie")
        cutscene:text("* UM...![wait:5] I wouldn't say that!", "blush_smile", "ralsei")
        cutscene:text("* Duh,[wait:5] YOU wouldn't.", "small_smile", "susie")
    end,

    legend = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Oh...!", "blush_surprise", "ralsei")
        cutscene:text("* What,[wait:5] you gonna serenade Ralsei with that one?", "smile", "susie")
    end,

    dontforget = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* ...", "bangs_neutral", "susie")
        cutscene:text("* ...[wait:5] Susie?", "smile", "ralsei")
        cutscene:text("* Nothing...[wait:5] just thought it was a kinda cool song.", "closed_grin", "susie")
    end,

    lostgirl = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* That one's...[wait:5] kinda nice.", "annoyed_down_smile", "susie")
        cutscene:text("* Wonder if I could learn it on,[wait:5] uh,[wait:5] guitar.", "smirk", "susie")
    end,

    rouxls = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Oh,[wait:5] that's Mr. Rouxls's theme!", "blush_pleased", "ralsei")
        cutscene:text("* More like the theme of him getting his ass kicked.", "smile", "susie")
    end,

    hammerofjustice = function (cutscene)
		Mod.logger:todo("(Dialogue should definitely change when Susie learns about the Old Man not being in the Dark World)")
        cutscene:setTextboxTop(false)
        cutscene:text("* Hell yeah,[wait:5] that's majestic!", "sincere_smile", "susie")
        cutscene:text("* Perhaps the Old Man would enjoy that one!", "blush_smile", "ralsei")
    end,

    heartache = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* How emotional...", "blush_smile", "ralsei")
        cutscene:text("* Maybe you should play that for your mom.", "surprise_smile", "susie")
        cutscene:text("* Y'know...[wait:5] she hasn't heard you play in a while.", "nervous_side", "susie")
    end,

    misc = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Dude,[wait:5] stop messing around!", "teeth_b", "susie")
    end,
		
    undertale = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* What's that song? Sounds like crap.", "nervous_side", "susie")
    end,

    sanctuary = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Feel like I heard that one...", "suspicious", "susie")
        cutscene:text("* ...?", "shock_smile", "ralsei")
        cutscene:text("* Yeah,[wait:5] that's right. Ralsei was humming it earlier.", "surprise_smile", "susie")
        cutscene:text("* O-oh,[wait:5] was I...? S-sorry...!", "blush_surprise", "ralsei")
    end,

    deox = function (cutscene)
		local ralsei = cutscene:getCharacter("ralsei")
		local susie = cutscene:getCharacter("susie")
		local jamm = cutscene:getCharacter("jamm")
		local jammf = Game:getFlag("jamm_join")
		cutscene:setSpeaker(ralsei)
		if not jamm then
			cutscene:text("* What a nice song...!", "blush_pleased")
			cutscene:text("* It feels... [wait:5]calm...", "blush_smile")
			if jammf then
				cutscene:text("* You should play this to Jamm, [wait:5]Kris!", "wink")
			end
		elseif jamm and jammf then
			cutscene:setSpeaker(jamm)
			cutscene:text("* Huh. [wait:10]That's familiar...", "neutral")
			cutscene:text("* (...Marcy...)", "worried_down")
			cutscene:setSpeaker(susie)
			cutscene:text("* You, [wait:5]uh.. [wait:10]alright, [wait:5]dude?", "nervous_side")
			cutscene:setSpeaker(jamm)
			cutscene:text("* [speed:0.2]...[speed:1]Yeah,[wait:5] just remembered something, [wait:5][face:look_left]is all.", "neutral")
		end
	end,
	
    megalovania = function (cutscene, event)
		if Game:getFlag("playedMegalovania", false) then
			Assets.stopSound(event.instrument)
			Assets.playSound("pianonoise")
			return
		end
		Game.world.timer:after(8/30, function() Assets.playSound("drive") end)
		Game:setFlag("playedMegalovania", true)
        cutscene:wait(0.5)
        local toby = Sprite("npcs/dogcar")
        toby:play()
        toby.x, toby.y = Game.world.camera.x + SCREEN_WIDTH/2, Game.world.player.y - 80
        toby:setScale(2)
		toby.physics.gravity = 2
		toby.physics.gravity_direction = -math.rad(180)
		toby.physics.speed_x = -24
		HookSystem.hook(toby, "update", function(orig, self)
			orig(self)
			toby.x = math.max(toby.x, Game.world.player.x + Game.world.player.width - 10)
		end)
        Game.world:spawnObject(toby)
        cutscene:wait(function() return toby.x <= Game.world.player.x + Game.world.player.width - 10 end)
        cutscene:fadeOut(0)
		event.show_instructions = false
        Assets.stopAndPlaySound("hurt")
        cutscene:wait(2)
        toby:remove()
        cutscene:fadeIn(0.5)
        cutscene:wait(0.5)
		event.show_instructions = true
    end,

    penumbra = function (cutscene, event)
		if Game:getFlag("playedPenumbra", false) then
			Assets.stopSound(event.instrument)
			Assets.playSound("pianonoise")
			return
		end
		Game.world.timer:after(8/30, function() Assets.playSound("drive") end)
		Game:setFlag("playedPenumbra", true)
        cutscene:wait(0.5)
        local toby = Sprite("npcs/dogcar")
        toby:play()
        toby.x, toby.y = Game.world.camera.x + SCREEN_WIDTH/2, Game.world.player.y - 80
        toby:setScale(2)
		toby.physics.gravity = 2
		toby.physics.gravity_direction = -math.rad(180)
		toby.physics.speed_x = -24
		HookSystem.hook(toby, "update", function(orig, self)
			orig(self)
			toby.x = math.max(toby.x, Game.world.player.x + Game.world.player.width - 10)
		end)
        Game.world:spawnObject(toby)
        cutscene:wait(function() return toby.x <= Game.world.player.x + Game.world.player.width - 10 end)
        cutscene:fadeOut(0)
		event.show_instructions = false
        Assets.stopAndPlaySound("hurt")
        cutscene:wait(2)
        toby:remove()
        cutscene:fadeIn(0.5)
        cutscene:wait(0.5)
		event.show_instructions = true
    end
}