# haskell

## why haskell

### 日复一日我都在寻找最强大的编程语言,直到一天我才突然发现，这个世界上不会存在真正完美的编程语言，原因如下：

---

#### 语言大致可以分为两种

- 表达力极强的，代表语言`nim`我从未见过表达能力如此强大的语言，它的表达能力十分惊艳

* 工程能力极好的，代表语言`java`,`golang`,如果你是老板，你会在技术选型上选择什么？这些语言死板，但这就是它的优势，选 py 写后端？看你工程师水平了 :)

  > 题外话， js 是个例外 ，因为 js 算是工程能力极差的，表达能力也不行的语言，类型系统也令人汗颜（如何判断一个变量是 array 还是 object,不用 es6 的 Array.isArray，你自己试试?），但是由于它在特定领域有不可替代的作用，所以才这么火热，但是现在的公司大多都不会直接写 js，`typescript`的火热程度也就说明了一切

#### 表达能力强大是什么意思？

这里我大致的解释下 表达能力强一般包含 3 个方面

- 能让编程人员在实现相同逻辑的时候使用较少的代码行数

  > 正面案例 `python`
  >
  > 反面案例 `java`

- 代码语义要清晰，方便阅读代码的人理解代码的运行机制

  > 正面案例 `golang`
  >
  > 反面案例 因为语言的可阅读性主要是习惯的问题，任何语言习惯之后都是不难读的，非要说一个，我觉得`erlang`的语法有点诡异，但这也是因为它出现的时代较早，所有形成了自己的一套编码规范。
  >
  > 这主要还是看编写的代码是否规范

- 允许多种形式的代码来表达同一种逻辑 注意！！这不一定是优点

  > 正面案例 `nim` `ruby`
  >
  > 反面案例 `nim`
  >
  > 这是把双刃剑啊，不是说多种表达形式就好啊，有些时候是跟上面的两条规则冲突的

表达能力强的语言**通常是**动态类型的语言，这些语言对于编程人员来说十分友善，灵活便捷，专注于功能简化了编码时间，有时候还看起来十分可爱，我相信每一个程序员都会有一到两门自己深深喜欢的脚本语言，使用它们是一件幸福的事情。

#### 工程强大什么意思

还是前面的问题，如果你是老板，你会招聘什么人

- 会 js 的大神啊，为什么？基本上什么都能做啊，一个人写前端|客户端|服务端|移动端，第三方库又那么多，社区又活跃。哈哈 :)
- java 啊。稳定，web 框架那么 nb，性能有不错，主要就是写 java 的人多啊，好招人，你要说你的服务端是什么冷门语言写的，估计招不到人哦

还是总结下，一般工程强大语言要有这些特点

- 社区活跃，轮子多

  > 为什么要说这个，其实这个是很重要的，社区活跃那么第三方库肯定会多，看看 js，你就明白，现在社区人最多的语言是什么，毫无疑问是`js`， 学别的语言你可能要问这门语言能做什么，学 js 你就要问这门语言什么不能做。
  >
  > 实质上，社区活跃程度在做技术选型时候属于比较重要的一环，你要做一个项目，首先要结合需求去找框架选型，看看社区是不是有现成的轮子给你用，如果有，再看看好不好用，有一个强大的社区给你撑腰，那么开发就没有想想的那么难

- 解决技术难点

  > 如果一门语言十分冷门，社区不活跃，但是它某些特性能解决你的项目的技术难点甚至是技术痛点，那我觉得你还是会考虑下的，这和语言本身就没有关系了，取决于开发者

- 性能和错误处理

  > 也许有些人会认为后端的性能瓶颈在数据库，语言本身的性能不重要，比如`php` `ruby` 这些语言就是这样认为的，这点仁者见仁，智者见智。同时容错系统是很重要的，比如`erlang`和它的`OTP`

上面的 3 点其实是一个工程代码的核心，也是很多人在技术选型的时候会考虑的点

---

其实上面的`工程`语言和`表达`语言其实是不矛盾的，虽然如今的编程语言很难做到面面俱到，但是还是不乏不错的编程语言的，未来何去何从，只能等更加新锐的编程语言出现了。在未来，这些情况会有改善，并且形成新的格局。

但是未来世界的格局不会由特定的一两门语言来决定，而是由多种语言组合起来，各司其职，最后就是 _和谐_

对于自己来说，我已经不再寻找这样一门面面俱到的语言了,

就像一个被感情伤害过很多次的人，现在已经没有精力说爱这个字了,

也许美好的生活就是桌上的咖啡，窗外的远山，耳边的音乐，眼前的爱人罢了，

我常常说美人要有姣好的容颜或者优雅的姿态，

但是能陪你度过一生的人只是那个懂你的人，

相互理解，互相扶持，

对我来说，这个爱人就是`Haskell` ，

所以请允许我请允许我用`lambda`结尾，诸位，午安

### `λ`

---

> Swnb
>
> 2018-08-05 13:46 于珠海
