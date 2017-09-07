# webpack 

## 使用node的module.exports来实现模块的引入

***

## CSS和lodaer

> 首先安装 style-loader   css-loader

 ### 两种实现的方式

* ## require('!style-loader! css-loader ! ./index.css')	//注意顺序

* ## require('./index.css')

  ## 打包命令需要修改 webpack main.js  index.js --module-bind "css=style!css"

***

上面的代码以css为例子

***

## webpack.config.js

有一点的修改>1版本和2版本

主要的代码如下

```json
module:{
  rules:[
    {
	test:/\.css$/,
    use:['style-loader','css-loader']
    },
    {
      test:/\.(png)|(jpg)|(svg)|(gif)$/,
      use:['file-loader']
    }
  ]
}
```



上面的代码是对与css的和image处理

在使用image的使用只要import "./picture.png" css里面使用url 实现背景

***

### 特殊的sass-loader

> 可以去官网查询[官网loader](https://webpack.js.org/loaders)

与css的webpack的写法一样,如果要使用sass-loader的话,则需要先安装node-sass才能使用;

***

可以多去看官方的文档来了解更多的知识,还是很清晰的.比起网上大部分的教程来说多是性价比很高的.

***

### entry

输入模块建议使用对象的形式

### output

输出要注意

path是绝对路径

`[hash]`是每次打包都不一样的hash值，但是有可能你只更改了一个文件，那么你如果不想全部更换文件名，只是根据莫个文件的改动去更改相应的文件名称，那么就是用`[chunkhash]`

### plugins

plugins需要传入的是你要的插件

推荐` clean-webpack-plugin`，每次都清楚之前的文件

`html-webpack-plugin`不需要什么其他的参数，它会自动在打包的目录下生成一个index.html文件包含script标签

```javascript
const cwp=require('clean-webpack-plugin')
plugins:[
    new cwp(['dirname'])，
  new hwp({title:'hello world'})
]
```

### 3种热加载的方式

第一种开启`watch`

这个没什么好说的

第二种就是`webpack-dev-server`

这个需要注意的是`publicPath`,因为`webpack-wdev-server --open `开启的路径是`/`代替目录，所以需要注意的是`publicPath`是`/`不是`./`

第三种，需要考虑`koa`是不是兼容的，目测不是的。

### 开发plugin插件

对于`plugin`插件只是一个函数在`prototype`的原型上添加了apply函数，参数是`complier`也就是webpack编译过后的`config.js`文件（配置文件）

`complier`包含的是环境的配置，而`compilation`表示的是每次打包的文的编译信息和跟踪信息

比如获取文件名称`compilation.assets`包含的就是所有文件的，属性就是文件名称，这里举个例子

```javascript
let str='file list =>'
for(let filename in compilation.assets){
    str+=filename
}
compilation.assets['filelist.md']={
    source:()=>str,
  size:()=>str.length
}
```

### 深入了解`webpack`plugin的插件的个个对象

先将下构建吧，一个块(chunk)就是由很多模块(modules)组成的，module由依赖组成，遍历过程可以简述称为下面的过程：

```javascript
compilation.chunks.forEach((chunk)=>{
    chunk.modules.forEach((module)=>{
        module.fileDependencies.forEach(filePath){
            console.log(filepath)
        }
    })
})
```

打包成的文件在哪里？

每一个chunk对应一个打包的文件都有输出的文件名称

```javascript
chunk.files.forEach(name={
    //name就是文件的名称
})
```

上面api可以实现`html-webpack-plugin`的功能

> 提示，现在不推荐forEach去遍历`module`的数据，建议使用的是内置的api`forEachModule`去取得module这个文件打包所需的文件模块

 如果要获取文件的改变的时间`chunk.files`和一个对象`compilation.fileTimestamps`,这个对象是包含了所有文件的对象，需要通过`Object.keys(object)`来实现这个过程的遍历.除了`module.fileDependencies`，还有最直接的获取方式`compilation.fileDependencies`

每个块` chunk`都有`hash`和`name`可以实现这个过程的访问。