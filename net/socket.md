# socket

socket 需要指定两个参数，分别是 ipv6 ipv4，还有 tcp 和 udp，tcp 由于是有序的，所以可以发送数据流，udp 是无序号的，只能发送数据包

socket 编程的顺序，先是 bind 端口，之后 listen 等待连接发送的数据包。socket 维护的队列分为两类，一类是正在握手的，一类是完成握手的。accept 拿到握手成功的连接，并且创建 socket

> 监听连接的 socket 和 accept 返回的 socket 不是一个 socket，一个是监听 socket ，一个是连接 socket

一个 socket（tcp/udp）连接使用 {本机 IP，本机 port，对机 ip，对机 port} 来标示一个连接

## IO 多路复用

### select

一个线程维护多个 socket，socket 可以全部放在一个 fd_set 里面，任意一个 socket 发生变化，通过一个 select 遍历 fd_set 找到里面下标变化的 socket，

### epoll

epoll_create 创建一个 epoll 对象，这个对象就是一个文件夹描述符号，维护了一个红黑树，每当 socket 通过这个 epoll 对象注册的时候，就是加入这个红黑树，之后 socket 有事件也是反过来调用 epoll 对象，也就是 calllback
