# docker

docker 的镜像和容器之间的关系

> 还不懂，这个还要再去研究

docker的一般命令

```shell
docker run --it --name webserver -d -p 8000:80 nginx  /bin/bash
```

数据的卷容器

```dockerfile
docker run -v $PWD/somedir:/somedir -d --name nginx nginx
dokcer run -volumes-from nginx -d --name nginx1 nginx
```

上面的命令可以实现数据容器的共享

数据的备份，这段代码先不写了，以后再仔细的看看它内部的实现

---

端口的映射和容器的互联

