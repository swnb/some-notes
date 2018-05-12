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

文件post

```javascript
let r=request.post('http://localhost.com/upload')
let form=f.form()
form.append('key',fs.createReadStream('./data'))
```

新的模块r2上线了

使用了`promise`进行封装,但是很简单的代码，不需要特别注意！

看看怎么使用

```javascript
const r2 =require('r2')
let data=await r2(url).text

let header={'x-text':'ok'}
let res=await r2(url,{headers}).response
```

