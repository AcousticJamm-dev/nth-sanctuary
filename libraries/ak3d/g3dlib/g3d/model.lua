-- written by groverbuger for g3d
-- september 2021
-- MIT license
local newMatrix = modRequire("libraries.ak3d.g3dlib.g3d.matrices")
local loadObjFile = modRequire("libraries.ak3d.g3dlib.g3d.objloader")
local collisions = modRequire("libraries.ak3d.g3dlib.g3d.collisions")
local vectors = modRequire("libraries.ak3d.g3dlib.g3d.vectors")
local camera = modRequire("libraries.ak3d.g3dlib.g3d.camera")
local Assets3D = modRequire("libraries.ak3d.utils.assets")
local vectorCrossProduct = vectors.crossProduct
local vectorNormalize = vectors.normalize

----------------------------------------------------------------------------------------------------
-- define a model class
----------------------------------------------------------------------------------------------------

---@class AK3D.Model : Class
---@overload fun(verts, texture, translation, rotation, scale): AK3D.Model
local Model = Class(nil, "Model")

-- define some default properties that every model should inherit
-- that being the standard vertexFormat and basic 3D shader
Model.VERTEX_FORMAT = {
    {"VertexPosition", "float", 3},
    {"VertexTexCoord", "float", 2},
    {"VertexNormal", "float", 3},
    {"VertexColor", "byte", 4},
}
Model.shader = g3d_tmp and g3d_tmp.shader

-- this returns a new instance of the model class
-- a model must be given a .obj file or equivalent lua table, and a texture
-- translation, rotation, and scale are all 3d vectors and are all optional
function Model:init(verts, texture, translation, rotation, scale)
    self.shader = Assets3D.getShader("default")
    -- if verts is a string, use it as a path to a .obj file
    -- otherwise verts is a table, use it as a model defintion
    if type(verts) == "string" then
        verts = loadObjFile(verts)
    end

    -- if texture is a string, use it as a path to an image file
    -- otherwise texture is already an image, so don't bother
    if type(texture) == "string" then
        texture = Assets.getTexture(texture)
    end

    -- initialize my variables
    self.verts = verts
    self.texture = texture
    self.mesh = love.graphics.newMesh(self.VERTEX_FORMAT, self.verts, "triangles")
    self.mesh:setTexture(self.texture)
    self.matrix = newMatrix()
    if type(scale) == "number" then scale = {scale, scale, scale} end
    self:setTransform(translation or {0,0,0}, rotation or {0,0,0}, scale or {1,1,1})
    self.shadervars = {}
end

-- populate model's normals in model's mesh automatically
-- if true is passed in, then the normals are all flipped
function Model:makeNormals(isFlipped)
    for i=1, #self.verts, 3 do
        if isFlipped then
            self.verts[i+1], self.verts[i+2] = self.verts[i+2], self.verts[i+1]
        end

        local vp = self.verts[i]
        local v = self.verts[i+1]
        local vn = self.verts[i+2]

        local n_1, n_2, n_3 = vectorNormalize(vectorCrossProduct(v[1]-vp[1], v[2]-vp[2], v[3]-vp[3], vn[1]-v[1], vn[2]-v[2], vn[3]-v[3]))
        vp[6], v[6], vn[6] = n_1, n_1, n_1
        vp[7], v[7], vn[7] = n_2, n_2, n_2
        vp[8], v[8], vn[8] = n_3, n_3, n_3
    end

    self.mesh = love.graphics.newMesh(self.VERTEX_FORMAT, self.verts, "triangles")
    self.mesh:setTexture(self.texture)
end

-- move and rotate given two 3d vectors
function Model:setTransform(translation, rotation, scale)
    self.translation = translation or self.translation
    self.rotation = rotation or self.rotation
    self.scale = scale or self.scale
    self:updateMatrix()
end

-- move given one 3d vector
function Model:setTranslation(tx,ty,tz)
    self.translation[1] = tx
    self.translation[2] = ty
    self.translation[3] = tz
    self:updateMatrix()
end

-- rotate given one 3d vector
-- using euler angles
function Model:setRotation(rx,ry,rz)
    self.rotation[1] = rx
    self.rotation[2] = ry
    self.rotation[3] = rz
    self.rotation[4] = nil
    self:updateMatrix()
end

-- create a quaternion from an axis and an angle
function Model:setAxisAngleRotation(x,y,z,angle)
    x,y,z = vectorNormalize(x,y,z)
    angle = angle / 2

    self.rotation[1] = x * math.sin(angle)
    self.rotation[2] = y * math.sin(angle)
    self.rotation[3] = z * math.sin(angle)
    self.rotation[4] = math.cos(angle)

    self:updateMatrix()
end

