# WebSocket 

***WebSocket***协议(Http协议的扩展),我们可以通过服务器向客户端发送消息(全双工通信),聊天室基于这个实现;

> 因为IE 10之前的版本不支持，再加上没有成熟的框架，应用层狭窄,所以一直得不到重视

Http协议和WebSocket协议的不同之处：

* Http (无状态协议) : 1个request对应一个response(异步请求):

  ```sequence
  title:http协议模型
  client->>server:request            
  client->>server:request
  server->>client:response
  server->>client:response
  ```

  > 不记得客户端是谁

* WebSocket的替代品:

  * 轮询:定时向服务器发送请求（给服务器带来巨大的负担）：

  ```sequence
  title:轮询模式
  client->>server:Ajax
  server->>client:null
  client->>server:Ajax
  server->>client:Obj
  client->>server:Ajax
  server->>client:已累死
  ```

  * 长连接(http1.1版本)：HTTP请求头中添加一个字段 Connection: Keep-Alive 	(伪轮询)：

  ```sequence
  title:long poll 模型
  client->server:request
  server->server:tcp(hold)
  server->server:data.listen
  server->client:data
  ```

  > timeout设置需要考量
  >
  > 从HTTP/1.1起，默认都开启了Keep-Alive，保持连接特性，简单地说，当一个网页打开完成后，客户端和服务器之间用于传输HTTP数据的TCP连接不会关闭，如果客户端再次访问这个服务器上的网页，会继续使用这一条已经建立的连接;
  >
  > 服务端创建了死循环来监听信息的变化(性能影响)

* WebSocket的模型：一个请求对应多个响应   (没事你别找我，有事我去找你)：

```sequence
title:webSocket
client->nginx:httpRquest
nginx->server:ws
server->client:response
server->client:repsonse
server->client:repsonse
```

> 缺点：中间的路由会中断协议;

我们通过客户端向服务器发送一个消息,之后服务器接受消息,并且向所有客户端发送这个消息,之后消息通过解析,形成聊天室;

我们来看代码:

```javascript
//客户端的代码
var ws=new WebSocket("ws://localhost:3000/talkplace");
ws.onmessage=function(message){
  console.log(message.data);
};
ws.onopen=function(){
  ws.send("hello world");
};+
```

上面的代码在客户端运行,生成监听,当由信息来临的时候,输出信息;

而客户端要向所有的用户传递信息,并且在前端生成所有的信息(自动);

具体的服务端代码如下:

```javascript
//服务端的broadcast(广播);

//创建websocket;
const ws=require("ws");
//创建websocket.server对象;
const wss=new ws.Server();
//监听连接;
wss.on("connection",function(ws){
  console.log('connect from client');
  ws.on("message",function(message){
    //客户端传来的信息;
    console.log(message); 
    //wss.clients 是一个对象,储存了所有的客户的地址
    wss.clients.forEach(function(clients){
    //广播信息出去面向所有的人;
    clients.send(message);
    //如果是单一的连接返回信息;
    //ws.send("message");
    });
  });
});
```

也就是下面的概念:

```sequence
title:聊天模型
client1->>server:发送聊天数据
server->>client1:广播聊天数据
server->>client2:广播聊天数据
server->>client3:广播聊天数据
```

我们还要确认来的人的身份(cookies):

首先要知道cookies是服务器给你的,所以在服务端给客户一个认证信息:

代码如下:

```json
{
  'POST /signin': async (ctx, next) => {
        index ++;
        let name = ctx.request.body.name || '路人甲';
        let user = {
            id: index,
            name: name,
            image: index % 10
        };
        let value = Buffer.from(JSON.stringify(user)).toString('base64');
        console.log(`Set cookie value: ${value}`);
        ctx.cookies.set('name', value);
        ctx.response.redirect('/');
    }
}
```



而对于WebSocket来说，他将连接对象的信息封装在ws上面;



用`util.inspect()`分析:

```json
{
  'ws.upgradeReq':"client"，
  'ws.upgradeReq.headers.cookie':"cookie";
}
```

