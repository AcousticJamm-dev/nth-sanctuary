---@class Map.dark_place : Map
local map, super = Class(Map, "second_sanctum_7")

function map:init(world, data)
	super.init(self, world, data)
	self.slide_battle = 0
    self.alphas = {}
	self.fake_movement = false
	self.loop_movement = true
	self.layer_y = 0
	self.last_player_y = 0
end

function map:onEnter()
	super.onEnter(self)
	self.overlay = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
	self.overlay:setColor(COLORS.black)
	self.overlay:setParallax(0, 0)
	self.overlay.alpha = 0
	self.overlay:setLayer(WORLD_LAYERS["below_bullets"])
	self.world:addChild(self.overlay)
	self:getHitbox("collision_slidearea_a").collidable = false
	self:getHitbox("collision_slidearea_b").collidable = false
end

function map:update()
	super.update(self)
	local layer_a = self:getTileLayer("tiles_1")
	local layer_b = self:getTileLayer("tiles_2")
	local layer_c = self:getTileLayer("props")
	local player = self.world.player
	if self.slide_battle == 0 then
		if player and player:isSliding() and not Game:getFlag("slidepass", false) then
			self.world.timer:script(function(wait)
				wait(0.5)
				self.world:setBattle(true)
				for _, follower in ipairs(self.world.followers) do
					self.alphas[follower] = follower.sprite.alpha
					local mask = follower:addFX(AlphaFX(1), "slide_alpha")
					self.world.timer:tween(10 / 30, mask, { alpha = 0 })
				end
				while self.world.player.y < 720 do
					wait()
				end
				for _, slidearea in ipairs(Game.world:getEvents("slidearea")) do
					slidearea.collidable = false
				end
				self:getHitbox("collision_slidearea_a").collidable = true
				self:getHitbox("collision_slidearea_b").collidable = true
				self.last_player_y = self.world.player.y
				self.world.player:setState("SLIDE_FREE")
				self.fake_movement = true
				wait(0.5)
				for i = 1, 6 do
					self.overlay:fadeTo(0.6, 15/30)
					wait(20/30)
					self.overlay:fadeTo(0.3, 15/30)
					Assets.playSound("spawn_weaker", 0.8, 0.45)
					wait(2)
				end
				Game.lock_movement = true
				while self.world.player.y ~= self.last_player_y do
					local time = math.max(MathUtils.round(MathUtils.dist(self.world.player.x, self.last_player_y, self.world.player.x, self.world.player.y) / 15), 1)/30
					self.world.timer:tween(time, self.world.player, {y = self.last_player_y}, "linear")
					wait(time)
				end
				self.loop_movement = false
				while self.layer_y + self.last_player_y < 2284 do
					wait()
				end
				self.world.player.y = 2284
				self.world.player:setState("WALK")
				for _, follower in ipairs(self.world.followers) do
					follower.y = self.world.player.y
					follower.state_manager:setState("WALK")
				end
				self.world.player:interpolateFollowers()
				self.world.camera:setPosition(self.world.player.x, self.world.player.y)
				for _, obj in ipairs(Game.stage:getObjects(DamageNumber)) do
					obj.y = obj.y + self.layer_y
				end
				for _, obj in ipairs(Game.stage:getObjects(Registry.getLegacyEvent("churchfog"))) do
					obj.y = obj.y + self.layer_y
				end
				self.layer_y = 0
				layer_a.y = layer_a.init_y
				layer_b.y = layer_b.init_y
				layer_c.y = layer_c.init_y
				self.fake_movement = false
				Game.lock_movement = false
			end)
			self.slide_battle = 1
		end
	elseif self.slide_battle == 1 then
		if player and not player:isSliding() then
			self.world:setBattle(false)
			self.world.player.slide_state.moving_slide_dusts = false
			self.overlay:fadeOutAndRemove(15/30)
			for follower, alpha in pairs(self.alphas) do
				local mask = follower:getFX("slide_alpha")
				if mask then
					self.world.timer:tween(10 / 30, mask, { alpha = alpha }, "linear", function()
						follower:removeFX(mask)
					end)
				end
			end
			self.alphas = {}
			self.slide_battle = 2
			self:getHitbox("collision_slidearea_a").collidable = false
			self:getHitbox("collision_slidearea_b").collidable = false
			for _, slidearea in ipairs(Game.world:getEvents("slidearea")) do
				slidearea.collidable = true
			end
			Game:setFlag("slidepass", true)
		end
	end
	if self.fake_movement then
		self.layer_y = self.layer_y + 12 * DTMULT
		
		if self.layer_y + self.last_player_y >= 1920 and self.loop_movement then
			self.layer_y = self.layer_y - 960
		end
	end
	layer_a.y = layer_a.init_y - self.layer_y
	layer_b.y = layer_b.init_y - self.layer_y
	layer_c.y = layer_c.init_y - self.layer_y
end

return map