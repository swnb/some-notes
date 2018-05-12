# 上传文件的过程

首先后端使用什么？

我的选择是`koa`，使用了`koa-body`进行了上传的实现，但是文件的名称是个`hash字符串`

所以我需要分析这个过程，并处理它

当使用requestjs时

传入的是一个对象

```javascript
{
    'key1':{
        name:'',
        path:''
    },
    'key2':{
        name:'',
        path:''
    }
}
```



前端的页面是`input[type='file']`时

input有`files`属性

files[0]是文件，files[0].name是文件名

在formdata里面使用`append(key,value)）`来添加这个东西，这个很重要！

后面就用fetch去传送

但是fetch没有数据的传输过程，也就是progress没法检测，只能用其他方法

