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

## 如何实现错误的处理

```go
if err!=nil{
    panic(err)
}

if err!=nil{
    log.Fatal(err)
}
```

> 对于一个 http 请求来说，错误就是 500 以上的一些 http 状态码，如果每次都要取处理这个 error，那是得不偿失的，那么怎么合理的处理

```go
type fn func(w http.ResponseWrite,r *http.request) error
// 看上面的代码，它实现了对于错误的输出，同时他也是一个类型，把函数本身作为一个对象的类来处理是一种十分巧妙的方案
```

```go
func (self fn) (w http.ResponseWrite,r *http.request){
    if err:=self(w,r);err!=nil{
        errHandle(w)
    }
}

func errHandle(w http.ResponseWrite){
    http.Error(w,nil,500)
}
```

## beego 对于错误的处理方式，拦截 panic()

```go
func recoverPanic(ctx *context.Context) {
    if err := recover(); err != nil {
	    if err == ErrAbort {
		    return
	    }
		if !BConfig.RecoverPanic {
			panic(err)
		}
		if BConfig.EnableErrorsShow {
			if _, ok := ErrorMaps[fmt.Sprint(err)]; ok {
				exception(fmt.Sprint(err), ctx)
				return
			}
		}
		var stack string
		logs.Critical("the request url is ", ctx.Input.URL())
		logs.Critical("Handler crashed with error", err)
		for i := 1; ; i++ {
			_, file, line, ok := runtime.Caller(i)
			if !ok {
				break
			}
			logs.Critical(fmt.Sprintf("%s:%d", file, line))
			stack = stack + fmt.Sprintln(fmt.Sprintf("%s:%d", file, line))
		}
		if BConfig.RunMode == DEV && BConfig.EnableErrorsRender {
			showErr(err, ctx, stack)
		}
	}
}
```
