return {
    legacy = function (cutscene)
		Kristal.hideBorder(0)
		Game.world.music:stop()
		cutscene:fadeOut(0)
		
		cutscene:text("* Hello,[wait:5] " .. Game.save_name .. ".")
		cutscene:text("* You are playing on an incompatible legacy save file.")
		cutscene:text("* Please delete this save file and start a new one.")
		cutscene:text("* Thank you,[wait:5] and we hope you enjoy what #th Sanctuary has to offer.")
		
        cutscene:wait(1)
		love.audio.stop()
        Music.clear()
        Game:load(nil,nil,true)
	end,
}
