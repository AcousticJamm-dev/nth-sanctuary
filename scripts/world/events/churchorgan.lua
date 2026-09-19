local ChurchOrgan, super = Class(Event, "churchorgan")

function ChurchOrgan:init(data)
    super.init(self, data)
	
    local properties = data.properties or {}

	self.prop = properties["cutscene"]
	
	self.draw_children_above = 1
	self.solid = true
	self.leader_x = data.center_x
	self.leader_y = self.y + self.height + 24
	self.catafollow = true
	self.con = 0
	self.forceend = false
	self.timer = 0
	self.resetlight = false
	self.instrument = "krispiano"
	self.buffer = 0
	self.soundtoplay = -1
	self.difficulty = 1
	self.canceltimer = 0
	self.canceltime = 15
	self.drawspace = 30
	self.engaged = false
	self.engaged_alpha = 0
	self.siner = 0
	self.dontdrawmenu = false
	self.drawalpha = 0
	self.memvolume = -1
	self.endlessplaylog = ""
	self.debugendlessplaylog = ""
	self.debugplaylogoverflow = 0
	self.solution = properties["solution"] or "aoamcdbaaoaebcdeeeeeacbnaaocdeeeeefghgfecaoamcdbaklji"
	self.oct = false
	self.cutscene = properties["cutscene"] or nil
	self.notedisplay = nil
	self.makenote = false
	self.reset_music = properties["resetmus"] ~= false
	self.show_instructions = false
end

function ChurchOrgan:onAdd(parent)
    super.onAdd(self,parent)
    if not Game.stage:getObjects(TutorialText)[1] then
		local tuttext = TutorialText(2, self)
		Game.world:addChild(tuttext)
	end
    if not Game.stage:getObjects(OrganNoteDisplay)[1] then
		self.notedisplay = OrganNoteDisplay(self)
		Game.world:addChild(self.notedisplay)
	end
end

local function scr_returnwait(x1, y1, x2, y2, spd)
	return math.max(1, MathUtils.round(MathUtils.dist(x1, y1, x2, y2) / spd))
end

local function scr_piano_determinepitch(sound)
	local a = 0
	local passentry = ""
	if sound == 0 then
		if not Input.down("menu") then
			a = 1
			passentry = "a"
		else
			a = 0.5
			passentry = "i"
		end
	elseif sound == 5 then
		if not Input.down("menu") then
			a = 1.125
			passentry = "b"
		else
			a = 0.5625
			passentry = "j"
		end
	elseif sound == 4 then
		if not Input.down("menu") then
			a = 1.25
			passentry = "c"
		else
			a = 0.625
			passentry = "k"
		end
	elseif sound == 3 then
		if not Input.down("menu") then
			a = 4/3
			passentry = "d"
		else
			a = 2/3
			passentry = "l"
		end
	elseif sound == 2 then
		if not Input.down("menu") then
			a = 1.5
			passentry = "e"
		else
			a = 0.75
			passentry = "m"
		end
	elseif sound == 1 then
		if not Input.down("menu") then
			a = 1.6666666666666667
			passentry = "f"
		else
			a = 0.8333333333333334
			passentry = "n"
		end
	elseif sound == 8 then
		if not Input.down("menu") then
			a = 1.875
			passentry = "g"
		else
			a = 0.9375
			passentry = "o"
		end
	elseif sound == 7 then
		if not Input.down("menu") then
			a = 2
			passentry = "h"
		else
			a = 1
			passentry = "a"
		end
	end
	return a, passentry
end

function ChurchOrgan:onInteract(player, dir)
	if self.con == 0 and self.buffer <= 0 then
		self.endlessplaylog = ""
		if Game.stage:getObjects(TutorialText)[1] then
			Game.stage:getObjects(TutorialText)[1].target = self
		end
		local cutscene = self.world:startCutscene(function(cutscene)
			cutscene:detachCamera()
			cutscene:detachFollowers()
			Game.world.music:fade(0, 30/30)
			Game.world.camera:panTo(560+SCREEN_WIDTH/2, Game.world.camera.y, 15/30)
			local leader = cutscene:getCharacter(Game.party[1]:getActor().id)
			local party2, party3, party4 = nil, nil, nil
			if #Game.party >= 2 then
				party2 = cutscene:getCharacter(Game.party[2]:getActor().id)
			end
			if #Game.party >= 3 then
				party3 = cutscene:getCharacter(Game.party[3]:getActor().id)
			end
			if #Game.party >= 4 then
				party4 = cutscene:getCharacter(Game.party[4]:getActor().id)
			end
			cutscene:walkTo(leader, 269 + 560, leader.y, 12/30)
			Game.world.timer:after(13/30, function() cutscene:walkTo(leader, 269 + 560, 300, 12/30) end)
			Game.world.timer:after(26/30, function() cutscene:walkTo(leader, 321 + 560, 300, 12/30) end)
			Game.world.timer:after(39/30, function() cutscene:look(leader, "up") end)
			if party2 then
				if #Game.party < 3 then
					cutscene:walkTo(party2, 321 + 560, 382, 12/30)
				else
					cutscene:walkTo(party2, 371 + 560, 362, 12/30)
				end
			end
			if party3 then
				cutscene:walkTo(party3, 271 + 560, 362, 12/30)
			end
			if party4 then
				cutscene:walkTo(party4, 321 + 560, 382, 12/30)
			end
			cutscene:wait(12/30)
			if party2 then
				cutscene:look(party2, "up")
			end
			if party3 then
				cutscene:look(party3, "up")
			end
			if party4 then
				cutscene:look(party4, "up")
			end
			cutscene:wait(30/30)
		end)
		cutscene:after(function()
			Game.lock_movement = true
			self.con = 0.2
		end)
		return true
	end
