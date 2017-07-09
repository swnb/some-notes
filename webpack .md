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