# Nim

一个  值是数字的 hash 表

```nim
    import tables
    var countmap = initCountTable[string]()
    countmap.inc(str)
```

let const 表示一个常量，但是，const 在编译  过程就要确定，不能在运行时绑定，但是 let 只是不能更改，可以在运行时赋予值。

```nim
    for letter in 'a'..'z':
        var str string
        str.add(letter)
    echo str
```

命名的不敏感，对于 `toUpperAscii()`还是`to_upper_ascii()`都一样

多类型的使用

`var`可以声明一个变量

这上面已经很神奇了，下面介绍下神奇的函数

参数

```nim
proc fn=echo nil

proc fn(arg:string|int)=echo arg #多个类型自己判断

proc fn(arg="auto")=echo arg #默认
```

返回

```nim
proc fn :auto= # 自定义返回
   return 1

proc fn:auto=
   result='aa'

proc fn:auto=
   'a'&'b
```

巨牛的  重新载入

```nim
proc fn(age:int)=
    echo age
proc fn(name:string)=
    echo name
```

你输入什么他输出什么。。。这么强么

当你使用`sequtils`，你可以调用 filter 等方法

当你使用`future`,你可以使用(x:int)->bool=>x mod 2 !=0

 类型推断，你可以不说类型，让程序去  推断他的类型
x => x mod 2 !=0

函数作为参数

```nim
proc fn(val:auto,vail:(x:int)->bool)=
    if vail(val):echo val
    else:echo "wrong type"

proc vail(x:auto):bool=
    if x>10:
        return true
    else:
        return false
```

数组

nim 的数组是可以不用从 0 开始的

```nim
var arr: array[-10..-9,int]
```

```nim
var lists=["a","b","c"]
for item in lists:
    echo item

for i in lists.low..lists.high:
    echo lists[i]
```

 关于集合

首先，类型你要判断好。

```nim
var seqs = @[]
var seqs: seq[int]
```

上面的代码不行，因为第一个你没说明类型，第二个你没说明类型的实际数据，你只是声明了 nil 对象， 赋予值的过程是初始化，必须要有

set 可以没有  初始化，但是必须要是数值做排序

```nim
var sets: set[int16]
assert sets=={}
```

case of 不允许相同的值，只能一个一个的 of

raise newException(IOError,"io error") 抛出异常

解构 tunple

```nim
var aaa : tuple[x,y: int]

type
    aaaa = tuple[x,y:int]


aaa= (x:10,y:22)

let asads:aaaa=(23,32)
let asasa:aaaa=(x:32,y:32)

let (x,_)=asads
let (_,y)=asads
echo x,y
```

spawn 的意义是什么

spawn 并不会异步执行，但是他会创建一个线程来监听当前的数据流动，并且将当前的线程调节为阻塞的  状态来转移执行权给其他的  异步函数执行，这就是 spawn 的意义，配合 stdin.readLine()，因为这个函数是没有  异步的  模型的。

看到这里，我很奇怪，是否只是在使用单核，也就是说只有一个主线程才会这么考虑，后面  考虑下，这个跟单核是没有任何关系的。

nim 的异步函数的解释是使用了 poll 的方式，500ms 的延迟，但是为什么不实用 epoll 这种方式

nim 的标准库介绍如下所示：

    nim的命名空间规范如下
    如果你使用了`from  sequtils import filter`
    那么你可以使用filter，但是，当你要使用其他的方法，必须制定名`sequtils.filter`
    同理`import sequtils except filter` 加上名称也是有用的.

```nim
proc e(name:string)=echo name

e "a"
"a".e
"a".e()
```

除了 `$`符号之外，还有 repr 这种方法对应所有的类型都可以字符串格式化。

对于`quit`退出并且报错`code`

`for x in items([1,2])：echo x`可以将一个可迭代对象迭代出来

`substr`将一个字符串截取出来一个位置-substr(1,2)

开始将`tables`模块

```nim
import tables

let hashdata=totable[string,int]({
    "sasa":1
})
```

哈希

```nim
import hashes
#计算hash
"ddvcd".hash
#保证hash的唯一性
!$Hash()  #!$对hHash类型有效
```

set 一般只能用几种类型作为元素，但是可以用 hash 的方式加入其他类型

由于 set 会排序，对于单一的元素进行查找是非常的快速的.但是元素是唯一的。

对于 os 模块，有很多的 api 处理文件路经处理

```nim
import os
getHomeDir() / "file.txt"
join_path(getHomeDir(),"file.txt")
```

walkfile

```nim
import os
for kind,path of walkDir(getHomeDir()):
    case kind:
        of pcDir:
            echo path
        of pcFile:
            echo path
```

arg

```nim
import parseOpt
for kind,key,val in getopt():
    case kind:
        of cmdShortOption:
            echo "short option"&key&val
        of cmdEnd:
            echo "end"
            break
        of cmdArgument:
            echo "arg"&key&val
        of cmdLongOption:
            echo "cmd long"&key&val
```
