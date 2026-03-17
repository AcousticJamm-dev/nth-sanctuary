return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 42,
  height = 30,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 16,
  nextobjectid = 206,
  properties = {},
  tilesets = {
    {
      name = "church_objects",
      firstgid = 1,
      filename = "../../../tilesets/church_objects.tsx",
      exportfilename = "../../../tilesets/church_objects.lua"
    },
    {
      name = "bg_dw_church_2_tileset",
      firstgid = 103,
      filename = "../../../tilesets/bg_dw_church_2_tileset.tsx"
    },
    {
      name = "bg_dw_church_tileset_new",
      firstgid = 301,
      filename = "../../../tilesets/bg_dw_church_tileset_new.tsx",
      exportfilename = "../../../tilesets/bg_dw_church_tileset_new.lua"
    },
    {
      name = "bg_dw_mansion_battle_tileset",
      firstgid = 883,
      filename = "../../../tilesets/bg_dw_mansion_battle_tileset.tsx",
      exportfilename = "../../../tilesets/bg_dw_mansion_battle_tileset.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects_bg",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "darkroombg",
          type = "",
          shape = "point",
          x = 40,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 42,
      height = 30,
      id = 8,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 20,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 727, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 42,
      height = 30,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 733, 0, 0, 0, 0, 0, 0, 0,
        0, 374, 374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 380, 374, 380, 380, 374, 374, 380, 374, 374, 380, 380, 374, 380, 374, 374, 380, 380, 380,
        0, 374, 380, 0, 374, 374, 374, 374, 380, 374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 715, 0, 380, 380, 374, 380, 374, 380, 374, 374, 380, 380, 380, 374, 374, 374, 380, 380, 374, 374,
        0, 374, 374, 0, 380, 374, 374, 380, 380, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 733, 0, 380, 374, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386,
        0, 380, 374, 380, 380, 380, 386, 386, 374, 380, 0, 0, 0, 0, 0, 0, 374, 380, 380, 380, 374, 380, 380, 374, 380, 380, 380, 374, 374, 0, 0, 0, 0, 0, 768, 0, 0, 0, 0, 0, 0, 0,
        0, 380, 374, 374, 380, 380, 0, 0, 374, 380, 0, 0, 0, 0, 0, 0, 380, 374, 374, 380, 374, 374, 374, 380, 380, 380, 380, 374, 374, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 386, 386, 386, 380, 374, 380, 374, 374, 374, 0, 0, 0, 0, 0, 0, 380, 374, 386, 386, 386, 386, 386, 386, 386, 386, 386, 374, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 380, 374, 677, 374, 380, 374, 0, 0, 0, 0, 0, 0, 374, 380, 380, 775, 374, 380, 374, 374, 380, 374, 380, 380, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 386, 386, 386, 386, 380, 380, 380, 374, 380, 374, 778, 380, 380, 374, 380, 380, 374, 380, 374, 374, 380, 380, 380, 380, 380, 0, 0, 715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 374, 374, 374, 380, 374, 380, 380, 380, 380, 374, 380, 386, 386, 386, 380, 374, 386, 386, 386, 374, 380, 0, 0, 733, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 386, 386, 386, 386, 386, 386, 386, 386, 386, 380, 374, 0, 715, 0, 380, 374, 0, 0, 0, 374, 374, 380, 380, 380, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 380, 374, 0, 733, 0, 374, 374, 0, 0, 0, 380, 380, 380, 380, 374, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 374, 374, 380, 380, 380, 677, 380, 0, 0, 0, 386, 386, 386, 386, 386, 386, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 715, 0, 374, 380, 380, 380, 380, 374, 374, 374, 380, 380, 374, 374, 380, 0, 0, 0, 0, 0, 0, 0, 768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 733, 0, 374, 380, 380, 374, 374, 374, 380, 374, 386, 386, 386, 380, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 380, 374, 374, 374, 374, 776, 677, 677, 380, 775, 386, 386, 386, 386, 380, 380, 0, 768, 0, 374, 380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 380, 380, 374, 380, 380, 677, 677, 677, 380, 380, 0, 0, 0, 0, 374, 380, 0, 0, 0, 380, 380, 0, 0, 0, 0, 0, 374, 374, 380, 380, 380, 380, 380, 374, 0, 0, 0, 0, 0,
        0, 0, 0, 386, 386, 386, 374, 374, 386, 386, 386, 380, 380, 0, 0, 0, 0, 374, 380, 0, 0, 0, 380, 374, 0, 0, 0, 0, 0, 380, 374, 380, 374, 380, 380, 380, 380, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 380, 374, 0, 768, 0, 380, 380, 0, 0, 0, 0, 374, 374, 0, 0, 0, 374, 380, 0, 0, 0, 0, 0, 374, 374, 386, 386, 386, 386, 374, 380, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 380, 374, 0, 0, 0, 374, 380, 0, 0, 0, 0, 380, 374, 380, 374, 380, 380, 374, 374, 380, 374, 374, 374, 374, 380, 374, 374, 374, 380, 374, 380, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 715, 0, 374, 380, 380, 374, 380, 374, 380, 0, 0, 0, 0, 380, 380, 374, 374, 380, 380, 374, 380, 380, 374, 380, 380, 678, 777, 380, 380, 380, 380, 380, 374, 0, 715, 0, 0, 0,
        0, 0, 0, 0, 733, 0, 380, 380, 374, 374, 374, 380, 380, 0, 0, 0, 0, 374, 374, 386, 386, 386, 386, 386, 386, 386, 374, 380, 386, 386, 386, 386, 386, 386, 386, 380, 374, 0, 733, 0, 0, 0,
        380, 380, 380, 380, 380, 380, 374, 380, 386, 386, 386, 374, 374, 0, 0, 0, 0, 380, 380, 0, 0, 0, 0, 0, 0, 0, 374, 374, 374, 380, 374, 374, 380, 374, 374, 677, 374, 380, 374, 374, 374, 380,
        374, 380, 380, 374, 380, 374, 380, 374, 0, 0, 0, 374, 380, 380, 380, 374, 374, 380, 374, 0, 0, 0, 0, 0, 0, 0, 374, 380, 374, 374, 380, 380, 374, 380, 380, 776, 380, 380, 380, 380, 374, 374,
        386, 386, 386, 386, 386, 386, 386, 386, 0, 0, 0, 374, 374, 380, 380, 380, 380, 374, 380, 0, 0, 0, 0, 0, 0, 0, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386, 386,
        0, 0, 0, 0, 768, 0, 0, 0, 0, 0, 0, 386, 386, 386, 386, 386, 386, 386, 386, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 768, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 42,
      height = 30,
      id = 12,
      name = "battleborder",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 895, 897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 895, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 897,
        0, 913, 915, 0, 895, 896, 896, 896, 896, 897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 933,
        0, 913, 915, 0, 913, 0, 0, 0, 0, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 913, 1330, 896, 1329, 0, 0, 0, 0, 915, 0, 0, 0, 0, 0, 0, 895, 896, 896, 896, 896, 896, 896, 896, 1329, 1330, 896, 896, 897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 931, 932, 932, 1347, 0, 0, 0, 0, 915, 0, 0, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 932, 932, 932, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 913, 0, 0, 0, 0, 915, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 931, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 896, 896, 896, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 896, 896, 896, 1329, 0, 1348, 932, 932, 932, 1347, 1348, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 931, 932, 932, 932, 932, 932, 932, 932, 932, 1347, 915, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 913, 1330, 896, 896, 896, 897, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 931, 932, 932, 932, 932, 933, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 895, 896, 896, 896, 896, 896, 1329, 1348, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 932, 1347, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 895, 896, 896, 896, 896, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 931, 932, 932, 1347, 1348, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 895, 896, 896, 896, 896, 896, 896, 897, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 1329, 1330, 896, 896, 896, 896, 896, 0, 1330, 896, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 932, 932, 932, 932, 1347, 1348, 932, 932, 932, 932, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 913, 1348, 932, 932, 932, 1347, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0,
        896, 896, 896, 896, 896, 896, 1329, 915, 0, 0, 0, 913, 915, 0, 0, 0, 0, 913, 915, 0, 0, 0, 0, 0, 0, 0, 913, 1330, 896, 896, 896, 896, 896, 896, 896, 1329, 1330, 896, 896, 896, 896, 897,
        932, 932, 932, 932, 932, 932, 932, 933, 0, 0, 0, 913, 1330, 896, 896, 896, 896, 1329, 915, 0, 0, 0, 0, 0, 0, 0, 931, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 932, 933,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 931, 932, 932, 932, 932, 932, 932, 933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "battleareas",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 119,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 560,
          width = 320,
          height = 480,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 14,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 165,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 640,
          width = 160,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 166,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 720,
          width = 120,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 720,
          width = 240,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 168,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 640,
          width = 120,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 169,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 440,
          width = 440,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 170,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 360,
          width = 160,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 171,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 160,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 172,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 80,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 173,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 120,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 175,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 176,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 0,
          width = 280,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 177,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 0,
          width = 240,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 178,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 280,
          width = 360,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 179,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 0,
          width = 320,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 180,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 0,
          width = 720,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 181,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 160,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 182,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1160,
          y = 160,
          width = 520,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 183,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1320,
          y = 440,
          width = 360,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 184,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 680,
          width = 200,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 186,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1160,
          y = 520,
          width = 160,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 188,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 520,
          width = 200,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 190,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 400,
          width = 120,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 191,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 400,
          width = 120,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 192,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 600,
          width = 120,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 194,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 440,
          width = 240,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 197,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 920,
          width = 120,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 198,
          name = "",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 1040,
          width = 440,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 199,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1000,
          width = 320,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 200,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 880,
          width = 280,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 201,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1040,
          y = 1000,
          width = 640,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 202,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 880,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 203,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1240,
          y = 760,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 204,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 200,
          width = 80,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "objects_switch",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 16,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 640,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 53,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 1060,
          y = 820,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 82,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 940,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 83,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 580,
          y = 980,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 84,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 1520,
          y = 940,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 85,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 540,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 86,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 220,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 87,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 1240,
          y = 460,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 102,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 1360,
          y = 100,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        },
        {
          id = 104,
          name = "churchtilebutton",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 300,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern",
            ["npcpress"] = false,
            ["offsound"] = 0,
            ["onsound"] = 0
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 13,
      name = "objects_enemies",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 127,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 740,
          y = 580,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 3
          }
        },
        {
          id = 128,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 460,
          y = 580,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 0
          }
        },
        {
          id = 129,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 460,
          y = 1020,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 1
          }
        },
        {
          id = 131,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 740,
          y = 1020,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 2
          }
        },
        {
          id = 134,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 500,
          y = 980,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 1
          }
        },
        {
          id = 135,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 700,
          y = 980,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 2
          }
        },
        {
          id = 136,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 700,
          y = 620,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 3
          }
        },
        {
          id = 137,
          name = "pathenemyturner",
          type = "",
          shape = "point",
          x = 500,
          y = 620,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 0
          }
        },
        {
          id = 144,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 760,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 0,
            ["movetype"] = 3
          }
        },
        {
          id = 157,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 760,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 2,
            ["movetype"] = 3
          }
        },
        {
          id = 158,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 600,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 3,
            ["movetype"] = 3
          }
        },
        {
          id = 160,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 560,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 3,
            ["movetype"] = 3
          }
        },
        {
          id = 161,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 1000,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 1,
            ["movetype"] = 3
          }
        },
        {
          id = 162,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 960,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 1,
            ["movetype"] = 3
          }
        },
        {
          id = 163,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 720,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 0,
            ["movetype"] = 3
          }
        },
        {
          id = 164,
          name = "pathenemynum",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 800,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["dir"] = 2,
            ["movetype"] = 3
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 15,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 205,
          name = "chest",
          type = "",
          shape = "rectangle",
          x = 60,
          y = 100,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["item"] = "revivemint"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_party",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 57,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = -240,
          y = 960,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["bigsize"] = 640,
            ["littlesize"] = 400,
            ["maxtimer"] = 120,
            ["timebuffer"] = 300
          }
        },
        {
          id = 88,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 180,
          y = 880,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 90,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 380,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 92,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 820,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 94,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 1260,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 95,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 1540,
          y = 880,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 96,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 1080,
          y = 760,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 98,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 600,
          y = 920,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 99,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 280,
          y = 240,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 100,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 900,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["group"] = "lantern"
          }
        },
        {
          id = 101,
          name = "lanternshrinking",
          type = "",
          shape = "point",
          x = 1380,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 11,
      name = "paths",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "spawn",
          type = "",
          shape = "point",
          x = 60,
          y = 960,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects_overlay",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 9,
          name = "darkness",
          type = "",
          shape = "point",
          x = 0,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["alpha"] = 1,
            ["highlight"] = false
          }
        }
      }
    }
  }
}
