---@class Savepoint : Event
local Savepoint, super = HookSystem.hookScript(Savepoint)

function Savepoint:onTextEnd()
	if self.heals then
        for _, party in pairs(Game.party_data) do
            party:healAssist(math.huge, false)
        end
    end
	
    super.onTextEnd(self)
end

return Savepoint