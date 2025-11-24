local DogFoodEnc, super = Class(Encounter)

function DogFoodEnc:init()
    super.init(self)

    self.text = "* A ridiculously powerful bag of dog food drew near!"

    self.music = "strongerer_monsters"
    self.background = true

    self:addEnemy("dogfood")
end

return DogFoodEnc