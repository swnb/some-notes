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

## module

关于 lua 的 module 的机制真的是很好玩

1 loadfile 加载不执行 返回一个函数 ,调用函数后执行
2 dofile 加载并且执行

3 require 记载执行缓存，但是此时 module 必须在 package.path 里面

## error handler

```lua
pcall(io.write, false) -- catch err
```

## file operate

```lua
file = io.open("./learn.md")
print(file:read(5))
file:close()
```
