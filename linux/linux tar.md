# tar

> _tar 不会压缩文件，一般用来打包目录_

## 需要熟悉的命令如下

-   -c 创建压缩文件

-   -x 解压文件

-   -v 显示所有的过程

-   -f 最后的参数 创建的文件

所以打包文件如下

```shell
tar -cvf name.tar  *.go //打包所有的golang文件为name.tar
```

解压缩如下

```shell
tar -xvf name.tar
```

之后使用 bzip2 或者 gzip 压缩的就要使用参数

-   -z gz 的包

-   -j bz2 的包

## 最强的压缩 7z

```shell
> 7z a -t7z  -r file.7z  ./file/ -mx9
```

// 上面的是最大的压缩限度
