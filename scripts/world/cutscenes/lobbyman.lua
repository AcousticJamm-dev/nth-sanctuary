return {
    four = function(cutscene)
        local man = cutscene:getCharacter("lobbyman")
        local susie, ralsei, kris = cutscene:getCharacter("susie"),cutscene:getCharacter("ralsei"),cutscene:getCharacter("kris")
        local tick = 0
        local tick2 = 0
        cutscene:setSpeaker(man)
        cutscene:text("* Hello. [wait:5]I am the Lobby Man.")
        local opts = {"Where am I?", "Who are you?", "Bye"}
        local function choicebox()
            if tick == 1 then opts[2] = "...Really?" end
            if tick2 == 1 then opts[1] = "Where next?" end
            local choice = cutscene:choicer(opts)
            if choice == 1 then
                if tick2 ~= 1 then
                    cutscene:text("* You are in the 4th Sanctuary.")
                    cutscene:text("* A beautiful coloring of purple to orange...")
                    tick2 = 1
                else
                    cutscene:text("* Heh heh.. [wait:10]I needn't spoil it.")
                    cutscene:text("* It'd ruin the fun.")
                end
                choicebox()
            elseif choice == 2 then
                if tick ~= 1 then
                    cutscene:text("* I am the Lobby Man.")
                    tick = 1
                else
                    cutscene:text("* There is nothing more to me.")
                end

                choicebox()
            elseif choice == 3 then
                cutscene:text("* bye")
                Assets.playSound("snd_mysterygo")
                Game.world.timer:tween(0.75, man, {alpha = 0, scale_x = 1, scale_y = 3}, 'out-circ')
                cutscene:wait(1)
                man:remove()
            end
        end

        choicebox()
        cutscene:wait(3)
        kris:setFacing("down")
    end,
}