---@class Event.hellglow : Event
local HellGlow, super = Class(Event)

function HellGlow:init(data)
    super.init(self, data)

    

    self.from = TiledUtils.parseColorProperty(data.properties.from)
    self.to = TiledUtils.parseColorProperty(data.properties.to)
    
    self.siner = 0
    self.fade_speed = data.properties.fade_speed or 1
    self.bg_bands = 21
    self.bg_band_height = 20
    self.bg_speed = data.properties.speed
    self.alphade = 0
    self.bg_color = self.from
    self:setParallax(0)
end

function HellGlow:update()
    super.update(self)
    self.siner = self.siner + DT * self.fade_speed
    local fade = (1 - math.cos(self.siner)) / 2
    self.bg_color = TableUtils.lerp(self.from, self.to, fade)
end

function HellGlow:draw()
    super.draw(self)
    love.graphics.push()
    love.graphics.translate(0,SCREEN_HEIGHT + 100)
    local scale = Utils.clampMap(math.sin(Kristal.getTime() * self.bg_speed * math.pi * 0.5), -1, 1, 0.5, 1)
    love.graphics.scale(1, scale)
    
    for i=1,self.bg_bands do
        local alpha = Utils.clampMap(i, 1,self.bg_bands, 1,0)

        Draw.setColor(self.bg_color, alpha)
        love.graphics.rectangle("fill", 0,-self.bg_band_height,SCREEN_WIDTH,self.bg_band_height)
        love.graphics.translate(0,-self.bg_band_height)
    end
    love.graphics.pop()
end

return HellGlow
