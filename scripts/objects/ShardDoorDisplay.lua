local ShardDoorDisplay, super = Class(Object)

function ShardDoorDisplay:init(text)
    super.init(self)
	self:setOrigin(0.5,1)
    self.debug_select = true

	self.height = 40

    self.text = ProphecyText(nil, 0, 0, {auto_size = true})
    self.text.debug_select = false
    self.text.font = "legend"
    self.text.font_size = 16
    self.text.align = "center"
    self.text:setText(text)
    self.text:setOrigin(0.5,1)
    self:addChild(self.text)
	self.width = (self.text.width+10)*2
	
    self.bg_surface = nil
    self.siner = 0

    -- the scrolling DEPTHS images used by the panels.
    self.shard_icon = Assets.getTexture("ui/shard_door_icon")
    self.tiletex = Assets.getTexture("backgrounds/IMAGE_DEPTH_EXTEND_SEAMLESS")
    self.shardpurple = ColorUtils.hexToRGB("#9999ffff")
	
	self.panel_alpha = 0
end

local function draw_sprite_tiled_ext(tex, _, x, y, sx, sy, color, alpha)
    local r,g,b,a = love.graphics.getColor()
    if color then
        Draw.setColor(color, alpha)
    end
    Draw.drawWrapped(tex, true, true, x, y, 0, sx, sy)
    love.graphics.setColor(r,g,b,a)
end

local function draw_set_alpha(a)
    local r,g,b = love.graphics.getColor()
    love.graphics.setColor(r,g,b,a)
end

function ShardDoorDisplay:draw()
	self.siner = self.siner + DTMULT
    local xsin = 0
    local ysin = math.cos(self.siner / 12) * 4

    super.draw(self)
    local display_canvas = Draw.pushCanvas(320, 240)
    love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        love.graphics.setShader(Kristal.Shaders["Mask"])
		Draw.draw(self.shard_icon, 0, 2, 0, 1, 1)
		Draw.drawCanvas(self.text.canvas, 10, 0, 0, 1, 1)
        love.graphics.setShader(last_shader)
    end, "replace", 1)
	love.graphics.setStencilTest("greater", 0)
	Draw.setColor(self.shardpurple)
	Draw.rectangle("fill", 0, 0, 320, 240)
	draw_sprite_tiled_ext(self.tiletex, 0, math.ceil(self.siner / 2), math.ceil(self.siner / 2), 1, 1, COLORS["white"], 0.6)
	Draw.setColor(1, 1, 1, 1)
    love.graphics.setStencilTest()
	Draw.popCanvas()
    love.graphics.setBlendMode("add")
	Draw.setColor(1,1,1)
	Draw.draw(display_canvas, xsin, ysin, 0, 2, 2)
	Draw.draw(display_canvas, xsin, ysin, 0, 2, 2)
    love.graphics.setBlendMode("alpha")
end

return ShardDoorDisplay