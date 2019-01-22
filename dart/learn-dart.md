# learn-dart

```dart
// 一般的函数
bool isNobile(int atomicNumber){
	return true;
};
// 箭头函数
bool isOK(int x) => x==1;

// 类型推导，不需要指定输出
isOk(int x) => x==1;

// Optional parameters :like swift
isOK(x:10);

isOK({int x=10})=> x==1;

// 匿名函数
var isOk= (int x){
	return x ;
};
```

```dart
class Vector{
  final x = 1;
  operator +(Vector v)=> x + v.x;

  Map<Symbol,Vector> _cache = const Map();
  final space(Symbol s) => _cache[s]??=Vector();

}
```

```dart
test()async{
	await stream()
}
```
