	---@class Map.dark_place : Map
local map, super = Class(Map, "second_sanctum_9")

function map:init(world, data)
	super.init(self, world, data)
	self.go_con = 0
	if Game:getFlag("chase_cutscene_prog") == 1 then
		self.music = "cultchase"
	else
		self.music = "second_church"
	end
end

function map:onEnter()
	if Game:getFlag("chase_cutscene_prog", 0) == 1 then
		for _, f in ipairs(Game.world.followers) do
			f.visible = false
		end
	end
end

function map:update()
	super.update(self)
	local player = Game.world.player
end

function map:doBullets()
	self.timer:every(1, function()
		if self.world:inBattle() and Game:getFlag("chasepass") ~= true then
	    	local new1 = self.world:spawnBullet("culteye", love.math.random(120, 360), love.math.random(0, 200))
			new1:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ff0000")))
		end
	end)
end

function map:update()
	super.update(self)
	if Game.world.player.x >= 1360 and Game:getFlag("chasepass") ~= true then
		for _, bullet in ipairs(Game.world.bullets) do
			if bullet.id == "gravitybullet" then
				bullet.x = bullet.x - 480
			end
		end

		Game.world.player.x = Game.world.player.x - 480
		if self.go_con > 9 then
			Game:setFlag("chasepass", true)
		end
		self.go_con = self.go_con+1
	end
end
return map