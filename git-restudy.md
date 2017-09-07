# git-restudy

### 合并分支

合并一个提前的分支到当前的落后的分支

```shell
$ git merge dev 
```

将dev的提交增加到当前的分支

之后可以删除多余的分支

```shell
$ git branch -d dev
```

如果两个分支都已经有新的递交，那么合并报错，需要自己去更改文件再去合并

也可以`git status `查看分支的冲突文件