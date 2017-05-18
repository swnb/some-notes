# React 的坑

第一天

* 使用`React.createClass`生成的组件必须要***大写*** 

* 不能在return语句里面添加两个并列的标签，可以有一个标签，后面再添加进去;

* label的for 属性要写成`htmlFor`,因为for是javascript的定义语句;

* class的属性要写成className属性，同上;

  > 对于className来说，需要注意的是，是在label所有地方都要写这个词语，包括在html标签内部也要这么o做;

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

