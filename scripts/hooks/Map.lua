local Map, super = Class("Map", true)

function Map:createTileObject(data, x, y, width, height)
    if data.gid then
        local gid, flip_x, flip_y = TiledUtils.parseTileGid(data.gid)
        local tileset, tile_id = self:getTileset(gid)
        return TileObject(tileset, tile_id, x or data.x, y or data.y, width or data.width, height or data.height, math.rad(data.rotation or 0), flip_x, flip_y, data.properties)
    end
end

return Map