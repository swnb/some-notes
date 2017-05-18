# 你不知道的javascript

## 编译原理

javascript是一门编译语言

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
scope->scope:检查
scope->compile:回馈
compile->compile:编译得到结果
compile->engine:将编译结果传递给引擎
engine->engine:解释代码
```

