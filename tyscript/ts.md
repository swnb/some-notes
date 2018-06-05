# typescript

强类型的 javascript

### interface

```typescript
interface P {
    (a: string): string;
}

function fn(a?: string | number): string {
    return "";
}

//一般的结构的实现对象是不能多属性也不能少属性的，但是下面的就是无限扩展的对象
interface Person {
    readonly a?: string;
    [propname: string]: any;
}

//数组和借口
interface ArrayInterface {
    [idnex: number]: number;
}
//function
let fn = function(a: string, b: string): number {
    return 1;
};
//等价与
let fn: (x: string, y: string) => number = function(
    a: string,
    b: string
): number {
    return 1;
};
```

### 重载

```typescript
//声明
function len(param: string): number;
function len(param: number): number;

//定义实现
function len(param: string | number): number {
    if (typeof param === "string") {
        return param.length;
    } else {
        return param.toString().length;
    }
}
```

### type

```typescript
type a = "a" | "b" | "c";

console.log(a);
```

### enum

```typescript
enum Days {
    "a",
    "b",
    "c",
    "d"
}
console.log(Days["a"]===Days[Days[0]]])
```

### class

```typescript
//abstract 抽象不允许实例化
abstract class Animal {
    private name;
    public constructor(name) {
        this.name = name;
    }
    protected c() {
        console.log(1);
    }
}

//public 都能访问
//private 只有自己类能访问,子类也不行
//子类可以访问protected
```

### 泛型

```typescript
function a<T>(x: T): T {
    return x[0];
}
```
