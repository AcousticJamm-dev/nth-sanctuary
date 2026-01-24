return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 15,
  height = 15,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 23,
  properties = {
    ["border"] = "church_b",
    ["music"] = "second_church"
  },
  tilesets = {
    {
      name = "bg_dw_church_2_tileset",
      firstgid = 1,
      filename = "../../../tilesets/bg_dw_church_2_tileset.tsx"
    },
    {
      name = "bg_dw_church_tileset_new",
      firstgid = 199,
      filename = "../../../tilesets/bg_dw_church_tileset_new.tsx"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_parallax",
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
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 15,
      height = 15,
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
        0, 0, 0, 0, 0, 0, 12, 19, 10, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 10, 19, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 10, 10, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 3, 10, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12, 10, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 2, 3, 10, 0, 0, 0, 0, 0, 0,
        10, 19, 10, 10, 19, 10, 11, 12, 10, 19, 19, 14, 19, 10, 4,
        19, 19, 19, 19, 10, 19, 10, 10, 10, 19, 10, 10, 10, 19, 4,
        10, 10, 13, 19, 19, 13, 19, 19, 10, 10, 10, 10, 19, 10, 10,
        0, 0, 0, 0, 0, 0, 3, 10, 10, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 12, 19, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 10, 10, 10, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 4, 13, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 13, 19, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 19, 19, 4, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "collision",
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
      id = 5,
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
          id = 3,
          name = "entry",
          type = "",
          shape = "point",
          x = 40,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "spawn",
          type = "",
          shape = "point",
          x = 80,
          y = 280,
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
      id = 3,
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
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 240,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "secsanctuary/second_sanctum_3",
            ["marker"] = "entry2"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects_top",
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
          id = 19,
          name = "churchfog",
          type = "",
          shape = "point",
          x = -66.061,
          y = 223.636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "filter",
          type = "",
          shape = "point",
          x = -120,
          y = 120,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = "hsv"
          }
        }
      }
    }
  }
}
