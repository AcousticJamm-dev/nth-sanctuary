---@field move_speed number *[Property `move_speed`]* Maximum movement speed (Defaults to `28`)
---@field jump_strength number *[Property `jump_strength`]* Jump velocity (Defaults to `16`)
---@field gravity number *[Property `gravity`]* Gravity strength during jump (Defaults to `0.65`)
---@field end_time number *[Property `end_time`]* Time to hold cancel before disengaging (Defaults to `15`)
---@field shake_duration number *[Property `shake_duration`]* Screen shake duration (Defaults to `8`)
---@field move_sound string *[Property `move_sound`]* Sound played when moving (Defaults to `"wing"`)
---@field land_sound string *[Property `land_sound`]* Sound played when landing (Defaults to `"bomb"`)
---@field jump_sound string *[Property `jump_sound`]* Sound played when jumping (Defaults to `"motor_upper_2"`)
---@field impact_sound string *[Property `impact_sound`]* Sound played on impact (Defaults to `"impact"`)
---@field explode_sound string *[Property `explode_sound`]* Sound played during explosion (Defaults to `"impact"`)
---@field piano_instrument string *[Property `piano_instrument`]* Piano sound instrument (Defaults to `"piano"`)
---@field carpet_sprite string *[Property `carpet_sprite`]* Carpet sprite (Defaults to `"dw_churchb_movingpianocarpet"`)
---@field shadow_sprite string *[Property `shadow_sprite`]* Shadow sprite when jumping (Defaults to `"saucershadow"`)
---@field dust_sprite string *[Property `dust_sprite`]* Dust particle sprite (Defaults to `"climb_dust_small"`)
---@field width number *[Property `width`]* Collision width (Defaults to `80`)
---@field height number *[Property `height`]* Collision height (Defaults to `80`)
---@field solid_width number *[Property `solid_width`]* Solid trigger width (Defaults to `68`)
---@field solid_height number *[Property `solid_height`]* Solid trigger height (Defaults to `18`)
---@field camera_offset_x number *[Property `camera_offset_x`]* Camera X offset when engaged (Defaults to `-281`)
---@field camera_offset_y number *[Property `camera_offset_y`]* Camera Y offset when engaged (Defaults to `-206`)
---@field camera_lerp_speed number *[Property `camera_lerp_speed`]* Camera interpolation speed (Defaults to `1/99`)
---@field camera_strength number *[Property `camera_strength`]* Camera follow strength (Defaults to `4`)
---@field kris_offset_x number *[Property `kris_offset_x`]* Kris X offset from piano (Defaults to `20`)
---@field kris_offset_y number *[Property `kris_offset_y`]* Kris Y offset from piano (Defaults to `-4`)
---@field susie_offset_x number *[Property `susie_offset_x`]* Susie X offset from piano (Defaults to `36`)
---@field susie_offset_y number *[Property `susie_offset_y`]* Susie Y offset from piano (Defaults to `-10`)
---@field ralsei_offset_x number *[Property `ralsei_offset_x`]* Ralsei X offset from piano (Defaults to `4`)
---@field ralsei_offset_y number *[Property `ralsei_offset_y`]* Ralsei Y offset from piano (Defaults to `-6`)
---@field auto_engage boolean *[Property `auto_engage`]* Automatically engage when player enters (Defaults to `false`)
---@field final_room boolean *[Property `final_room`]* Is this the final room variant (Defaults to `false`)
---@field save_position boolean *[Property `save_position`]* Save position to flags (Defaults to `true`)
---@field enable_camera_control boolean *[Property `enable_camera_control`]* Allow camera control (Defaults to `true`)
---@field enable_jump boolean *[Property `enable_jump`]* Allow jumping mechanics (Defaults to `true`)
---@field enable_explosion boolean *[Property `enable_explosion`]* Enable explosion sequence (Defaults to `true`)
---@field debug_mode boolean *[Property `debug_mode`]* Enable debug controls (Defaults to `false`)
---@field show_collision boolean *[Property `show_collision`]* Show collision bounds (Defaults to `false`)
---@field log_state boolean *[Property `log_state`]* Log state changes to console (Defaults to `false`)

local RemotePianoMove, super = Class(Event, "RemotePianoMove")

