return {
    sans = function(cutscene)
        local sans = cutscene:getCharacter("sans")
        local flag = Game:getFlag("got_rake")
        cutscene:setSpeaker(sans)
        if not flag then
            cutscene:text("* heya.", "neutral")
            cutscene:text("* someone gotta babysit these kids.", "look_left")
            cutscene:text("* actually, [wait:5]want a rake? [wait:10][face:wink]don't need it anymore.", "neutral")
            local ch = cutscene:choicer({"Yes", "No"})
            if ch == 1 then
                cutscene:text("* here. [wait:5]have fun.", "neutral")
                Game.inventory:addItem("sound_stone")
                cutscene:setSpeaker()
                Assets.playSound("item")
                cutscene:text("* You got a Rake.")
                Game:setFlag("got_rake", true)
                Game.inventory:addItem("rake")
            else
                cutscene:text("* well, [wait:5]if you're sure...", "neutral")
                cutscene:text("* just don't come back when you're raked from whatever you're doing.", "joking")
            end
        else
            cutscene:text("* heya.", "neutral")
            cutscene:text("* someone gotta babysit these kids.", "look_left")
            cutscene:text("* enjoying the rake? [wait:10][face:wink]it really isn't one to be leafed alone.", "neutral")
        end
        
        
    end,
    sans2 = function(cutscene)
        local sans = cutscene:getCharacter("sans")
        local flag = Game:getFlag("got_rake")
        cutscene:setSpeaker(sans)
        if not flag then
            cutscene:text("* heya.", "neutral")
            cutscene:text("* someone gotta babysit these kids.", "look_left")
        else
            cutscene:text("* heya.", "neutral")
            cutscene:text("* someone gotta babysit these kids.", "look_left")
            cutscene:text("* actually, [wait:5]want a rake? [wait:10][face:wink]don't need it anymore.", "neutral")
            cutscene:text("* ...i gave it to you already? [wait:10][face:joking]i can't beleaf this.", "neutral")
        end
        
        
    end,

    untroll = function (cutscene)
        local get = Game:getFlag("untroll_moss")
        if not get then
            Game.world.music.volume = 0
            Assets.playSound("moss_fanfare",1, 1.25)
            cutscene:text("* You found the [color:green]Moss!")
            Game.inventory:addItem("moss")
            Game.world.timer:tween(1, Game.world.music, {volume = 1})
            Game:setFlag("untroll_moss", true)
            Game:setFlag("trolled", false)
            Game:setFlag("#citadel_room2#6:opened", false)
        elseif get == true then
            cutscene:text("* (You already got the moss.)")
            Game:setFlag("#citadel_room2#6:opened", false)
            Game:setFlag("trolled", false)
        end
    end,

    cruel = function (cutscene, event)
        for _, child in ipairs(event.children) do
            if child:includes(TileObject) then
                child:remove()
            end
        end
        event:setSprite("world/objects/treasure_chest_2")
        event:setScale(2, 1)
        Assets.playSound("locker")
        cutscene:text("* (You looked inside the chest...)")
        local cr = cutscene:spawnNPC("jellycruel", 160, 380)
        cr:setScale(0, 4)
        cr.alpha = 0
        Game.world.timer:tween(1, cr, {scale_x = 1, scale_y = 1, alpha = 1}, 'out-expo')
        cr.layer = 1000
        cutscene:wait(0.8)
        cutscene:text("* (Inside, [wait:5]was a [color:red]Jellycruel!")
        local src = Assets.playSound("tensionhorn")
        src:setPitch(0.7)
        cutscene:wait(10/30)
        local src = Assets.playSound("tensionhorn")
        src:setPitch(0.8)
        cutscene:wait(12/30)
        cutscene:startEncounter("jellycruel")
        cr:remove()
        event:setSprite("world/objects/treasure_chest_1")
    end

}
