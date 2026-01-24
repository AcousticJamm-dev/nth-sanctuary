local MainMenuOptions, super = HookSystem.hookScript(MainMenuOptions)


function MainMenuOptions:init(menu)
    super.init(self, menu)
end

function MainMenuOptions:initializeOptions()
    super.initializeOptions(self)
    self:registerConfigOption({"graphics" }, "Remove Hue Shift", "nthSanctuary/removeHSV")
    self:registerConfigOption({"graphics" }, "potat mode :)", "nthSanctuary/potat", function (toggled)
        if toggled then
            SCREEN_CANVAS = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT, {dpiscale = 0.125})
        else
            SCREEN_CANVAS = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT, {dpiscale = 1})
        end
    end)
    
end



return MainMenuOptions