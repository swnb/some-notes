# tar

> *tar 不会压缩文件，一般用来打包目录*

### 需要熟悉的命令如下

* -c 创建压缩文件
* -x 解压文件
* -v 显示所有的过程
* -f 最后的参数  创建的文件

所以打包文件如下
```shell
tar -cvf name.tar  *.go //打包所有的golang文件为name.tar
```
解压缩如下
```shell
tar -xvf name.tar
```

之后使用zip或者gzip压缩