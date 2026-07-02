local actor, super = Class(Actor, "shopkeepers/vaporguy")

function actor:init()
    super.init(self)

    self.name = "VaporGuy"

    self.width = 104
    self.height = 119

    self.path = "shopkeepers/vaporguy"
    self.default = "static"

end

return actor