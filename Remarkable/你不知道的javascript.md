# 你不知道的JavaScript

## 编译原理

JavaScript是一门编译语言

编译执行的过程需要3个东西来参加：

* 编译
* 作用域
* 引擎（V8）

首先一个变量声明：

```javascript
var a = 10;
```

这个过程会发生什么

首先编译来读取到var a, 编译向作用域询问这个变量的存在;没有就要求他生成一个变量，之后编译完成，交给引擎去执行，引擎执行时先向作用域索取这个变量，如果没有就报错，有才会执行：

```sequence
title:编译模型
code->compile:开始编译
compile->scope:查询变量
scope->scope:检查/创建
scope->compile:回馈结果
compile->compile:编译得到结果
compile->engine:将编译结果传递给引擎
engine->engine:解释
engine->scope: LHS 和 RHS 查询
scope->engine:变量位置/值
engine->end:输出
```

对于作用域的问题还是需要认真的研究(this)

这个作用域指向调用它的对象，这个对象就是调用栈的函数：

明确3个要点，首先call和apply会将这个函数直接执行，所以最好还是针对这个对象使用bind来确定他的作用域，之后再调用;

new会在之后再处理这个函数，绑定他的作用域，所以在new之下之前的bind都是无效的;

```javascript
function foo(name){
  this.name=name
}
var obj={}
var bar=foo.bind(obj);
var x=new bar('zhang');
//上面的代码没办法绑定的原因就是在于new会覆盖掉原本的绑定;
console.log(obj.name);//undefined
console.log(x.name);//zhang
```

箭头函数的用法和this有很重要的联系，所以根据这个，要明确：

在箭头函数里面是没办法绑定this的，比如：

```javascript
function foo(){
  return ()=>console.log(this.name);
}
var a={
  name:'zhang'
}
var b={
  name："yuwei"
}
var foo1 = foo.call(a);
foo1.call(b);//zhang
// 上面的代码输出的不是a的name，因为箭头函数师妹右this的，所以没办法进行绑定;
```

### 浅复制和深复制

实现深复制的方法有一个是最好用的：

```javascript
var copy=function(obj){
  //使用字符串来传递
  return JSON.parse(JSON.stringify(obj))
}
```

浅复制的方法很多，也很一般：

```javascript
Object.assign({},obj);
```

### 属性描述符：

es6新增加的描述符：

```javascript
Object.getOwnPropertyDescriptor(Obj,.attr);
Object.definedProperty(obj,attr,{
  value:'',
  writable:true,
  configurable:true,
  enumerable:true//是否出现在for 。。。 in的属性的枚举里面
})
```

设置getter和setter的方法有很多种，实现主要提两种：

```javascript
Object.definedProperty(obj,attr,{
  configurable:true,
  enumerable:true,//如果你要设置这两个get,set属性就不能设置value和writable;切记住;
  get:function(){
    console.log('you are getting this value');
    return this.a;
  },
  set：function(val){
    console.log('you are setting this value');
    this.a=val;
  }
})
```

另外一种：

```javascript
var a={
  get b(){
    console.log('get this value');
    return this.b;
  },
  set b(value){
    console.log('set this value');
    this.b=value;
  }
}
a.b;	//输出的是这个属性的值
a.b=1;	//输出赋值的过程q
```

多重继承会有很多麻烦，javascript 本身没办法实现这样的功能，这是一件好事，所以要实现这样的方法需要prototype，也就是说通过原型继承来实现这种方法。

```javascript
function extent(sourse,,target){
  for (var key in sourse){
	if (!(key in target)){
		target[key]=sourse[key];
    }
  }
}
//这样来实现继承的方式，很简单粗暴;
```

对于Object.create()来说,避免了原型链的问题;

```javascript
var a=function(x){
  this.x=x;
}
a.prototype.c=function(){console.log('prototype')};
var d=Object.create(a);
d.c();//这个会报错，因为没有原型链继承e的问题;
```

