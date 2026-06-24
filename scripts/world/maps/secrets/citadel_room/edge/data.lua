return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 18,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 18,
  properties = {
    ["border"] = "tvworld",
    ["music"] = "greenroom_detune"
  },
  tilesets = {
    {
      name = "bg_ch3_dw_teevie_land_tileset",
      firstgid = 1,
      filename = "../../../../tilesets/teevie_land.tsx"
    },
    {
      name = "church_objects",
      firstgid = 157,
      filename = "../../../../tilesets/church_objects.tsx",
      exportfilename = "../../../../tilesets/church_objects.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 18,
      height = 12,
      id = 1,
      name = "Tile Layer 2",
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
        0, 0, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4,
        0, 0, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10,
        0, 0, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16,
        0, 0, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27,
        2, 4, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21,
        8, 10, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27,
        14, 16, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21,
        26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27,
        20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21,
        26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27,
        0, 0, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21, 20, 21,
        0, 0, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27, 26, 27
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 18,
      height = 12,
      id = 2,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 127, 94, 129, 96, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 99, 100, 101, 129, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 104, 105, 112, 107, 108, 135, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 139, 111, 112, 113, 141, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134, 139, 118, 141, 134, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 122, 134, 140, 134, 126, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 0,
          width = 640,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 480,
          width = 640,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 80,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 400,
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
      id = 4,
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
          id = 4,
          name = "entry",
          type = "",
          shape = "point",
          x = 40,
          y = 340,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "entry2",
          type = "",
          shape = "point",
          x = 680,
          y = 310,
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
      id = 6,
      name = "objects_below_party",
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
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 160,
          width = 240,
          height = 160,
          rotation = 0,
          gid = 264,
          visible = true,
          properties = {}
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
          id = 5,
          name = "npc",
          type = "",
          shape = "point",
          x = 500,
          y = 300,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "ral",
            ["text1_1"] = "> i think you're lost",
            ["text1_2"] = "> as a reminder don't drag me into [style:none][color:red]it[style:dark][color:white], [wait:5]okay?",
            ["text2_1"] = "> stop it i dont wanna talk about [style:none][color:red]it",
            ["text3_1"] = "[font:main, 48][style:none][color:red]> it"
          }
        },
        {
          id = 7,
          name = "script",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "events.scarlet_tree",
            ["map"] = "secrets/citadel_room/edge",
            ["once"] = false
          }
        },
        {
          id = 14,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 120,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = "true",
            ["text1_1"] = "* (\"WARNING!\") [wait:10]\n* (\"TITREN SPAWN AHEAD!\")",
            ["text2_1"] = "* (Yes, [wait:5]you read that correctly.)"
          }
        },
        {
          id = 15,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 120,
          width = 120,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "secrets/citadel_room/titren_room"
          }
        }
      }
    }
  }
}
