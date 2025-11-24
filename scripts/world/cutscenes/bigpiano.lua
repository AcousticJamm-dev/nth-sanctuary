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
        cutscene:text("* Annoying?", "blush_smile", "susie")
        cutscene:text("* UM...![wait:5] I wouldn't say that!", "blush_smile", "ralsei")
        cutscene:text("* Duh,[wait:5] YOU wouldn't.", "blush_smile", "susie")
    end,

    megalovania = function (cutscene)
        local toby = Sprite("npcs/dogcar")
        toby:play()
        toby.x, toby.y = Game.world.player.x+400, Game.world.player.y - 80
        toby:setScale(2)
        Game.world:spawnObject(toby)
        cutscene:wait(1/4)
        Assets.playSound("drive")
        toby:slideTo(toby.x - 400, toby.y, 1/2)
        cutscene:wait(1/2)
        local a = Game.world:getEvent("pianobig")
        cutscene:fadeOut(0)
        Assets.playSound("hurt")
        cutscene:wait(1)
        toby:remove()
        cutscene:fadeIn(1)
        cutscene:wait(1)
    end,

    misc = function (cutscene)
        cutscene:setTextboxTop(false)
        cutscene:text("* Dude,[wait:5] stop messing around!", "teeth_b", "susie")
    end,
}