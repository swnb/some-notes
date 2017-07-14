# Vue

***

## vue的data和methods都是可以直接调用或者this内部引用

***

对于父子组件

先生成,后通过props控制

```html
<hello	v-bind:pro='message'>
</hello>
<script>
Vue.component('hello',{
  props:['pro'],       			//类似react的props来传递属性,否则父亲组件不能控制儿子组件
  template:"<p>{{pro.text}}</p>"
});

let vm=new Vue({
  el:"hello", 					//控制儿子组件
  data:{
    message:{
      text:'hello world'
    }
  }
});
</script>
```



***

## 计算属性和computed之间的对比

```html
<div>
  {{message}} 
  {{message.split('').reverse().join('')}}
  {{reverseMessage}}  <!-- computed的函数也是可以直接用的-->
</div>
<script>	
  let vm=new Vue({
    el:'div',
    data:{
      message:'a',
    },
    computed:{
      reverseMessage:function(){
        return this.message.split('').reverse().join('');
      }
    }
  });
  let numstart=vm.message.charCodeAt(1);
  setInterval(()=>{
    numstart++;
  	vm.message+=String.fromCharCode(numstart); 
  });
  //记住这两个api 一个是     'abc'.charCodeAt(index)
  //另一个是			String.fromCharCode(num);
</script>

```



> computed  很好用 建议

***

## computed 和 methods对比

建议使用computed

### methods在渲染的时候会更新

### computed只跟据内部的this.$data内的变量变化才变化,可以理解成为缓存

## 如果不需要缓存就使用methods,需要性能优化就使用computed

***

## watch和computed的对比

## watch的写法可能有些奇怪,需要注意

```javascript
let vm=new Vue({
  data:{
    message:'hello world'
  },
  watch:{
    //这里很反常,因为他不符合对于js的正常写法,这里的message不是函数名而是data的message,记住他的特别
    message:function(newval){   
		message+=1;
    }
  }
});
```

## 建议使用computed直接变换计算

***

## computed的setter和getter

## 类似Object.defineProperty

```javascript	
computed:{
									//和watch一样
  message:{
	get:function(){
      
	},
	set:function(){
    
	}
	}
}
```

***

## watch或者vm.$watch配合loadsh的_.debounce(去抖动)和axios可以实现很好异步模块,不举例了

***

## class | style和vue

### 对象语法

```html
<head>
  <style>
 	.active{
		width:20px;
      	height:20px;
  	}
  </style>
</head>
<hello v-bind:class='{active:isactive,}'></hello>
<hain v-bind:class='classObject'></hai>
<script>
new Vue({
  el:'hello',
  data:{
	isactive:true   			//通过true 或者false实现class是否add
  },
})
</script>

//直接使用对象
<script>
  new Vue({
  el:'hai',
  data:{
	classObject:{
      active:true,   			//vue的语法还是有点颠覆,这里active不是true;
      hide:false				//通过true 或者false实现class是否add	
    }   					 	
  },
})
</script>

```

>简洁,方便控制

***

### 数组语法

```html
<hello   v--bind:class='[hide,show]'>

</hello>
<script>
data:{
  hide:'show',
  show:"hide"
}
</script>
```

***

## 上面的class或者style还可以跟computed一起使用,这里不介绍,自己脑补

***

## style的语法也有数组和对象,这里只以对象举例

```html
<hello v-bind:style="{fontSize:x}"></hello>   
<!-- 
和js的style的属性一样,驼峰命名->fontSize
可以使用-写,但是要加引号 ->'font-size'
-->
<!-- 
数据就这么写
data:{ 
	x:'red'
}
-->
```

> Vue的style会自动加前缀,注意这个点

## 这里还是要提一下,从软件开发的角度,分离才是重点(便于维护),将控制(v-on:click='func'),样式(v-bind:style='')等写入html的dom里面是不合适的,但是vue其实最终渲染还是将他们放在了viewmodel里面,而且这样写其实是有利于观察页面的,所以不要担心   (强行解释一波)

***

## V-if 和 V-for

### 先介绍v-if

> 先看 v-if, 举个使用的例子

```html
<template v-if=' swi==="a" '>
  <p>hai</p>
</template>
<template v-else-if=' swi==="b" '>
  <p>hi</p>
</template>
<template v-else>
  <p>hello</p>
 </template>
<!--这里是v-show例子-->
<p v-show='swi' >hello world</p>

<!--data 数据层 这里简写-->
data:{
	char:'a',
	swi:true
}

```

## 我们总结下 v-if 和 v-show 的 知识点

* ## v-if  . v-else 推荐和template 标签一起使用 而且 v-if 必须和v-else-if和v-else紧靠在一起,不然无效

