# React

- 大小写,大写表示是 react 的组件,小写表示这是 dom 元素.

- 非 dom 属性

  - dangerouslySetInnerHTML

    - 在 jsx 里面直接写入 js 代码

  - ref

    - 引用子主键

      > 因为分离的设计,所以不要关心上面的主键,主要关心自己的内部设置;

  - key

    - 性能的优化

---

jsx 里面，函数就可以表示组件

```jsx
function A(props) {
	return <h1>hello world{props.name}</h1>;
}

render(<A name="zhang" />, html.body);
```

对于 state 只能 class 去创建组件，对于组件，下面是一个标准的例子，很多地方值得深思。

```javascript
class Clock extends React.Component {
	constructor(props) {
		super(props);
		this.state = { date: new Date() };
	}

	componentDidMount() {
		this.timerID = setInterval(() => this.tick(), 1000);
	}

	componentWillUnmount() {
		clearInterval(this.timerID);
	}

	tick() {
		this.setState({
			date: new Date()
		});
	}

	render() {
		return (
			<div>
				<h1>Hello, world!</h1>
				<h2>It is {this.state.date.toLocaleTimeString()}.</h2>
			</div>
		);
	}
}

ReactDOM.render(<Clock />, document.getElementById('root'));
```

### 使用 setState 更新 ui

但是如果需要根据之前的 state 进行更新，那么就不能直接使用`setState({})`,需要使用`setState((preState,props)=>{})`

> setState({})是异步是什么意思？ui 先更新，之后呢，再设置 state，这个时候 state 是多少就不知道了。。所以根据 preState 来计算新的值，也就是说使用函数，这很巧妙

### 事件的问题

```jsx
this.clickHandle = this.clickHandle.bind(this);
```

如果子组件调用父亲组件的方法，那么一般方法就是

```jsx
//parent
<Child onClick={this.change}>
//child
function Child(props){
    <a onClick={props.onClick}></a>
}
```

### 数组和 key

数组使用很简单[<a>link</a>,<b></b>,<i></i>]

一般要循环生成的元素是需要 keys 的属性，用来给 react 标识这个元素是独一无二的，用于 diff 算法优化 dom 重绘制。

这里还要强调的是 key 如果发生了变化,那么 react 人为这个元素需要重新绘制,如果 key 不变,那么只是对属性判断
这里 react 能拿到每个 dom 的 key ,分析 key 的变化,比如,一个数组不要用 index 来做数组的 key ,因为数组的 key 是变动的,一旦数据没变,位置变了,diff 就开始了,重新创建每个元素;

### this.props.children

类是<slot></slot>

### ref

ref={element=>{this.element=element}}
