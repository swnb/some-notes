# request.js

一个js模块

但是有了`curl`，这个玩意的就像高仿品，重要的是心态

```javascript
let request=require('request')
request('http://www.baidu.com',function(err,response,body){})
```

建议`pipe`

```javascript
request(url).pipe(fs.createWriteStream('file'))
```

支持mime Type

post

```javascript
request.post(url,{form:{key:'value'}})
```

