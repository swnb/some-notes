# web直播

###  先研究下ffmep这个比较好的直播项目，通过websocket来进行数据的转接。

在server端没什么好研究的，只是作为数据的转接，实现数据的推送,核心代码

```javascript
let server=new require('ws').Server({port:80,perMessageDeflate: false});
server.broadcast=data=>{
  server.clients.forEach(client=>{
    client.readyState===require('ws').OPEN?client.send(data):void 0;
    
  })
}


....http...

request.on('data', function(data){
		socketServer.broadcast(data);
		if (request.socket.recording) {
			request.socket.recording.write(data);
		}
	});
```



主要是客户端的处理和解码，这个需要好好的研究一下。

目录结构

```tree
./src/
├── ajax.js
├── ajax-progressive.js
├── buffer.js
├── canvas2d.js
├── decoder.js
├── jsmpeg.js
├── mp2.js
├── mpeg1.js
├── player.js
├── ts.js
├── video-element.js
├── webaudio.js
├── webgl.js
└── websocket.js
```



我们先看他做了什么？

> muxer是指合并文件，即将视频文件、音频文件和字幕文件合并为某一个视频格式。比如把rmvb格式的视频，mp3格式的音频文件以及srt格式的字幕文件，合并成为一个新的mp4或者mkv格式的文件。demuxer是muxer的逆过程，就是把合成的文件中提取出不同的格式文件。

在监听过网页的变化后才对dom操作。

```javascript
document.readyState==='complete'?
  func():
document.addEventListener('DOMContentLoaded',()=>{]})
```

代码在`video-element`的文件里面，具体的实现：

* 通过`dataset`属性来获取`data-url`

* 对容器设置属性，添加`canvas`

  >  addStyles(this.canvas, {
  >
  > ​            display: 'block',
  >
  > ​            width: '100%'
  >
  > ​        });

  生成对象

  ```javascript
  // Parse the data-options - we try to decode the values as json. This way
          // we can get proper boolean and number values. If JSON.parse() fails,
          // treat it as a string.
          var options = { canvas: this.canvas };
          for (var option in element.dataset) {
              try {
                  options[option] = JSON.parse(element.dataset[option]);
              } catch (err) {
                  options[option] = element.dataset[option];
              }
          }
  ```

  ​

  > ​        this.player = new JSMpeg.Player(url, options);
  >
  > ​        element.playerInstance = this.player;

* 之后处理`player`对象

  player对象对于不同协议做兼容

   > if (options.source) {
   >
   >​            this.source = new options.source(url, options);
   >
   >​            options.streaming = !!this.source.streaming;
   >
   >​        } else if (url.match(/^wss?:\/\//)) {
   >
   >​            this.source = new JSMpeg.Source.WebSocket(url, options);
   >
   >​            options.streaming = true;
   >
   >​        } else if (options.progressive !== false) {
   >
   >​            this.source = new JSMpeg.Source.AjaxProgressive(url, options);
   >
   >​            options.streaming = false;
   >
   >​        } else {
   >
   >​            this.source = new JSMpeg.Source.Ajax(url, options);
   >
   >​            options.streaming = false;
   >
   >​        }

  对于上面的只看`websocket`

  他使用了这样的代码

  ```javascript
  WSSource.prototype.connect = function(destination) {
  	this.destination = destination;
  };
  WSSource.prototype.onMessage = function(ev) {
  	if (this.destination) {
  		this.destination.write(ev.data);
  	}
  };
  ```

  ​

* 提取文件信息

  ```javascript
  this.demuxer = new JSMpeg.Demuxer.TS(options);
          this.source.connect(this.demuxer);
  ```

  ​