# 创建远程仓库

> 太简单了

1.  创建 git 用户

首先你要创建 git 用户

```shell
sudo adduser git
```

在用户下设置信用访问，那么就是在用户的  目录  下添加.ssh 的目录，在目录里面的`authorized_keys`添加公钥,一行个

2.  之后在创建`git`仓库

创建一个目录仓库，在仓库设置权限。

```shell
    git init --bare rep.git
    sudo chown -R git:git ./rep.git //git用户使用
```

3.  之后`整合仓库`

```shell
    git clone git@{server}:/rep.git
```
