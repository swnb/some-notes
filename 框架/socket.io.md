# socket.io study

[socket.io](https://socket.io/)

socket.io不是真正的`websocket`

它是一种`webscoket`的变体,也就是自己封装`websocket`

```javascript
//没有区别
const server =app.listen(port)
const server=require('http').createServer(app)
```

客户端和服务端

```javascript
//server
const io=require('socket.io')
//client
const io=require('socket.io-client')
```

回调

```javascript
//client
<script>
  var socket = io(); // TIP: io() with no args does auto-discovery
  socket.on('connect', function () { // TIP: you can avoid listening on `connect` and listen on events directly too!
    socket.emit('ferret', 'tobi', function (data) {
      console.log(data); // data will be 'woot'
    });
  });
</script>
//server   

var io = require('socket.io')(80);

io.on('connection', function (socket) {
  socket.on('ferret', function (name, fn) {
    fn('woot');
  });
});
      
```

分房间

```javascript
//server
var io = require('socket.io')(80);
var chat = io
  .of('/chat')
  .on('connection', function (socket) {
    socket.emit('a message', {
        that: 'only'
      , '/chat': 'will get'
    });
    chat.emit('a message', {
        everyone: 'in'
      , '/chat': 'will get'
    });
  });

var news = io
  .of('/news')
  .on('connection', function (socket) {
    socket.emit('item', { news: 'item' });
  });
//client
<script>
  var chat = io.connect('http://localhost/chat')
    , news = io.connect('http://localhost/news');
  
  chat.on('connect', function () {
    chat.emit('hi!');
  });
  
  news.on('news', function () {
    news.emit('woot');
  });
</script>
```

除了自己之外的广播

```javascript
var io = require('socket.io')(80);

io.on('connection', function (socket) {
  socket.broadcast.emit('user connected');
}); 
```

