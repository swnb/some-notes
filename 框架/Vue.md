# Vue

***



## vue的data和methods都是可以直接调用或者this内部引用



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

> 类似Object.defineProperty

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



#### PS:vue的官方文档给了一段代码,使用watch(vm.$watch)配合loadsh.js的_.debounce(去抖动)和axios实现一个表单异步请求,来说明watch是有它的用处的,我看了半天觉得没什么特别的就不提了,用到的知识点都说了,有兴趣自己去查上面的名词,就不举例了

***



## class | style和vue



### class 对象语法

```html
<head>
  <style>
 	.active{
		width:20px;
      	height:20px;
  	}
  </style>
</head>
<hello v-bind:class='{active:isactive}'></hello>
<hai v-bind:class='classObject'></hai>
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

### class  数组语法

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



> ### 上面的class或者style还可以跟computed一起使用,这里不介绍,自己脑补

***

### style的语法也有数组和对象,这里只以对象举例

```html
<hello v-bind:style="{fontSize:x}"></hello>   
<!-- 
和js的style的属性一样,驼峰命名->fontSize
可以使用-写,但是要加引号 ->'font-size'

数据就这么写
-->
data:{ 
	x:'red'
}
```

> Vue的style会自动加前缀,注意这个点



***

### 这里还是要提一下,从软件开发的角度,分离才是重点(便于维护),将控制(v-on:click='func'),样式(v-bind:style='')等写入html的dom里面是不合适的,但是vue的最终渲染还是将他们放在了viewmodel里面,而且这样写其实是有利于观察页面的,所以不要担心  

### (强行解释一波)  

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

* ## v-if  会移除或重新渲染dom元素,性能耗费大于 v-show . v-show只是单纯的设置display:none; .所以建议如果需要频繁显示和消失使用v-show, 但是v-show不论初始条件是否为真,他都会先渲染,然后再更改css,v-if则不是这样的(懒加载),所以v-show有更高的初始化成本.

* ## v-show是不支持template标签,也不支持v-else

* ## v-for 的优先级高于v-if

* ## v-if是智能的,这是vue的优化处理,他不会重新渲染可复用的组件,下面我举例说明

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

* ## 如果需要更新可复用组件,需要设置key属性,如果key值不同,vue就可以更新组件

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

<!--直接将值迭代出来-->
v-for='v in items'

<!--值与键值迭代-->
v-for='(v,k) in items'

<!--完全迭代:值,键值,位置-->
v-for='(v,k,i) in items'
```

### v-for可以像python一样输出有序整数

```javascript
v-for='n in 100'   //n迭代1-100数字
```

### v- for在vue新版本里面和组件一起使用的时候需要加入key的属性

```javascript
v- for="i in items":key='i.id'  //key应该是唯一的,后面组件讲解
```

### v-for在迭代数组的时候需要注意一些问题

​	数组的动态更新只在对数组进行pop(),shift()等方法的时候才生效

​	换种方法说			

> ```javascript
> data:{
>   a:[1,2,3,4,5]
> }
>
> vm.a[10]=12;    //不会更新data里面的a的
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

也可以像原生js一样传入event

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

#### 双向绑定可以用js的`Object.defineProperty()`和`oninput`来实现,有兴趣可以自己试试

***



## 组件

组件是vue最重要的部分了.

下面详细讲解组件

通过Vue.component()来注册组件

```javascript
Vue.component('vue-template',{
	template:"<div v-on:click="count++" v-bind:class='{div:swi}'>{{count}}</div>",
  	data:()=>({count:0,})
});
```

注意data是一个函数不是对象

注册组件后需要使用`new Vue`来生成实例

```html
<vue-template></vue-template>
<script>
new Vue({
	el:"vue-template"  //或者他的父级元素
})
</script>
```

对于el挂载在dom上面的元素,需要注意

vue在html标准化后才会获得模板

举例

```html
<tabel>
<vue-tempalte></vue-tempalte>
</tabel>
 <!--
上面的代码报错
因为table内部不会解析vue-template
Vue也就获得不到模板
-->
```

针对上面的问题,解决办法

使用is属性,例如`<table> <tr is='vue-template'> </tr> </table>`

***



### 父子组件的通信

vue的官网用了一个形象的说法来说明这个问题:`emit up props down`

之前我介绍过props的传递属性,

值得注意的是,这个传递是单向的,也就是父亲可以改变儿子的属性,儿子改变是不可以也不建议传递到父组件的

举个例子

```html
<div>
  <parent>
  </parent>
</div>
<script>
//注册两个组件 父亲 儿子
 Vue.component('child',{
   props:['reci_meg'],
   template:"<input v-model='reci_meg' type='text'>",
 });
  Vue.component('parent',{
    template:'<div><input v-model="send_meg" typd="text"> <child v-bind:reci_meg="send_meg"/></div>',
    data:()=>({send_meg:'hello world'}),
  });
  new Vue({
    el:'div',
  });
