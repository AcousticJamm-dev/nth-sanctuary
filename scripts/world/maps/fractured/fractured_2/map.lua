local map, super = Class(Map)

function map:load() --When the map loads....
    super.load(self)
    self.siner = 0 --[i] Required setup variable. 
		for _, event in ipairs(self.events_by_name["window_glow"]) do
		event.scale_y = -1
	end
end

function map:onEnter()

end


return map