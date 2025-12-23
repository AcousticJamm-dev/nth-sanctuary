local ModlandFileSelect, super = Class("ModlandFileSelect")

function ModlandFileSelect:onKeyPressed(key, is_repeat)
	if self.state == "SELECT" then
        if Input.is("confirm", key) then
            Assets.stopAndPlaySound("ui_select")
            if self.selected_y == 5 then
                if self.selected_x == 1 then
                    self.menu:pushState("CREDITS")
					return true
                end
            end
        end
    end
	super.onKeyPressed(self,key,is_repeat)
end

function ModlandFileSelect:draw()
    local mod_name = "#TH SANCTUARY"
    Draw.setColor(PALETTE["filemenu_header"])
    Draw.printShadow(mod_name, 16, 8)
    
    Draw.setColor(PALETTE["filemenu_selected"])
    
    Draw.printShadow(self:getTitle(), 80, 60)
    
    local function setColor(x, y)
        local luma = 1
        if self.selected_x == x and self.selected_y == y then
            Draw.setColor(PALETTE["filemenu_selected"])
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
    end

    if self.state == "SELECT" or self.state == "TRANSITIONING" then
        setColor(1, 4)
        Draw.printShadow(self:gasterize "Copy", 108, 380)
        setColor(2, 4)
        Draw.printShadow(self:gasterize "Erase", 280, 380)
        if not self.chapter_select then
            setColor(3, 4)
            Draw.printShadow(self:gasterize "Exit", self.bottom_row_heart[3] + 28, 380)
        else
            setColor(3, 4)
            Draw.printShadow(self:gasterize "Chapter Select", self.bottom_row_heart[3] + 28, 380)
            setColor(3, 5)
            Draw.printShadow(self:gasterize "Exit", self.bottom_row_heart[3] + 28, 380 + 40)
        end
        if self.previous_chapter then
            setColor(1, 5)
            Draw.printShadow(self:gasterize "Credits", 108, 380 + 40)
        end
        setColor(2, 5)
        Draw.printShadow(self:gasterize "Config", self.bottom_row_heart[2] + 28, 380 + 40)
    else
        setColor(1, 4)
        Draw.printShadow(self:gasterize "Cancel", 110, 380)
    end

    Draw.setColor(1, 1, 1)
end

return ModlandFileSelect