---@class TutorialText : Object
local OrganNoteDisplay, super = Class(Object)

function OrganNoteDisplay:init(target)
    super.init(self)
	self.target = target or nil
    self:setPosition(0,0)
    self:setParallax(0,0)
    self.display_active = false
    self.display_alpha = 0
	self.siner = 0
    self.gradient20 = Assets.getTexture("backgrounds/gradient20")
    self.fill = Assets.getTexture("bubbles/fill")
	self.arrowspr = "ui/organ_dir"
	self.diag = "ui/organ_diag"
	self.circlespr = "ui/organ_circ"
	self.arrowspr_h = "ui/organ_dir_h"
	self.diag_h = "ui/organ_diag_h"
	self.circlespr_h = "ui/organ_circ_h"
	self.shift = "ui/organ_sh"
	self.drawunits = {}
	table.insert(self.drawunits, {rot = 0, tex = self.circlespr, htex = self.circlespr_h, dir = 0})
	table.insert(self.drawunits, {rot = 1, tex = self.arrowspr, htex = self.arrowspr_h, dir = 5})
	table.insert(self.drawunits, {rot = 0, tex = self.diag, htex = self.diag_h, dir = 4})
	table.insert(self.drawunits, {rot = 0, tex = self.arrowspr, htex = self.arrowspr_h, dir = 3})
	table.insert(self.drawunits, {rot = 3, tex = self.diag, htex = self.diag_h, dir = 2})
	table.insert(self.drawunits, {rot = 3, tex = self.arrowspr, htex = self.arrowspr_h, dir = 1})
	table.insert(self.drawunits, {rot = 2, tex = self.diag, htex = self.diag_h, dir = 8})
	table.insert(self.drawunits, {rot = 2, tex = self.arrowspr, htex = self.arrowspr_h, dir = 7})
	table.insert(self.drawunits, {rot = 0, tex = self.shift, htex = self.shift, dir = -1, switch = true})
end

function OrganNoteDisplay:onAdd(parent)
    super.onAdd(self, parent)
    self:setLayer(WORLD_LAYERS["ui"])
end

function OrganNoteDisplay:update()
    super.update(self)
end

function OrganNoteDisplay:draw()
    super.draw(self)
	local col_def = ColorUtils.hexToRGB("#2DADC0FF")
	local col_sel = ColorUtils.hexToRGB("#CAFFE4FF")
	self.display_alpha = MathUtils.lerp(self.display_alpha, self.target.engaged_alpha, 0.125 * DTMULT)
	self.siner = self.siner + 1 * DTMULT
	local yy = 40
	local bgcol = COLORS.black
	local alph = 0.9 * self.display_alpha
	local barheight = 80
	Draw.setColor(bgcol, alph)
	Draw.draw(self.gradient20, 0, yy, 0, 32, 1, 0, 20)
	Draw.draw(self.fill, 0, yy, 0, SCREEN_WIDTH, barheight, 0, 0)
	Draw.draw(self.gradient20, 0, yy + barheight, 0, 32, -1, 0, 20)
	local outline = false
	if Input.down("menu") then
		outline = true
	end
	local makeswitch = 0
	if Input.pressed("menu") then
		makeswitch = 1
	end
	if Input.released("menu") then
		makeswitch = 2
	end
	Draw.setColor(1,1,1,1)
	local xspace = 64
	local xloc = SCREEN_WIDTH/2 - ((xspace * 8) / 2)
	local yloc = yy + 40
	for i, unit in ipairs(self.drawunits) do
		local bonusalpha = 0
		local myx = xloc + xspace * (i-1)
		local myy = yloc + (math.sin((self.siner + ((i-1) * 4)) / 8) * 4)
		local col = col_def
		
		if self.target.soundtoplay == unit.dir then
			col = col_sel
			if self.target.makenote then
				local which = unit.tex
				if outline then
					which = unit.htex
				end
                local note = Sprite(which, myx, myy)
				note.layer = self.layer - 1
                note:setColor(col)
				note:setScale(2,2)
				note:setOriginExact(10, 10)
				note.rotation = math.rad(-90 * unit.rot)
                note.physics.speed = 1
				note.physics.direction = math.rad(-((unit.dir + 3) * 45))
				if self.target.soundtoplay == 0 then
					note.physics.speed = 0
					Game.world.timer:tween(20/30, note, {scale_x = 3, scale_y = 3}, 'out-quad')
				end
				Game.world.timer:tween(20/30, note, {alpha = 0}, 'out-quad', function()
					note:remove()
				end)
				self:addChild(note)
			end
			self.target.makenote = false
		end
		if unit.switch and Input.down("menu") then
			col = col_sel
		end
		love.graphics.setColor(col[1], col[2], col[3], self.display_alpha * 2)
		if outline then
			Draw.draw(Assets.getTexture(unit.htex), myx, myy, math.rad(-90 * unit.rot), 2, 2, 10, 10)
		else
			Draw.draw(Assets.getTexture(unit.tex), myx, myy, math.rad(-90 * unit.rot), 2, 2, 10, 10)
		end
		if makeswitch > 0 then
			local which = unit.tex
			if makeswitch == 2 then
				which = unit.htex
			end
            local note = Sprite(which, myx, myy)
			note.layer = self.layer + 1
			note:setParallax(0,0)
            note:setColor(col)
			note:setScale(2,2)
			note.alpha = 1 * self.display_alpha
			note:setOriginExact(10, 10)
			note.rotation = math.rad(-90 * unit.rot)
			Game.world.timer:tween((2+MathUtils.round((i-1) / 2))/30, note, {alpha = 0}, 'out-quad', function()
				note:remove()
			end)
			Game.world:addChild(note)
			love.graphics.setColor(col[1], col[2], col[3], self.display_alpha * 2)
			if outline then
				Draw.draw(Assets.getTexture(unit.htex), myx, myy, math.rad(-90 * unit.rot), 2, 2, 10, 10)
			else
				Draw.draw(Assets.getTexture(unit.tex), myx, myy, math.rad(-90 * unit.rot), 2, 2, 10, 10)
			end
		end
		love.graphics.setColor(1,1,1,1)
	end
end

return OrganNoteDisplay