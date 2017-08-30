# Rxjs api

```javascript
//多个值
Rx.observable.of('first','second')
//数组
Rx.Observable.from(['first','second'])
//将事件源转成流
Rx.Observable.fromEvent(eventSource,'eventType')
//Promise转换成为流
Rx.Observable.fromPromise(fetch('/user'))
//回调函数,参数是函数名称，成的是一个函数，不是被观察者
Rx.Observable.bindCallback(fs.exists)（path）.subscribe(flag=>{
    console.log(flag)
})
```

