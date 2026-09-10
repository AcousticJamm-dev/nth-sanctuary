local Logger, super = HookSystem.hookScript(Logger)

--- Display a todo message.
---@param ... any # The message(s) to log.
function Logger:todo(...)	
    self:outputMessage("TODO", ConsoleFormatting({ 1, 0.5, 0 }, { "\27[38;5;208m" }), Logging.dump({ ... }), false)
end

--- Display a fixme message.
---@param ... any # The message(s) to log.
function Logger:fixme(...)	
    self:outputMessage("FIXME", ConsoleFormats.RED, Logging.dump({ ... }), false)
end

--- Display a hack message.
---@param ... any # The message(s) to log.
function Logger:hack(...)	
    self:outputMessage("HACK", ConsoleFormats.RED, Logging.dump({ ... }), false)
end

--- Display an optimization message.
---@param ... any # The message(s) to log.
function Logger:optimize(...)	
    self:outputMessage("OPTIMIZE", ConsoleFormats.MAGENTA, Logging.dump({ ... }), false)
end

--- Display a tracking message.
---@param obj Class		The object to track a value for.
---@param val string	The value you want to track.
function Logger:track(obj, val)
	if isClass(obj) then
		self:outputMessage("TRACK", ConsoleFormats.BLUE, Logging.dump({
			FormatString(tostring(obj), ConsoleFormats.GREEN)
			:add(FormatString(".", ConsoleFormats.GRAY))
			:add(FormatString(val, ConsoleFormats.GREEN))
			:add(FormatString(": ", ConsoleFormats.GRAY))
			:add(FormatString(tostring(obj[val]), ConsoleFormats.DEFAULT))
		}), false)
	else
		error("Cannot track a non-Class.")
	end
end

--- Display a performance message.
---@param timer PerformanceTimer	The timer keeping track of the time.
function Logger:perf(timer)
    self:outputMessage("PERF", ConsoleFormats.GREEN, Logging.dump({timer:getString()}), false)
end

--- Display a review request.
---@param ... any # The message(s) to log.
function Logger:review(...)	
    self:outputMessage("REVIEW", ConsoleFormats.MAGENTA, Logging.dump({ ... }), false)
end

--- Display an experiment message.
---@param ... any # The message(s) to log.
function Logger:experiment(...)	
    self:outputMessage("EXPERIMENT", ConsoleFormats.MAGENTA, Logging.dump({ ... }), false)
end

--- Display a todo message, and announce it.
---@param ... any # The message(s) to log.
function Logger:todoNotify(...)
    self:outputMessage("TODO", ConsoleFormatting({ 1, 0.5, 0 }, { "\27[38;5;208m" }), Logging.dump({ ... }), true)
end

--- Display a fixme message, and announce it.
---@param ... any # The message(s) to log.
function Logger:fixmeNotify(...)
    self:outputMessage("FIXME", { ConsoleFormats.RED }, Logging.dump({ ... }), true)
end

--- Display a hack message, and announce it.
---@param ... any # The message(s) to log.
function Logger:hackNotify(...)	
    self:outputMessage("HACK", { ConsoleFormats.RED }, Logging.dump({ ... }), true)
end

--- Display an optimization message, and announce it.
---@param ... any # The message(s) to log.
function Logger:optimizeNotify(...)	
    self:outputMessage("OPTIMIZE", { ConsoleFormats.MAGENTA }, Logging.dump({ ... }), true)
end

--- Display a tracking message, and announce it.
---@param obj Class		The object to track a value for.
---@param val string	The value you want to track.
function Logger:trackNotify(obj, val)
	if isClass(obj) then
		self:outputMessage("TRACK", ConsoleFormats.BLUE, Logging.dump({
			FormatString(tostring(obj), ConsoleFormats.GREEN)
			:add(FormatString(".", ConsoleFormats.GRAY))
			:add(FormatString(val, ConsoleFormats.GREEN))
			:add(FormatString(": ", ConsoleFormats.GRAY))
			:add(FormatString(tostring(obj[val]), ConsoleFormats.DEFAULT))
		}), true)
	else
		error("Cannot track a non-Class.")
	end
end

--- Display a performance message, and announce it.
---@param timer PerformanceTimer	The timer keeping track of the time.
function Logger:perfNotify(timer)
    self:outputMessage("PERF", ConsoleFormats.GREEN, Logging.dump({timer:getString()}), true)
end

--- Display a review request, and announce it.
---@param ... any # The message(s) to log.
function Logger:reviewNotify(...)	
    self:outputMessage("REVIEW", { ConsoleFormats.MAGENTA }, Logging.dump({ ... }), true)
end

--- Display an experiment message, and announce it.
---@param ... any # The message(s) to log.
function Logger:experimentNotify(...)	
    self:outputMessage("EXPERIMENT", { ConsoleFormats.MAGENTA }, Logging.dump({ ... }), true)
end

return Logger