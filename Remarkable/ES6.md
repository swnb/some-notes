# ES6

const var let

```javascript
var can be defined
let donot change the var outof  function()
let c=1;
function change (){ let c=2}
change();
console.log(c);//c=1;  c still equal 1
vm.$set()和Vue.set(),listen change array 
```



学习let声明变量let需要新版本的node支持;

```javascript
var a=[];
for (var i = 0;i < 10;i++){
  a[i]=function(){
    console.log(i);
  }
}
a[6];//9
```

解决办法有一种,如下,使用立即函数:

```javascript
function createFuncArray(){
  var a=[];
  for (var i = 0;i < 10;i++){
    a[i]=(function(c){		 //当前立即执行,立即函数的特性
      return function(c){
        console.log(c);
      }
    })(i);
  }
  return a;
}
createFuncArray()[6]();//6
```

> 这是因为函数的编程,所以作用域基于函数,而不是{ }
> 详细看下面的例子

```javascript
var a=function(){
  if (true){
    var inside="inside";
  }
  console.log(inside);//"inside"
}
```

> 这是因为 if 和 for 虽然会在内部产生大括号,但是不会产生额外的作用域,所以之后的console.log能正确的输出变量;

## 在es6后产生了 const 和 let 这样的声明,他们的出现修正了函数式编程的问题

在这之前,javascript只有两作用域,一个是函数作用域,一个是全局作用域;

现在let和const产生了块级作用域;

```javascript
var a=[];
for (let i = 0;i < 10;i++){
  a[i]=function(){
    console.log(i);
  }
}
a[6]();//6
```

> 上述的代码会正确的表达编程思想;
>
> 每次生成的i都是新的;这是因为每次语句执行后都会销毁变量;
>
> 但是i是根据之前的值计算出来的,这是引擎的问题,引擎会记录前面的值;

另外一个需要注意的是

```javascript
for (let i = 0;i < 3;i++) {
  i=4;
  console.log(i);//内部是新的子域
}
//这个代码会正确的循环三次,因为内部的i和for的i不同
```

> let生成的变量不是window(全局)的属性;

模板式生成;

```javascript
let [x ='a', ,y='c'] = [1,2,3];
console.log( x , y ); //1 3
let [x='b', ,y = x ]=new Set(['a','b','c']);
console.log( x , y );//'a' 'c' 
```

> 模板的输出对于可迭代对象都是可以的;

***

async 函数是什么？一句话，它就是 Generator 函数的语法糖。

***

明确值传递和地址传递：

```javascript
function test(obj){
  obj.name='name';
  obj=new Object();
  obj.name="new name";
}
var O=new Object();
test(O);
console.log(O.name);
//不会输出new 会输出name，因为实际上因为function内部只是地址而已，所以第二次赋值过去的时候是地址，，把obj重新赋值了;
```

***

### 字符串，数组，对象遍历可以直接使用`var i of  a`

```javascript
var strings="strings"; 
var index=0;
var n=new Number;
strings.includes('string'，index);//开始查找的值;
strings.startsWidth('string',index);
strings.endsWidth('string',index);
string.repeat(n);//类似python的
//'string'*number; 
```

string的模板写法

```javascript
var a='string';
console.log(`hello world ${a}`);
```

***

## 正则篇

对于与正则对象，es6也有了新的扩展：

```javascript
var r=/^[ab]{3,4}(.*)?\b.+?\[$/i;
r=new RegExp(/[xyz](.*)?/i);
//Es6新的扩展
r=new RegExp(/abc/ig,'i').flags;
```

对于字符串来说，实现的方法有4种：

```javascript
string.match(new RegExp(/[abc]+?c/));
string.replace();
string.search();
string.split();
```

***

## 数值的扩展

8进制和2进制;

8进制需要使用0o123(0o这样的后缀);

2进制用0b123(0b这样的后缀);

后面的字母可以大写;

> parseInt和parseFloat的方法放在了Number里面;

```javascript
Number('0o123');//转换成为10进制;
Number.parseInt('12.5'); //变整数;
Number.isInteger(10);//输入的必须是数字，字符串会报错;
```

***

## 数组的扩展

Array.form(obj)(特性):

```javascript
let obj={
  '0':'a',
  '1':'b',
  '2':'c',
  length:3
}
let a=Array.from(obj);
// 把一个类数组对象生成为一个数组
console.log(a);//['a','b','c']
```

应用层面：

```javascript
var arrayLike=document.querySelectorAll('p');//这是一个类似数组的对象;
let a=Array.from(arrayLike);
a.forEach(function(i){
 	console.log(a.firstChild.nodeValue);
})
```

> Array.from(new Set(array));
>
> 上面的方法对于set也是可以生效的;
>
> 因为这个方法对于可以迭代的对象都是有效的;

### 神奇的运算符：

