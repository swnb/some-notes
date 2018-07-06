# golang source code

## 如何判断一个文件存在

看下面的代码

```go
    _,err := os.Stat(filename)
    return err==nil || os.IsExit(err)
```

```go
    if _,err:=os.Stat(filename);err!=nil{
        return false
    }
    return true
```

## hash 运算

```go
func hash(str string)string{
    return hex.EncodingToString(sha1.Sum([]byte(str)))
}
```
