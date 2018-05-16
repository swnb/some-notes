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


多类的使用