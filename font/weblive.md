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

我们先看他做了什么？

> muxer是指合并文件，即将视频文件、音频文件和字幕文件合并为某一个视频格式。比如把rmvb格式的视频，mp3格式的音频文件以及srt格式的字幕文件，合并成为一个新的mp4或者mkv格式的文件。demuxer是muxer的逆过程，就是把合成的文件中提取出不同的格式文件。

在监听过网页的变化后才对dom操作。





