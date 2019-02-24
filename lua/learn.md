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

# metatable

类似 js 的原型链，但是 js 的原型链只能访问函数和变量，本质上还是一个对象罢了
lua 还有对于操作符号的处理，比如 + - 这种也可以截获，这个在 dart 里面见过，dart 在这方面由于不是传统的脚本语言，比起 lua 的 metatable 还是差了一点，但是 dart 是现代语言里面中语法设计相当亲和的语言，我最喜欢的语言就是 dart，只可惜了 dart 应用狭窄，为什么这么说，dart 号称移动端前端后端都能写，但是对前端来说 dart2js 生成的代码太庞大，绝对不可能流行，只能在 google 那一套生态混日子（angular）。对后端来说 ，dart 在 Nodejs 相当成熟的设计基础上加了静态类型, 运行效率本应该比 Nodejs 要好一点，但是实际使用中效率低下，保守估计吞吐率相比 Nodejs 下降了大概 1/3，这说明 dart vm 还需要大量的优化，更不要说跟宇宙级的 jvm 相比了。最后移动端，flutter 实际上是借鉴（官方承认的）React 的设计，但是 React 在这方面沉淀的技术和思想不是你可以随便模仿的（我是 React 粉），比如 jsx 表示 dom 树结构是用 xml，可读性非常好，flutter 编写 widget 树结构还是在用 dart 编写，给人一种嵌套过深的感觉（你看了代码就知道了）。但是现在 dart 本身面向工程的设计是非常令人满意的，是在 js 和 java 的最佳实践上诞生的一门非常不错的语言，我很喜欢。

这里还是要说下 golang ，很多人对 golang 有敌意，但是 golang 在抽象和性能的平衡上做的很好，假如我想要写点不复杂的东西，我要求快速开发还要保证性能是 T1 级别，那 golang 绝对是做好的选择，我写了这么多的语言，一个深深的体会就是，世界上没有一门语言可以做到任何场景下都适用。

```lua
local map = {}
map.__add = function(a, b)
	return {
		a[1] + b[1],
		b[1] + b[2]
	}
end

local a = {1, 2}
a = setmetatable(a, map)
local b = {1, 2}
b = setmetatable(b, map)

for k, v in ipairs(a + b) do
	print(k, v)
end
```

## 完结篇

dot 和 The colon

```lua
local Person = {
	name = "swnb"
}
-- 你定义了一个函数
function Person.setAge(person, age)
	person.age = 10
end

-- 你可以这么调用，那么就是第一参数就是你自己
Person:setAge(100)
print(Person.age)

-- 实际上你需要的是改 Person 的属性，这样定义函数self 就是默认的
-- 那么你可以这样来写，js 默认this 就是调用者，所以。。。比lua 方便，但是js的这个特性我一般不用
function Person:setAge(age)
	self.age = 10
end

Person:setAge(100)
print(Person.age) -- 100
```

所以定义和使用的时候都是可以用: 的。很灵活

完结。
