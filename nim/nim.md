# Nim

一个值是数字的hash表

```nim
    import tables
    var countmap = initCountTable[string]()
    countmap.inc(str)
```


let const 表示一个常量，但是，const在编译过程就要确定，不能在运行时绑定，但是let只是不能更改，可以在运行时赋予值。



```nim
    for letter in 'a'..'z':
        var str string
        str.add(letter)
    echo str
```

命名的不敏感，对于`toUpperAscii()`还是`to_upper_ascii()`都一样


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

 巨牛的重新载入

```nim
proc fn(age:int)=
    echo age
proc fn(name:string)=
    echo name
```
你输入什么他输出什么。。。这么强么

当你使用`sequtils`，你可以调用filter等方法

当你使用`future`,你可以使用(x:int)->bool=>x mod 2 !=0 

类型推断，你可以不说类型，让程序去推断他的类型
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

nim的数组是可以不用从0开始的
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

关于集合

首先，类型你要判断好。
```nim
var seqs = @[]
var seqs: seq[int] 
```
上面的代码不行，因为第一个你没说明类型，第二个你没说明类型的实际数据，你只是声明了nil对象，赋予值的过程是初始化，必须要有

set可以没有初始化，但是必须要是数值做排序
```nim
var sets: set[int16]
assert sets=={}
```

case of 不允许相同的值，只能一个一个的of

raise newException(IOError,"io error") 抛出异常


解构tunple
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

spawn 并不会异步执行，但是他会创建一个线程来监听当前的数据流动，并且将当前的线程调节为阻塞的状态来转移执行权给其他的异步函数执行，这就是spawn的意义，配合 stdin.readLine()，因为这个函数是没有异步的模型的。

看到这里，我很奇怪，是否只是在使用单核，也就是说只有一个主线程才会这么考虑，后面考虑下，这个跟单核是没有任何关系的。


