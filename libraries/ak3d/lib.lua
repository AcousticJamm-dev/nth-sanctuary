local Model = modRequire("libraries.ak3d.g3dlib.g3d.model")
local Assets3D = modRequire("libraries.ak3d.utils.assets")
local Stage3D = modRequire("libraries.ak3d.src.game.world.Stage3D")
local Player3D = modRequire("libraries.ak3d.src.game.world.player")
local Matrix = modRequire("libraries.ak3d.g3dlib.g3d.matrices")
local g3d = (modRequire("libraries.ak3d.g3dlib.g3d.init")) ---@type g3d
local BillboardSprite = (modRequire("libraries.ak3d.g3dlib.g3d.billboard"))
local lib = {}
-- Registry.registerGlobal("AK3D", lib)
-- AK3D = lib

function lib:init()
    g3d.camera.aspectRatio = (4/3)*math.sqrt(2)
    -- g3d.camera.updateViewMatrix()
    g3d.camera.nearClip = 10
    g3d.camera.farClip = 640*100
    g3d.camera.updateOrthographicMatrix(164 * math.sqrt(2))
    self.ortho = Utils.copy(g3d.camera.projectionMatrix)
    g3d.camera.fov = 1.7
    
    -- g3d.camera.updateOrthographicMatrix(20)
    -- g3d.camera.updateOrthographicMatrix(5)
    Registry.registerGlobal("g3d", (g3d))
end

-- function lib:postInit()
--     self.funnystage = Stage3D()
--     Game.world:spawnObject(self.funnystage, false and "objects" or WORLD_LAYERS["above_events"])
--     self.funnystage.persistent = true
--     ---@type AK3D.BillboardSprite
--     self.testbillboard = BillboardSprite("party/kris/light/walk/down_1", {-20*20,0,0})
--     self.funnystage:add(self.testbillboard)
--     -- TODO: Why 1.95?
--     self.testbillboard:setScale(2,2,2)
--     print(math.deg(g3d.camera.fov))
--     -- Game.world.player:addFX(ColorMaskFX({1,1,1}))
--     -- Game.world.player:addFX(AlphaFX(0))
--     self.testbillboard.shader = Assets3D.getShader("default")
--     self.funnystage:add(self.funnymodel)
-- end

function lib:preInit()
    Assets3D.initialize()
    Model.shader = Assets3D.getShader("default")
end

-- function lib:preUpdate()
--     local x, y, z = unpack(self.testbillboard.translation)
--     -- g3d.camera.fpsController.pitch = Utils.wave(Kristal.getTime()*math.pi, -1,1)*math.pi/4
--     g3d.camera.setTargetAndRotation(x,y,z+74,-math.pi*0.25*Utils.floor((Kristal.getTime()), 0.0001))
--     -- self.funnymodel:setRotation(0, (math.pi*1.5)+g3d.camera.fpsController.pitch, g3d.camera.fpsController.direction)
--     -- self.funnymodel:draw()
-- end

return lib
