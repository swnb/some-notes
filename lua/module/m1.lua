local m1 = {}

local x = 1
m1.fn = function()
	x = x + 1
	print(x)
end

return m1
