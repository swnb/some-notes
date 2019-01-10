# haskell

### 列表？

`list` 其实是一个链表，这也就是它的一些处理和其他语言不同的地方，它推荐的是头部操作，但是也可以尾部追加，不过这个情况就会让本身的链表慢一点，下面介绍下基本的操作，比如这样

```haskell
addListHead :: Int -> a -> [a] -> [a]
addListHead flag ele list
    | flag == 1 = ele:list
    | flag == 2 = list++[ele]
    | flag == 3 = [] 
    | flag == 4 = list
    | flag == 5 = list !! 1
```

 haskell是一门有严格格式化的语言，使用起来很舒服

上面的代码是一般的通用公式，可以实现一般的`switch`语句，我很喜欢这种风格

#### 什么是 `let` 和 `where`？

看起来差不多。let的声明在前面。但是where的声明在后面，这种差别是存在的，let其实是一种表达式，这种表达式是存在返回值的。

#### case

函数的模式匹配就是case的语法糖，比如下面的代码：

``` haskell
caseExample x = x ++ [1]
caseExmaple [] = 10
caseExample xs = case xs of [] -> 10
				case xs of x -> x++[1]
```





