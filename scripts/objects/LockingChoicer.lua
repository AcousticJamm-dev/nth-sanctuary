---@class LockingChoicer : Choicebox

local LockingChoicer, super = Class(Choicebox)

function LockingChoicer:init(lock, ...)
    super.init(self, ...)

    self.lock_index = lock
end

function LockingChoicer:handleDirectionalInput()
    if self.current_choice ~= self.lock_index then
        super.handleDirectionalInput(self)
    end
end

return LockingChoicer