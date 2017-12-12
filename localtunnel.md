# localtunnel 研究

内网穿透是http协议的痛点，如何实现内网穿透。下面我给一些思路：

* 建立TCP长连接
* 建立http2连接
* websocket
* server-send

下面我主要研究下`localtunnel`的架构来学习这项技术。

目录

```tree
./
├── bin
│   └── client
├── client.js
├── History.md
├── lib
│   ├── HeaderHostTransformer.js
│   ├── TunnelCluster.js
│   └── Tunnel.js
├── package.json
├── README.md
└── test
    └── index.js

3 directories, 9 files
```

核心的js代码如下

```javascript
	var net=require('net')    
    ...
	//TunnelCluster.prototype.__proto__ = EventEmitter.prototype;
	...
	var remote = net.connect({
        host: remote_host,
        port: remote_port
    });

    remote.setKeepAlive(true);
```

可以看到，`localtunnel`还是使用了net这个node库来实现自己的TCP连接，之后以事件驱动的形式进行数据的交互和监听。