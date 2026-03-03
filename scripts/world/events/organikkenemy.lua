local OrganikkEnemy, super = Class(ChaserEnemy, "organikkenemy")

function OrganikkEnemy:init(data)
    super.init(self, data.properties["actor"], data.x, data.y, data.properties)

    -- Start with normal collision
    self.noclip = false
    self.original_noclip = false
end

function OrganikkEnemy:onAlerted()
    -- Call parent method first
    super.onAlerted(self)
    
    -- Store original noclip and enable noclip after parent sets it to false
    self.original_noclip = self.noclip
    self.noclip = true
end

function OrganikkEnemy:alert(duration, options)
    -- Override the alert method to ensure noclip stays enabled
    local original_callback = options and options.callback
    local new_options = options or {}
    new_options.callback = function()
        self.original_noclip = self.noclip
        self.noclip = true
        if original_callback then original_callback() end
    end
    
    super.alert(self, duration, new_options)
end

function OrganikkEnemy:onEncounterEnd(primary, encounter)
    -- Restore original noclip state after encounter
    self.noclip = self.original_noclip
    
    super.onEncounterEnd(self, primary, encounter)
end

return OrganikkEnemy
