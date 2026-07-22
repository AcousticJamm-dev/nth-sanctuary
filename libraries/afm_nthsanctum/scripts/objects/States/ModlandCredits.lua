---@class ModlandCredits : MainMenuCredits
---@overload fun(menu: FileSelectMenu): ModlandCredits
local ModlandCredits, super = Class(MainMenuCredits)

function ModlandCredits:init(menu)
    super.init(self,menu)
    self.pages = TableUtils.merge({
        {
            "#th Sanctuary",
            {
                { "Lead Developers", COLORS.yellow },
                "Ralszor",
                "DiamondDeltahedron",
                "TheLucidLibrarian",
                "Mason",
                "Funkin's Garbage",
                { "Storywriting", COLORS.yellow },
                "KayCelestia",
                "TheLucidLibrarian",
                "",
                "",
            },
            {
                { "Contributors", COLORS.yellow },
                "Hyperboid",
                "JARU",
                "Leaff",
                "Duskl1ght \"Dusk\"",
                "freezitsu",
                "Runius",
                "CharacturrDreemurr",
                "Krisp / Tamato"
            }
        },
        {
            "#th Sanctuary",
            {
                { "Music", COLORS.yellow },
                "DeltaPulsar",
                "squibles",
                "deepdarkdepths__",
                "obj_lily",
                "therealaarami",
                "AkitA",
                "Rareblin",
                "Lucas Pucas",
                "",
            },
            {
                { "Contributors", COLORS.yellow },
                "CuriousSpook",
                "XoticKade",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            }
        },
        {
            "#th Sanctuary",
            {
                { "Extra Assets", COLORS.yellow },
                "DELTARUNE Team",
                "Toby Fox",
                "Temmie Chang",
                "duskkii",
                "",
                "",
                "",
                "",
                "",
                ""
            },
            {
                { "Special Guests", {0.5, 1, 0.7} },
                "AcousticJamm",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""
            }
        },
        
    }, self.pages)
end

function ModlandCredits:onKeyPressed(key)
    if Input.isCancel(key) or Input.isConfirm(key) then
		if Input.isConfirm(key) then
			Assets.stopAndPlaySound("ui_select")
		else		
			Assets.stopAndPlaySound("ui_cancel")
		end
        self.menu:popState()
        return
    end
    super.onKeyPressed(self,key)
end

return ModlandCredits