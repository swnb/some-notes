# 数据的传输

我们知道前端传输数据一般两种方法->get,post
>  get ->url/?key=value&key=value
>
>  post ->body 



实际上post有两种方式传输,当在表单加入enctype(encode type),如果是`x-www-form-urlencoded` 之后,所有body的数据呈现url的编码key-value,当是multipart/formdata时候,编码改变

> 前者适合小数据
>
> 后者大数据传输



```go
form=r.ParseForm()
form.Form   //所有的
form.PostForm //单纯表单数据,包含get post 但是url的数据和其他请求不可接受
form.Multipart //特殊的编码解析的大数据,上面提到过
```



> 当你使用Multipart时候,需要加入ParseMultipartForm(1024)提供解析的字节

对于上面的来说,一般情况下一个key对应一个value

但是r.Form可以有多个value,但你使用url和form一起传数据,可以看到,



***

好用的r.FormValue(key)与r.form[key]不同,前者只有单一的结果(多个值的第一个),不会多个值.

同样r.PostFormValue返回表单的数据



***

当需要 上传文件时,除了前端设置enctype之外还有

input ->type='file'



后端使用

file,_,err=r.FormFile(key)