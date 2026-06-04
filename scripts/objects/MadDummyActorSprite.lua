---@diagnostic disable: undefined-field
local MadDummyActorSprite, super = Class(ActorSprite)

function MadDummyActorSprite:init(actor)
    super.init(self, actor)

    self.head = Sprite(self:getTexturePath("head"), self.width/2, 21)
    self.head:setOriginExact(self.width/2, 21)
    self.head.visible = false
    self.head.debug_select = false
    self:addChild(self.head)

    self.body = Sprite(self:getTexturePath("body"),  self.width/2, 23)
    self.body:setOriginExact(self.width/2, 23)
    self.body.visible = false
    self.body.debug_select = false
    self:addChild(self.body)

    self.base = Sprite(self:getTexturePath("base"), self.width/2, 36)
    self.base:setOriginExact(self.width/2, 36)
    self.base.visible = false
    self.base.debug_select = false
    self:addChild(self.base)
	
	self.part_data = {}
	self.part_data["head"] = {x = self.width/2, y = 21, rot = 0, ox = self.width/2, oy = 21, orot = 0}
	self.part_data["body"] = {x = self.width/2, y = 23, rot = 0, ox = self.width/2, oy = 23, orot = 0}
	self.part_data["base"] = {x = self.width/2, y = 36, rot = 0, ox = self.width/2, oy = 36, orot = 0}	
	
    self:setSprite("idle")
    
	self.ow_timer = 0
	self.mode = 0	
    self.rot = 0
	self.rotter = 0
    self.speedmod = -0.4
    self.rotmod = 0.15
	
    self.cotton_count = 1
	
	self.siner_active = false
end

function MadDummyActorSprite:update()
    super.update(self)

    --animation stuff
	if self.anim == "moving" or (self.anim == "hurt" and self.siner_active) then	
		self.head.visible = true
		self.body.visible = true
		self.base.visible = true
		if self.mode == 0 then
			self.rotter = self.rotter + DTMULT
			self.rotter = self.rotter + (self.speedmod / 2) * DTMULT
			self.rot = (math.sin((self.rotter / 6)) * 30) / 2
			self.rot = self.rot * self.rotmod / 2
		
			self.head.rotation = -math.rad(self.rot)
			self.head.x = self.width/2
			self.head.y = 21

			self.body.rotation = -math.rad(self.rot) * 3
			self.body.x = self.width/2
			self.body.y = 23 + (self.rot / 4)

			self.base.rotation = -math.rad(-self.rot)
			self.base.x = self.width/2 - (self.rot / 3)
			self.base.y = 36 + (self.rot / 3)
		else
			self.head.rotation = -math.rad(self.part_data["head"].rot)
			self.head.x = self.part_data["head"].x
			self.head.y = self.part_data["head"].y

			self.body.rotation = -math.rad(self.part_data["body"].rot)
			self.body.x = self.part_data["body"].x
			self.body.y = self.part_data["body"].y

			self.base.rotation = -math.rad(self.part_data["base"].rot)
			self.base.x = self.part_data["base"].x
			self.base.y = self.part_data["base"].y
		end
		if self.mode == 2 then
			self.part_data["head"].x = self.part_data["head"].x - ((self.part_data["head"].x - self.part_data["head"].ox) / 4) * DTMULT
			self.part_data["head"].y = self.part_data["head"].y - ((self.part_data["head"].y - self.part_data["head"].oy) / 4) * DTMULT
			self.part_data["head"].rot = self.part_data["head"].rot - ((self.part_data["head"].rot - self.part_data["head"].orot) / 4) * DTMULT
			self.part_data["body"].x = self.part_data["body"].x - ((self.part_data["body"].x - self.part_data["body"].ox) / 4) * DTMULT
			self.part_data["body"].y = self.part_data["body"].y - ((self.part_data["body"].y - self.part_data["body"].oy) / 4) * DTMULT
			self.part_data["body"].rot = self.part_data["body"].rot - ((self.part_data["body"].rot - self.part_data["body"].orot) / 4) * DTMULT
			self.part_data["base"].x = self.part_data["base"].x - ((self.part_data["base"].x - self.part_data["base"].ox) / 4) * DTMULT
			self.part_data["base"].y = self.part_data["base"].y - ((self.part_data["base"].y - self.part_data["base"].oy) / 4) * DTMULT
			self.part_data["base"].rot = self.part_data["base"].rot - ((self.part_data["base"].rot - self.part_data["base"].orot) / 4) * DTMULT
			
			self.ow_timer = self.ow_timer - DTMULT
			if self.ow_timer <= 0 then
				self.ow_timer = 0
				self.mode = 0
			end
		end
    end
end

function MadDummyActorSprite:getTexturePath(sprite_name)
    return self.actor:getSpritePath() .. '/' .. self.actor.parts[sprite_name][1]
end

function MadDummyActorSprite:set(anim, ...)
    self.actor:onSetAnimation(self, anim, ...)
end

function MadDummyActorSprite:setPartVisible(boolean)
    for _, child in ipairs(self.children) do
        child.visible = boolean
    end
end

return MadDummyActorSprite