end

function ChurchOrgan:update()
	super.update(self)
	if self.buffer > 0 then
		self.buffer = self.buffer - 1 * DTMULT
	end
	
	if self.resetlight then
		self.resetlight = false
	end
	
	if self.con == 0.2 then
		self.con = 1
		Game.world.player:setSprite("piano")
		self.engaged = true
		self.show_instructions = true
	end
	
	if self.con == 1 then
		Game.lock_movement = true
		if Input.down("cancel") and not Game.world.cutscene then
			self.canceltimer = self.canceltimer + 1 * DTMULT
		else
			self.canceltimer = 0
		end
		
		if self.canceltimer >= self.canceltime or self.forceend then
			self.con = 4
			self.show_instructions = false
			if self.debugendlessplaylog ~= "" then
				local overflow_text = ""
				if self.debugplaylogoverflow > 0 then
					overflow_text = " (truncated "..self.debugplaylogoverflow.." time"..(self.debugplaylogoverflow ~= 1 and "s" or "")..")"
				end
				Mod.logger:debug("Last piano log recorded: "..self.debugendlessplaylog..overflow_text)
				self.debugplaylogoverflow = 0
			end
			self.debugendlessplaylog = ""
			Game.world.player:resetSprite()
			local cutscene = self.world:startCutscene(function(cutscene)
				cutscene:detachCamera()
				cutscene:detachFollowers()
				Game.world.music:seek(0)
				Game.world.music:setVolume(0)
				Game.world.music:fade(1, 120/30)
				Game.world.camera:panTo(560+SCREEN_WIDTH/2, Game.world.camera.y, 15/30)
				local leader = cutscene:getCharacter(Game.party[1]:getActor().id)
				cutscene:walkTo(leader, leader.x - 50, leader.y, 12/30)
				Game.world.timer:after(13/30, function() cutscene:walkTo(leader, leader.x, leader.y + 40, 12/30) end)
				Game.world.timer:after(26/30, function() cutscene:walkTo(leader, leader.x + 50, leader.y, 12/30) end)
				Game.world.timer:after(39/30, function() cutscene:look(leader, "down") end)
				cutscene:wait(44/30)
				cutscene:panTo(leader, 15/30)
				cutscene:wait(16/30)
				cutscene:walkToSpeed(leader, leader.x, leader.y + 4, 4) -- lol
				cutscene:interpolateFollowers()
				cutscene:attachFollowers()
				cutscene:attachCamera()
			end)
			cutscene:after(function()
				Game.lock_movement = false
			end)
		end
		
		self.soundtoplay = 0
		if Input.down("left") and not Input.down("down") and not Input.down("right") and not Input.down("up") then
			self.soundtoplay = 1
		end
		if Input.down("left") and Input.down("down") and not Input.down("up") and not Input.down("right") then
			self.soundtoplay = 2
		end
		if Input.down("down") and not Input.down("left") and not Input.down("right") and not Input.down("up") then
			self.soundtoplay = 3
		end
		if Input.down("down") and Input.down("right") and not Input.down("left") and not Input.down("up") then
			self.soundtoplay = 4
		end
		if Input.down("right") and not Input.down("left") and not Input.down("down") and not Input.down("up") then
			self.soundtoplay = 5
		end
		if Input.down("up") and Input.down("right") and not Input.down("down") and not Input.down("left") then
			self.soundtoplay = 7
		end
		if Input.down("up") and not Input.down("left") and not Input.down("down") and not Input.down("right") then
			self.soundtoplay = 7
		end
		if Input.down("up") and Input.down("left") and not Input.down("down") and not Input.down("right") then
			self.soundtoplay = 8
		end
		local soundplayed = false
		if Input.pressed("confirm") and self.soundtoplay ~= -1 and not Input.down("cancel") and not Game.world.cutscene then
			local mypitch, passkey = scr_piano_determinepitch(self.soundtoplay)
			Assets.playSound(self.instrument, 0.8, mypitch)
			soundplayed = true
			self.makenote = true
			self.notesplayed = true
			self.buffer = 0
			self.endlessplaylog = self.endlessplaylog..passkey
			self.debugendlessplaylog = self.debugendlessplaylog..passkey
			if StringUtils.len(self.debugendlessplaylog) >= 200 then
				self.debugendlessplaylog = StringUtils.sub(self.debugendlessplaylog, 2, StringUtils.len(self.debugendlessplaylog))
				self.debugplaylogoverflow = self.debugplaylogoverflow + 1
			end
			Mod.logger:debug("Key pressed: "..passkey)
			local i = 1
			while i <= utf8.len(self.endlessplaylog) do

                --solution
				if StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == self.solution then
					Mod.logger:debug("Played solution song ("..self.solution..")")
					Assets.playSound("bell")
					self.endlessplaylog = ""
					break
					
                --His Theme
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "mbamooamamooa" then
					Mod.logger:debug("Played His Theme (mbamooamamooa)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.histheme")
					break

                --Your Best Friend
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "ccdecddebm" then
					Mod.logger:debug("Played Your Best Friend (ccdecddebm)")
					Input.clear("menu", true)
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.yourbestfriend")
					break

                --Your Dad's Best Friend
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "adefddcdbadedcdd" then
					Mod.logger:debug("Played Your Dad's Best Friend (adefddcdbadedcdd)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.annoying")
					break

				--The Legend
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "nachgebc" then
					Mod.logger:debug("Played The Legend (nachgebc)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.legend")
					break

				--Don't Forget
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "cdeeeeeacbbbbbbcbaaaaaaghgec" then
					Mod.logger:debug("Played Don't Forget (cdeeeeeacbbbbbbcbaaaaaaghgec)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.dontforget")
					break

				--Lost Girl
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "nacghecfoaeoa" then
					Mod.logger:debug("Played Lost Girl (nacghecfoaeoa)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.lostgirl")
					break

                --Rouxls Kaard
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "caonnfedcbabc" then
					Mod.logger:debug("Played Rouxls Kaard (caonnfedcbabc)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.rouxls")
					break

                --Spear/Hammer of Justice Motif
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "edbcab" then
					Mod.logger:debug("Played Hammer of Justice (edbcab)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.hammerofjustice")
					break

                --Heartache
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "naoannoaec" then
					Mod.logger:debug("Played Heartache (naoannoaec)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.heartache")
					break

                --You've Got A Friend in Me/Chopsticks/Heart & Soul/DEOXYNN Title
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "cecfeafhfhe" then
					Mod.logger:debug("Played You've Got A Friend in Me (cecfeafhfhe)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.misc")
					break
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "ddddddddccccccccgggggfghhhhgf" then
					Mod.logger:debug("Played Chopsticks (ddddddddccccccccgggggfghhhhgf)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.annoying")
					break
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "aaaaonoabccccbabcd" then
					Mod.logger:debug("Played Heart & Soul (aaaaonoabccccbabcd)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.misc")
					break
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "klncae" then
					Mod.logger:debug("Played DEOXYNN Title (klncae)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.deox")
					break
					
                --Once Upon a Time/Undertale
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "mebaem" then
					Mod.logger:debug("Played Once Upon a Time/Undertale (mebaem)")
					Input.clear("menu", true)
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.undertale")
					break

                --Dark Sanctuary
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "naebababebab" then
					Mod.logger:debug("Played Dark Sanctuary (naebababebab)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.sanctuary")
					break
				
                --MEGALOVANIA
				elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "nnfc" then
					Mod.logger:debug("Played MEGALOVANIA (nnfc)")
					self.endlessplaylog = ""
					Game.world:startCutscene("churchorgan.megalovania", self)
					break
					
                --Penumbra Phantasm
                elseif StringUtils.sub(self.endlessplaylog, i, utf8.len(self.endlessplaylog)) == "dceccd" then
					Mod.logger:debug("Played Penumbra Phantasm (dceccd)")
                    self.endlessplaylog = ""
                    Game.world:startCutscene("churchorgan.penumbra", self)
                    break
				end
				i = i + 1
			end
			if StringUtils.len(self.endlessplaylog) >= 200 then
				self.endlessplaylog = StringUtils.sub(self.endlessplaylog, 2, StringUtils.len(self.endlessplaylog))
			end
		end
	end
	
	if self.con == 30 then
	end
	
	if self.con == 4 then
		self.forceend = false
		self.con = 0
		self.timer = 0
		self.buffer = 6
		self.canceltimer = 0
		self.dontdrawmenu = false
	end
end

function ChurchOrgan:draw()
	super.draw(self)
	
	self.siner = self.siner + 1 * DTMULT
	if self.con == 1 then
		self.engaged = true
		self.engaged_alpha = 1
	else
		self.engaged = false
		self.engaged_alpha = 0
	end
end

return ChurchOrgan