# grunt gulp webpack

* grunt

  首先，我们要package.json文才可以，`npm init -y`可以制动生成package.json文件;

  然后 npm install 生成node_module;

第一步：先在package.json里面添加一个内容：`devDependencies{  }`

第二步：输入命令`npm install grunt --save-dev ` `--save-dev`是安装开发依赖的意思，用意就是在`devDependencies`内添加`grunt`的内容;

第三步：配置Gruntfile.js文件，具体写入下面的代码：

```node.js
module.exports=function(grunt){
  grunt.initConfig({
    pkg:grunt.file.readJSON("package.json")
  });
  grunt.registerTask('default',[]);
}
```

下面我们就可以运行我们的项目了：

`$ grunt`就可以了

## grunt的插件:[官网地址](http://www.gruntjs.net/plugins)

有名的插件：

* uglify 用于压缩js代码;
* clean 清除文件;
* watch 实时监控;
* jshint 语法检查;
* concat 合并文件；

在当前目录下，以grunt-contrib-uglify为例，也就是说顺序是一样的，先使用`cnpm install grunt-contrib-uglify`来安装压缩文件，之后，配置Gruntfile.js，具体配置要看其他的东西了;

详细在[这里](http://developer.51cto.com/art/201506/479127.htm),wangEditer的创作者写的;

之后`grunt`来运行你的文件;

***

## webpack相对的简单一点