-- rotate given one quaternion
function Model:setQuaternionRotation(x,y,z,w)
    self.rotation[1] = x
    self.rotation[2] = y
    self.rotation[3] = z
    self.rotation[4] = w
    self:updateMatrix()
end

-- resize model's matrix based on a given 3d vector
function Model:setScale(sx,sy,sz)
    self.scale[1] = sx
    self.scale[2] = sy or sx
    self.scale[3] = sz or sx
    self:updateMatrix()
end

-- update the model's transformation matrix
function Model:updateMatrix()
    self.matrix:setTransformationMatrix(self.translation, self.rotation, self.scale)
end

-- align's the model matrix to a given point
-- up vector is assumed to be normalized
function Model:lookAtFrom(pos, target, up)
    local pos = pos or self.translation
    self.matrix:lookAtFrom(pos, target, up or {0,0,1}, self.scale)
end

function Model:lookAt(target, up)
    self.matrix:lookAtFrom(self.translation, target, up or {0,0,1}, self.scale)
end

function Model:draw()
	return
end

-- draw the model
function Model:drawModel()
    local shader = self.shader
    if shader:hasUniform("modelMatrix") then
        shader:send("modelMatrix", self.matrix)
    end
    if shader:hasUniform("viewMatrix") then
        shader:send("viewMatrix", camera.viewMatrix)
    end
    if shader:hasUniform("projectionMatrix") then
        shader:send("projectionMatrix", camera.projectionMatrix)
    end
    if shader:hasUniform "isCanvasEnabled" then
        shader:send("isCanvasEnabled", love.graphics.getCanvas() ~= nil)
    end
    if shader:hasUniform "alphaThreshold" then
        shader:send("alphaThreshold", 0.5)
    end
    if shader:hasUniform "isWireframeEnabled" then
        shader:send("isWireframeEnabled", love.graphics.isWireframe())
    end
    Draw.pushShader(shader, self.shadervars)

    love.graphics.draw(self.mesh)
    love.graphics.setShader()
end

---@param shader love.Shader | string | nil
function Model:setShader(shader, vars)
    shader = (type(shader) == "string" and Assets3D.getShader(shader)) or shader or Model.shader
    ---@cast shader love.Shader
    self.shader = shader
    for k, v in pairs(vars) do
        if self.shader:hasUniform(k) then
            self.shadervars[k] = v
        end
    end
end


local ffi_success, ffi = pcall(require, "ffi")
if ffi_success then
    pcall(ffi.cdef, [[
        struct vertex {
            float x, y, z;
            float u, v;
            float nx, ny, nz;
            uint8_t r, g, b, a;
        }
    ]])
end

-- makes models use less memory when loaded in ram
-- by storing the vertex data in an array of vertix structs instead of lua tables
-- requires ffi
-- note: throws away the model's verts table
function Model:compress()
    if not ffi_success then
        return false, "Compression requires FFI"
    end
    if not self.verts then
        return false, "Model already compressed"
    end
    local data = love.data.newByteData(ffi.sizeof("struct vertex") * #self.verts)
    local datapointer = ffi.cast("struct vertex *", data:getFFIPointer())

    for i, vert in ipairs(self.verts) do
        local dataindex = i - 1
        datapointer[dataindex].x  = vert[1]
        datapointer[dataindex].y  = vert[2]
        datapointer[dataindex].z  = vert[3]
        datapointer[dataindex].u  = vert[4] or 0
        datapointer[dataindex].v  = vert[5] or 0
        datapointer[dataindex].nx = vert[6] or 0
        datapointer[dataindex].ny = vert[7] or 0
        datapointer[dataindex].nz = vert[8] or 0
        datapointer[dataindex].r  = (vert[9] or 1)*255
        datapointer[dataindex].g  = (vert[10] or 1)*255
        datapointer[dataindex].b  = (vert[11] or 1)*255
        datapointer[dataindex].a  = (vert[12] or 1)*255
    end

    self.mesh:release()
    self.mesh = love.graphics.newMesh(self.VERTEX_FORMAT, #self.verts, "triangles")
    self.mesh:setVertices(data)
    self.mesh:setTexture(self.texture)
    self.verts = nil
    return true, "Model compressed successfully"
end

function Model:rayIntersection(...)
    return collisions.rayIntersection(self.verts, self, ...)
end

function Model:isPointInside(...)
    return collisions.isPointInside(self.verts, self, ...)
end

function Model:sphereIntersection(...)
    return collisions.sphereIntersection(self.verts, self, ...)
end

function Model:closestPoint(...)
    return collisions.closestPoint(self.verts, self, ...)
end

function Model:capsuleIntersection(...)
    return collisions.capsuleIntersection(self.verts, self, ...)
end

setmetatable(Model, {__call = function(t, ...)
    local m = setmetatable({}, Model)
    m:init(...)
    return m
end})

function Model:update() end

return Model
