# async和await

实现上面es7的写法需要用到promise和yield

先写一个async的函数

```javascript
let promise=new Promise(resolve=>{
  setTimeout(()=>{
    resolve(1)
  },0);
});
async function gen(){
  let z= await promise;
  console.log(z);
}
```

先实现一下`async` 和`await` 作用

```javascript
let promise=new Promise(resolve=>{
  setTimeout(()=>{
    resolve(1)
  },0)
});
function * gen(){
  let z= yield promise;
  console.log(z);
}
//得到一个迭代对象
let it=gen();
//到第一个断点
it.next();
//运行并在
promise.then((data)=>{
  it.next(data);
});
```

因为async和await是操作符,不能模拟,我们用函数的形式进行模拟

```javascript
function co();
```



一般的async的写法类似上面,我们先定义一个promise对象作为测试

```javascript
let promise=new Promise(resolve=>{
  setTimeout(()=>{
    resolve('timeout')
  },1000);
})
```

然后实现await方法

```javascript

```

