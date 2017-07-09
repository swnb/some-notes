# React 的坑

第一天

* 使用`React.createClass`生成的组件必须要***大写*** 

* 不能在return语句里面添加两个并列的标签，可以有一个标签，后面再添加进去;

* babel的for 属性要写成`htmlFor`,因为for是javascript的定义语句;

* class的属性要写成className属性，同上;

  > 对于className来说，需要注意的是，是在label所有地方都要写这个词语，包括在html标签内部也要这么做;

> {  表示解析javascript，<   表示解析html

下面是一个例子，注意`Helloworld`的首字母大写，还有`return`的dom 元素要只有一个祖先标签;

```babel
var HelloWorld=React.createClass({
	render:function(){
          return <div>
          			<h1> hello {this.props.attribute}</h1>
          			<h3>hello {this.props.className}</h3>
          		 </div>
	}
});
ReactDOM.render(
	<HelloWorld attribute="world" className="render_color" htmlFor="id" />,
	document.getElementById("somediv")
)
```

>在props属性里面有一个特殊的属性 children 表示节点

***

对于新的react方法

```javascript
React.Child.map(this.props.children,function(){
  
});
React.Child.forEach(this.props.children,function(){
  
});
React.Child.count(this.props.children,function(){
  
});
```

> 这里需要注意， `this.props.children` 的值有三种可能：如果当前组件没有子节点，它就是 `undefined` ;如果有一个子节点，数据类型是 `object` ；如果有多个子节点，数据类型就是 `array` 。所以，处理 `this.props.children` 的时候要小心

***

## react的state 和props

props是一旦确定就不能更改的

### 上面我已经详细说了props的用法,注意.属性class和for要使用className和htmlfor来代替,组件需要大写,this.props.children有特殊的意义,上面已经详细的解释

下面是对于props的一些补充

> 新版本的react也放弃了对于createClass的 开发,开始使用class

对于props属性可以设置它的属性,避免更改:

> 已经有了新的方案来替代，取代propTypes

例如下面的例子:

```jsx
React.createClass({
  protypes:{
    title:this.PropTypes.string.isRequired//注意大小写
  },
  render:function(){
    return <div>
 		{this.props.title}
  </div>
}
})
```

>对于组件来说，他是存在内存的一种虚拟数据结构;他在内存里面进行更改
>
>这样提高了网页的性能;需要通过ref 来协助找到dom

```jsx
React.createClass({
  handleClick:function(){
    this.refs.textname.focus();
  },
  render:function(){
    return (<div>
  		<input ref='textname' type='text'></input>
    	<input type='button' value='push' onCLick={this.handleClick} >
  </div>)
  }
})
```

***

下面进入重点react的state

```jsx
let T=React.createClass({
  getInitialState:function(){
    return {like:false}
  }
})
```

上面的代码为这个组件的state生成了一个属性

下面继续：

```jsx
let t=React.createClass({
  getInitialState:function(){
    return {like:true}
  },
  change:function(){
    this.setState({like:false})
  },
  render:function(){
    let pa=like?"hello":"world";
    return (<div><input type='text' onChange={this.change}>
        <p>{pa}</p>
        </div>)
  }
})
```

上面的代码实现的是属性的转换

***

 ### 官方文档

先生成 一个react项目 create-react-app

```shell
npm install -g create-react-app
create-react-app my-app
cd my-app
npm start
```

新版本react是推荐使用下面的方法class继承`React.Component`对象的方法去编写组件

同时state的初始值不再使用`getInitialState` 而是直接在constriuctor里面使用this.state来设置它的值





