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