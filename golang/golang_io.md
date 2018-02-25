# golang_io

关于golang的文件读取工作是一个重点

由于os.Open和bufio.NewReader都会返回一个对象具有read的方法

所以有必要明白如何读取文件的内容

如果内存的使用有考虑,那么必须使用`read`的方法一个一个`buffer`读取出来,当然也会有速度上的问题,

如果所需的内存很小,那么`ioutil.ReadFile`和`ioutil.ReadAll`是再合适不过的选择

所以你需要考虑的就是关于代码的可行性,

与node的对比

`fs.readFileSync()`

`ioutil.ReadFile`

两者的对比是有很大的区别的

