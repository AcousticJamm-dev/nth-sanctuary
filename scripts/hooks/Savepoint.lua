---@class Savepoint : Event
local Savepoint, super = HookSystem.hookScript(Savepoint)

function Savepoint:onTextEnd()
	if self.heals then
        for _, party in pairs(Game.party_data) do
            party:healAssist(math.huge, false)
        end
    end
	
	local function starts_with(str, start)
		return str:sub(1, #start) == start
	end
	
	if not starts_with(Game.world.map.id, "sanctum_hell") then
		Game:setFlag("last_savepoint", Game.world.map.id)
	end
	
    super.onTextEnd(self)
end

return Savepoint