# lua

## local 和 global 的区别

如果你声明 local ，那么变量就在块级作用域里面，否则就在全局状态下，对于 module 来说也是一样的，如果你引入 module ，但是 module 没有 local ，那么变量共享

```lua
x = 1

if x == 2 then
	local x = 3
	print(x)
else
	print(x)
end
```

## 变量

```lua
local x = {}
print(type(x))
tostring(x) == nil --false
```

## function

```lua
local x = function()
	return function()
		return 1, 2, 3
	end
end

(function(a, b, c)
	print(a, b, c)
end)(x()())

```

## loop

```lua
for i = 1,100 do
	print(i)
end

for i = 1, 80, 10 do
	print(i)
end
```
