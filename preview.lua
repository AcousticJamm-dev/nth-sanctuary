local preview = {}
local flags = {}
for i=1,3 do
    local path = "saves/nth_sanctum/file_"..i..".json"
    if love.filesystem.getInfo(path) then
        local data = JSON.decode(love.filesystem.read(path))
        table.insert(flags, data.flags["prog"])
    end
end
table.sort(flags)
local flag = flags[#flags]

-- whether to fade out the default background
preview.hide_background = false
function preview:init(mod, button)
    self.mod_id = mod.id
    self.base_path = mod.path.."/preview"
    local function p(f) return self.base_path .. "/" .. f end
    if flag then
        print("Progression: "..flag)
        --print(self.music)
        mod.preview_music_path = p("prev2.mp3")
    end
    -- code here gets called when the mods are loaded
    self.siner = 0
    self.rune = love.graphics.newImage(p("rune.png"))
    self.window = love.graphics.newImage(p("huge_window.png"))
    self.gang = love.graphics.newImage(p("gang.png"))
    self.checker = love.graphics.newImage(p("checker.png"))
    self.checker:setWrap("repeat", "repeat")
    self.w, self.h = self.checker:getWidth(), self.checker:getHeight()
    self.scroll = 20
    self.off = 0
    self.quad = love.graphics.newQuad(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, self.w, self.h)
end

function preview:update()
    -- code here gets called every frame, before any draws
    -- to only update while the mod is selected, check self.selected (or self.fade)
    self.siner = self.siner + DTMULT
    self.off =  self.off-self.scroll*(DTMULT/30)
end

function preview:draw()
    if self.fade <= 0 then return end
    love.graphics.setColor(0, 0, 0, self.fade)
    love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
    love.graphics.setColor(1,1,1)
    if flag == 0 then
        local rune = self.rune
        local runeox, runeoy = rune:getWidth()/2, rune:getHeight()/2
        love.graphics.draw(rune, SCREEN_WIDTH/2, SCREEN_HEIGHT/2+math.sin(self.siner/30)*10,0, 2, 2, runeox, runeoy)
    elseif flag > 0 then
        local rune = self.window
        local runeox, runeoy = rune:getWidth()/2, rune:getHeight()/2
        local gang = self.gang
        local gangox, gangoy = gang:getWidth()/2, gang:getHeight()/2
        local offset = 127
        self.quad:setViewport(-self.off, self.off, SCREEN_WIDTH, SCREEN_HEIGHT, self.w, self.h)
        love.graphics.setColor(0.25, 0.25, 0.25)
        love.graphics.draw(self.checker, self.quad, 0,0,0)
        love.graphics.setColor(1,1,1)
        for i = 1, 4 do
            love.graphics.draw(rune, 0+offset*i-1, SCREEN_HEIGHT/2,0, 0.5, 0.5, runeox, runeoy)
        end
        love.graphics.draw(gang, SCREEN_WIDTH/2, SCREEN_HEIGHT/2+180,0, 2, 2, gangox, gangoy)
    end
end

function preview:drawOverlay()
    -- code here gets drawn above the menu every frame
    -- so u can make cool effects
    -- if u want
end

return preview