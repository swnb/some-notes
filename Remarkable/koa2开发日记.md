# koa2开发日记

```javascript
const Koa = require("koa");
const app=new Koa();
```

路由

```javascript
const Koa=require("koa");
const app=new Koa();
const router=require("koa-router")();
//解析post的body;要在router之前注册
const bodyparser=require("koa-bodyparser");
app.use(bodyparser());
//GET
router.get('url.path',async (socket,next)=>{
  	//判断请求的类型
  	cosole.log(socket.request.type);
  	if(socket.request.method="GET"){
    	//get数据
    	var name=socket.request.params.name;
     	//响应响应可以直接写type
     	socket.response.type='text/html;charset=utf8';		  		  socket.reponse.body=`${x}`;
  }
});
//POST
router.post("/url.path",async (socket,next)=>{
	//判断请求方法
  	if (socket.request.method="POST"){
   	 	//post数据,提取要先注册koa-bodyparser;
   	 	var name=socket.request.body.name; 
   		//响应
     	socket.response.type='text/html;charset=utf8';		  socket.response.body=`${x}`;
      	socket.response.body= await fs.create
  	}
})
app.use(router.routes());
app.listen(8080);
```

## Nunjucks模板

还是使用vue之类的模板,react之类的吧;

***

## WebSocket协议

在这之前, 服务器是没办法主动跟客户端打交道的,之前使用的方法有两种:

* 轮询(客户端定时发送请求)

  > 不灵活,还会给服务器压力,,不符合设计要求(减少http请求数目)

* Comet(长连接)

  > 以多线程模式运行的服务器会让大部分线程大部分时间都处于挂起状态，极大地浪费服务器资源。另外，一个HTTP连接在长时间没有数据传输的情况下，链路上的任何一个网关都可能关闭这个连接，而网关是我们不可控的，这就要求Comet连接必须定期发一些ping数据表示连接“正常工作”。

在这种背景下诞生了websocket;

我会在一个月内完成关于websocket实现一个聊天室的桌面应用;

详细见WebSocket的文章;

***

## 关于restful的问题,通过url和响应头部的信息实现一些功能

对于响应的头设置成为`application/json`,然后response一个json数据,对于js来说就可以机器解析,并显示在页面上成为json格式,这跟原本的html解析是不同的

***

[关于后端跨域和koa_cros](http://www.haorooms.com/post/input_file_leixing)

[js获取上传的文件](http://www.2cto.com/kf/201310/252484.html)	

[一个成功的案例](http://www.jianshu.com/p/e9ce78270860)

[co-busbodyn部分](www.baidu.com)

[koa的好的总结](http://www.tuicool.com/articles/UBzANv)

***

## 对于使用fomdata传输的数据,需要使用具体的模块来解析:

## 这里推荐一个好的模块来使用multiparty模块和formidable

> 但是上面 的模块i还是有问题.因为没 办法和 koa框架结合i起来

经过推荐,最后选择了下面的框架;koa-multer,只是我还不理解;

代码如下:

```javascript
	import multer from ‘koa-multer
    const upload = multer({dest: ‘上传文件的临时路径，改成自己的’})
    router.post(’/upload, upload.single(‘filename’), async (ctx) {
    //originalname 文件名称，path上传后文件的临时路径，mimetype文件类型
    		const {originalname, path, mimetype} = 							ctx.req.file;
    	//之后可以对文件进行上出上传到七牛等操作，完成操作后
    		fs.unlink(path)//删除文件
    })
    //要注意filename要和前端的表单元素的name一致

```

 一定要看 [ 重点](https://stackoverflow.com/questions/31530200/node-multer-unexpected-field)

还是使用

***

## 终于明白了,koa的req是原生的node的request,而他的request是全写;还有不要乱写head,使用mime模块的lookup 来 确认模块

***

### 在koa框架里面封装了流 的方法,所以不需要再 写入流的问题,只要设置好头部信息

```javascript
ctx.body=fs.createReadStream('./');
```



