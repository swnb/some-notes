# file

关于 file 的理解，文件句柄和文件描述符

对于一个进程能打开的文件是限制在 1024 左右的

而对于系统的全局来说，打开的文件大概在内存/10k 左右

lsof 可以查看这个信息,[地址](https://www.howtoforge.com/linux-lsof-command/)