* ## v-if  会移除或重新渲染dom元素,性能耗费大于 v-show . v-show只是单纯的设置display:none; .建议如果需要频繁显示和消失使用v-show, 但是v-show不在意是否初始条件是否是真,他都会渲染,然后更改css,v-if则不是这样的,所以v-show有更高的初始化成本.

* ## v-show是不支持template标签,也不支持v-else

* ## v-for 的优先级高于v-if

* ## v-if是智能的,这是vue的优化处理,他不会重新渲染可重复的组件,下面我举例说明

  > ```html
  >
  > <div>
  >   	<template  v-if='swi'>
  >   		<input type='text' placeholder='enter you name'>
  > 	</template>
  > 	<template v-else>
  >   		<input type='text' placeholder='enter your passwd'>
  > 	</template>
  > <div>
  >
  >   <!--data -->
  >  data:{
  >    swi:true
  >  }
  > ```
  >
  > ## 上面的例子,input标签是不会重绘的,只是修改placeholder,因为他被认为是可以复用的

* ## 如果需要更新可复用组件,需要设置key属性,如果key值不同,vue就更新组件

  > ```html
  > <div>
  >   	<template  v-if='swi'>
  >   		<input type='text' placeholder='enter you name' key='username'>
  > 	</template>
  > 	<template v-else>
  >   		<input type='text' placeholder='enter your passwd' key='passwd'>
  > 	</template>
  > <div>
  >
  >   <!--data -->
  >  data:{
  >    swi:true
  >  }
  > ```

### 下面介绍v-for

> 举个例子

```html
<template v-for='(value,key,index) in items'>
  <p>{{value}}{{key}}{{index}}</p>
</template>

<!-- data  自己尝试下-->
data:{
  items:{
		a:'1',
		b:'2',
		c:'3'
	}
}

<!--v-for 可以实现对于对象的优化迭代-->

v-for='v in items'

<!--直接将值迭代出来-->

v-for='(v,k) in items'

<!--值与键值迭代-->

v-for='(v,k,i) in items'

<!--完全迭代:值,键值,位置-->
```

### v-for可以像python一样输出有序整数

```javascript
v-for='n in 100'   //n迭代1-100数字
```

### v- for在最新版本和组件一起使用的时候需要加入key的属性

```javascript
v- for="i in items":key='i.id'  //key应该是唯一的,后面组件讲解
```

### v-for在迭代数组的时候需要注意一些问题

​	数组的动态更新只在对数组进行pop(),shift()等方法的时候才有

​	换种方法说			

> ```javascript
> data:{
>   a:[1,2,3,4,5]
> }
>
> vm.a[10]=12;//这个不会更新数组的
> ```

​									

***

## v-on

v-on用于事件绑定

看例子

```html
<button v-on:click='func'></button>

<!-- methods -->
methods:{
  func:(){
	console.log('click')
}
}
```

可以在函数传输参数

```html
<button v-on:click='func("hello world")'>
  
  <!-- methods -->
methods:{
  func:(message){
	console.log(message)
}
}
```

也可以像原生js一样传入事件

```html
<button v-on:click='func'>
  
  <!-- methods -->
methods:{
  func:(event){
	console.log(event.target.tagName,event.target.offsetTop,event.target.offsetLeft);
}
}
```

如果两个参数都需要

```html
<button v-on:click='func('hai',$event)'> //加入$event
  
  <!-- methods -->
methods:{
  func:(message,event){
	console.log(event.target.tagName,event.clientX,event.clientY);
}
}
```

> 值得注意的是上面的得到的event是原生的event对象

***

## 事件修饰符

还记得  `event.preventDefault()` 或 `event.stopPropagation()`么

前者阻止默认事件,后者阻止冒泡.

vue对于这样的需求做封装

```html
v-on:click.stop='func'  //阻止冒泡
v-on:click.prevent='func'  //阻止默认事件
v-on:click.once='func'		//只执行一次
<!--也可以写在一起或者单纯的阻止默认事件-->
v-on:click.prevent.once
```

***

vue为一些键盘输入的键值提供了修饰符

```
v-on:keyup.ctrl='func'

<!--常见的-->
.alt
.ctrl
.shift
.enter
.up
.down
.left
.right
```

***

## v-model

v-model用来绑定表单value值

下面是数据双向绑定的应用:

```html
<input type='text' v-model='message'>
</p>这是你的输入{{message}}</p>

data:{
  message:''
}
```

#### 双向绑定可以用`Object.defineProperty()`和`onkeyup`来实现,有兴趣可以自己试试

***

## 组件

组件是vue最重要的特性了

