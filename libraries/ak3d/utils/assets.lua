---@class AK3D.Assets3D
local Assets3D = {}

function Assets3D.initialize()
    Assets3D.initShaders()
    Assets3D.initModels()
end

---@private
---@param base_path string
---@param handler fun(id:string, full_path:string)
---@param exts string[]
function Assets3D._loadFrom(base_path, handler, exts)
    for _, relative_path in ipairs(Utils.getFilesRecursive(base_path)) do
        local full_path = base_path .. "/" .. relative_path
        for _,ext in ipairs(exts) do
            local ends, id = Utils.endsWith(relative_path, "." .. ext)
            if ends then
                handler(id, full_path)
                goto continue
            end
        end
        ::continue::
    end
end

function Assets3D.initShaders()
    Assets3D.shader_paths = {}
    local function handler(id, full_path)
        Assets3D.shader_paths[id] = full_path
    end
    for i = 1, #Mod.info.lib_order do
        Assets3D._loadFrom(Mod.info.libs[Mod.info.lib_order[i]].path .. "/ak3dassets/shaders", handler, {"glsl", "vert", "frag"})
    end
    Assets3D._loadFrom(Mod.info.path .. "/ak3dassets/shaders", handler, {"glsl", "vert", "frag"})
    ---@type table<string, love.Shader>
    Assets3D.shaders = {}
    for k, v in pairs(Assets3D.shader_paths) do
        if not Utils.startsWith(k, "_include/") then
            Assets3D.shaders[k] = Assets3D.newShader(k)
        end
    end
end

function Assets3D.preprocessShader(id)
    local path = assert(Assets3D.shader_paths[id], "No such shader: "..id)
    local shader_src = ("/// @file:%s,%s\n"):format(id, path)
    for line in love.filesystem.lines(Assets3D.shader_paths[id]) do
        ---@cast line string
        ---@type boolean, string
        local incl, include_path = Utils.startsWith(line, "#include")
        if incl then
            local shader_id = "_include/" .. select(3,include_path:find(" *\"(.*)\""))
            line = Assets3D.preprocessShader(shader_id)
        end
        shader_src = shader_src .. line .. "\n"
    end
    return shader_src .. ("\n/// @fileend:%s,%s\n"):format(id, path)
end

---@return love.Shader
function Assets3D.newShader(id)
    local shader_src = Assets3D.preprocessShader(id)
    local ok, out = pcall(love.graphics.newShader, shader_src, nil)
    if ok then --[[@cast out -string]] return out end
    ---@cast out string

    local error_split = Utils.split(out, "\n")
    local shadersrc_split = Utils.split(shader_src, "\n")
    ---@class AK3D.Assets3D.file_ptr
    ---@field id string---@field path string---@field linenum number

    ---@type AK3D.Assets3D.file_ptr[]
    local file_stack = {}
    ---@param t AK3D.Assets3D.file_ptr
    local function pushfile(t) 
        table.insert(file_stack, t)
    end
    ---@type table<number,AK3D.Assets3D.file_ptr>
    local line_number_map = {}
    for index,srcline in ipairs(shadersrc_split) do
        local filemarker; filemarker, srcline = Utils.startsWith(srcline, "/// @file")
        if filemarker then
            local fileend; fileend, srcline = Utils.startsWith(srcline, "end")
            srcline = srcline:sub(2)
            local sub_id, sub_path = unpack(Utils.split(srcline, ","))
            if not fileend then
                pushfile{
                    id = assert(sub_id),
                    path = assert(sub_path),
                    linenum = 1,
                }
                line_number_map[index] = {
                    id = assert(sub_id),
                    path = assert(sub_path),
                    linenum = 0,
                }
            else
                line_number_map[index] = {
                    id = assert(sub_id),
                    path = assert(sub_path),
                    linenum = file_stack[#file_stack].linenum + 1,
                }
                table.remove(file_stack, #file_stack)
            end
        elseif file_stack[#file_stack] then
            line_number_map[index] = Utils.copy(file_stack[#file_stack])
            file_stack[#file_stack].linenum = file_stack[#file_stack].linenum + 1
        end
    end
    for i,v in ipairs(error_split) do
        error_split[i] = v:gsub("Line %d+", function(text)
            local number = assert(tonumber(select(2, Utils.startsWith(text, "Line "))))
            return ("Line %s of %s"):format(line_number_map[number].linenum, line_number_map[number].id)
        end)
    end
    print("line_number_map")
    for k, v in pairs(line_number_map) do
        print("", k,Utils.dump(v))
    end
    error({msg = ([[
shader %s: %s
%s
]]):format(id,table.concat(error_split, "\n"), debug.traceback())})
end

function Assets3D.initModels()
    Assets3D.model_paths = {}
    local exts = {"obj", "dae"}
    local function handler(id, full_path)
        Assets3D.model_paths[id] = full_path
    end
    for i = 1, #Mod.info.lib_order do
        Assets3D._loadFrom(Mod.info.libs[Mod.info.lib_order[i]].path .. "/ak3dassets/models", handler, exts)
    end
    Assets3D._loadFrom(Mod.info.path .. "/ak3dassets/models", handler, exts)
end

function Assets3D.getShader(id)
    return assert(Assets3D.shaders[id], "No such shader: "..id)
end
function Assets3D.hasShader(id)
    return Assets3D.shaders[id] ~= nil
end

function Assets3D.getModelPath(id)
    return assert(Assets3D.model_paths[id], "No such shader: "..id)
end

function Assets3D.newModel(id, texture, translation, rotation, scale)
	local Model = modRequire("libraries.ak3d.g3dlib.g3d.model")
    return Model(Assets3D.getModelPath(id), Assets.getTexture(texture), translation, rotation, scale)
end

function Assets3D.hasModel(id)
    return Assets3D.model_paths[id] ~= nil
end

return Assets3D