</script>
```



### 上面的数据是单向绑定的,其实是利用了props传递的单向性(由父亲到儿子),而且该代码会报错,因为vue不建议在儿子组件直接改变props属性,由于props的传递是单向的,我们不能在子组件内直接绑定或更改props的值



#### 那么正确使用的方法是什么 ????	

#### (核心代码)

```javascript
Vue.component('child',{
	props:['reci_meg'],
  template:"<input type='text' v-model='message' >",
  	data:function(){
      return {message:this.reci_meg}
  	}
})
```

#### 上面的代码声明了一个message数据,代码不再报错了,但是数据的单向绑定也就失效了

#### 这时候就需要强大的computed(计算属性)了,computed在变量变化时会立刻计算;

#### (核心代码)

```JAVASCRIPT
Vue.component('child',{
        props:['reci_meg'],
        template:"<input type='text' v-model='deal_message' >",  //这里是计算属性
        computed:{
            deal_message:function(){
                return this.reci_meg
            }
        }
    });
```

#### 这样我们的单向绑定就实现了,请自己写一个类似的实例,以便理解父子组件的数据传递

> 如果props属性是一个对象,那么由于两者共享内存空间,就会发生子组件影响父组件的值,这是我们不想看到的.react和vue都不建议子组件去更改父组件的值,只需要关注自己的组件部分就可以,这是传统软件的一个设计模式,降低耦合度.提高代码的可维护性.

### 子组件怎么向父组件通讯? 上面我已经提到了 ` emit up props down` 

vue自定义了两个方法,分别是`$on()`,`$emit()`

> 熟悉JS事件的同学应该知道`addEventListener`,`dispatchEvent`,但是很遗憾的是vue的`$on $emit()`并不是它的封装,所以这里只给一段代码,不再做详细介绍,可以去MDN上查找,
>
> ```javascript
> document.addEventListener('some_event',()=>{
>   console.log('some event is emit')
> });
> let event=document.createEvent('HTMLEvents');
> //事件初始,化第一个参数是事件名称,第二个参数事件传递是否是冒泡的形式,第三参数是否阻止事件传递;
> event.initEvent('some_event',true,true) ;
> //触发事件
> document.dispatchEvent(event);
> ```
>
> 但是很遗憾的是vue并不是`dispatchEvent()`或者`addEventListener()`的封装,有兴趣研究的可以自己去看源代码

Vue使用自定义事件主要用于子组件向父组件通信

需要注意的是不能使用$on监听事件,需要在父组件内使用v-on:event来绑定事件

下面来看例子

```javascript
//child
Vue.component('child',{
  	template:'<button v-on:click="childEventEmit">{{count}}</button>',
  	data:()=>({count:0}),
  	methods:{
    	childEventEmit:function(){
  			this.count+=1;
  			this.$emit('event_emit');
    	}
  	}
});
//parent
Vue.component('parent',{
    template:'<div><p>{{count}}</p><child v-on:event_emit="parentEventEmit"/></div>',
  	data:()=>({count:0}),
  	methods:{
    	parentEventEmit:function(){
  			this.count+=1;
    	}
  	}
});

//挂载到一个div上
new Vue({
  el:'div',
})
```

上面的代码注册了两个组件,实现了子组件向父组件的通讯,其中parent组件调用了child组件,需要注意,**v-on只能在child组件上使用监听,其他地方是获取不到child的触发的事件的**

### 上面就是父子组件通信的内容,总结起来就是`props down emit up `

***



## 非父子关系的组件之间的通信

vue官方给的例子是通过一个空Vue实例来做中间人

举个例子

```javascript
let vm=new Vue();

Vue.component('broone',{
  template:"<input type='text' v-model='val' v-on:input='changeVal'>",
  data(){
    return {val:'value'}
  },
  methods:{
    changeVal(){
      vm.$emit('changeVal',this.val);
    }
  }
});
Vue.component('brotwo',{
  template:"<input type='text' v-model='val' >",
  data(){
    return {val:'value'}
  },
  created(){
      vm.$on('changeVal',(v)=>{this.val=v})    //箭头函数
  }
})
```

> 细心的同学就会发现,上面的代码巧妙的利用了箭头函数的作用域(这里不再说明,可以把箭头函数换成匿名函数试试);还有created是生命周期函数,在函数实例化后调用,箭头函数在当前就会绑定好作用域,不会变化,当然,上面的方法还是不好.建议使用vuex

***



## slot

 首先讲讲vue的作用域,来看实例:

```html
<hello>{{message}}</hello>
上面的message的值是父亲组件控制的
```

我们肯定会遇到这样的情况

```html
<hello>
  <p>
    hello world
  </p>
</hello>
```

在自定义的组件内部使用其他的组件,这时候slot就有用了:

```html
<hello>
<P>HELLO WORLD</P>
</hello>

template:`<div>
  <input typd='text'>
  <slot>
    <p>this is hello world</p>
  </slot>
</div>`
```

在模板内使用slot,当调用组件时候传入dom对象就用他取代slot,否则就继续使用原本内容.

上面的渲染结果是这样的

```html
<div>
	<input type='text'/>
	<p>HELLO WORLD</p>
</div>
```

#### slot的name属性

如果要特别对应相应的部分

```html
<!--child-->
<div>
	<slot name='header'></slot>
  	<slot name='body'></slot>
</div>

<!--parent-->
<child>
	<p slot='header'>hello</p>
</child>
```

到这里通讯就讲完了

3个api --  props events slot