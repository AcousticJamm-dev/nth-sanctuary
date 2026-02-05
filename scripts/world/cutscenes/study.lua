return {
    fountain = function(cutscene, event)
		if not Game:getFlag("interactedWithFountain", false) then
			cutscene:text("* (It's a pool of water. ...[wait:5] huh?)")
			cutscene:text("* (A feather drifted into it...[wait:5] and turned into coins!)")
			cutscene:text("* (Throw something inside?)")
			Game:setFlag("interactedWithFountain", true)
		else
			cutscene:text("* (It's a pool of water. Throw something in?)")		
		end
        Game:enterShop("toss_fountain")
    end,
    table = function(cutscene, event)
		--[[if not Game:getFlag("interactedWithTable", false) then
			Game:setFlag("interactedWithTable", true)
		else]]
			cutscene:text("* Umm,[wait:5] would you like anything,[wait:5] Kris?", "blush_smile", "ralsei")
		--end
        local choicer = cutscene:choicer({"Buy", "Do not"})
        if choicer == 1 then
			Game:enterShop("gerson_table")
		end
    end,
	book = function (cutscene, event)
		local flag = Game:getFlag("readCount")
		local books = {
			[1] = {
				"* Interacted 1"
			},
			[2] = {
				"* Interacted 2",
				"* 2 times!!!1!"
			},
			[3] = {
				"* Interacted 3",
				"* Three!!1!1",
				"ok"
			},
			[4] = {
				"* Interacted 4",
				"ok"
			},
			[5] = {
				"* Interacted 5",
			},
			[6] = {
				"* Interacted 6",
			},
			[7] = {
				"* Interacted 7",
			},
			[8] = {
				"* Interacted 8",
			},
			[9] = {
				"* Interacted 9",
			},
			[10] = {
				"* Interacted 10",
			},
			--^ Add lore later, all ideas welcome ^--
		}
		if not flag then
			cutscene:text("* (It's a book.[wait:10] It has the...)")
			cutscene:text("* (Huh? [wait:5]This isn't the Delta Rune...)")
			cutscene:text("* (The triangles are replaced with a shield.)")
			cutscene:text("* (...and 6 triangles all pointed to a star in the center,[wait:10] on the shield.)")
			Game:setFlag("readCount", 0)
		end
		if Game:getFlag("readCount", 0) >= 10 then
    		cutscene:text("* That's enough reading for now.")
    		return
		end

		::req::
		if not flag or flag < 1 then
			cutscene:text("* (Read a passage?)")
		else
			cutscene:text("* (Read another passage?)")
		end
		local choice = cutscene:choicer({"Yes", "No"})
		if choice == 1 then
			cutscene:text("* (You open the book to a random page...)")
			Game:addFlag("readCount", 1)
			flag = Game:getFlag("readCount")
			for i = 1, #books[flag] do
				cutscene:text(books[flag])
				if flag == 10 then
					cutscene:text("* (As you put the book back, [wait:5]you see something glinting behind.)")
					cutscene:text("* (You reach behind with your free hand...)")
					cutscene:text("* (And when you pull back, [wait:5]you find yourself holding a [color:9999ff]Dark Shard.[color:white])")
					Assets.playSound("item", 1, 0.5)
					cutscene:text("* (You obtained a [color:9999ff]Dark Shard.[color:white])")
					Mod:setDarkShard(Mod.DarkShardID.BookShard, true)
					return
				end
				goto req
			end
		elseif choice == 2 then
			cutscene:text("* You close the book.")
		end
	end
}
