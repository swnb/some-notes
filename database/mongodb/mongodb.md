# mongodb



启动server

```shell
systemctl start mongod.service
```

mongo-shell

```shell
mongo
```

```shell
#显示 db
db
#所有sb
show dbs || db.get
#switch db
use <name>
```

>- **admin**： 从权限的角度来看，这是"root"数据库。要是将一个用户添加到这个数据库，这个用户自动继承所有数据库的权限。一些特定的服务器端命令也只能从这个数据库运行，比如列出所有的数据库或者关闭服务器。
>- **local:** 这个数据永远不会被复制，可以用来存储限于本地单台服务器的任意集合
>- **config**: 当Mongo用于分片设置时，config数据库在内部使用，用于保存分片的相关信息。



和table不同

> mongodb是将table转换成collection的,并且在使用了db后,这个db就成了一个对象,可以访问他的collection实现drop,比如db.collectionName.drop()

创建collection和删除

```shell
db.createCollection('name you neeed')

db.nameyouneed.drop()uajingg
```

尽管collection的命名不能有空格和特殊字符,但是可以创建和读取,使用`getCollection()`,`createCollection()`



在一个集合中插入数据

``` shell
db.collectionName.insert({JSONOBJ})
db.collectionName.insert({JSONOBJ},{JSONOBJ})
```



开始查询的过程

```shell
#找到对应的key
db.collection.find({'tag':'1'}).pretty()#当找的数据是[]数组类型,那么对于tag来说就是取其中的一个

#多个条件

#AND
find({'tag':"1",'name':"zhang"}).pretty()

#OR
find({$or:['tag','1','name':'zhang']}).pretty()

#great low equal

find('value':{$gt:5000}).pretty()

find('value':{$lt:5000}).pretty()

find('value':{$let:500}).pretty()

$get#大于等于
$ne#不等于
```



```shell
find().limit(2).skip(2)
#跳过前两个,获取两个输出
```



局部查询

```shell
find({'like':{$get:2121}},{'name':0,'title':1}).pretty()

#1表示输出,0表示不输出
```



更新数据

```shell
update({'like':{$ne:2000}},{$set:{likes:2121}})

##如果增加数据
db.movie.update({title:'sasa'},{$inc:{likes:2}})
#likes+=2

全部更新
db.movie.update({title:'sasa'},{$inc:{likes:2}},{multi:true})

```

添加数据(变成数组)

```shell
update({},{$push:{tag:"zjajjda"}})
```



 删除数据

```shell
movie.remove({'tag':'name'})
```