function RemotePianoMove:init(data)
    super.init(self, data)
    
    -- AGGRESSIVE DEBUG OUTPUT
    print("=== REMOTE PIANO MOVE INIT CALLED ===")
    print("Data:", data)
    print("X:", self.x, "Y:", self.y)
    print("Width:", self.width, "Height:", self.height)
    
    local properties = data and data.properties or {}
    print("Properties:", properties)
    
    -- Load properties with defaults
    self.move_speed = properties["move_speed"] or 28
    self.jump_strength = properties["jump_strength"] or 16
    self.gravity = properties["gravity"] or 0.65
    self.end_time = properties["end_time"] or 15
    self.shake_duration = properties["shake_duration"] or 8
    self.move_sound = properties["move_sound"] or "wing"
    self.land_sound = properties["land_sound"] or "bomb"
    self.jump_sound = properties["jump_sound"] or "motor_upper_2"
    self.impact_sound = properties["impact_sound"] or "impact"
    self.explode_sound = properties["explode_sound"] or "impact"
    self.piano_instrument = properties["piano_instrument"] or "piano"
    self.carpet_sprite = properties["carpet_sprite"] or "dw_churchb_movingpianocarpet"
    self.shadow_sprite = properties["shadow_sprite"] or "saucershadow"
    self.dust_sprite = properties["dust_sprite"] or "climb_dust_small"
    self.width = properties["width"] or 80
    self.height = properties["height"] or 80
    self.solid_width = properties["solid_width"] or 68
    self.solid_height = properties["solid_height"] or 18
    self.camera_offset_x = properties["camera_offset_x"] or -281
    self.camera_offset_y = properties["camera_offset_y"] or -206
    self.camera_lerp_speed = properties["camera_lerp_speed"] or 1/99
    self.camera_strength = properties["camera_strength"] or 4
    self.kris_offset_x = properties["kris_offset_x"] or 20
    self.kris_offset_y = properties["kris_offset_y"] or -4
    self.susie_offset_x = properties["susie_offset_x"] or 36
    self.susie_offset_y = properties["susie_offset_y"] or -10
    self.ralsei_offset_x = properties["ralsei_offset_x"] or 4
    self.ralsei_offset_y = properties["ralsei_offset_y"] or -6
    self.auto_engage = properties["auto_engage"] or false
    self.final_room = properties["final_room"] or false
    self.save_position = properties["save_position"] or true
    self.enable_camera_control = properties["enable_camera_control"] or true
    self.enable_jump = properties["enable_jump"] or true
    self.enable_explosion = properties["enable_explosion"] or true
    self.debug_mode = properties["debug_mode"] or false
    self.show_collision = properties["show_collision"] or false
    self.log_state = properties["log_state"] or false
    
    print("Properties loaded successfully")
    
    -- Basic setup - skip sprite loading for now to avoid Assets issues
    print("Skipping sprite loading - using fallback drawing")
    self:setOrigin(0.5, 0.5)
    self:setHitbox(0, 0, self.width, self.height)
    
    print("Sprite and hitbox set")
    
    -- Basic properties
    self.con = 0
    self.engaged = false
    
    print("=== REMOTE PIANO MOVE INIT COMPLETE ===")
end

function RemotePianoMove:update()
    super.update(self)
    -- Simple update for testing
    if self.debug_mode then
        print("RemotePianoMove update called at:", self.x, self.y)
    end
end

function RemotePianoMove:draw()
    super.draw(self)
    
    -- Draw carpet sprite first (underneath) - using fallback for now
    love.graphics.setColor(0.5, 0.3, 0.2, 0.8)
    love.graphics.rectangle("fill", self.x - 40, self.y - 40, 80, 80)
    
    -- Draw piano sprite (on top) - using fallback for now
    love.graphics.setColor(0.2, 0.2, 0.2, 0.9)
    love.graphics.rectangle("fill", self.x - 30, self.y - 30, 60, 60)
    love.graphics.setColor(1, 1, 1, 1)
    
    -- Debug info
    if self.debug_mode then
        love.graphics.setColor(1, 1, 0, 1)
        love.graphics.print("RemotePianoMove", self.x - 40, self.y - 60)
        love.graphics.print("X: "..math.floor(self.x).." Y: "..math.floor(self.y), self.x - 40, self.y - 45)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return RemotePianoMove
