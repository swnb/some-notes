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

​	