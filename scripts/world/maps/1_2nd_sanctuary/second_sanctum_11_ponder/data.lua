return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.1",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 18,
  nextobjectid = 47,
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
      filename = "../../../tilesets/bg_dw_church_tileset_new.tsx",
      exportfilename = "../../../tilesets/bg_dw_church_tileset_new.lua"
    },
    {
      name = "tiles_moss",
      firstgid = 781,
      filename = "../../../tilesets/tiles_moss.tsx"
    },
    {
      name = "church_objects",
      firstgid = 783,
      filename = "../../../tilesets/church_objects.tsx",
      exportfilename = "../../../tilesets/church_objects.lua"
    },
    {
      name = "bg_dw_church_library_2_tileset",
      firstgid = 893,
      filename = "../../../tilesets/bg_dw_church_library_2_tileset.tsx"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 16,
      name = "objects_parallax3",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.3,
      parallaxy = 0.82,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 15,
      name = "objects_parallax2",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.4,
      parallaxy = 0.85,
      properties = {},
      objects = {
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = -230,
          y = 570,
          width = 640,
          height = 200,
          rotation = 0,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = -150,
          y = -190,
          width = 416,
          height = 130,
          rotation = 90,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 220,
          y = -190,
          width = 416,
          height = 130,
          rotation = 90,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = -150,
          y = 226,
          width = 416,
          height = 130,
          rotation = 90,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 220,
          y = 226,
          width = 416,
          height = 130,
          rotation = 90,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = -230,
          y = 40,
          width = 640,
          height = 200,
          rotation = 0,
          opacity = 1,
          gid = 795,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 14,
      name = "objects_parallax",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.5,
      parallaxy = 0.9,
      properties = {},
      objects = {
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = -1060,
          y = 980,
          width = 639,
          height = 1600,
          rotation = 45,
          opacity = 1,
          gid = 787,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 440,
          width = 639,
          height = 1600,
          rotation = 45,
          opacity = 1,
          gid = 1073742611,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 17,
      name = "objects_fade",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 560,
          width = 360,
          height = 640.33,
          rotation = 270,
          opacity = 1,
          gid = 791,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 13,
      name = "tiles_osc_optimize",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 194, 194, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0,
        0, 0, 0, 0, 194, 194, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0,
        0, 0, 0, 0, 194, 194, 194, 194, 194, 194, 194, 194, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 194, 194, 194, 194, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_osc",
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
          name = "texturescroller",
          type = "",
          shape = "point",
          x = 0,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["type"] = "hsv"
          }
        },
        {
          id = 10,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 80,
          width = 320,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
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
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 240,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 0,
          width = 120,
          height = 200,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 0,
          width = 120,
          height = 200,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 200,
          width = 240,
          height = 200,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 400,
          width = 640,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 0,
          width = 320,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects_under_party",
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
      id = 6,
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
          id = 8,
          name = "entry",
          type = "",
          shape = "point",
          x = 40,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
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
        0, 559, 470, 470, 470, 559, 604, 605, 605, 606, 559, 470, 470, 470, 559, 0,
        0, 894, 895, 896, 476, 565, 774, 774, 774, 774, 565, 476, 897, 898, 899, 0,
        0, 904, 905, 906, 169, 8, 9, 14, 14, 19, 8, 9, 907, 908, 909, 0,
        0, 914, 915, 916, 179, 17, 18, 14, 14, 16, 17, 187, 917, 918, 919, 0,
        0, 924, 925, 926, 197, 26, 27, 2, 3, 25, 196, 179, 927, 928, 929, 0,
        0, 28, 28, 28, 28, 28, 22, 11, 12, 23, 28, 28, 28, 28, 28, 0,
        0, 0, 0, 0, 0, 0, 28, 28, 28, 28, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 11,
      name = "objects_under_party",
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
          id = 26,
          name = "churchmagicglass",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 240,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["idlealpha"] = 0
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 120,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          gid = 2147484429,
          visible = true,
          properties = {
            ["cutscene"] = "events.moss3",
            ["usetile"] = "true"
          }
        },
        {
          id = 46,
          name = "churchmagicglass",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 240,
          width = 160,
          height = 160,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["idlealpha"] = 0
          }
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
          id = 27,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 320,
          width = 40,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "1_2nd_sanctuary/second_sanctum_11_exit",
            ["marker"] = "entry2"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
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
          id = 28,
          name = "churchfog",
          type = "",
          shape = "point",
          x = 80,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "filter",
          type = "",
          shape = "point",
          x = 40,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["type"] = "hsv"
          }
        }
      }
    }
  }
}
