# node 原生的 http

node 原生的 http 还是能实现一部分的需求的，我今天遇到了很多问题，可以总结下 node 的 http 模块

```javascript
const http = require("http");
let server1 = htpp
    .createServer(function(request, response) {
        var method = request.method;
        var pathname = url.parse(request.url).pathname;
        response.writeHead(200, {
            "content-type": "text/plain",
            "access-control-allow-origin": "*"
        });
        response.write("xxx");
        response.end("strng");
        fs.createReadStream("./index.html", "utf-8").pipe(response);
    })
    .listen(80);
```
