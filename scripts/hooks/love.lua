local lv, super = HookSystem.hookScript(love)

function lv.filedropped(file)
    local path = file:getFilename()
    local name = path:match("([^/\\]+)$") -- extract filename
    local ext = name:match("%.([^%.]+)$")
    Mod.inserted_plorgius = name..ext
end

return lv