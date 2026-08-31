local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
    self.time = 20
    self:setArenaSize(100, 300)
    self:setSoulPosition(320, 35)
    self.touched = false
end

function Basic:onStart()
    local visual = Sprite("world/culteye")
    local spr = Object(0, 0, visual.width, visual.height)
    self.star = spr
    spr:setHitbox(0, 0, spr.width, spr.height)
    self:addChild(spr)
    Assets.playSound("appear_choppy")

    Assets.playSound("ghostappear", 1, 0.8)
    

    visual:setOrigin(0.5)
    visual:setPosition(spr.width / 2, spr.height / 2)
    spr:setScale(10, 3)
    visual.graphics.spin = 0.2
    visual.debug_select = false
    spr:addChild(visual)
    visual.alpha = 0
    visual:fadeToSpeed(1)
    
    spr:setOrigin(0.5)
    spr:setPosition(Game.battle.arena.left + (Game.battle.arena.width/2), Game.battle.arena.bottom)
    local arena = Game.battle.arena
    self.timer:every(1/3, function()
        if not self.touched then 
            local h = self:spawnBullet("risestar", love.math.random(arena.left, arena.right), arena.bottom, math.rad(-90))
        end
    end)
end


function Basic:reachedStar()
    local g1 = Game.battle.enemies[1]
    local sus = Game.battle:getPartyBattler("susie")

    if sus.chara.health > 0 then
        Game.battle.wave_timer = 0
        self.timer:script(function (fuck)
            sus:setAnimation("battle/rude_buster")
            fuck(7/15)
            Assets.playSound("rudebuster_swing")
            local h = Game.battle:addChild(RudeBusterBeam(false, sus.x, sus.y - 20, self.star.x, self.star.y, function(damage_bonus, play_sound)
                self.timer:script(function (wait2)
                    Game.battle.timer:tween(0.6, self.star, {x = g1.x}, 'out-sine')
                    Game.battle.timer:tween(0.6, self.star, {y = g1.y}, 'in-sine')
                    wait2(0.6)
                    self.star.visible = false
                    Game.battle.encounter.parried = true
                    Assets.playSound("damage")
                    Assets.playSound("break2")
                    g1:hurt(math.min(700, g1.health-1))
                    Game.battle.timer:tween(2/30, g1, {x = g1.x + 20, y = g1.y - 40}, 'linear', function()
                        Game.battle.timer:tween(0.5, g1, {x = g1.x - 20, y = g1.y + 40}, 'out-cubic')
                    end)
                    wait2(0.5)
                    Game.battle:endWaves()
                end)
            end))
            h.layer = BATTLE_LAYERS["above_bullets"]
        end)
    end
    
end

function Basic:update()
    super.update(self)

    local soul = Game.battle.soul
    if not self.touched
        and soul
        and self.star
        and soul:collidesWith(self.star.collider)
    then
        self.touched = true
        self:reachedStar()
    end
end

return Basic
