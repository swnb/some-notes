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

https client for auto proxy;

```dart
import "dart:io";

Future main() async {
  final client = HttpClient();

  var ua = client.userAgent;

  client.userAgent = "Mozilla";

  print(ua);

  try {
    client.findProxy =
        (Uri uri) => HttpClient.findProxyFromEnvironment(uri, environment: {
              "http_proxy": "http://127.0.0.1:1087",
              "https_proxy": "http://127.0.0.1:1087",
            });

    var uri = Uri.parse("https://www.google.com");

    print(uri);

    final cc = await client.getUrl(uri);

    final response = await cc.close();

    print(response.headers);

    final data = await response.drain();

    print(data);
  } catch (e) {
    print(e);
  }
}
```
