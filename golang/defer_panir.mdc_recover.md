# defer   panic recover

### defer 

* 将函数和压入一个栈

* 函数的参数是在声明的时候定义值的

```go 
 func c() (i int) {
	defer func() { i++ }()
	return 1
}
```

### 

