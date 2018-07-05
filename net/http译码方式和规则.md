# http 译码方式和规则

一般的 post 都会在头部写入:

Content-Type : application/x-www-form-urlencoded

但是这种方式没法上传文件和图片，所以有了 Content-Type : multipart/form-data

这需要在 form 便签内部添加 enctype = " multipart / form-data "

这样就可以实现这样传递;

```html
<input type="file" multiple="multiple">
<!--表示可以多选-->
```

在 node 端可以这样写

[formidable 的链接在这里](https://www.npmjs.com/package/formidable)

```````javascript
const formidable=require("formidable");
const form=new formidable.IncomingForm();
const path=require("path");
form.encoding='utf-8';
form.uploadDir=path.reslove('./tmp');
form.keepExtensions = true; //保留后缀
form.maxFieldsSize = 3 * 1024 * 1024;
form.parse(request,function(err,fields,files){
  //更改他的名字
})
``````javascript
const formidable=require("formidable");
const form=new formidable.IncomingForm();
const path=require("path");
form.encoding='utf-8';
form.uploadDir=path.reslove('./tmp');
form.keepExtensions = true; //保留后缀
form.maxFieldsSize = 3 * 1024 * 1024;
form.parse(request,function(err,fields,files){
  //更改他的名字
})
```````
