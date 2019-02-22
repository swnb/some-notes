x = 1

if x == 2 then
	local x = 3
	print(x)
else
	print(x)
end

local x = {}
print(type(x))
print(tostring(x) == nil) --false

local x = function()
	return function()
		return 1, 2, 3
	end
end

(function(a, b, c)
	print(a, b, c)
end)(x()())

for i = 1, 100 do
	print(i)
end

for i = 1, 80, 10 do
	print(i)
end

print(pcall(io.write, false)) -- error handler

file = io.open("./learn.md")
print(file:read(5))
file:close()

print(string.byte("sasa", 1, 2))
str = "sasada"
print(str:byte(1, 2))
