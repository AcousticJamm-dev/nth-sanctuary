---@class ModlandCredits : MainMenuCredits
---@overload fun(menu: FileSelectMenu): ModlandCredits
local ModlandCredits, super = Class(MainMenuCredits)

function ModlandCredits:init(menu)
    super.init(self,menu)
    self.pages = {
        {
            "#th Sanctuary",
            {
                { "Lead Developers", COLORS.yellow },
                "Ralszor",
                "DiamondDeltahedron",
                "",
                "",
                { "Spritework", COLORS.yellow },
                "Runius",
                "",
                "",
                "",
                "",
            },
            {
                { "Contributors", COLORS.yellow },
                "AcousticJamm",
                "nazareth",
                "",
                "",
                { "Music", COLORS.silver },
                "DeltaPulsar",
                "obj_lily",
                "therealaarami",
                "",
                ""
            }
        },
        {
            "Kristal Engine",
            {
                { "Lead Developers", COLORS.silver },
                "NyakoFox",
                "SylviBlossom",
                "vitellary",
                "",
                { "Assets", COLORS.silver },
                "Toby Fox",
                "Temmie Chang",
                "DELTARUNE team",
                "",
                "",
            },
            {
                { "GitHub Contributors", COLORS.silver },
                "Abbe",
                "AcousticJamm",
                "Agent 7",
                "AlexGamingSW",
                "Archie-osu",
                "Azrael",
                "Bor",
                "CosmicPikachu001",
                "Dobby233Liu"
            }
        },
        {
            "Kristal Engine",
            {
                { "GitHub Contributors", COLORS.silver },
                "Elioze",
                "FireRainV",
                "HUECYCLES",
                "Hyperboid",
                "isakube",
                "J.A.R.U.",
                "Lionmeow",
                "Luna",
                "MCdeDaxia"
            },
            {
                { "GitHub Contributors", COLORS.silver },
                "MrOinky",
                "NelleMonelle",
                "Nextop",
                "nightpool",
                "prokube",
                "Simbel",
                "sjl057",
                "skarph",
                "SuperOfSrb2"
            }
        },
        {
            "Kristal Engine",
            {
                { "GitHub Contributors", COLORS.silver },
                "TFLTV",
                "Verozity",
                "WIL-TZY",
                "YeetusSnoopy",
                "",
                "",
                "",
                "",
                "",
                ""
            }
        }
    }
end

function ModlandCredits:onKeyPressed(key)
    if Input.isCancel(key) or Input.isConfirm(key) then
        Assets.stopAndPlaySound("ui_cancel")
        Kristal.saveConfig()
        self.menu:popState()
        return
    end
    super.onKeyPressed(self,key)
end

return ModlandCredits