```javascript
[...document.querySelectorAll('p')];
//上面的运算可以代替Array.from()函数;
//中括号和3个点不要忘记;
//真的神奇，但是要注意×××他是需要接口的，别用他×××
```

Array的真谛：

```javascript
Array.form({length:3});
//[undefined,undefined,undefined]
//Array.from针对的是属性里面有length的值的对象;
```

## Array.from的用法：

第二个参数：

```javascript
Array.from(arrayLike, x => x*x)
//该方法类似map，直接将放回的值放入数组;
//现在认识到了array的强大之处;
Array.from(['a','b',,,,,c],x => x || 0);
//能想起来么这个写法;
```

## Array.of

Array.of()可以替代 Array()和new Array()来生成数组：

```javascript
Array.of('a','b','c');
//return ['a','b','c']
```

### indexOf() 和 includes()

icludes()更加好用;

3个数组的属性

* items.keys()

> 返回一个可以迭代的数组;

* items.values()


* items.entries()

es6可以遍历出空位：

```javascript
0 in [undefined,undefined,undefined]//true
0 in [,,,]//false
//上面的需要注意
```

 ***

## 函数的扩展

 函数没有默认值，es5要实现的需要一些套路：

> ### func . call(obj,var 1,var 2);
>
> ### func . apply(obj,[var 1,var 2,var 3]);

call和apply都会直接执行一次函数;

> ```javascript
> function a(){
>
> 	console.log(this.id);
>
> }
>
> a.call({'id':1});//1
> ```
>
> 

```javascript
function(a,b){
  a=a||'hello';
  b=b||"world";
  console.log(a,b);//hello world;
  console.log(a+b);//helloworld;
}
```

上面的函数有缺点：

如果输入""那么判断成为false，那么输出依旧是默认的值，所以稍微修改一下：

```javascript
if (typeof a=='undefined'){
  a='hello'
}
```

而es6有了默认的值：

```javascript
function (a='hello',b='world'){
  console.log(a,b);
}
```

使用上面的方式需要注意：

```javascript
var p=1;
function(a = p + 1){
  console.log(a);//这个值会在每次调用的时候随p变化而变化;
  //不能再声明参数了！
  let a=1;//error
  const a=1;//error
}
```

es6可以对解析函数进行解析

```javascript
function( {x = 1,y = 2} = {x : 1 , y : 2} ){
	//上面的输入，没有参数，那么输入{1 ， 2};
  	//输入{}那就设x,y为1,2;
  	console.log(x,y);
}
```

## rest参数

```javascript
var a=(...a) => {
  a.forEach(function(a){
    console.log(a);
  });
};
// 传入多个参数变成一个数组在内部调用
```

rest的反运算

```javascript
var x=[];
var a=(...a)=>{
  x.push(...a);
}
a(1,2,3,4,5)
//内部的...运算方式将a进行了相反的运算;将参数传入x里面;（方便）
```

> 在没有rest运算的时候，实现他的功能要这样
>
> ```javascript
> var a=(a,b,c)=>{
>  //ES5
> }
> a.call(null,1,2,3);//不方便啊
> //或者
> var b = [1 , 2 , 3];
> b.apply(null,b);
> ```

### rest运算可以将`document.querySelectorALL('p')`转换成为一个数组

> 但是rest对于没有iterator接口的对象是没法实现，例如
>
> ```javascript
> var a={
>   '0':'a',
>   '1','b',
>   '2','c',
>   length:3
> }
> //只能用Array.from(a);实现这种方式
> Array.from(a);//Array.from()函数对于有length的对象才是有效的，，不要忘记了;
> ```

### 箭头函数

有几点要注意的关于箭头函数：

* 箭头函数没办法使用new

* 箭头函数没办法使用yield

* 箭头函数没有this，也没法用call或者apply来添加this

  > ```javascript
  > function f(){
  >   return () => {
  >     return () => {
  >       return () => {
  >         console.log('id',this,id);
  >       }
  >     }
  >   }
  > }
  > var foo=f.call({'id':1});
  > //箭头函数是没有this对象的，他只能指向最外层
  > foo.call({'id':2})()();//id=1
  > foo().call({'id':3})();//id=1
  > foo()().call({'id':4})//id=1
  > ```



这是箭头函数最大的应用层面：

解决this的问题;

#### 箭头函数的应用层

管道（pipe）：

```javascript
const a => a*a => 
```

***

## class和extends

在extends里面如果要实现constructor的this调用需要

使用super函数,举例

```javascript
class old{
  constructor(x,y){
    this.x=x;
    this.y=y;
  }
}
class n{
	constructor(x,y,color){
		super(x,y)//实例化原型的x,y参数,所以->不使用super,不能调用this
        this.color=color;
    }
}
```

>### super()等价于A.prototype.constructor.call(this)

这个是重点,有助于理解super这个值



