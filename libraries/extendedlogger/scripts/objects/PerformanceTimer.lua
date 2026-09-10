---@class PerformanceTimer : Object
---@overload fun(name: string, active: boolean) : PerformanceTimer
local PerformanceTimer, super = Class(Object)

function PerformanceTimer:init(name, active)
    super.init(self)
	
	self.name = name
	self.value = 0
	self.active = true
end

function PerformanceTimer:update()
	if self.active then
		self.value = self.value + DT
	end
end

--- Starts the timer.
function PerformanceTimer:start()
	self.active = true
end

--- Stops the timer.
function PerformanceTimer:stop()
	self.active = false
end

--- Gets the string of the timer state.
---@return string
function PerformanceTimer:getString()
	return FormatString("Timer ", ConsoleFormats.GRAY)
		:add(FormatString(self.name, ConsoleFormats.GREEN))
		:add(FormatString(" is at ", ConsoleFormats.GRAY))
		:add(FormatString(tostring(self.value) .. "s", ConsoleFormats.GREEN))
end

return PerformanceTimer