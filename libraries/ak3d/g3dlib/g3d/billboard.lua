local Model = modRequire("libraries.ak3d.g3dlib.g3d.model")
local g3d = modRequire("libraries.ak3d.g3dlib.g3d.init") ---@type g3d
---@class AK3D.BillboardSprite: AK3D.Model
---@field use_texture_size boolean
local BillboardSprite, super = Class(Model, "Billboard")
---@cast super AK3D.Model

function BillboardSprite:init(texture, translation, rotation, scale)
    local basescale = 1
    if type(texture) == "string" then
        texture = Assets.getTexture(texture)
    end
    ---@cast texture love.Texture
    self.width, self.height = texture:getDimensions()
    self.corners = {
        topleft = {
            basescale*(-self.width/1.5),
            -basescale*(-self.height),
            0,
            0,
            0, -0,-0,1
        },
        bottomleft = {
            basescale*(-self.width/1.5),
            0,
            0,
            0,1, -0,-0,1
        },
        topright = {
            basescale*(self.width/1.5),
            -basescale*(-self.height),
            0,
            1,0, -0,-0,1
        },
        bottomright = {
            basescale*(self.width/1.5),
            0,
            0,
            1,1, -0,-0,1
        },
    }
    super.init(self, {
        self.corners.topleft,
        self.corners.topright,
        self.corners.bottomright,
        self.corners.bottomright,
        self.corners.bottomleft,
        self.corners.topleft,
    }, texture, translation, rotation, scale)
    self.use_texture_size = true
    self.texture:setFilter("nearest", "nearest")
    self.base_corners = Utils.copy(self.corners, true)
    self.mesh:setVertices(self.verts)
    self:setScale(2,2,2)
end


function BillboardSprite:compress()
    return false, "Compression not supported for BillboardSprite"
end

function BillboardSprite:setSize(width, height)
    self.width, self.height = width, height
end


function BillboardSprite:draw()
    -- self.rotation[1] = 0
    -- self.rotation[3] = g3d.camera.fpsController.pitch
    -- self.rotation[2] = -g3d.camera.fpsController.direction - math.pi/2
    -- -- self.rotation[2] = math.pi*1.5
    -- self.rotation[4] = nil
    -- self:updateMatrix()
    self.shader:send("billboard", true)
    self.shader:send("billboardScale", {self.scale[1], self.scale[2]})
    self:updateMesh()
    return super.draw(self)
end

function BillboardSprite:updateMesh()
    local basescale = 1
    local left, top = (-self.width/1.5), -(-self.height)
    local right, bottom = left + (self.width/0.75), top - self.height
    local tbl = {
        topleft = {
            basescale*left,
            basescale*top,
            0,
        },
        bottomleft = {
            basescale*left,
            basescale*bottom,
            0,
        },
        topright = {
            basescale*right,
            basescale*top,
            0,
        },
        bottomright = {
            basescale*right,
            basescale*bottom,
            0,
        },
    }
    for k, v in pairs(tbl) do
        Utils.copyInto(self.corners[k], v, true)
    end
    self.mesh:setVertices(self.verts)
end

--- *(Called internally)* Sets the current sprite to a single texture. \
--- **Note**: *Only for internal overrides. Use `Sprite:setSprite()` instead.*
function BillboardSprite:setTextureExact(texture)
    if type(texture) == "string" then
        self.texture = Assets.getTexture(texture)
    else
        self.texture = texture
    end
    if (not self.texture) and (texture ~= nil) then
        Kristal.Console:warn("Texture not found: " .. Utils.dump(texture))
    end
    self.texture_path = Assets.getTextureID(texture)
    if self.use_texture_size then
        if self.texture then
            self.width = self.texture:getWidth()
            self.height = self.texture:getHeight()
        else
            self.width = 0
            self.height = 0
        end
    end
end

function BillboardSprite:setSprite(texture)
    return self:setTextureExact(texture)
end

return BillboardSprite
