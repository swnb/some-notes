# python study

## encode

python 使用 unicode 但是在linux里面代码是utf-8

所以

```python
#encoding=utf-8

s = '中文'
s.encode('utf-8') //Error

s = u'中文'
s.encode('utf-8') //中文
```

上面的问题在python3里面不再出现，已经改善

## scrapy

pip 安装

```shell
scrapy startproject projectname
```

##  装饰器

装饰器顾名思义是用来装饰的，主要作用是对函数进行封装

```python
def decorat(func):
  def newfunc(name):
    print(name)
    func(name)
    return name
  return newfunc

@decorat
def n(name):
  print('hello',name)
```

n的作用本来只是输出名字，但是通过装饰器，n不仅可以输出名字，还可以返回这个名字并且打印出名字



## class

python的class对象
创建对象很简单

```python
class parent():
  name='parent'
child=parent()
print(child.name)
```

上面parent就是一个类，child就是一个实例



## 下划线和私有变量 封装

学过js的就知道，在js里面，对象的属性是可以直接在外部访问的，没有私有属性这种说法，但是可以通过Object.defineProperty()函数来实现属性不可遍历，一般为了 安全起见，浏览器里面js代码都会使用立即函数进行封装。对于python来说，情况简单的多

```python
class obj():
    def __init__(self, name):
        self.__name = name

    def get_name(self):
        return self.__name

```

上面的类__name变量不能访问，需要调用get_name函数获取，这中写法也符合面向对象编程的封装

如果是双下划线是特殊函数的意思，例如`__init__`函数，一个下划线表示虽然他不是私有变量，但是该变量需要看成私有变量，定义变量名的时候需要注意

>  私有变量与安全
>
> 类的属性不应该可以被随便修改，因为这是很危险的事情，想象一下，如果你的脚本在浏览器运行，在没有被立即函数封装的情况下，就可以在console.log控制台里面直接修改对象的属性，那么这样是很危险的，尤其是在涉及到表单提交的时候



## 继承和多态

js使用原型连来实现继承，这就导致js只能实现单继承

python3下默认多有类都已经继承object

使用isinstance(child,parent) 函数来判断child是不是parent的后代，也就是说生成chid的类是否继承了parent，我们来看下

```python
class human():
  def get_attr(self):
    print('human')
class woman(human):
  def get_attr(self):
    print('woman')
w=woman()
print(isinstance(w,human)) 
```

那上面的继承怎么和多态连接起来

举例子，对于一个human的类，有get_attr的方法，那么所有继承human的类，都会有get_attr的方法，所以，我们写一个方法

```python
def s(obj):
  if isinstance(obj,human):
    obj.get_attr()
```

也就是说对于不同的对象，但是有相同的属性，可以通过多态这样的特性，在输入不确定的情况下，稳定的输出，不需要根据输入特意的修改代码

> js 的(私有属性)的问题
>
> js没有办法实现完美的私有属性，只能借助闭包假实现(不完美)
>
> ```javascript
> let parent=function(name){
> 	let na=name
>     this.getName=()=>na
> }
> ```



## 类属性和实例属性

```python
class parent():
    name = 'p'


child = parent()

print(child.name + parent.name)

```

类属性实例也可以访问



## 面向对象高级程序设计

限制类动态添加的属性`__slots__`

```python
class human():
  __slots__=('name','age')
```

这样human类只能动态绑定name和age属性，其他属性添加会报错

定义class的getter和setter

对于python，使用内置的装饰器`@property`

```python
class a():
  @property
  def name(self):
    return self.__name
  @name.setter
  def name(self,new):
    self.__name=new
```

注意要先set再get，把属性当最函数名称

python的这种装饰器结合私有函数很好实现这种get和set，但是js就很难实现

