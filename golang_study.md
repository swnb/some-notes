# golang

 

* vscode 安装了 gopkg 来进行包管理



```go
package main
import (
	"fmt"
)
func main(){
  fmt.Println("zz")
}
```



> 在 Go 中，首字母大写的名称是被导出的。
>
> 双引号

***

> 类型在变量名 _之后_

```go
func add(x int,y int)int{
  return x+y
}
```

***

> Go 的返回值可以被命名，并且像变量那样使用。
>
> 返回值的名称应当具有一定的意义，可以作为文档使用。
>
> 没有参数的 `return` 语句返回结果的当前值。也就是`直接`返回。
>
> 直接返回语句仅应当用在像下面这样的短函数中。在长的函数中它们会影响代码的可读性。

```go
func swap(x,y int)(z,c int){
  z=x
  c=y
  return 
}
```

***

> 在函数中，`:=` 简洁赋值语句在明确类型的地方，可以用于替代 `var`定义。
>
> 函数外的每个语句都必须以关键字开始（`var`、`func`、等等），`:=` 结构不能使用在函数外。

对于声明变量，`var`可以无限制的声明，函数外 包内都可以，但是`：=`不行，所以，而且当`：=`时候是需要确定类型的，就像`const`一样,不声明但是确定值，`const`可以在函数外声明

***

基本数值类型

> bool
>
> string
>
> int  int8  int16  int32  int64
>
> uint uint8 uint16 uint32 uint64 uintptr
>
> byte // uint8 的别名
>
> rune // int32 的别名     // 代表一个Unicode码
>
> float32 float64
>
> complex64 complex128

变量在定义时没有明确的初始化时会赋值为_零值_。

零值是：

- 数值类型为 `0`，
- 布尔类型为 `false`，
- 字符串为 `""`（空字符串）

类型转换直接进行

```go
var z=string(42)
func main(){
  c:=string(42)
}
```

***

循环`for`

```go
for i:=0;i<10;i++{
  sum+=1
}
//省略
for;sum<100;{
  sum+=sum
}
//while
for sum<1000{
  sum+=sum
}
//死循环
for{
  
}
```

跟 `for` 一样，`if` 语句可以在条件之前执行一个简单的语句。

由这个语句定义的变量的作用域仅在 `if` 范围之内。

```go
if i:=1;i>2{
  
}
```

***

defer修饰词

遇到`return `返回

延迟的函数调用被压入一个栈中,满足先进后出的原则

***

指针

```go 
//获取地址
add:=&i
//获取值
i=*add
```



***

对象

很有趣的对象设置方式

```{go
type object struct{
  name string 
  age int
}
someone:=object{}
//some:=object{"swnb",16}
//some:=object{name:"swnb"}
age:=someone.name
```

对象和指针可以等同

```go
type obj struct{
  data string
}
o:=obj{}
data:=o.data
add_o=&o
data=add_o.data
```

***

数组

```go
var a [lens]string
//不建议使用下面的方式填写
a:=[]string{"10","20"}
```

slice切片

```go
a[start:end]//a[start]--a[end-1]
```

*关于数组，强烈建议看看这个[文章](https://studygolang.com/articles/5877)*

关于`...`

```go
func slice(x ...int){
  
}
x:=[]int{1,2,3,4}
slice(x...)
```

range

```go
for i,v:=range arr{
  fmt.Println(i,v)
}
```

通过`—`来避免变量的使用

***

map

通过make生成map

```go
map[string]structname
```



```go
type obj struct{
	name string 
  	age int
}
m:=make(map[string]obj)
m["key"]=obj{name:"zhang"}
```

map

```go
type Vertex struct {
	Lat, Long float64
}

var m = map[string]Vertex{
	"Bell Labs": Vertex{
		40.68433, -74.39967,
	},
	"Google": Vertex{
		37.42202, -122.08408,
	},
}

var m = map[string]Vertex{
	"Bell Labs": {40.68433, -74.39967},
	"Google":    {37.42202, -122.08408},
}

```

```go
delete(m,"key")
ele,ok:=m["key"]
```

***

函数值和闭包

```go
f:=func(){  
}
```

给构造体添加方法

```go
func (v *Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}
```

> *方法接收者* 出现在 `func` 关键字和方法名之间的参数中

 传递指针和值的区别

```go
func (v *Vertex) Abs() {
 	v.Value=12 //修改原本的值
}
func (v Vertex) Abs() {
 	v.Value=12 //不修改原本的值
}
```

***

接口

接口是一组方法的集合

很复杂的实现，讲一些有趣的东西吧

```go
//从写输出的特性
//改写对象的Ｓtring()方法
type a struct{
  name string 
  age int
}

```

io

```go
//Read 用数据填充指定的字节 slice，并且返回填充的字节数和错误信息。 在遇到数据流结尾时，返回 io.EOF 错误。
package main

import (
	"fmt"
	"io"
	"strings"
)

func main() {
	r := strings.NewReader("Hello, Reader!")

	b := make([]byte, 8)
	for {
		n, err := r.Read(b)
		fmt.Printf("n = %v err = %v b = %v\n", n, err, b)
		fmt.Printf("b[:n] = %q\n", b[:n])
		if err == io.EOF {
			break
		}
	}
}
```

***

go

```go
func proce(c chan int){
  var str int
  c<-str
}

c:＝make(chan int)
go proce(c)
z:= <-c
```

***

交叉编译

```shell
 env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build
```
> 	GOOS = linux, darwin, freebsd, windows  
	GOARCH = amd64, 386
	CGO_ENABLED=1,0
	GOROOT_BOOTSTRAP=/usr/local/go/
	GOROOT=/usr/local/go
