local actor, super = Class(Actor, "kay")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "kaycelestia"

    -- Width and height for this actor, used to determine its center
    self.width = 28
    self.height = 45

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {0, 30, 28, 15}
	
    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0.5, 1, 1}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/kay"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "clover"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil
    --deviceuser0
    self.indent_string = "> "
    
    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {
        ["idle"] = 0.2
    }

    -- Table of sprite animations
    self.animations = {}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},
        ["fell"] = {0, 15},
	}
end

return actor