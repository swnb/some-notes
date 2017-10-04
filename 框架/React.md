# React

* 大小写,大写表示是react的组件,小写表示这是dom元素.

* 非dom属性

  * dangerouslySetInnerHTML

    *  在jsx里面直接写入js代码

  * ref

    * 引用子主键

      > 因为分离的设计,所以不要关心上面的主键,主要关心自己的内部设置;

  * key

    * 性能的优化

***

jsx里面，函数就可以表示组件

```jsx
function A(props){
  return <h1>hello world{props.name}</h1>
}

render(<A name='zhang'/>,html.body)
```

对于state只能class去创建组件，对于组件，下面是一个标准的例子，很多地方值得深思。

```javascript
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
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

ReactDOM.render(
  <Clock/>,
  document.getElementById('root')
);
```

### 使用setState更新ui

但是如果需要根据之前的state进行更新，那么就不能直接使用`setState({})`,需要使用`setState((preState,props)=>{})`

> setState({})是异步是什么意思？ui先更新，之后呢，再设置state，这个时候state是多少就不知道了。。所以根据preState来计算新的值，也就是说使用函数，这很巧妙

### 事件的问题

```jsx
this.clickHandle=this.clickHandle.bind(this)
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

### 数组和key

数组使用很简单[<a>link</a>,<b></b>,<i></i>]

一般要循环生成的元素是需要keys的属性，用来给react标识这个元素是独一无二的，用于diff算法优化dom重绘制。

### this.props.children

类是<slot></slot>

### ref

ref={element=>{this.element=element}}