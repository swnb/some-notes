# Rxjs api

### 被观察的数据

#### 转换

```javascript
//单值
Rx.Observable.just('a')
//多个值
Rx.Observable.of('first','second')
//数组
Rx.Observable.from(['first','second'])
//json转成map
Rx.Observable.pairs(['first','second'])
//将事件源转成流
Rx.Observable.fromEvent(eventSource,'eventType')
//Promise转换成为流
Rx.Observable.fromPromise(fetch('/user'))
//回调函数,参数是函数名称，成的是一个函数，不是被观察者
Rx.Observable.bindCallback(fs.exists)（path）.subscribe(flag=>{
    console.log(flag)
})

//时间生成
.interval(1000)
//序列生成
.range(n,count)  //n,n+1,....,n+count-1
//延时周期生成
.timer(firstDelay,afterDelay) //0,1,2,3,4,5,6,7.....
```

#### 生成

```javascript
let subject=new Rx.Subject()
subject.subscribe(d=>console.log(d))
subject.next(10)
```

#### 数据流的控制

```javascript
let e=Rx.Observable.fromEvent(eventSource,'eventType')
e.filter(event=>event,target.value.length>100)
.subscribe(data=>{
    console.log(data)
})
e.switchMap((event)=>Rx.Observable.fromEvent(someevent,'type'))//生成事件流
e.delay(1000) //延时
e.throttleTime(1000) //设置数据流量
e.debounceTime(200) //去抖动
e.take(3)  //触发次数上线
e.takeUntil(stopStream) //某个事件触发流的启动就终止订阅
```

#### 数据流的处理

```javascript
//map 对于每个数据做处理并且返回，但是函数编程的准则就是不要更改外部的值
let a=Rx.Observable.fromEvent(event,'type')
a.map(event=>event.target.value*2)
.subscribe(result=>console.log(result))

a.pluck('attr1','attr2','attr3')	//得到属性值，一个个遍历，真的强大
a.pairwise() 	//一次传输两个流为一个数组，也就是说输出的数据包含前一个数据,强大
a.distinct()	//传输的全部数据被去重，也就是说前面数据会被记录下来
a.distinctUntilChanged() 	//相邻的数据去重
```

### 意义是什么

在一般编程中，一般来说状态都是不被跟踪的，一段代码，输入到输出，整个过程越快越好，所有的数据都是没有必要被跟踪，但是在web里面，情况不一样，有大量的i/o数据流动，人机交互，网络通讯的问题，尤其对于前端，需要大量的状态跟踪，

如果把编程比作处理数据流动的管道，那么函数在编程里就是一个用了就关的管道，原因是函数内部的所有变量在不使用闭包的情况下运行完毕就被回收，那怎么记录函数的状态呢？使用外部变量和闭包来创建不会被清理的变量，记录函数的状态，但是，外部变量被暴露会产生安全问题，大量的闭包又会产生内存泄漏，而且两种都不便于编程，状态的跟踪这种需求对函数编程不友好。

而响应编程就像一个用了不关的管道，管道内部记载了这个管道的状态，每次有数据从管道里里流过都可以查看这些状态，这就是响应编程的核心，观察记录数据的状态，把它用在合理的地方能大大降低开发难度。

### 实质是什么

协程和迭代

rxjs依旧是语法糖，实质上它内部是由协程和迭代的一个结合体

协程编程，一个线程内的函数获得了执行权正在运行，遇到了断点，需要交出控制权，但是现场可以被保留，等待下一次获取控制权再运行，典型的就是**生成器函数**,协程的特点就是现场不会被销毁，所以可以用来记录状态，通过迭代来运行