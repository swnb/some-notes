main() {
  // * lambda;
  num bar(num a, num b) => a + b;

  const list = <int>[1, 2];

  final _ = list.fold(0, bar);

  // * function
  void foo(num a, num b) {
    print(a + b);
  }

  // * apply
  Function.apply(foo, [1, 2]);

  // *  特殊操作
  (() => () {})();

  // * callable class
  final foo1 = Foo();

  foo1()()().foo()().foo();

  // * async function
  wait() async {
    await Future.delayed(const Duration(seconds: 1));
    print('done');
  }

  wait();

  Iterable<int> iter() sync* {
    int count = 0;
    while (true) {
      yield count++;
    }
  }

  final v = iter().take(1);
  print(v);
}

class Foo {
  get foo => this;
  call() => this;
}
