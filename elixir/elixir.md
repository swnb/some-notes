# elixir

再没学习这门语言之前就听说这门语言的语法风格的迥异.现在真的见识到了,实在让我太意外了.

-   从基本类型开始讲起

    数字加 1+2

    字符串加 “a”<>"b"

    除 10/3 返回的是浮点数

    div(10/2)

    rem(10/2)

-   数值表示

    0b101010101

    0o777

    0xa1bF

-   判断类型

    is_boolean(true)

    is_integer(10)

    is_float(10.1)

    is_number(10.01)

-   atom 原子类型

    true == :true

    > boolen 就是 atom 类型

-   字符串

    "hello"

    "#{:world}"

    字符串也是二进制,和以获取字符串的序列大小,还有比如 String.upcase("cdcdcd")

    String.codepoints "\ua213\u2121b"

-   function

    add = fn a,b->a+b end

    add.(1,2) //调用

    (fn ->x=0 end ).()
    函数内部的赋值不能影响前面变量

-   列表

    [1,2,true,3]

    length([1,2,3])

    [1,2,3]++[4,5,6]

    [1,2,3,3,4,4]--[1,2,3] == [3,4,4]

    [head|body]=[1,2,3,4]

    hd [1,2,3] head

    tl [1,2,3]

    hd [] //wrong

    使用 i 打印出数据信息

-   tuple

    {:ok,"cdcd"}

    tuple_size {:ok,"cdcd",123}

    elem(tuple,2) put_elem(tuple,1,"cdcd")

列表和元组的区别是什么,就像链表和顺序表一样,列表不好索引,但是方便更改数据,元组恰好相反,通常用来存放数据

### 操作部分

or and not

-   -   / \*

<> ++ --

== ===这两者的区别跟 js 完全不一样,不要混淆,这个只是对浮点数和整数严格区分

number < atom < reference < functions < port < pid < tuple < maps < list < bitstring

排序算法就是这样的额

### 模式匹配

x = 1 //1

表示匹配的过程是这样的

1 = x //1

如果不想赋值,那么就可以用 ^x = 1 //模式匹配

### 判断语句

case {1,2,3} do
{4,5,6} ->
"this is not"
{1,x,3} ->
"cdcd"
_ ->
"_"
end

这里面有赋值的操作

如果想消除
`^x`来替代

卫语句的表达式

```elixir
case 1 do
    x when hd x ->
        "not match"
    x ->
        "x->#{x}"
end
```

函数也可以使用卫语句

```elixir
f = fn
  x, y when x > 0 and y > 0 -> x + y
  x, y -> x * y
end
```

cond

```elixir
cond do
    2+2==5->
        "true"
    2*2==3->
        true
    true->
        "true"
end
```

if else unless

if true do
"do"
else
"cd"
end

unless false do
"do"
end

上面条件控制都包含了 do end 模块

if 的其他写法
if true,do: 1 + 2 ,else: :error

is_number(if true,do: 1 + 2 end)

i 打印变量信息,? 打印字符的编码

二进制数据的表达方式
<<2,3,4,5,6>>

字符串二进制的数据使用方式相近

“cdc” <> <<1,24,6>>

数据一般呢不大于 255

<<256 :: size(16)>> bits 2bytes -> <<1,0>>

### map

map 在 elixir 里面不是 hash 表,而是链表和顺序表的结合体

[{:a,1},{:b:11}][a,1,b:2]

//键值必须是 atom
//顺序你来定
//多次使用

map 必须是指定的

map= %{:a=>1,2=>:b}

> 映射的方式过于诡异,这个方式创建的数据是无序的,而且可以任意指定,所以可以模式匹配,对于大小不同的数据

Map.get(map,:a)

Map.to_list(map)

当映射的 key 都是原子的时候,那么就可以直接写 %{a: 1,b: 2}

Enum.map([1,2,3],fn x->x end)

Enum.map(%{:a=>1,2=>:b},fn {k,v}->[1,2] end)

|> 管道

# module

```elixir
defmodule Math do
    def sum([],sumres) do
        sumres
    end
    def sum([head|tail]) do
        sum(tail,head+sumres)
    end
end
```

1..1000|>Enum.map(&(&1+3))

Stream 和 Enum 模块()

//之后要好好研究这一部分的代码，stream 和 enum

### 进程 processes

spawn 衍生进程，类似 golang，生成了一个子进程

spawn fn -> 1+2 end

-> PID

process

Process.alive(PID)

self

-> id

// 有了 send 就可以直接接受数据调度，这个是比 go 好的

send

send PID(self), {:hello,"zah"}

recive do
{:hello,msg}->msg
after
1000->"end"
end

### Alias require import

alias Math.List as: List===alias Math.List

> 在函数里面使用有局限性

require // 前缀

import // 可以无前缀

### 大致的类型

```elixir
Atom
BitString
Float
Function
Integer
List
Map
PID
Port
Reference
Tuple
```

### protocol

```elixir
defprotocol Blank do
  @doc "return the data is blank or not"
  def blank?(data)
end

defimpl Blank,for: List do
  def blank?(_) do
    false
  end
end

defimpl Blank, for: Integer  do
  def blank?(_) do
    false
  end
end
IO.puts Blank.blank?(1)
```

```elixir
for n<-[1,2,3,4],do: n*n
```

### advance

erlang 模块

:timer

:os

:timer.tc(function,[arg1,arg2,arg3])

:os

### 宏

    - quote 生成树结构
    - unquote 修改语法树
    - 前面两者在defmarco里面使用生成宏

```elixir
defmodule Meta do
    defmacro sure(expr,do: func) do
        quote do
            if unquote(expr) do
                unquote(func).()
            end
        end
    end
end
```

### actor

recive 是阻塞的，可以不用担心

```elixir
Process.register(pid,:pid)
pid=Process.whereis(:pid)
```

### 列表

列表是链表
