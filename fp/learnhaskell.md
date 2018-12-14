- haskell 这种语言里面可以判断数组是相同的，和其他语言不同，不判断地址，只判断数组是否是这个形式的，纯数学是可以理解相同和不同的，这跟很多语言不同，数组一般不能判断相同

```haskell
data TypeA = A Float| B Int deriving (Show)

count :: A -> Float

count x = x
```

type

```haskell
data Person = Person {
    name :: string,
    age :: Int
}

name Person {name = "swnb", age = 100 }
```
