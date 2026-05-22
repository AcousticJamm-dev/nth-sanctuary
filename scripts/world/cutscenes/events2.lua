return {
    nothing_important = function(cutscene)
        local a = Game.world.music
        cutscene:fadeOut(2, {music = true})
        local susie, ralsei, kris = cutscene:getCharacter("susie"),cutscene:getCharacter("ralsei"),cutscene:getCharacter("kris")
        Game.world.music:play("canta")
        cutscene:wait(2)
        cutscene:setSpeaker(ralsei)
        cutscene:text({
            "* [speed:0.5][shake:0.52]I can't do this anymore, [wait:5]Kris...",
            "* [speed:0.5][shake:0.52]It's so hard to keep going",
            "* [speed:0.5][shake:0.52]I",
            "* [speed:0.5][shake:0.52]I want to go home.",
            "* [speed:0.5][shake:0.52]How much longer, [wait:5]Kris? [wait:5]Susie?",
            "* [speed:0.5][shake:0.52]It just won't stop",
            "* [speed:0.5][shake:0.52]There are too many Dark Worlds",
            "* [speed:0.5][shake:0.52]I can't",
            "* [speed:0.5][shake:0.52]I can't keep it together anymore",
            "* [speed:0.5][shake:0.52]I know, [wait:5]it's okay to cry.[wait:10] It's okay to not always be happy.",
            "* [speed:0.5][shake:0.52]But",
            "* [speed:0.5][shake:0.52]I just want to go"
        })
        cutscene:setSpeaker(susie)
        cutscene:wait(45/30)
        cutscene:text({"* ...",
            "* Ralsei.",
            "* We already came this far.",
            "* I want to leave, [wait:5]too.",
            "* And, [wait:5]y'know?",
            "* I'll keep going until I can't anymore.[wait:10] Until I drop.",
            "* Even if the Knight didn't... [wait:10]Do this...",
            "* We're gonna stop it anyways.",
            "* Just... [wait:10]Deal with it.",
            "* We can stop it. [wait:10]We WILL stop it.",
            "* ...Even if it's a bit too much.",
        })
        cutscene:setSpeaker(ralsei)
        cutscene:wait(45/30)
        cutscene:text({"* [speed:0.5][shake:0.52]Thank you, [wait:5]Susie...",
            "* [speed:0.5][shake:0.52]I think",
            "* [speed:0.5][shake:0.52]I think I can keep going",
            "* [speed:0.5][shake:0.52]Thank you, [wait:5]both of you...",
            "* [speed:0.5][shake:0.52]Let's keep going.",
        })
        cutscene:setSpeaker()
        cutscene:text("* (Ralsei's will changed...)[wait:10]\n* (Check his [color:yellow]SPELLs[color:white].)")
    end,

    jammslingshot = function (cutscene)
        local h = Game:getFlag("slingCon")

        if h == 1 then
            cutscene:setSpeaker("jamm")
            cutscene:text("* Where is it...", "suspicious")
        end
    end

    
}