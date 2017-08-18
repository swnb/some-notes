#bug和笔记
> ##星期五, 05. 五月 2017 06:09下午 

## 动画效果

##***使用@keyframes来进行动画的书写，使用的技术并不难，但是有些概念需要掌握***
* ##有关position的内容
  * ###第一点position的父元素需要是relative，absolute的位置才是相对于他的，如果他的的父亲元素没有absolute，那么就相对于body建立坐标;
  * ###只有设置了position的元素才能设置z-index;因为position是设置成为脱离文档流的元素，对于对于文档流流元素来说，才有层的概念；

* ##对于position来定义元素的居中对齐，要设置margin为auto;除此之外还要设置元素的left,bottom,right,top.#都为0

***

> ## 5-7-16:59

## 设置动画的暂停和启动：

* jquery就要设置css为`.css("animation-play-state","paused")` 或者设置成为`running`。

  > 我在使用`.addClass(function(){})`的时候出错了，不懂原因。很可能是因为`function(){}`的使用不当导致，以后要注意这个问题;


***

## vue的bug内容：也就是对于动态生成的数组，不会在v-repeat里面增加;

对于这个官方的解释是，如果对数值进行类似`a[index]=value`这样的赋值，那么就会出现类似的效果，还有就是增加数组的length

也是无效的，需要使用一个`vue.set()`函数来实现这个功能;

> angular对于动态生成的元素要使用watch来j监听;

js对于动态生成的元素要实现监听效果，要使用`delegate()`/`on()`等函数;

***

## linux remove

优雅的删除linux软件;

sudo apt-get autoremove --purge package name

***

# 对于模块

chrome V8 解决了速度的问题;

commjs 解决了格式的问题，让他不那么乱

基于上面的两者，就生成了服务端的node.js

* process的两个方法:

  * `process.stdin`(需要启用)

  * `process.stdout`(console.log()的原生写法)

  * `process.argv`(数组)第一个参数是node,第二个是文件绝对地址,后面的是cli的输入;

  * ```javascript
    process.nextTick(callback);
    ```

* npm包

  * package.json生成的文件安装方法

    > 二进制在bin文件下
    >
    > lib放置javaScript文件

    ```json
    {
      'main':'./lib/index.js'
      'name':"唯一的姓名",
      'description':"解释描述"
    }
    ```

    之后还要有README.md再去运行`npm install` 生成依赖环境,node_modules

    注意:如果不想手写,可以自动生成:`npm init`

* util模块

  * `util.inherits(argv,argv)`

  ```javascript
  util.inherits(child,parent);//对象的继承
  //仅仅在parent.prototype的属性才会继承;
  //其他属性不会继承;
  ```

  * util.inspect(Object,'是否显示隐藏信息(boolean)',默认显示两层number,是否显示颜色color(boolean))

    > 一共4个参数;
    >
    > ```javascript
    > util.inspect(new Obj(),true,6,true);
    > ```

  * `util.isArray(Obj);`是否是数组;

  * `util.isFunction(Func);`

  * `util.isObject(Obj);`

***

## events.js模块

```javascript
const events=require("events");
//生成对象
const emitter=new events.EventEmitter();
emitter.on("something",function(argv1,argv2){
  //简单注册;
  console.log(argv1+argvs2);
});
//触发
emitter.emit("something",argv1,argv2);
//执行一次
emitter.once("something",function(){
  console.log("only once");
});
```

> 对于error事件,需要注册:
>
> ```javascript
> var emitter=new events.EventEmitter();
> emitter.on("err",function(err){
>   console.log(err);
> })
> ```
>
> EventEmitter()继承 来实现组件的事件;

***

npm包更新nodejs,

```shell
$ sudo npm install -g n #n是专门node的管理包
$ sudo n stable
```



***

mongodb是文档型的数据库,有独特的数据结构,非关系库,原则,不要老是断开链接;

***

chrome下面的按钮只要简单的`ouline:none`

firefox需要这样写

```css
button::-moz-focus-inner,
input::-moz-focus-inner{
  border:none;
}
```

***

chrome 在处理@keyframe的时候似乎在一个1%只能处理有限的件事件,

***

主机能建立的连接数目与端口号最大值’65535‘(可以改变)无关，与能打开的大文件数目有关，在文件数目上面如果改变就可以实现高数目连接(网卡够好，内存给足)

***

一个`''`是等于false的

这对于

```javascript
var test= (a) => {
  a = a || 1;
  return a
}
test('');
//return 1
```



***

js的基本类型：

number , null , string , boolean , undefined

object(Array,Date,RegExp,Function)

```javascript
var undefined;
undefined == null; // true
1 == true;   // true
2 == true;   // false
0 == false;  // true
0 == '';     // true
NaN == NaN;  // false
[] == false; // true
[] == ![];   // true
```



变量提升和函数提升

```javascript
console.log(a);//undefined,不会报错
var a=1;
console.log(a);//1
//等价下面的语句
var a;
console.log(a);
a=1;
console.log(a);
```

 函数提升有一点不同：

```javascript
a();//throw error
var a=function(){
  console.log(1)
}
a();//1
var a=function(){
console.log(2);
}
a();//2
```

不同之处在于,a的提前声明会报错的，因为这是一个函数;

***函数声明就完全不同了，只有一个函数，没有重写***

但是如果是函数表达式而言：

```javascript
var a=function(){
  console.log(1);
}
a();//1
function a(){
  console.log(2);
}
a();//1
```



***

dconf-tools 一个好用的工具;

***

对于编写的规则，如果 border想要设置成为没有就要设置border-left:0;

不要设置成为none;兼容考虑;

border-radius是有8个值的;

***

原生的方法遍历子节点：childNodes返回一个对象的集合，对于这个对象的集合是一个数组，可以通过原生的forEach函数来遍历这集合，然后在集合中对与这个元素来判断这个元素的名称，例如nodeName，className 或者id来看标签属性。他拥有原生节点的特性;

对于遍历的方法有很多种，比如 nodeType===1来确定他是一个节点元素

而对于动态 生成的 元素需要优化，也就是createFragment()来包含这个元素，因为他的特性，将子孙节点给到页面， 避免重绘.

***

生成随机数：

```javascript
let num=Math.floor(Math.random()*n);
//0-n的整数;
```

***

关于原生js的遍历,document会将节点包括文本节点包括"空格"在内部,然后在遍历的时候会发生错误,所以需要遍历的是使用chidren[n]这样的属性.建议不要使用childnodes这样的属性.所以还是不需要了.

***

### 选择defer还是async

`defer`与`async`的区别是：前者要等到整个页面正常渲染结束，才会执行；后者一旦下载完，渲染引擎就会中断渲染，执行这个脚本以后，再继续渲染。一句话，`defer`是“渲染完再执行”，`async`是“下载完就执行”。另外，如果有多个`defer`脚本，会按照它们在页面出现的顺序加载，而多个`async`脚本是不能保证加载顺序的。

从上面的说法来看，最好选择的是defer而不是async

***

## safar不能同时flex和background-clip

可能是因为-webkit 的问题

***

## for (x in array)

在不设置length的情况下是不遍历length，但是属性是字符串类型。