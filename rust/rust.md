# rust

## learning rust

```rust
let mut mutData = 10; // 可变的数据
let immutData = 10; // 不可变的数据
```

rust 里面的表达式 很强大，即便是 if 语句也可以作为表达式的一部分，

```rust
fn main(){
	let x = if x == 0 { 0 } else { 1 }; // powerfull

	let mut count = 0;
	let x = loop {
		count+=1;
		if count > 10{ // 这是一个表达式
			break 199;
		}
	};

	println!("{}",x); //199
}
```

rust 里面除了实现 copy tail 的类型之外 , 移动 会使之前的变量无效,所以

```rust
	let x = 1;
	let y = x;
	// Copy 可以
	let x = "sdfs";
	let y = x.clone();
	// 深度拷贝是可以的
```

如果要调用一个函数,那么你的函数就是这个样子

```rust
fn cal_length(string: String) -> (String, usize) {
	let len = string.len();
	(string, len)
}
```

上面的代码的意味着你在获取所有权之后交还所有权
通过元祖实现多值返回起源 lisp, 类是 py swift 一样 , (golang 的多值返回不依赖抽象的数据结构)

那么下面如果你想改变一个数据,那么你可以这么做

```rust
fn push_str(string: String) -> String {
	let mut string = string;
	string.push_str("dadas");
	string
}
```

借用数据

```
fn borrow(string: &mut String){
	string.push_str("dasda");
}
```

对于数据的借用,你需要注意的是,
`let mut s = "some string"`

1. 可变的借用 `&mut s`
2. 不可变的借用 `&s`

可变的引用不可以同时出现
可变的引用和不可变的引用不能同时出现
不可变的引用可以同时出现,因为是只读

透过悬挂指针看看借用和移动的区别

```rust
fn move() -> String {
	let string = String::from("dada");
	string
}

fn borrow() -> &String {
	let string = "dadsa"
	&string // error code
}
```

rust 的切片的写法很多样

```rust
let string = String::from("some string");
let s = &string[..]
let s = &string[1..2]
let s = &string[..2]
let s = &string[1..=2]
```

当你在引用 string 的 slice 后清空原先的引用,会报错,看下面的代码

```rust
let mut string = String::from("some string");
let slices = &string[1..2];
string.clear();
println!("{}", slices);
```

结构体就像 js 一样轻便

```rust
struct User {
	name: String,
	age: i32,
	is_active: bool,
}

fn createUser(name: String, age: i32) -> User {
	User {
		name,
		age,
		is_active: false,
	}
}
```

解构不能在末尾有,号

```rust
let user = createUser(String::from("dadas"), 10);
let user2 = User {
	name: String::from("dads"),
	..user
};
```

tuple 的结构

```rust
struct Color(i32,i32,i32);

let color Color(1,12,221);
```

方法

```rust
struct Color(i32, i32, i32);

impl Color {
	fn sum(&self) -> i32 {
		self.0 + self.1 + self.2
	}

	fn new() -> Color {
		Color(1, 121, 212)
	}
}

Color::new();
```

enum

枚举的用法真的是很广泛

```rust
enum Message { // 枚举的数据
    Quit,	// 无类型
    Move { x: i32, y: i32 }, // 匿名的结构体
    Write(String),	// String 结构
    ChangeColor(i32, i32, i32), // tuple 结构
}
```

```rust
enum Color{
	Pink,  // 这是一个单元结构体
	Yellow,
	Some(String), // 这是一个字符串
}

let a:Color = Color::Pink;

let string = match a{
	Color::Pink=>"",
	_ => {
		println!("{}",string);
		"da"
	}
};
```

if let 避免较长的匹配

```rust
let string = if let Color::Pink  = a {
	""
}else{
	println!("{}",string);
	"da"
};
```

对于 rust 的模块系统 4 个关键字 `pub mod use super` 目录里面 mod.rs 就是默认的主文件;

数据结构
向量

```rust
let v = Vec::new();
v.push(1);
match v.get(1){
	Some(number)=>println!("{}",number),
	None => println!("none"),
}
```

hashTable

```rust
let key = &String::from("key");
let mut hashMap: HashMap<String, String> = HashMap::new();
hashMap.remove(key); // 删
let k = String::from("key");
hashMap.insert(k, String::from("value")); // 增
hashMap.get(key); // 查
let k = String::from("key");
hashMap.entry(k).or_insert(String::from("what is it")); // 改
```

rust 的泛型没有动态成本 ,在编译阶段就进行替换

```rust
struct SomePoint<T, U> {
	x: T,
	Y: U,
}
```

类似接口的 trait

```rust
pub trait Person {
	fn say(&self) -> String;
}

struct Man {
	Name: String,
	Age: i32,
}

impl Person for Man {
	fn say(&self) -> String {
		let name = self.Name.to_string();
		name
	}
}

fn notify<T: Person>(person: T) {
	person.say();
}

```

function programming;

```rust
struct Counter {
	value: i32,
}

impl Counter {
	fn new() -> Counter {
		Counter { value: 0 }
	}
}

impl Iterator for Counter {
	type Item = i32;
	fn next(&mut self) -> Option<Self::Item> {
		self.value += 1;
		if self.value >= 100 {
			return None;
		}
		Some(self.value)
	}
}

```

智能指针

储存在堆上的数据

```rust
let num = Box::new(10);
println!("{}",num);
```

如何生成单链表

```rust
struct Node<T>
where
	T: std::fmt::Debug,
{
	value: T,
	next_pointer: NodePointer<T>,
}

impl<T> Node<T>
where
	T: std::fmt::Debug,
{
	fn new(value: T) -> Node<T> {
		Node {
			value,
			next_pointer: NodePointer::Null,
		}
	}
	fn link(mut before: Node<T>, after: Node<T>) -> Node<T> {
		before.next_pointer = NodePointer::Pointer(Box::new(after));
		before
	}
	fn print(&self) {
		let Node {
			value,
			next_pointer,
		} = self;
		print!("{:?} -> ", value);
		if let NodePointer::Pointer(Node) = next_pointer {
			Node.print();
		} else {
			print!("{}", "null");
		}
	}
}

enum NodePointer<T>
where
	T: std::fmt::Debug,
{
	Pointer(Box<Node<T>>),
	Null,
}

pub fn main() {
	println!("{}", "+".repeat(100));
	let long = 10;
	let new = Node::new;
	let cons = Node::link;
	let mut a: Vec<i32> = (1..long).collect();
	a.reverse();

	let mut last = new(long);
	for i in a {
		last = cons(new(i), last);
	}
	last.print();
}

```
