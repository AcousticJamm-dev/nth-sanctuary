return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 26,
  height = 18,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 14,
  nextobjectid = 64,
  properties = {
    ["border"] = "church_b",
    ["music"] = "second_church",
    ["name"] = "Second Sanctuary - Main"
  },
  tilesets = {
    {
      name = "bg_dw_church_tileset_new",
      firstgid = 1,
      filename = "../../../tilesets/bg_dw_church_tileset_new.tsx"
    },
    {
      name = "church_objects",
      firstgid = 583,
      filename = "../../../tilesets/church_objects.tsx",
      exportfilename = "../../../tilesets/church_objects.lua"
    },
    {
      name = "bg_dw_church_2_tileset",
      firstgid = 614,
      filename = "../../../tilesets/bg_dw_church_2_tileset.tsx"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 13,
      name = "objects_parallax3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.3,
      parallaxy = 0.82,
      properties = {},
      objects = {
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = -80,
          y = 210,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 210,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 752,
          y = 210,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 50,
          name = "",
          type = "",
          shape = "rectangle",
          x = -80,
          y = 410,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 410,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 52,
          name = "",
          type = "",
          shape = "rectangle",
          x = 752,
          y = 410,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 53,
          name = "",
          type = "",
          shape = "rectangle",
          x = -80,
          y = 610,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 54,
          name = "",
          type = "",
          shape = "rectangle",
          x = 336,
          y = 610,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 752,
          y = 610,
          width = 416,
          height = 130,
          rotation = 0,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff00007f"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 11,
      name = "objects_parallax2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.4,
      parallaxy = 0.85,
      properties = {},
      objects = {
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 270,
          y = 720,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 270,
          y = 240,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 630,
          y = 720,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 41,
          name = "",
          type = "",
          shape = "rectangle",
          x = 630,
          y = 240,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 850,
          y = 720,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 43,
          name = "",
          type = "",
          shape = "rectangle",
          x = 850,
          y = 240,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 44,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1190,
          y = 720,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
          visible = true,
          properties = {
            ["color"] = "#ff2525ba"
          }
        },
        {
          id = 45,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1190,
          y = 240,
          width = 480,
          height = 150,
          rotation = -90,
          gid = 595,
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
      id = 10,
      name = "objects_parallax",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 0.5,
      parallaxy = 0.9,
      properties = {},
      objects = {
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = -720,
          y = 760,
          width = 640,
          height = 1600,
          rotation = -315,
          gid = 587,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 730,
          width = 640,
          height = 1600,
          rotation = -315,
          gid = 1073742411,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 12,
      name = "objects_tile_oscillate",
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
          id = 32,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 40,
          width = 480,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 160,
          width = 240,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 240,
          width = 80,
          height = 440,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 600,
          width = 720,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "tile_oscillate",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 680,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "texturescroller",
          type = "",
          shape = "point",
          x = -43.9394,
          y = -193.636,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["type"] = "hsv"
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 26,
      height = 18,
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
        0, 0, 0, 0, 0, 0, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 749, 0, 0, 0, 0, 749, 0, 0,
        0, 0, 0, 0, 0, 0, 615, 616, 74, 74, 74, 74, 74, 74, 74, 74, 74, 626, 758, 0, 0, 0, 0, 758, 0, 0,
        0, 0, 0, 0, 0, 0, 624, 625, 74, 783, 782, 621, 782, 801, 800, 783, 622, 74, 767, 0, 0, 0, 0, 767, 0, 0,
        0, 0, 0, 0, 0, 0, 74, 629, 801, 630, 630, 630, 630, 630, 630, 630, 631, 74, 776, 787, 787, 787, 787, 776, 0, 0,
        0, 0, 0, 0, 0, 0, 620, 801, 630, 630, 630, 791, 792, 630, 630, 791, 617, 74, 635, 644, 792, 630, 630, 630, 0, 0,
        0, 0, 0, 0, 0, 0, 790, 630, 630, 630, 630, 800, 801, 630, 630, 800, 784, 74, 644, 636, 80, 792, 630, 630, 0, 0,
        0, 0, 0, 0, 0, 0, 80, 792, 630, 630, 630, 791, 810, 809, 810, 630, 630, 631, 641, 641, 641, 641, 809, 792, 0, 0,
        0, 0, 0, 0, 0, 0, 80, 80, 639, 639, 639, 811, 80, 80, 80, 639, 639, 80, 0, 0, 0, 0, 627, 790, 0, 0,
        0, 0, 0, 0, 0, 0, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 0, 0, 0, 0, 80, 799, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800, 626, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 793, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 800, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 630, 630, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 792, 630, 0, 0,
        0, 0, 0, 0, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 787, 790, 630, 0, 0,
        0, 0, 0, 0, 809, 635, 633, 634, 799, 791, 792, 791, 626, 80, 783, 782, 801, 630, 630, 800, 624, 625, 80, 792, 0, 0,
        0, 0, 0, 0, 783, 644, 642, 643, 801, 800, 801, 802, 80, 801, 630, 630, 791, 809, 792, 630, 800, 80, 782, 783, 0, 0,
        0, 0, 0, 0, 630, 800, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 641, 0, 0
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
      objects = {
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 320,
          width = 720,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 240,
          width = 160,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 0,
          width = 80,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 0,
          width = 480,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 0,
          width = 320,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 160,
          width = 80,
          height = 560,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 680,
          width = 720,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 600,
          width = 40,
          height = 120,
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
          id = 1,
          name = "spawn",
          type = "",
          shape = "point",
          x = 480,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "spoint",
          type = "",
          shape = "point",
          x = 280,
          y = 640,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "npoint",
          type = "",
          shape = "point",
          x = 80,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "spoint2",
          type = "",
          shape = "point",
          x = 200,
          y = 640,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "rpoint",
          type = "",
          shape = "point",
          x = 260,
          y = 610,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "kpoint",
          type = "",
          shape = "point",
          x = 260,
          y = 670,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "entry",
          type = "",
          shape = "point",
          x = 200,
          y = 680,
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
          id = 8,
          name = "npc",
          type = "",
          shape = "point",
          x = 200,
          y = 640,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "noelle",
            ["flagcheck"] = "!noellefall"
          }
        },
        {
          id = 9,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 600,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "primary.fall",
            ["flagcheck"] = "!noellefall",
            ["once"] = false
          }
        },
        {
          id = 57,
          name = "window_glow",
          type = "",
          shape = "point",
          x = 840,
          y = 80,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "window_glow",
          type = "",
          shape = "point",
          x = 760,
          y = 520,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "window_glow",
          type = "",
          shape = "point",
          x = 400,
          y = 520,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 720,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "secsanctuary/second_sanctum_1",
            ["marker"] = "entry"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "objects_fog",
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
          name = "churchfog",
          type = "",
          shape = "point",
          x = -80,
          y = 60,
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
      id = 5,
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
          id = 6,
          name = "filter",
          type = "",
          shape = "point",
          x = -133.939,
          y = -43.6364,
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
