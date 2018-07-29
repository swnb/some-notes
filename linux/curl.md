# curl

curl 是 linux 自带的一个网络工具，做网络请求是很方便的

### 简单连接和显示

获取网页代码到标准输出

```shell
$ curl $URL/$IP
```

保存这个网页到`tmp.html`

```shell
$ curl -o tmp.html $URL/$IP
```

一般网页都是会**跳转**的，所以可以显示跳转的网页信息

```shell
$ curl -L $URL/$IP
```

显示连接的**头信息**

```shell
$ curl -i $URL/$IP
```

显示连接的详细信息包括**通信过程**

```shell
$ curl -v $URL/$IP$
```

要显示更详细的通讯过程

```shell
$ curl --trace trace.txt $URL/$IP$
```

### 携带数据的连接

#### post 和 get

get 只提交数据

```shell
$ curl $URL?name=data&passwd=passwd
```

post 提交

```shell
$ curl -X POST --data 'name=data' $URL
```

代理对象的操作

```shell
$ curl --user-agent '[User Agent]' $URL
```

cookie 操作

```shell
$ curl --cookie 'name=data' $URL
```

使用 cookie 文件

```shell
$ curl -c cookies.txt $URL
$ curl -b cookies.txt $URL
```
