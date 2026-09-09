local Wave, super = HookSystem.hookScript(Wave)

function Wave:update()
	if not self.paused_stuff then
		super.update(self)
	end
end

return Wave