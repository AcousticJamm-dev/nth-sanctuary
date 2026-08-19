local character, super = Class("ralsei", true)

function character:init()
    super.init(self)
    self.max_stats = {
            health = 280,
            attack = 22,
            magic = 20
    }
end
return character