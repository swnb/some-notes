# 神编程 rx.js 响应编程



## rx初探

#### 一般类型

* Observable
* Observer
* Subscription
* Operators
* Subject
* Schedulers

观察者

```javascript
const rx=require('rx)
rx.Observable.fromEvent(eventSource,'eventType')
.subscribe(()=>{
    console.log('event end')
})
```

rx能实现强大的函数编程语法
```javascript
const rx=require('rx)
rx.Observable.fromEvent(eventSource,'eventType')
.scan(count=>count+1,1)
.subscribe(count=>{
    console.log(count)
})
```
上面的count是内部的变量，仅仅是这个函数就让我成了RX的死粉，提升编程的简易程度
比如一个toggle的实现
```javascript
const rx=require('rx)
rx.Observable.fromEvent(eventSource,'eventType')
.scan(swit=>!swit,true)
.subscribe(swit=>{
    console.log(swit?'true':'false')
})
```
flow操作符号
* filter

* delay

* debounceTime

* take

* takeUntil

* distinct

* distinctUnitilChanged

  ​

## Observable 发布者

PUSH模式

```javascript
Rx.Observable.create(subscribe => {
    subscribe.next(1)
    subscribe.next(2)
    subscribe.complete()
}).subscribe(data => {
    console.log(data)
})
```

#### Push VS Pull

函数是拉(pull)的模式，数据被被动的拉取，Promise是推(push)的模式,数据被推送

Observable是同步的，不是异步，如果编写的过程加入异步，它才会异步

在函数里面，return是函数的终结，只能return一个单一的值，但是响应编程可以远远不断的推送数据，就像一个源源不断传输数据的管道，函数就像用了就关闭的管道

#### 生成，发布，订阅，取消

生成 =>

`let ob=create()`

发布 =>

3个事件，其中error和complete只执行一次

订阅=>

`let sbuscription=ob.subscribe(data=>{console.log(data)})`

取消订阅，但是只是中断了管道（中断了数据的传输）=>

`scription.unsubscribe()`



## Observer 观察者

同样是`observable`生成的

`observable.subscribe()`生成的观察者（订阅者）

什么是被观察者

```javascript
let observer={
    next:x=>console.log('Observer got a value '+x),
  	error:err=>console.log(err),
  	complete(){console.log('end')}
}
```

怎么观察

```javascript
Observable.subscribe(Obeserver)
```

